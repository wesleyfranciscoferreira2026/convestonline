import { useEffect, useState } from 'react'
console.log("STATS_LOADED_CHECK")
import { Link } from 'react-router-dom'
import { ArrowLeft, BarChart3, BookOpen, CheckCircle2, ClipboardList, Clock, Flame, Loader2, Lock, Sparkles, Target, Zap } from 'lucide-react'
import { supabase } from '../lib/supabaseClient'
import { useAuth } from '../lib/auth'
import { buildWeekBuckets, computeStreak, minutesToHuman, toISODate } from '../utils/date'
import { Card, CountUp, EmptyState, ProgressBar, StatCard } from '../components/ui'
import SubjectIcon from '../components/SubjectIcon'
import Markdown from '../components/Markdown'
import { chat, isAIAvailable } from '../lib/ai'
import { planName, statsLimitMessage, statsReviewsLimit } from '../lib/plans'

export default function Stats() {
  // UNIQUE_MARKER_XYZ123
  const { user, profile } = useAuth()
  const [loading, setLoading] = useState(true)
  const [sessions, setSessions] = useState([])
  const [attempts, setAttempts] = useState([])
  const [progress, setProgress] = useState([])
  const [subjects, setSubjects] = useState([])
  const [activeMinutes, setActiveMinutes] = useState(0)
  const [reviews, setReviews] = useState([])
  const [reviewText, setReviewText] = useState('')
  const [reviewLoading, setReviewLoading] = useState(false)
  const [reviewError, setReviewError] = useState('')
  const [showStats, setShowStats] = useState(true)

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

      let total = 0
      try {
        const raw = JSON.parse(localStorage.getItem('convest-active') || '{}')
        for (const v of Object.values(raw)) total += v || 0
      } catch { /* ignora */ }
      setActiveMinutes(Math.round(total / 60))

      const today = new Date().toISOString().slice(0, 10)
      const { data: todayReviews } = await supabase
        .from('stats_reviews')
        .select('id, review_date, summary, created_at')
        .eq('review_date', today)
        .order('created_at', { ascending: false })
      if (active) setReviews(todayReviews ?? [])

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

  const plan = profile?.plan || 'free'
  const reviewsUsed = reviews.length
  const reviewLimit = statsReviewsLimit(plan)
  const reviewsLeft = reviewLimit === Infinity ? Infinity : Math.max(0, reviewLimit - reviewsUsed)

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

  const bestSubject = bySubject
    .filter((s) => s.ans >= 5)
    .sort((a, b) => (b.acc ?? 0) - (a.acc ?? 0) || b.cor - a.cor)[0] || null

  const weekMap = {}
  for (const a of attempts) {
    const d = new Date(a.answered_at)
    const day = d.getDay()
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

  async function generateReview() {
    setReviewError('')
    if (reviewsLeft <= 0) {
      setReviewError(statsLimitMessage(plan, reviewsUsed))
      return
    }
    if (!isAIAvailable()) {
      setReviewError('A IA nao esta configurada. Abra Convest IA > Configurar para ativar.')
      return
    }
    setReviewLoading(true)
    const resumo = [
      `Tempo total estudado: ${minutesToHuman(totalMinutes)}.`,
      `Questões resolvidas: ${answered}, com ${correct} acertos (${accuracy}% de acerto).`,
      `Aulas concluídas: ${completedLessons}. Sequência atual: ${streak} dias.`,
      `Dias ativos: ${activeDays}. Tempo ativo no site: ${minutesToHuman(activeMinutes)}.`,
      ...bySubject.map(
        (s) => `Matéria ${s.name}: ${minutesToHuman(s.mins)} estudados, ${s.cor}/${s.ans} acertos${s.acc !== null ? ` (${s.acc}%)` : ''}, ${s.completed} aulas concluídas.`,
      ),
    ].join(' ')
    const prompt = [
      'Você é a tutora de estudos do Convest+. Analise os dados de evolução deste aluno e escreva uma revisão de estatísticas pessoal.',
      'Seja encorajador, específico e prático, em português, usando Markdown.',
      'Estruture em: 1) Panorama (resumo do desempenho), 2) Pontos fortes, 3) O que melhorar, 4) Plano de ação para os próximos 7 dias.',
      'Não invente números que não estejam nos dados. Máximo de 400 palavras.',
      '',
      'Dados do aluno:',
      `${resumo}`,
    ].join('\n')
    const result = await chat({
      messages: [
        { role: 'system', content: 'Você é um tutor de estudos didático e objetivo. Responda sempre em português.' },
        { role: 'user', content: prompt },
      ],
      temperature: 0.5,
    })
    if (!result.ok) {
      setReviewError(`${result.error.title} ${result.error.hint}`)
      setReviewLoading(false)
      return
    }
    const text = result.text || ''
    setReviewText(text)
    setReviewLoading(false)
    if (user) {
      const { data: inserted } = await supabase
        .from('stats_reviews')
        .insert({ user_id: user.id, summary: text.slice(0, 4000) })
        .select('id, review_date, summary, created_at')
        .maybeSingle()
      if (inserted) setReviews((current) => [inserted, ...current])
    }
  }

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
            <StatCard icon={Clock} label="Tempo total" value={totalMinutes} format={minutesToHuman} animated={showStats} />
            <StatCard icon={ClipboardList} label="Questões resolvidas" value={answered} animated={showStats} />
            <StatCard icon={Target} label="Taxa de acerto" value={accuracy} suffix="%" animated={showStats} />
            <StatCard icon={BookOpen} label="Aulas concluídas" value={completedLessons} animated={showStats} />
            <StatCard icon={Flame} label="Sequência" value={streak} suffix={streak === 1 ? " dia" : " dias"} animated={showStats} />
            <StatCard icon={Zap} label="Tempo ativo no site" value={activeMinutes} format={minutesToHuman} animated={showStats} />
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

      <Card className="stats-review-card">
        <div className="stats-review-head">
          <div>
            <h3 className="section-title">Revisão das minhas estatísticas</h3>
            <p className="stats-review-sub">
              Um relatório pessoal sobre sua evolução, escrito pela Convest IA.
            </p>
          </div>
          <span className={`stats-review-badge ${reviewsLeft > 0 ? 'is-free' : 'is-locked'}`}>
            {reviewsLeft === Infinity
              ? 'Ilimitado'
              : `${reviewsLeft} de ${reviewLimit} hoje`}
          </span>
        </div>

        <div className="stats-review-limits">
          <span className="stats-review-plan">Plano atual: <strong>{planName(plan)}</strong></span>
          <span className="stats-review-hint">
            {reviewLimit === Infinity
              ? 'Seu plano dá acesso ilimitado às revisões de estatísticas.'
              : `Plano Gratuito: 1 revisão por dia. Básico: até 5. Pro: até 10. Premium: ilimitado.`}
          </span>
        </div>

        {reviewsLeft <= 0 && (
          <div className="stats-review-locked">
            <Lock size={15} aria-hidden="true" />
            <span>
              {statsLimitMessage(plan, reviewsUsed)}{" "}
              <Link to="/planos" className="stats-review-link">
                Ver planos
              </Link>
            </span>
          </div>
        )}

        <div className="task-form-actions stats-review-actions">
          <button
            type="button"
            className="btn btn-primary"
            onClick={generateReview}
            disabled={reviewLoading || reviewsLeft <= 0}
          >
            {reviewLoading ? <Loader2 size={16} className="spin" aria-hidden="true" /> : <Sparkles size={16} aria-hidden="true" />}
            {reviewLoading ? 'Analisando...' : 'Ver minhas estatísticas'}
          </button>
          <span className="stats-review-count">
            {reviewsUsed} revisão(ões) hoje
          </span>
        </div>

        {reviewError && <p className="form-error" role="alert">{reviewError}</p>}

        {reviewText && (
          <div className="stats-review-output">
            <Markdown text={reviewText} />
          </div>
        )}

        {reviews.length > 0 && (
          <details className="stats-review-history">
            <summary>Revisões de hoje ({reviews.length})</summary>
            <ul className="stats-review-history-list">
              {reviews.map((r) => (
                <li key={r.id}>
                  <span className="stats-review-time">
                    {new Date(r.created_at).toLocaleTimeString('pt-BR', { hour: '2-digit', minute: '2-digit' })}
                  </span>
                  <span className="stats-review-summary">
                    {(r.summary || '').slice(0, 160)}...
                  </span>
                </li>
              ))}
            </ul>
          </details>
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
