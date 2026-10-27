import { useEffect, useState } from 'react'
import { Link, useSearchParams } from 'react-router-dom'
import { ArrowLeft, CheckCircle2, Loader2, RotateCcw, Sparkles, XCircle } from 'lucide-react'
import { supabase } from '../../lib/supabaseClient'
import { useAuth } from '../../lib/auth'
import { useToast } from '../../components/Toast'
import { Card, EmptyState, ProgressBar } from '../../components/ui'

const KIDS_SUBJECTS = [
  { slug: 'portugues', name: 'Português', emoji: '📖' },
  { slug: 'matematica', name: 'Matemática', emoji: '🔢' },
  { slug: 'ciencias', name: 'Ciências', emoji: '🔬' },
  { slug: 'historia', name: 'História', emoji: '🏰' },
  { slug: 'geografia', name: 'Geografia', emoji: '🌍' },
  { slug: 'ingles', name: 'Inglês', emoji: '🗣️' },
]

export default function KidsExercises() {
  const { user } = useAuth()
  const toast = useToast()
  const [searchParams] = useSearchParams()
  const initialSubject = searchParams.get('subject') || ''

  const [gradeGroup, setGradeGroup] = useState('kids1') // 'kids1' | 'kids2'
  const [subjectSlug, setSubjectSlug] = useState(initialSubject)
  const [subject, setSubject] = useState(null)
  const [topics, setTopics] = useState([])
  const [selectedTopic, setSelectedTopic] = useState('')
  const [grade, setGrade] = useState('')
  const [questions, setQuestions] = useState([])
  const [loading, setLoading] = useState(false)
  const [session, setSession] = useState(null)
  const [showEffect, setShowEffect] = useState(null) // 'correct' | 'wrong' | null

  useEffect(() => {
    if (!subjectSlug) { setSubject(null); return }
    let active = true
    async function load() {
      const { data: subj } = await supabase.from('subjects').select('id, name').eq('slug', subjectSlug).maybeSingle()
      if (!active) return
      setSubject(subj)
      if (!subj) return
      const { data: qs } = await supabase
        .from('questions')
        .select('topic, grade')
        .eq('subject_id', subj.id)
        .eq('level', gradeGroup)
        .eq('status', 'published')
      if (!active) return
      const tset = new Set((qs ?? []).map((q) => q.topic).filter(Boolean))
      const gset = new Set((qs ?? []).map((q) => q.grade).filter(Boolean))
      setTopics(Array.from(tset).sort())
      if (gradeGroup === 'kids1' && gset.size > 0) setGrade(String(Math.min(...gset)))
    }
    load()
    return () => { active = false }
  }, [subjectSlug, gradeGroup])

  async function start() {
    if (!subject) { toast('Selecione uma matéria.', 'error'); return }
    setLoading(true)
    let query = supabase
      .from('questions')
      .select('id, prompt, options, correct_index, explanation, topic, grade')
      .eq('subject_id', subject.id)
      .eq('level', gradeGroup)
      .eq('status', 'published')
    if (selectedTopic) query = query.eq('topic', selectedTopic)
    if (grade) query = query.eq('grade', Number(grade))
    const { data } = await query.order('sort_order')
    setLoading(false)
    const qs = (data ?? []).sort(() => Math.random() - 0.5)
    if (qs.length === 0) {
      toast('Nenhuma questão encontrada para essa seleção.', 'error')
      return
    }
    setQuestions(qs)
    setSession({ index: 0, answers: [], selected: null, confirmed: false, finished: false })
    setShowEffect(null)
  }

  async function confirmAnswer() {
    if (session.selected === null) return
    const q = questions[session.index]
    const correct = session.selected === q.correct_index
    if (user) {
      await supabase.from('question_attempts').insert({
        user_id: user.id,
        subject_id: subject.id,
        question_id: q.id,
        is_correct: correct,
      })
    }
    setShowEffect(correct ? 'correct' : 'wrong')
    setSession((s) => ({
      ...s,
      confirmed: true,
      answers: [...s.answers, { selected: s.selected, correct }],
    }))
  }

  function skipQuestion() {
    setShowEffect(null)
    setSession((s) => {
      const nextIndex = s.index + 1
      if (nextIndex >= questions.length) return { ...s, finished: true, selected: null, confirmed: false, skipped: (s.skipped || 0) + 1 }
      return { ...s, index: nextIndex, selected: null, confirmed: false, skipped: (s.skipped || 0) + 1 }
    })
  }

  function nextQuestion() {
    setSession((s) => {
      const nextIndex = s.index + 1
      if (nextIndex >= questions.length) return { ...s, finished: true, selected: null, confirmed: false }
      return { ...s, index: nextIndex, selected: null, confirmed: false }
    })
    setShowEffect(null)
  }

  function resetAll() {
    setQuestions([])
    setSession(null)
    setShowEffect(null)
  }

  // ---------- Hub ----------
  if (questions.length === 0) {
    return (
      <div className="kids-page">
        <Link to="/kids" className="kids-back-link">
          <ArrowLeft size={16} aria-hidden="true" /> Voltar
        </Link>
        <header className="kids-page-header">
          <h1>Exercícios Kids</h1>
          <p>Escolha o nível, a matéria e o tópico para praticar!</p>
        </header>

        <Card className="kids-info-card">
          <div className="field">
            <label>Nível de ensino</label>
            <div className="kids-level-tabs">
              <button type="button" className={`kids-level-tab ${gradeGroup === 'kids1' ? 'is-active' : ''}`} onClick={() => { setGradeGroup('kids1'); setSelectedTopic(''); setGrade('') }}>
                1º ao 5º ano
              </button>
              <button type="button" className={`kids-level-tab ${gradeGroup === 'kids2' ? 'is-active' : ''}`} onClick={() => { setGradeGroup('kids2'); setSelectedTopic(''); setGrade('') }}>
                6º ao 9º ano
              </button>
            </div>
          </div>

          <div className="field">
            <label>Matéria</label>
            <div className="kids-subject-grid">
              {KIDS_SUBJECTS.map((s) => (
                <button
                  key={s.slug}
                  type="button"
                  className={`kids-subject-card ${subjectSlug === s.slug ? 'is-selected' : ''}`}
                  onClick={() => setSubjectSlug(s.slug)}
                  style={{ '--kid-color': '#f97316' }}
                >
                  <span className="kids-subject-emoji">{s.emoji}</span>
                  <strong>{s.name}</strong>
                </button>
              ))}
            </div>
          </div>

          {topics.length > 0 && (
            <div className="field">
              <label>Tópico</label>
              <div className="kids-topic-chips">
                <button type="button" className={`kids-chip ${selectedTopic === '' ? 'is-active' : ''}`} onClick={() => setSelectedTopic('')}>
                  Todos
                </button>
                {topics.map((t) => (
                  <button key={t} type="button" className={`kids-chip ${selectedTopic === t ? 'is-active' : ''}`} onClick={() => setSelectedTopic(t)}>
                    {t}
                  </button>
                ))}
              </div>
            </div>
          )}

          {loading && <p className="gen-hint">Carregando…</p>}

          <button type="button" className="btn btn-primary btn-block" onClick={start} disabled={!subject || loading}>
            <Sparkles size={16} aria-hidden="true" /> Começar exercícios
          </button>
        </Card>
      </div>
    )
  }

  // ---------- Resultado ----------
  if (session?.finished) {
    const correct = session.answers.filter((a) => a.correct).length
    const total = questions.length
    const pct = Math.round((correct / total) * 100)
    return (
      <div className="kids-page">
        <div className="kids-result-card">
          <div className="kids-result-emoji">{pct >= 80 ? '🏆' : pct >= 50 ? '⭐' : '💪'}</div>
          <h1>{pct >= 80 ? 'Parabéns!' : pct >= 50 ? 'Muito bem!' : 'Continue tentando!'}</h1>
          <p>Você acertou {correct} de {total} questões ({pct}%).</p>
          <div className="kids-result-actions">
            <button type="button" className="btn btn-outline" onClick={resetAll}>Voltar</button>
            <button type="button" className="btn btn-primary" onClick={start}>Tentar de novo</button>
          </div>
        </div>
      </div>
    )
  }

  // ---------- Runner ----------
  const q = questions[session.index]
  return (
    <div className="kids-page">
      <div className="kids-runner-header">
        <button type="button" className="kids-back-link" onClick={resetAll}>
          <ArrowLeft size={16} aria-hidden="true" /> Sair
        </button>
        <span className="kids-progress-text">
          Questão {session.index + 1} de {questions.length}
        </span>
      </div>
      <ProgressBar value={session.index + (session.confirmed ? 1 : 0)} max={questions.length} label="Progresso" />

      <Card className={`kids-question-card ${showEffect ? `kid-effect-${showEffect}` : ''}`}>
        <p className="kids-question-prompt">{q.prompt}</p>
        <div className="kids-options">
          {q.options.map((opt, idx) => {
            const selected = session.selected === idx
            const confirmed = session.confirmed
            const isCorrect = idx === q.correct_index
            let cls = 'kids-option'
            if (selected) cls += ' is-selected'
            if (confirmed) {
              if (isCorrect) cls += ' is-correct'
              else if (selected) cls += ' is-wrong'
            }
            return (
              <button key={idx} type="button" className={cls} disabled={confirmed} onClick={() => setSession((s) => ({ ...s, selected: idx }))}>
                <span className="kids-option-letter">{String.fromCharCode(65 + idx)}</span>
                <span>{opt}</span>
                {confirmed && isCorrect && <span className="kid-correct-badge">✅</span>}
                {confirmed && selected && !isCorrect && <span className="kid-wrong-badge">💧</span>}
              </button>
            )
          })}
        </div>

        {!session.confirmed ? (
          <div className="question-actions">
            <button type="button" className="btn btn-primary kids-confirm-btn" disabled={session.selected === null} onClick={confirmAnswer}>
              Confirmar
            </button>
            <button type="button" className="btn btn-ghost" onClick={skipQuestion}>
              Pular
            </button>
          </div>
        ) : (
          <div className="kids-feedback">
            {session.selected === q.correct_index ? (
              <p className="kid-feedback-ok">🎉 Muito bem! Você acertou!</p>
            ) : (
              <p className="kid-feedback-bad">💧 Ops! Não foi dessa vez.</p>
            )}
            {q.explanation && (
              <div className="kid-explanation">
                <strong>💡 Explicação:</strong>
                <p>{q.explanation}</p>
              </div>
            )}
            <button type="button" className="btn btn-primary kids-next-btn" onClick={nextQuestion}>
              {session.index === questions.length - 1 ? 'Ver resultado' : 'Próxima questão →'}
            </button>
          </div>
        )}
      </Card>

      {showEffect === 'correct' && (
        <div className="kid-confetti" aria-hidden="true">
          {Array.from({ length: 24 }).map((_, i) => (
            <span key={i} className="kid-confetti-piece" style={{ '--i': i }} />
          ))}
        </div>
      )}
    </div>
  )
}
