import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { ArrowLeft, BarChart3, BookOpen, CheckCircle2, ClipboardList, Clock, Flame, Target, Zap } from 'lucide-react'
import { supabase } from '../lib/supabaseClient'
import { useAuth } from '../lib/auth'
import { buildWeekBuckets, computeStreak, minutesToHuman, toISODate } from '../utils/date'
import { Card, EmptyState, ProgressBar, StatCard } from '../components/ui'
import SubjectIcon from '../components/SubjectIcon'

export default function Stats() {
  const { user } = useAuth()
  const [loading, setLoading] = useState(true)
  const [sessions, setSessions] = useState([])
  const [attempts, setAttempts] = useState([])
  const [progress, setProgress] = useState([])
  const [subjects, setSubjects] = useState([])
  const [activeMinutes, setActiveMinutes] = useState(0)

  useEffect(() => {
    if (!user) { setLoading(false); return }
    let active = true
    async function load() {
      const [sessRes, attRes, progRes, subjRes] = await Promise.all([
        supabase.from('study_sessions').select('duration_minutes, studied_at, source, subject_id').order('studied_at', { ascending: false }),
        supabase.from('question_attempts').select('is_correct, answered_at, subject_id'),
        supabase.from('user_lesson_progress').select('progress_percent, completed_at, lesson_id, lessons(subject_id)'),
        supabase.from('subjects').select('id, name, icon').order('sort_order'),
      ])
      if (!active) return
      setSessions(sessRes.data ?? [])
      setAttempts(attRes.data ?? [])
      setProgress(progRes.data ?? [])
      setSubjects(subjRes.data ?? [])

      // Tempo ativo no site (localStorage, buckets por dia)
      let total = 0
      try {
        const raw = JSON.parse(localStorage.getItem('convest-active') || '{}')
        for (const v of Object.values(raw)) total += v || 0
      } catch { /* ignora */ }
      setActiveMinutes(Math.round(total / 60))
      setLoading(false)
    }
    load()
    return () => { active = false }
  }, [user])

  if (!user) {
    return (
      <div className="page">
        <Card>
          <EmptyState icon={BarChart3} title="Entre na sua conta" description="Suas estatísticas ficam salvas na sua conta." />
        </Card>
      </div>
    )
  }

  if (loading) {
    return (
      <div className="page">
        <Card><div style={{ height: 120 }} /></Card>
      </div>
    )
  }

  const week = buildWeekBuckets(sessions)
  const weekMinutes = week.reduce((s, d) => s + d.minutes, 0)
  const totalMinutes = sessions.reduce((s, x) => s + x.duration_minutes, 0)
  const streak = computeStreak(sessions.map((s) => s.studied_at))
  const answered = attempts.length
  const correct = attempts.filter((a) => a.is_correct).length
  const accuracy = answered > 0 ? Math.round((correct / answered) * 100) : 0
  const completedLessons = progress.filter((p) => p.completed_at).length
  const activeDays = new Set(sessions.map((s) => toISODate(new Date(s.studied_at)))).size

  // Por matéria
  const bySubject = subjects.map((subj) => {
    const subjAttempts = attempts.filter((a) => a.subject_id === subj.id)
    const subjSessions = sessions.filter((s) => s.subject_id === subj.id)
    const mins = subjSessions.reduce((s, x) => s + x.duration_minutes, 0)
    const ans = subjAttempts.length
    const cor = subjAttempts.filter((a) => a.is_correct).length
    const acc = ans > 0 ? Math.round((cor / ans) * 100) : null
    const completed = progress.filter((p) => p.lessons?.subject_id === subj.id && p.completed_at).length
    return { ...subj, mins, ans, cor, acc, completed }
  }).filter((s) => s.mins > 0 || s.ans > 0 || s.completed > 0)

  // Melhor matéria: maior taxa de acerto (mín. 5 questões), desempate por mais acertos.
  const bestSubject = bySubject
    .filter((s) => s.ans >= 5)
    .sort((a, b) => (b.acc ?? 0) - (a.acc ?? 0) || b.cor - a.cor)[0] || null

  // Melhor período: agrupa tentativas por semana (segunda-feira) e encontra a melhor.
  const weekMap = {}
  for (const a of attempts) {
    const d = new Date(a.answered_at)
    const day = d.getDay() // 0=dom
    const monday = new Date(d)
    monday.setDate(d.getDate() - ((day + 6) % 7))
    monday.setHours(0, 0, 0, 0)
    const key = toISODate(monday)
    if (!weekMap[key]) weekMap[key] = { correct: 0, total: 0, start: monday }
    weekMap[key].total += 1
    if (a.is_correct) weekMap[key].correct += 1
  }
  const weekEntries = Object.entries(weekMap).map(([key, v]) => ({
    key,
    start: v.start,
    correct: v.correct,
    total: v.total,
    acc: v.total > 0 ? Math.round((v.correct / v.total) * 100) : 0,
  }))
  const bestWeek = weekEntries
    .filter((w) => w.total >= 5)
    .sort((a, b) => b.acc - a.acc || b.correct - a.correct)[0] || null

  // Histórico recente (últimas 10 atividades)
  const recent = sessions.slice(0, 10)

  return (
    <div className="page">
      <Link to="/" className="back-link">
        <ArrowLeft size={16} aria-hidden="true" /> Voltar ao início
      </Link>
      <header className="page-header">
        <h2>Estatísticas</h2>
        <p>Sua evolução individual — sem rankings, só você contra você.</p>
      </header>

      <div className="stats-grid">
        <StatCard icon={Clock} label="Tempo total" value={minutesToHuman(totalMinutes)} />
        <StatCard icon={ClipboardList} label="Questões resolvidas" value={answered} />
        <StatCard icon={Target} label="Taxa de acerto" value={answered > 0 ? `${accuracy}%` : '—'} />
        <StatCard icon={BookOpen} label="Aulas concluídas" value={completedLessons} />
        <StatCard icon={Flame} label="Sequência" value={`${streak} ${streak === 1 ? 'dia' : 'dias'}`} />
        <StatCard icon={Zap} label="Tempo ativo no site" value={minutesToHuman(activeMinutes)} />
      </div>

      <Card className="best-performance-card">
        <h3 className="section-title">Melhor desempenho</h3>
        {bestSubject || bestWeek ? (
          <div className="best-performance-grid">
            {bestSubject && (
              <div className="best-performance-item">
                <span className="best-performance-label">Melhor matéria</span>
                <div className="best-performance-value">
                  <SubjectIcon name={bestSubject.icon} size={20} />
                  <strong>{bestSubject.name}</strong>
                </div>
                <span className="best-performance-meta">
                  {bestSubject.acc}% de acerto · {bestSubject.cor}/{bestSubject.ans} questões
                </span>
              </div>
            )}
            {bestWeek && (
              <div className="best-performance-item">
                <span className="best-performance-label">Melhor semana</span>
                <div className="best-performance-value">
                  <strong>
                    {bestWeek.start.toLocaleDateString('pt-BR', { day: '2-digit', month: 'short' })} –{' '}
                    {new Date(bestWeek.start.getTime() + 6 * 86400000).toLocaleDateString('pt-BR', { day: '2-digit', month: 'short', year: 'numeric' })}
                  </strong>
                </div>
                <span className="best-performance-meta">
                  {bestWeek.acc}% de acerto · {bestWeek.correct}/{bestWeek.total} questões
                </span>
              </div>
            )}
          </div>
        ) : (
          <EmptyState
            icon={Target}
            title="Ainda não há dados suficientes"
            description="Resolva pelo menos 5 questões em uma matéria para calcular seu melhor desempenho."
          />
        )}
      </Card>

      <Card>
        <h3 className="section-title">Minutos por dia — última semana</h3>
        {weekMinutes === 0 ? (
          <EmptyState icon={Clock} title="Nenhuma sessão esta semana" description="Conclua uma tarefa ou leia uma aula para registrar minutos." />
        ) : (
          <div className="week-chart" role="img" aria-label={`Total da semana: ${minutesToHuman(weekMinutes)}`}>
            {week.map((day) => {
              const max = Math.max(...week.map((d) => d.minutes), 1)
              return (
                <div key={day.key} className={`week-day ${day.isToday ? 'is-today' : ''}`}>
                  <span className="week-bar-wrap">
                    <span className="week-bar" style={{ height: `${Math.max(6, Math.round((day.minutes / max) * 100))}%` }} title={minutesToHuman(day.minutes)} />
                  </span>
                  <span className="week-label">{day.label}</span>
                  <span className="week-min">{day.minutes > 0 ? day.minutes : ''}</span>
                </div>
              )
            })}
          </div>
        )}
      </Card>

      <Card>
        <h3 className="section-title">Por matéria</h3>
        {bySubject.length === 0 ? (
          <EmptyState icon={BarChart3} title="Sem dados por matéria ainda" description="Resolva exercícios e estude aulas para ver o detalhamento." />
        ) : (
          <div className="subject-stats">
            {bySubject.map((s) => (
              <div key={s.id} className="subject-stat-row">
                <div className="subject-stat-name">
                  <SubjectIcon name={s.icon} size={16} />
                  <strong>{s.name}</strong>
                </div>
                <div className="subject-stat-metrics">
                  <span><Clock size={13} aria-hidden="true" /> {minutesToHuman(s.mins)}</span>
                  <span><CheckCircle2 size={13} aria-hidden="true" /> {s.cor}/{s.ans} acertos {s.acc !== null ? `(${s.acc}%)` : ''}</span>
                  <span><BookOpen size={13} aria-hidden="true" /> {s.completed} aulas</span>
                </div>
                {s.ans > 0 && <ProgressBar value={s.cor} max={s.ans} label={`Acerto em ${s.name}`} />}
              </div>
            ))}
          </div>
        )}
      </Card>

      <Card>
        <h3 className="section-title">Histórico recente</h3>
        {recent.length === 0 ? (
          <EmptyState icon={Clock} title="Sem atividades registradas" description="Suas sessões de estudo aparecerão aqui." />
        ) : (
          <ul className="history-list">
            {recent.map((s, i) => (
              <li key={i} className="history-item">
                <span className="history-time">{new Date(s.studied_at).toLocaleString('pt-BR', { day: '2-digit', month: '2-digit', hour: '2-digit', minute: '2-digit' })}</span>
                <span className="history-desc">
                  {minutesToHuman(s.duration_minutes)} estudados
                  {s.source ? ` · ${sourceLabel(s.source)}` : ''}
                </span>
              </li>
            ))}
          </ul>
        )}
      </Card>

      <p className="settings-note">
        Dias ativos: {activeDays}. Sem rankings ou comparações — só sua evolução.
      </p>
    </div>
  )
}

function sourceLabel(src) {
  return src === 'task' ? 'tarefa' : src === 'lesson' ? 'aula' : src === 'exercise' ? 'exercício' : 'manual'
}
