import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import {
  ArrowLeft,
  ArrowRight,
  CheckCircle2,
  ClipboardList,
  Loader2,
  RotateCcw,
  XCircle,
} from 'lucide-react'
import { supabase } from '../lib/supabaseClient'
import { useAuth } from '../lib/auth'
import { useToast } from '../components/Toast'
import SubjectIcon from '../components/SubjectIcon'
import { Card, EmptyState, ProgressBar } from '../components/ui'

export default function Exercises() {
  const { user } = useAuth()
  const toast = useToast()
  const [subjects, setSubjects] = useState(null)
  const [counts, setCounts] = useState({})
  const [activeSubject, setActiveSubject] = useState(null)
  const [questions, setQuestions] = useState([])
  const [loadingQ, setLoadingQ] = useState(false)
  const [session, setSession] = useState(null) // { index, answers: [{selected, correct}], finished }

  useEffect(() => {
    let active = true
    async function load() {
      const { data: subs } = await supabase.from('subjects').select('id, slug, name, icon').order('sort_order')
      if (!active) return
      setSubjects(subs ?? [])
      // Contagem de questões por matéria
      const { data: qs } = await supabase.from('questions').select('subject_id').eq('status', 'published')
      const c = {}
      for (const q of qs ?? []) c[q.subject_id] = (c[q.subject_id] || 0) + 1
      setCounts(c)
    }
    load()
    return () => { active = false }
  }, [])

  async function start(subject) {
    if (!user) { toast('Entre na sua conta para resolver exercícios.', 'error'); return }
    setActiveSubject(subject)
    setLoadingQ(true)
    const { data } = await supabase
      .from('questions')
      .select('id, prompt, options, correct_index, explanation, difficulty')
      .eq('subject_id', subject.id)
      .eq('status', 'published')
      .order('sort_order')
    setLoadingQ(false)
    const qs = (data ?? []).sort(() => Math.random() - 0.5)
    if (qs.length === 0) {
      toast('Esta matéria ainda não tem exercícios.', 'error')
      setActiveSubject(null)
      return
    }
    setQuestions(qs)
    setSession({ index: 0, answers: [], selected: null, confirmed: false, finished: false })
  }

  async function confirmAnswer() {
    if (session.selected === null) return
    const q = questions[session.index]
    const correct = session.selected === q.correct_index
    // Registra a tentativa.
    await supabase.from('question_attempts').insert({
      user_id: user.id,
      subject_id: activeSubject.id,
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
      if (nextIndex >= questions.length) {
        return { ...s, finished: true, selected: null, confirmed: false }
      }
      return { ...s, index: nextIndex, selected: null, confirmed: false }
    })
  }

  function resetSession() {
    setSession(null)
    setActiveSubject(null)
    setQuestions([])
  }

  // ---------- Hub ----------
  if (!activeSubject) {
    return (
      <div className="page">
        <header className="page-header">
          <h2>Exercícios</h2>
          <p>Escolha uma matéria e teste seus conhecimentos.</p>
        </header>

        {!subjects ? (
          <div className="subject-grid subject-grid-lg">
            {[0, 1, 2, 3].map((i) => (
              <Card key={i}><div style={{ height: 80 }} /></Card>
            ))}
          </div>
        ) : subjects.filter((s) => (counts[s.id] || 0) > 0).length === 0 ? (
          <Card>
            <EmptyState
              icon={ClipboardList}
              title="Exercícios em preparação"
              description="Os exercícios serão publicados em breve. Enquanto isso, estude as aulas disponíveis."
              action={<Link to="/explorar" className="btn btn-primary">Explorar matérias</Link>}
            />
          </Card>
        ) : (
          <div className="subject-grid subject-grid-lg">
            {subjects
              .filter((s) => (counts[s.id] || 0) > 0)
              .map((s) => (
                <button key={s.id} type="button" className="subject-card-lg subject-card-btn" onClick={() => start(s)}>
                  <span className="subject-icon">
                    <SubjectIcon name={s.icon} size={22} />
                  </span>
                  <h3>{s.name}</h3>
                  <p>{counts[s.id]} {counts[s.id] === 1 ? 'questão' : 'questões'}</p>
                  <span className="subject-badge">Iniciar →</span>
                </button>
              ))}
          </div>
        )}
      </div>
    )
  }

  // ---------- Loading ----------
  if (loadingQ) {
    return (
      <div className="page">
        <Card><EmptyState icon={Loader2} title="Carregando questões…" /></Card>
      </div>
    )
  }

  // ---------- Resultado ----------
  if (session?.finished) {
    const correct = session.answers.filter((a) => a.correct).length
    const total = questions.length
    const pct = Math.round((correct / total) * 100)
    return (
      <div className="page">
        <header className="page-header">
          <h2>Resultado — {activeSubject.name}</h2>
          <p>Você acertou {correct} de {total} questões.</p>
        </header>

        <Card className="result-card">
          <div className="result-score">
            <strong>{pct}%</strong>
            <span>{correct}/{total} acertos</span>
          </div>
          <ProgressBar value={correct} max={total} label="Resultado do exercício" />
          <p className="result-message">
            {pct >= 80 ? 'Excelente! Continue assim. 🎉' : pct >= 50 ? 'Bom trabalho. Revise as questões erradas.' : 'Vale revisar o conteúdo antes de tentar de novo.'}
          </p>
          <div className="result-actions">
            <button type="button" className="btn btn-outline" onClick={resetSession}>
              <ArrowLeft size={16} aria-hidden="true" /> Voltar
            </button>
            <button type="button" className="btn btn-primary" onClick={() => start(activeSubject)}>
              <RotateCcw size={16} aria-hidden="true" /> Tentar de novo
            </button>
          </div>
        </Card>

        {session.answers.some((a) => !a.correct) && (
          <Card>
            <h3 className="section-title">Revise as questões erradas</h3>
            <div className="review-list">
              {questions.map((q, i) => {
                const a = session.answers[i]
                if (a?.correct) return null
                return (
                  <div key={q.id} className="review-item">
                    <p className="review-q">{i + 1}. {q.prompt}</p>
                    <p className="review-wrong">
                      <XCircle size={14} aria-hidden="true" /> Sua resposta: {q.options[a.selected]}
                    </p>
                    <p className="review-right">
                      <CheckCircle2 size={14} aria-hidden="true" /> Correta: {q.options[q.correct_index]}
                    </p>
                    {q.explanation && <p className="review-expl">{q.explanation}</p>}
                  </div>
                )
              })}
            </div>
          </Card>
        )}
      </div>
    )
  }

  // ---------- Runner ----------
  const q = questions[session.index]
  const isLast = session.index === questions.length - 1
  return (
    <div className="page">
      <header className="page-header">
        <button type="button" className="back-link" onClick={resetSession}>
          <ArrowLeft size={16} aria-hidden="true" /> Sair do exercício
        </button>
        <h2>{activeSubject.name}</h2>
        <p>
          Questão {session.index + 1} de {questions.length}
        </p>
        <ProgressBar value={session.index + (session.confirmed ? 1 : 0)} max={questions.length} label="Progresso do exercício" />
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
              <button
                key={idx}
                type="button"
                className={cls}
                disabled={confirmed}
                onClick={() => setSession((s) => ({ ...s, selected: idx }))}
              >
                <span className="option-letter">{String.fromCharCode(65 + idx)}</span>
                <span>{opt}</span>
                {confirmed && isCorrect && <CheckCircle2 size={18} aria-hidden="true" />}
                {confirmed && selected && !isCorrect && <XCircle size={18} aria-hidden="true" />}
              </button>
            )
          })}
        </div>

        {!session.confirmed ? (
          <button
            type="button"
            className="btn btn-primary"
            disabled={session.selected === null}
            onClick={confirmAnswer}
          >
            Confirmar resposta
          </button>
        ) : (
          <div className="question-feedback">
            {session.selected === q.correct_index ? (
              <p className="feedback-ok">
                <CheckCircle2 size={16} aria-hidden="true" /> Resposta correta!
              </p>
            ) : (
              <p className="feedback-bad">
                <XCircle size={16} aria-hidden="true" /> Resposta incorreta.
              </p>
            )}
            {q.explanation && <p className="feedback-expl">{q.explanation}</p>}
            <button type="button" className="btn btn-primary" onClick={nextQuestion}>
              {isLast ? 'Ver resultado' : 'Próxima questão'} <ArrowRight size={16} aria-hidden="true" />
            </button>
          </div>
        )}
      </Card>
    </div>
  )
}
