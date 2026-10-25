import { useCallback, useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import {
  ArrowRight,
  BookOpen,
  CheckCircle2,
  ClipboardList,
  Clock,
  Compass,
  Flame,
  Loader2,
  Sparkles,
  Plus,
  Target,
  Trash2,
} from 'lucide-react'
import { supabase } from '../lib/supabaseClient'
import { useAuth } from '../lib/auth'
import { useToast } from '../components/Toast'
import SubjectIcon from '../components/SubjectIcon'
import { Card, EmptyState, ProgressBar, SectionHeader, Skeleton, StatCard } from '../components/ui'
import {
  buildWeekBuckets,
  computeStreak,
  minutesToHuman,
  toISODate,
} from '../utils/date'

export default function Dashboard() {
  const { user, profile } = useAuth()
  const toast = useToast()
  const [loading, setLoading] = useState(true)
  const [sessions, setSessions] = useState([])
  const [tasks, setTasks] = useState([])
  const [subjects, setSubjects] = useState([])
  const [inProgress, setInProgress] = useState([])
  const [attempts, setAttempts] = useState([])
  const [completedLessons, setCompletedLessons] = useState(0)

  const dailyGoal = profile?.daily_goal_minutes ?? 60
  const todayISO = toISODate()

  const load = useCallback(async () => {
    if (!user) return
    setLoading(true)
    const weekAgo = new Date()
    weekAgo.setDate(weekAgo.getDate() - 6)
    weekAgo.setHours(0, 0, 0, 0)

    const [sessionsRes, tasksRes, subjectsRes, progressRes, attemptsRes, completedRes] =
      await Promise.all([
        supabase
          .from('study_sessions')
          .select('duration_minutes, studied_at')
          .gte('studied_at', weekAgo.toISOString()),
        supabase
          .from('study_tasks')
          .select('id, title, estimated_minutes, status, subjects(name)')
          .eq('planned_date', todayISO)
          .order('created_at', { ascending: true }),
        supabase.from('subjects').select('id, name, icon, description').order('sort_order'),
        supabase
          .from('user_lesson_progress')
          .select('progress_percent, last_accessed_at, lessons(id, title, estimated_minutes, subjects(name))')
          .lt('progress_percent', 100)
          .order('last_accessed_at', { ascending: false })
          .limit(3),
        supabase.from('question_attempts').select('is_correct'),
        supabase
          .from('user_lesson_progress')
          .select('lesson_id', { count: 'exact', head: true })
          .not('completed_at', 'is', null),
      ])

    setSessions(sessionsRes.data ?? [])
    setTasks(tasksRes.data ?? [])
    setSubjects(subjectsRes.data ?? [])
    setInProgress((progressRes.data ?? []).filter((row) => row.lessons))
    setAttempts(attemptsRes.data ?? [])
    setCompletedLessons(completedRes.count ?? 0)
    setLoading(false)
  }, [user, todayISO])

  useEffect(() => {
    load()
  }, [load])

  // ------------------------- dados derivados -------------------------
  const week = useMemo(() => buildWeekBuckets(sessions), [sessions])
  const todayMinutes = week.find((d) => d.isToday)?.minutes ?? 0
  const weekMinutes = week.reduce((sum, d) => sum + d.minutes, 0)
  const streak = useMemo(() => computeStreak(sessions.map((s) => s.studied_at)), [sessions])
  const goalPercent = dailyGoal > 0 ? Math.min(100, Math.round((todayMinutes / dailyGoal) * 100)) : 0

  const answeredCount = attempts.length
  const correctCount = attempts.filter((a) => a.is_correct).length
  const accuracy = answeredCount > 0 ? Math.round((correctCount / answeredCount) * 100) : null

  const recommendations = useMemo(() => subjects.slice(0, 3), [subjects])

  // ------------------------- tarefas -------------------------
  async function addTask({ title, minutes, subjectId }) {
    const { data, error } = await supabase
      .from('study_tasks')
      .insert({
        user_id: user.id,
        title,
        estimated_minutes: minutes,
        subject_id: subjectId || null,
        planned_date: todayISO,
      })
      .select('id, title, estimated_minutes, status, subjects(name)')
      .single()
    if (error) {
      toast('Não foi possível adicionar a tarefa.', 'error')
      return false
    }
    setTasks((list) => [...list, data])
    toast('Tarefa adicionada ao plano de hoje.')
    return true
  }

  async function toggleTask(task) {
    const completing = task.status !== 'completed'
    const { error } = await supabase
      .from('study_tasks')
      .update({
        status: completing ? 'completed' : 'pending',
        completed_at: completing ? new Date().toISOString() : null,
      })
      .eq('id', task.id)
    if (error) {
      toast('Não foi possível atualizar a tarefa.', 'error')
      return
    }
    setTasks((list) =>
      list.map((t) => (t.id === task.id ? { ...t, status: completing ? 'completed' : 'pending' } : t)),
    )

    // Concluir a tarefa registra uma sessão de estudo com os minutos estimados —
    // é isso que alimenta as estatísticas de tempo. Desmarcar remove a sessão.
    if (completing) {
      const { data } = await supabase
        .from('study_sessions')
        .insert({
          user_id: user.id,
          duration_minutes: task.estimated_minutes,
          source: 'task',
        })
        .select('duration_minutes, studied_at')
        .single()
      if (data) setSessions((list) => [...list, data])
      toast('Tarefa concluída. Bom trabalho!')
    } else {
      await supabase
        .from('study_sessions')
        .delete()
        .eq('user_id', user.id)
        .eq('source', 'task')
        .eq('duration_minutes', task.estimated_minutes)
        .gte('studied_at', new Date(new Date().setHours(0, 0, 0, 0)).toISOString())
      setSessions((list) => {
        const copy = [...list]
        const idx = copy.findIndex(
          (s) => s.duration_minutes === task.estimated_minutes && toISODate(new Date(s.studied_at)) === todayISO,
        )
        if (idx >= 0) copy.splice(idx, 1)
        return copy
      })
    }
  }

  async function deleteTask(task) {
    const { error } = await supabase.from('study_tasks').delete().eq('id', task.id)
    if (error) {
      toast('Não foi possível remover a tarefa.', 'error')
      return
    }
    setTasks((list) => list.filter((t) => t.id !== task.id))
  }

  // ------------------------- render -------------------------
  if (loading) return <DashboardSkeleton />

  const doneTasks = tasks.filter((t) => t.status === 'completed').length

  return (
    <div className="page dashboard">
      {/* ---------- Convest IA ---------- */}
      <Link to="/ia" className="ai-hero-card">
        <div className="ai-hero-text">
          <span className="ai-hero-badge">
            <Sparkles size={14} aria-hidden="true" /> NOVO
          </span>
          <h3>Convest IA — sua tutora particular</h3>
          <p>Tire dúvidas de matemática, física, história, geografia e mais. Explico passo a passo e cito as fontes.</p>
        </div>
        <span className="ai-hero-cta">
          Perguntar à IA <ArrowRight size={16} aria-hidden="true" />
        </span>
      </Link>

      {/* ---------- Boas-vindas + resumo da rotina ---------- */}
      <Card className="hero-card">
        <div className="hero-text">
          <h2>Seu próximo nível começa com o que você aprende hoje.</h2>
          <p>Pequenas sessões diárias constroem grandes resultados.</p>
        </div>
        <div className="hero-stats">
          <div className="hero-stat">
            <span className="hero-stat-icon">
              <Target size={18} aria-hidden="true" />
            </span>
            <div>
              <strong>{dailyGoal}min</strong>
              <span>meta diária</span>
            </div>
          </div>
          <div className="hero-stat">
            <span className="hero-stat-icon">
              <Clock size={18} aria-hidden="true" />
            </span>
            <div>
              <strong>{minutesToHuman(todayMinutes)}</strong>
              <span>estudado hoje</span>
            </div>
          </div>
          <div className="hero-stat">
            <span className="hero-stat-icon">
              <BookOpen size={18} aria-hidden="true" />
            </span>
            <div>
              <strong>{minutesToHuman(weekMinutes)}</strong>
              <span>nesta semana</span>
            </div>
          </div>
          <div className="hero-stat">
            <span className="hero-stat-icon">
              <Flame size={18} aria-hidden="true" />
            </span>
            <div>
              <strong>
                {streak} {streak === 1 ? 'dia' : 'dias'}
              </strong>
              <span>de sequência</span>
            </div>
          </div>
        </div>
        <div className="hero-goal">
          <div className="hero-goal-label">
            <span>Meta de hoje</span>
            <span>
              {minutesToHuman(todayMinutes)} de {minutesToHuman(dailyGoal)} · {goalPercent}%
            </span>
          </div>
          <ProgressBar value={todayMinutes} max={dailyGoal} label="Progresso da meta diária" />
        </div>
      </Card>

      {/* ---------- Estatísticas resumidas ---------- */}
      <div className="stats-grid">
        <StatCard icon={Clock} label="Horas na semana" value={minutesToHuman(weekMinutes)} />
        <StatCard icon={ClipboardList} label="Questões resolvidas" value={answeredCount} />
        <StatCard
          icon={CheckCircle2}
          label="Taxa de acerto"
          value={accuracy === null ? '—' : `${accuracy}%`}
          hint={accuracy === null ? 'sem questões ainda' : undefined}
        />
        <StatCard icon={BookOpen} label="Conteúdos concluídos" value={completedLessons} />
      </div>

      <div className="dashboard-grid">
        <div className="dashboard-col">
          {/* ---------- Continuar estudando ---------- */}
          <Card>
            <SectionHeader title="Continuar estudando" subtitle="Retome de onde você parou" />
            {inProgress.length === 0 ? (
              <EmptyState
                icon={Compass}
                title="Escolha sua primeira matéria"
                description="Quando você começar uma aula, ela aparecerá aqui para você continuar com um clique."
                action={
                  <Link to="/explorar" className="btn btn-primary">
                    Explorar matérias <ArrowRight size={16} aria-hidden="true" />
                  </Link>
                }
              />
            ) : (
              <ul className="continue-list">
                {inProgress.map((row) => (
                  <li key={row.lessons.id} className="continue-item">
                    <div className="continue-info">
                      <span className="continue-subject">{row.lessons.subjects?.name}</span>
                      <strong>{row.lessons.title}</strong>
                      <span className="continue-meta">
                        {row.progress_percent}% concluído · ~{row.lessons.estimated_minutes}min restantes
                      </span>
                      <ProgressBar value={row.progress_percent} label={`Progresso de ${row.lessons.title}`} />
                    </div>
                    <Link to={`/aula/${row.lessons.id}`} className="btn btn-outline btn-sm">
                      Continuar
                    </Link>
                  </li>
                ))}
              </ul>
            )}
          </Card>

          {/* ---------- Recomendados ---------- */}
          <Card>
            <SectionHeader
              title="Recomendados para você"
              subtitle="Comece por uma das matérias da plataforma"
            />
            {recommendations.length === 0 ? (
              <EmptyState
                icon={BookOpen}
                title="Catálogo em preparação"
                description="As matérias serão exibidas aqui assim que o banco de dados estiver configurado."
              />
            ) : (
              <div className="subject-grid">
                {recommendations.map((s) => (
                  <Link key={s.id} to="/explorar" className="subject-card">
                    <span className="subject-icon">
                      <SubjectIcon name={s.icon} />
                    </span>
                    <strong>{s.name}</strong>
                    <span>{s.description}</span>
                  </Link>
                ))}
              </div>
            )}
          </Card>
        </div>

        <div className="dashboard-col">
          {/* ---------- Plano de hoje ---------- */}
          <TodayPlan
            tasks={tasks}
            subjects={subjects}
            doneCount={doneTasks}
            onAdd={addTask}
            onToggle={toggleTask}
            onDelete={deleteTask}
          />

          {/* ---------- Semana ---------- */}
          <Card>
            <SectionHeader title="Sua semana" subtitle="Minutos estudados por dia" />
            {weekMinutes === 0 ? (
              <EmptyState
                icon={Clock}
                title="Nenhuma sessão esta semana"
                description="Conclua uma tarefa do plano de hoje para registrar seus primeiros minutos."
              />
            ) : (
              <div className="week-chart" role="img" aria-label={`Total da semana: ${minutesToHuman(weekMinutes)}`}>
                {week.map((day) => (
                  <div key={day.key} className={`week-day ${day.isToday ? 'is-today' : ''}`}>
                    <span className="week-bar-wrap">
                      <span
                        className="week-bar"
                        style={{
                          height: `${weekMinutes ? Math.max(6, Math.round((day.minutes / Math.max(...week.map((d) => d.minutes), 1)) * 100)) : 6}%`,
                        }}
                        title={`${minutesToHuman(day.minutes)}`}
                      />
                    </span>
                    <span className="week-label">{day.label}</span>
                  </div>
                ))}
              </div>
            )}
          </Card>
        </div>
      </div>
    </div>
  )
}

/* =================== Plano de hoje =================== */

function TodayPlan({ tasks, subjects, doneCount, onAdd, onToggle, onDelete }) {
  const [formOpen, setFormOpen] = useState(false)
  const [title, setTitle] = useState('')
  const [minutes, setMinutes] = useState(30)
  const [subjectId, setSubjectId] = useState('')
  const [saving, setSaving] = useState(false)

  async function submit(event) {
    event.preventDefault()
    if (!title.trim()) return
    setSaving(true)
    const ok = await onAdd({ title: title.trim(), minutes: Number(minutes) || 30, subjectId })
    setSaving(false)
    if (ok) {
      setTitle('')
      setMinutes(30)
      setSubjectId('')
      setFormOpen(false)
    }
  }

  return (
    <Card>
      <SectionHeader
        title="Plano de hoje"
        subtitle={
          tasks.length > 0
            ? `${doneCount} de ${tasks.length} ${tasks.length === 1 ? 'atividade concluída' : 'atividades concluídas'}`
            : 'Organize suas próximas horas de estudo'
        }
        action={
          !formOpen && (
            <button type="button" className="btn btn-ghost btn-sm" onClick={() => setFormOpen(true)}>
              <Plus size={16} aria-hidden="true" /> Nova tarefa
            </button>
          )
        }
      />

      {formOpen && (
        <form className="task-form" onSubmit={submit}>
          <input
            type="text"
            className="input"
            placeholder="Ex.: Resolver 10 questões de funções"
            aria-label="Nome da tarefa"
            required
            value={title}
            onChange={(e) => setTitle(e.target.value)}
            autoFocus
          />
          <div className="task-form-row">
            <select
              className="input"
              aria-label="Matéria (opcional)"
              value={subjectId}
              onChange={(e) => setSubjectId(e.target.value)}
            >
              <option value="">Sem matéria</option>
              {subjects.map((s) => (
                <option key={s.id} value={s.id}>
                  {s.name}
                </option>
              ))}
            </select>
            <input
              type="number"
              className="input"
              min={5}
              max={600}
              step={5}
              aria-label="Duração estimada em minutos"
              value={minutes}
              onChange={(e) => setMinutes(e.target.value)}
            />
          </div>
          <div className="task-form-actions">
            <button type="button" className="btn btn-ghost btn-sm" onClick={() => setFormOpen(false)}>
              Cancelar
            </button>
            <button type="submit" className="btn btn-primary btn-sm" disabled={saving}>
              {saving && <Loader2 size={15} className="spin" aria-hidden="true" />}
              Adicionar
            </button>
          </div>
        </form>
      )}

      {tasks.length === 0 && !formOpen ? (
        <EmptyState
          icon={ClipboardList}
          title="Nada planejado para hoje"
          description="Adicione sua primeira tarefa e acompanhe o avanço da meta diária."
          action={
            <button type="button" className="btn btn-primary" onClick={() => setFormOpen(true)}>
              <Plus size={16} aria-hidden="true" /> Planejar meu dia
            </button>
          }
        />
      ) : (
        <ul className="task-list">
          {tasks.map((task) => (
            <li key={task.id} className={`task-item ${task.status === 'completed' ? 'is-done' : ''}`}>
              <button
                type="button"
                className="task-check"
                role="checkbox"
                aria-checked={task.status === 'completed'}
                aria-label={`Marcar "${task.title}" como ${task.status === 'completed' ? 'pendente' : 'concluída'}`}
                onClick={() => onToggle(task)}
              >
                <CheckCircle2 size={20} aria-hidden="true" />
              </button>
              <div className="task-info">
                <strong>{task.title}</strong>
                <span>
                  {task.subjects?.name ? `${task.subjects.name} · ` : ''}
                  {task.estimated_minutes}min
                </span>
              </div>
              <button
                type="button"
                className="icon-btn icon-btn-danger"
                aria-label={`Remover "${task.title}"`}
                onClick={() => onDelete(task)}
              >
                <Trash2 size={16} />
              </button>
            </li>
          ))}
        </ul>
      )}
    </Card>
  )
}

/* =================== Skeleton =================== */

function DashboardSkeleton() {
  return (
    <div className="page dashboard" aria-busy="true" aria-label="Carregando sua página inicial">
      <Card className="hero-card">
        <Skeleton width="55%" height={26} />
        <Skeleton width="35%" height={14} />
        <div className="hero-stats">
          {[0, 1, 2, 3].map((i) => (
            <Skeleton key={i} width={110} height={44} radius={12} />
          ))}
        </div>
      </Card>
      <div className="stats-grid">
        {[0, 1, 2, 3].map((i) => (
          <Card key={i} className="stat-card">
            <Skeleton width="60%" height={12} />
            <Skeleton width="40%" height={24} />
          </Card>
        ))}
      </div>
      <div className="dashboard-grid">
        <Card>
          <Skeleton width="40%" height={18} />
          <Skeleton height={90} radius={14} />
        </Card>
        <Card>
          <Skeleton width="40%" height={18} />
          <Skeleton height={90} radius={14} />
        </Card>
      </div>
    </div>
  )
}
