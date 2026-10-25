import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import {
  ArrowLeft,
  ArrowRight,
  CheckCircle2,
  Loader2,
  RotateCcw,
  Trash2,
  XCircle,
} from 'lucide-react'
import { supabase } from '../lib/supabaseClient'
import { useAuth } from '../lib/auth'
import { useToast } from '../components/Toast'
import SubjectIcon from '../components/SubjectIcon'
import { Card, EmptyState, ProgressBar } from '../components/ui'

export default function Review() {
  const { user } = useAuth()
  const toast = useToast()
  const [loading, setLoading] = useState(true)
  const [wrong, setWrong] = useState([]) // [{question, count, reviewed}]
  const [reviewedSet, setReviewedSet] = useState(new Set())
  const [mode, setMode] = useState('list') // 'list' | 'quiz'
  const [questions, setQuestions] = useState([])
  const [session, setSession] = useState(null)

  useEffect(() => {
    if (!user) { setLoading(false); return }
    let active = true
    async function load() {
      const [{ data: attempts }, { data: reviewed }] = await Promise.all([
        supabase
          .from('question_attempts')
          .select('question_id, is_correct, subject_id, questions(id, prompt, options, correct_index, explanation, subject_id, subjects(name, icon))')
          .eq('user_id', user.id)
          .eq('is_correct', false),
        supabase.from('reviewed_questions').select('question_id').eq('user_id', user.id),
      ])
      if (!active) return
      const map = new Map()
      for (const a of attempts ?? []) {
        if (!a.questions) continue
        const q = a.questions
        if (!map.has(q.id)) map.set(q.id, { question: q, count: 0 })
        map.get(q.id).count += 1
      }
      const rset = new Set((reviewed ?? []).map((r) => r.question_id))
      setReviewedSet(rset)
      setWrong(Array.from(map.values()))
      setLoading(false)
    }
    load()
    return () => { active = false }
  }, [user])

  async function toggleReviewed(qid) {
    if (reviewedSet.has(qid)) {
      await supabase.from('reviewed_questions').delete().eq('user_id', user.id).eq('question_id', qid)
      setReviewedSet((s) => { const n = new Set(s); n.delete(qid); return n })
    } else {
      await supabase.from('reviewed_questions').insert({ user_id: user.id, question_id: qid })
      setReviewedSet((s) => new Set(s).add(qid))
      toast('Marcada como revisada.')
    }
  }

  function startReviewQuiz() {
    const qs = wrong
      .filter((w) => !reviewedSet.has(w.question.id))
      .map((w) => w.question)
    const list = qs.length > 0 ? qs : wrong.map((w) => w.question)
    if (list.length === 0) { toast('Nenhuma questão para revisar.', 'error'); return }
    setQuestions(list.sort(() => Math.random() - 0.5))
    setSession({ index: 0, answers: [], selected: null, confirmed: false, finished: false })
    setMode('quiz')
  }

  async function confirmAnswer() {
    if (session.selected === null) return
    const q = questions[session.index]
    const correct = session.selected === q.correct_index
    await supabase.from('question_attempts').insert({
      user_id: user.id,
      subject_id: q.subject_id,
      question_id: q.id,
      is_correct: correct,
    })
    setSession((s) => ({
      ...s,
      confirmed: true,
      answers: [...s.answers, { selected: s.selected, correct }],
    }))
  }

  function nextQuestion() {
    setSession((s) => {
      const nextIndex = s.index + 1
      if (nextIndex >= questions.length) return { ...s, finished: true, selected: null, confirmed: false }
      return { ...s, index: nextIndex, selected: null, confirmed: false }
    })
  }

  if (!user) {
    return (
      <div className="page">
        <Card>
          <EmptyState icon={RotateCcw} title="Entre na sua conta" description="Sua revisão fica salva na sua conta." />
        </Card>
      </div>
    )
  }

  if (loading) {
    return (
      <div className="page">
        <Card><div style={{ height: 80 }} /></Card>
      </div>
    )
  }

  // ---------- Quiz ----------
  if (mode === 'quiz') {
    if (session?.finished) {
      const correct = session.answers.filter((a) => a.correct).length
      const total = questions.length
      const pct = Math.round((correct / total) * 100)
      return (
        <div className="page">
          <header className="page-header">
            <h2>Revisão concluída</h2>
            <p>Você acertou {correct} de {total}.</p>
          </header>
          <Card className="result-card">
            <div className="result-score"><strong>{pct}%</strong><span>{correct}/{total}</span></div>
            <ProgressBar value={correct} max={total} label="Resultado da revisão" />
            <div className="result-actions">
              <button type="button" className="btn btn-outline" onClick={() => setMode('list')}>Voltar à lista</button>
              <button type="button" className="btn btn-primary" onClick={startReviewQuiz}>Refazer</button>
            </div>
          </Card>
        </div>
      )
    }
    const q = questions[session.index]
    return (
      <div className="page">
        <header className="page-header">
          <button type="button" className="back-link" onClick={() => setMode('list')}>
            <ArrowLeft size={16} aria-hidden="true" /> Voltar à lista
          </button>
          <h2>Revisão</h2>
          <p>Questão {session.index + 1} de {questions.length}</p>
          <ProgressBar value={session.index + (session.confirmed ? 1 : 0)} max={questions.length} label="Progresso da revisão" />
        </header>
        <Card className="question-card">
          <p className="question-prompt">{q.prompt}</p>
          <div className="question-options">
            {q.options.map((opt, idx) => {
              const selected = session.selected === idx
              const confirmed = session.confirmed
              const isCorrect = idx === q.correct_index
              let cls = 'question-option'
              if (selected) cls += ' is-selected'
              if (confirmed) {
                if (isCorrect) cls += ' is-correct'
                else if (selected) cls += ' is-wrong'
              }
              return (
                <button key={idx} type="button" className={cls} disabled={confirmed} onClick={() => setSession((s) => ({ ...s, selected: idx }))}>
                  <span className="option-letter">{String.fromCharCode(65 + idx)}</span>
                  <span>{opt}</span>
                  {confirmed && isCorrect && <CheckCircle2 size={18} aria-hidden="true" />}
                  {confirmed && selected && !isCorrect && <XCircle size={18} aria-hidden="true" />}
                </button>
              )
            })}
          </div>
          {!session.confirmed ? (
            <button type="button" className="btn btn-primary" disabled={session.selected === null} onClick={confirmAnswer}>
              Confirmar
            </button>
          ) : (
            <div className="question-feedback">
              {session.selected === q.correct_index ? (
                <p className="feedback-ok"><CheckCircle2 size={16} aria-hidden="true" /> Correta!</p>
              ) : (
                <p className="feedback-bad"><XCircle size={16} aria-hidden="true" /> Incorreta.</p>
              )}
              {q.explanation && <p className="feedback-expl">{q.explanation}</p>}
              <button type="button" className="btn btn-primary" onClick={nextQuestion}>
                {session.index === questions.length - 1 ? 'Ver resultado' : 'Próxima'} <ArrowRight size={16} aria-hidden="true" />
              </button>
            </div>
          )}
        </Card>
      </div>
    )
  }

  // ---------- Lista ----------
  const pending = wrong.filter((w) => !reviewedSet.has(w.question.id))
  return (
    <div className="page">
      <header className="page-header">
        <h2>Revisão</h2>
        <p>Reveja as questões que você errou e marque como revisadas.</p>
      </header>

      {wrong.length === 0 ? (
        <Card>
          <EmptyState
            icon={CheckCircle2}
            title="Nenhuma questão errada"
            description="Resolva exercícios primeiro. As questões que você errar aparecerão aqui para revisão."
            action={<Link to="/exercicios" className="btn btn-primary">Ir para exercícios</Link>}
          />
        </Card>
      ) : (
        <>
          <Card>
            <div className="review-summary">
              <span><strong>{wrong.length}</strong> questões erradas</span>
              <span><strong>{pending.length}</strong> pendentes de revisão</span>
              <button type="button" className="btn btn-primary btn-sm" onClick={startReviewQuiz} disabled={pending.length === 0 && wrong.length === 0}>
                <RotateCcw size={15} aria-hidden="true" /> Refazer erradas
              </button>
            </div>
          </Card>

          <div className="review-list">
            {wrong.map((w) => {
              const q = w.question
              const reviewed = reviewedSet.has(q.id)
              return (
                <Card key={q.id} className={`review-card ${reviewed ? 'is-reviewed' : ''}`}>
                  <div className="review-card-head">
                    <span className="review-subject">
                      <SubjectIcon name={q.subjects?.icon} size={14} /> {q.subjects?.name}
                    </span>
                    <span className="review-count">errada {w.count}x</span>
                  </div>
                  <p className="review-q">{q.prompt}</p>
                  <p className="review-right">
                    <CheckCircle2 size={14} aria-hidden="true" /> Resposta correta: {q.options[q.correct_index]}
                  </p>
                  {q.explanation && <p className="review-expl">{q.explanation}</p>}
                  <div className="review-card-actions">
                    <button
                      type="button"
                      className={`btn btn-sm ${reviewed ? 'btn-ghost' : 'btn-outline'}`}
                      onClick={() => toggleReviewed(q.id)}
                    >
                      {reviewed ? '✓ Revisada' : 'Marcar como revisada'}
                    </button>
                  </div>
                </Card>
              )
            })}
          </div>
        </>
      )}
    </div>
  )
}
