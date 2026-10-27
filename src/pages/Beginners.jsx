import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import {
  ArrowLeft,
  BookOpen,
  CheckCircle2,
  ClipboardList,
  Heart,
  Lightbulb,
  Loader2,
  RotateCcw,
  Sparkles,
  Target,
  XCircle,
  Zap,
} from 'lucide-react'
import { supabase } from '../lib/supabaseClient'
import { useAuth } from '../lib/auth'
import { useToast } from '../components/Toast'
import { Card, EmptyState, ProgressBar } from '../components/ui'
import Markdown from '../components/Markdown'

const TABS = [
  { key: 'study', label: 'Como estudar', icon: Lightbulb },
  { key: 'content', label: 'Conteúdos', icon: BookOpen },
  { key: 'exercises', label: 'Exercícios', icon: ClipboardList },
]

const SUBJECTS = [
  { slug: 'matematica', name: 'Matemática', emoji: '🔢' },
  { slug: 'portugues', name: 'Português', emoji: '📖' },
  { slug: 'historia', name: 'História', emoji: '🏰' },
  { slug: 'geografia', name: 'Geografia', emoji: '🌍' },
  { slug: 'ciencias', name: 'Ciências', emoji: '🔬' },
  { slug: 'ingles', name: 'Inglês', emoji: '🗣️' },
]

export default function Beginners() {
  const { user } = useAuth()
  const toast = useToast()
  const [tab, setTab] = useState('study')
  const [lessons, setLessons] = useState(null)
  const [selectedSubject, setSelectedSubject] = useState('matematica')
  const [selectedLesson, setSelectedLesson] = useState(null)

  // Exercícios
  const [level, setLevel] = useState(1)
  const [exSubject, setExSubject] = useState('matematica')
  const [exQuestions, setExQuestions] = useState([])
  const [loadingQ, setLoadingQ] = useState(false)
  const [session, setSession] = useState(null)

  useEffect(() => {
    let active = true
    async function load() {
      const { data } = await supabase
        .from('lessons')
        .select('id, title, description, content, estimated_minutes, subject_id, subjects(name, slug, icon)')
        .eq('track', 'intro')
        .eq('status', 'published')
        .order('sort_order')
      if (active) setLessons(data ?? [])
    }
    load()
    return () => { active = false }
  }, [])

  const filteredLessons = (lessons ?? []).filter((l) => l.subjects?.slug === selectedSubject)

  async function startExercises() {
    setLoadingQ(true)
    const { data: subj } = await supabase.from('subjects').select('id').eq('slug', exSubject).maybeSingle()
    if (!subj) { setLoadingQ(false); return }
    const { data } = await supabase
      .from('questions')
      .select('id, prompt, options, correct_index, explanation, difficulty, topic, intro_level')
      .eq('subject_id', subj.id)
      .eq('track', 'intro')
      .eq('intro_level', level)
      .eq('status', 'published')
      .order('sort_order')
    setLoadingQ(false)
    const qs = (data ?? []).sort(() => Math.random() - 0.5)
    if (qs.length === 0) { toast('Nenhuma questão para esse nível/matéria.', 'error'); return }
    setExQuestions(qs)
    setSession({ index: 0, answers: [], selected: null, confirmed: false, finished: false })
  }

  async function confirmAnswer() {
    if (session.selected === null) return
    const q = exQuestions[session.index]
    const correct = session.selected === q.correct_index
    if (user) {
      await supabase.from('question_attempts').insert({
        user_id: user.id,
        subject_id: (await supabase.from('subjects').select('id').eq('slug', exSubject).maybeSingle()).data?.id,
        question_id: q.id,
        is_correct: correct,
      })
    }
    setSession((s) => ({ ...s, confirmed: true, answers: [...s.answers, { selected: s.selected, correct }] }))
  }

  function prevQuestion() {
    setSession((s) => {
      if (s.index <= 0) return s
      const prevIndex = s.index - 1
      const prevAnswer = s.answers[prevIndex]
      return {
        ...s,
        index: prevIndex,
        selected: prevAnswer ? prevAnswer.selected : null,
        confirmed: Boolean(prevAnswer),
      }
    })
  }

  function skipQuestion() {
    setSession((s) => {
      const ni = s.index + 1
      if (ni >= exQuestions.length) return { ...s, finished: true, selected: null, confirmed: false, skipped: (s.skipped || 0) + 1 }
      return { ...s, index: ni, selected: null, confirmed: false, skipped: (s.skipped || 0) + 1 }
    })
  }

  function nextQuestion() {
    setSession((s) => {
      const ni = s.index + 1
      if (ni >= exQuestions.length) return { ...s, finished: true, selected: null, confirmed: false }
      return { ...s, index: ni, selected: null, confirmed: false }
    })
  }

  function resetExercises() {
    setExQuestions([])
    setSession(null)
  }

  // ---------- Render: detalhe de aula ----------
  if (selectedLesson) {
    const l = selectedLesson
    return (
      <div className="page">
        <button type="button" className="back-link" onClick={() => setSelectedLesson(null)}>
          <ArrowLeft size={16} aria-hidden="true" /> Voltar às aulas
        </button>
        <article className="lesson-article">
          <header className="lesson-header">
            <span className="lesson-subject">{l.subjects?.name}</span>
            <h1>{l.title}</h1>
            {l.description && <p className="lesson-desc">{l.description}</p>}
          </header>
          <div className="lesson-content">
            <Markdown text={l.content || ''} />
          </div>
        </article>
      </div>
    )
  }

  // ---------- Render: resultado de exercícios ----------
  if (session?.finished) {
    const correct = session.answers.filter((a) => a.correct).length
    const total = exQuestions.length
    const pct = Math.round((correct / total) * 100)
    return (
      <div className="page">
        <div className="beginner-result-card">
          <div className="beginner-result-emoji">{pct >= 80 ? '🏆' : pct >= 50 ? '⭐' : '💪'}</div>
          <h1 className="beginner-result-title">{pct >= 80 ? 'Excelente!' : pct >= 50 ? 'Muito bem!' : 'Continue tentando!'}</h1>
          <p className="beginner-result-text">Você acertou {correct} de {total} ({pct}%).</p>
          <div className="beginner-result-actions">
            <button type="button" className="btn btn-outline" onClick={resetExercises}>Voltar</button>
            {pct >= 60 && level < 3 && (
              <button type="button" className="btn btn-primary" onClick={() => { setLevel((l) => l + 1); resetExercises() }}>
                <Zap size={16} aria-hidden="true" /> Avançar para o Nível {level + 1}
              </button>
            )}
            <button type="button" className="btn btn-primary" onClick={startExercises}>Tentar de novo</button>
          </div>
        </div>
      </div>
    )
  }

  // ---------- Render: runner de exercícios ----------
  if (session && exQuestions.length > 0) {
    const q = exQuestions[session.index]
    return (
      <div className="page">
        <button type="button" className="back-link" onClick={resetExercises}>
          <ArrowLeft size={16} aria-hidden="true" /> Sair
        </button>
        <header className="page-header">
          <h2>Exercícios — Nível {level}</h2>
          <p>Questão {session.index + 1} de {exQuestions.length}</p>
          <ProgressBar value={session.index + (session.confirmed ? 1 : 0)} max={exQuestions.length} label="Progresso" />
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
              if (confirmed) { if (isCorrect) cls += ' is-correct'; else if (selected) cls += ' is-wrong' }
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
            <div className="question-actions">
              {session.index > 0 && (
                <button type="button" className="btn btn-ghost" onClick={prevQuestion}>← Anterior</button>
              )}
              <button type="button" className="btn btn-primary" disabled={session.selected === null} onClick={confirmAnswer}>
                Confirmar
              </button>
              <button type="button" className="btn btn-ghost" onClick={skipQuestion}>
                Pular
              </button>
            </div>
          ) : (
            <div className="question-feedback">
              {session.index > 0 && (
                <button type="button" className="btn btn-ghost" onClick={prevQuestion} style={{ alignSelf: 'flex-start' }}>← Anterior</button>
              )}
              {session.selected === q.correct_index ? (
                <p className="feedback-ok"><CheckCircle2 size={16} aria-hidden="true" /> Correta!</p>
              ) : (
                <p className="feedback-bad"><XCircle size={16} aria-hidden="true" /> Incorreta.</p>
              )}
              {q.explanation && <p className="feedback-expl">{q.explanation}</p>}
              <button type="button" className="btn btn-primary" onClick={nextQuestion}>
                {session.index === exQuestions.length - 1 ? 'Ver resultado' : 'Próxima'} <ArrowRight size={16} aria-hidden="true" />
              </button>
            </div>
          )}
        </Card>
      </div>
    )
  }

  // ---------- Hub ----------
  return (
    <div className="page beginner-page">
      <Link to="/" className="back-link">
        <ArrowLeft size={16} aria-hidden="true" /> Voltar ao início
      </Link>

      <header className="beginner-hero">
        <div className="beginner-hero-text">
          <span className="beginner-hero-badge">
            <Sparkles size={14} aria-hidden="true" /> Trilha de estudos
          </span>
          <h1>Estou iniciando no mundo dos estudos</h1>
          <p>Conteúdos introdutórios, dicas de estudo e exercícios por nível de dificuldade.</p>
        </div>
        <div className="beginner-hero-mascot" aria-hidden="true">📚</div>
      </header>

      <div className="beginner-tabs">
        {TABS.map((t) => {
          const Icon = t.icon
          return (
            <button key={t.key} type="button" className={`beginner-tab ${tab === t.key ? 'is-active' : ''}`} onClick={() => setTab(t.key)}>
              <Icon size={16} aria-hidden="true" /> {t.label}
            </button>
          )
        })}
      </div>

      {/* ---------- Como estudar ---------- */}
      {tab === 'study' && (
        <div className="beginner-study">
          <Card className="beginner-study-card">
            <h3 className="section-title">Como estudar de forma efetiva</h3>
            <div className="study-tips">
              <div className="study-tip">
                <strong>1. Estude um pouco todos os dias</strong>
                <p>10 a 15 minutos por dia valem mais do que 3 horas uma vez por semana. A constância cria o hábito.</p>
              </div>
              <div className="study-tip">
                <strong>2. Faça resumos com suas palavras</strong>
                <p>Depois de ler um conteúdo, feche o material e escreva o que lembra. Isso força o cérebro a processar a informação.</p>
              </div>
              <div className="study-tip">
                <strong>3. Resolva exercícios</strong>
                <p>Praticar é a melhor forma de fixar o conteúdo. Comece pelos exercícios de nível 1 e suba conforme se sentir confortável.</p>
              </div>
              <div className="study-tip">
                <strong>4. Revise regularmente</strong>
                <p>Reveja o conteúdo após 1 dia, 3 dias, 1 semana e 1 mês. Isso move a informação para a memória de longo prazo.</p>
              </div>
              <div className="study-tip">
                <strong>5. Ensine alguém</strong>
                <p>Explicar um assunto para outra pessoa é a melhor forma de saber se você realmente entendeu.</p>
              </div>
            </div>
          </Card>

          <Card className="beginner-study-card">
            <h3 className="section-title">Rotina pesada: como estudar mesmo sem tempo</h3>
            <div className="study-tips">
              <div className="study-tip">
                <strong>1. Use os "tempos mortos"</strong>
                <p>Transporte, fila, intervalo — 5 minutos de estudo nesses momentos somam. Use o celular para revisar ou ler um resumo.</p>
              </div>
              <div className="study-tip">
                <strong>2. Estude antes de dormir</strong>
                <p>O cérebro consolida a memória durante o sono. Revisar por 5 minutos antes de dormir é muito eficaz.</p>
              </div>
              <div className="study-tip">
                <strong>3. Defina uma meta mínima diária</strong>
                <p>Em vez de "estudar 2 horas", defina "ler 1 página" ou "resolver 3 questões". Metas pequenas são mais fáceis de cumprir.</p>
              </div>
              <div className="study-tip">
                <strong>4. Elimine distrações</strong>
                <p>Desligue notificações, coloque o celular longe. 15 minutos de foco total valem mais que 1 hora distraído.</p>
              </div>
              <div className="study-tip">
                <strong>5. Não se culpe por dias ruins</strong>
                <p>Ter dias sem estudo é normal. O importante é voltar no dia seguinte. Consistência vale mais que perfeição.</p>
              </div>
            </div>
          </Card>

          <Card className="beginner-study-card">
            <h3 className="section-title">Como manter o foco</h3>
            <div className="study-tips">
              <div className="study-tip">
                <strong>1. Técnica Pomodoro</strong>
                <p>Estude 25 minutos, descanse 5. Repita 4 vezes e faça uma pausa longa de 15-30 minutos.</p>
              </div>
              <div className="study-tip">
                <strong>2. Ambiente adequado</strong>
                <p>Um lugar silencioso, com boa iluminação e sem bagunça visual ajuda a concentrar.</p>
              </div>
              <div className="study-tip">
                <strong>3. Defina um objetivo claro</strong>
                <p>"Vou estudar matemática" é vago. "Vou resolver 5 questões de equação" é específico e mensurável.</p>
              </div>
              <div className="study-tip">
                <strong>4. Durma bem</strong>
                <p>Sono é quando o cérebro organiza o que você aprendeu. Sem sono, o estudo não fixa.</p>
              </div>
              <div className="study-tip">
                <strong>5. Hidrate-se e alimente-se bem</strong>
                <p>O cérebro consome 20% da energia do corpo. Água e alimentação adequada melhoram o foco.</p>
              </div>
            </div>
          </Card>
        </div>
      )}

      {/* ---------- Conteúdos introdutórios ---------- */}
      {tab === 'content' && (
        <div className="beginner-content">
          <div className="beginner-subject-tabs">
            {SUBJECTS.map((s) => (
              <button
                key={s.slug}
                type="button"
                className={`beginner-subject-tab ${selectedSubject === s.slug ? 'is-active' : ''}`}
                onClick={() => setSelectedSubject(s.slug)}
              >
                {s.emoji} {s.name}
              </button>
            ))}
          </div>

          {!lessons ? (
            <Card><div style={{ height: 80 }} /></Card>
          ) : filteredLessons.length === 0 ? (
            <Card>
              <EmptyState
                icon={BookOpen}
                title="Conteúdos em preparação"
                description="As aulas introdutórias desta matéria serão adicionadas em breve."
              />
            </Card>
          ) : (
            <div className="lesson-list">
              {filteredLessons.map((l) => (
                <button key={l.id} type="button" className="lesson-row" onClick={() => setSelectedLesson(l)}>
                  <span className="lesson-status">
                    <span className="lesson-num">📖</span>
                  </span>
                  <div className="lesson-row-info">
                    <strong>{l.title}</strong>
                    <span>{l.description}</span>
                  </div>
                  <span className="lesson-row-meta">
                    <Zap size={14} aria-hidden="true" /> {l.estimated_minutes}min
                  </span>
                </button>
              ))}
            </div>
          )}
        </div>
      )}

      {/* ---------- Exercícios por nível ---------- */}
      {tab === 'exercises' && (
        <div className="beginner-exercises">
          <Card className="beginner-exercise-card">
            <h3 className="section-title">Exercícios por nível de dificuldade</h3>
            <p className="beginner-exercise-desc">
              Comece no Nível 1 (fácil) e avance conforme se sentir confortável. Ao acertar 60% ou mais, você pode avançar para o próximo nível.
            </p>

            <div className="beginner-level-info">
              <div className={`level-card ${level === 1 ? 'is-active' : ''}`} onClick={() => setLevel(1)}>
                <span className="level-num">1</span>
                <div>
                  <strong>Nível 1 — Fácil</strong>
                  <p>Questões básicas para começar do zero.</p>
                </div>
              </div>
              <div className={`level-card ${level === 2 ? 'is-active' : ''}`} onClick={() => setLevel(2)}>
                <span className="level-num">2</span>
                <div>
                  <strong>Nível 2 — Médio</strong>
                  <p>Questões um pouco mais desafiadoras.</p>
                </div>
              </div>
              <div className={`level-card ${level === 3 ? 'is-active' : ''}`} onClick={() => setLevel(3)}>
                <span className="level-num">3</span>
                <div>
                  <strong>Nível 3 — Difícil</strong>
                  <p>Questões para quem já domina o básico.</p>
                </div>
              </div>
            </div>

            <div className="field" style={{ marginTop: 'var(--space-4)' }}>
              <label>Matéria</label>
              <div className="beginner-subject-tabs">
                {SUBJECTS.map((s) => (
                  <button
                    key={s.slug}
                    type="button"
                    className={`beginner-subject-tab ${exSubject === s.slug ? 'is-active' : ''}`}
                    onClick={() => setExSubject(s.slug)}
                  >
                    {s.emoji} {s.name}
                  </button>
                ))}
              </div>
            </div>

            <button type="button" className="btn btn-primary beginner-practice-btn" onClick={startExercises} disabled={loadingQ}>
              {loadingQ ? <Loader2 size={18} className="spin" aria-hidden="true" /> : <Sparkles size={18} aria-hidden="true" />}
              {loadingQ ? 'Carregando…' : `Começar a praticar — Nível ${level}`}
            </button>
          </Card>
        </div>
      )}
    </div>
  )
}
