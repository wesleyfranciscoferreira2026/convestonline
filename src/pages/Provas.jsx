import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import {
  ArrowLeft,
  ArrowRight,
  CheckCircle2,
  ClipboardList,
  Loader2,
  RotateCcw,
  Sparkles,
  Wand2,
  XCircle,
} from 'lucide-react'
import { supabase } from '../lib/supabaseClient'
import { QUESTION_COUNT_OPTIONS, premiumCountMessage, questionCountLabel } from '../lib/questionCounts'
import { chat, isAIAvailable, parseAIJson } from '../lib/ai'
import { useAuth } from '../lib/auth'
import { useToast } from '../components/Toast'
import SubjectIcon from '../components/SubjectIcon'
import Markdown from '../components/Markdown'
import { Card, EmptyState, ProgressBar } from '../components/ui'

const CATEGORIES = [
  { key: 'enem', label: 'ENEM' },
  { key: 'vestibular', label: 'Vestibulares' },
  { key: 'militar', label: 'Cursos Militares' },
]

export default function Provas() {
  const { user } = useAuth()
  const toast = useToast()
  const [exams, setExams] = useState(null)
  const [subjects, setSubjects] = useState([])
  const [counts, setCounts] = useState({})
  const [category, setCategory] = useState('enem')
  const [selectedExam, setSelectedExam] = useState(null)
  const [selectedSubjects, setSelectedSubjects] = useState([])
  const [selectedTopic, setSelectedTopic] = useState('')
  const [difficulty, setDifficulty] = useState('all')
  const [questionType, setQuestionType] = useState('multiple_choice')
  const [topics, setTopics] = useState([])
  const [years, setYears] = useState([])
  const [selectedYear, setSelectedYear] = useState('')
  const [quantity, setQuantity] = useState(10)
  const [questions, setQuestions] = useState([])
  const [loadingQ, setLoadingQ] = useState(false)
  const [session, setSession] = useState(null)
  const [generating, setGenerating] = useState(false)

  useEffect(() => {
    let active = true
    async function load() {
      const [{ data: ex }, { data: subs }, { data: qs }] = await Promise.all([
        supabase.from('exams').select('id, slug, name, category, description').order('sort_order'),
        supabase.from('subjects').select('id, name, icon').order('sort_order'),
        supabase.from('questions').select('exam_id, subject_id').eq('status', 'published').not('exam_id', 'is', null),
      ])
      if (!active) return
      setExams(ex ?? [])
      setSubjects(subs ?? [])
      const c = {}
      for (const q of qs ?? []) c[q.exam_id] = (c[q.exam_id] || 0) + 1
      setCounts(c)
    }
    load()
    return () => { active = false }
  }, [])

  const filteredExams = (exams ?? []).filter((e) => e.category === category)

  // Carrega tópicos e anos disponíveis para a prova selecionada
  useEffect(() => {
    if (!selectedExam || selectedSubjects.length === 0) { setTopics([]); setYears([]); return }
    let active = true
    async function load() {
      const { data } = await supabase
        .from('questions')
        .select('topic, year')
        .eq('exam_id', selectedExam.id)
        .eq('status', 'published')
        .in('subject_id', selectedSubjects)
      if (!active) return
      const tset = new Set((data ?? []).map((q) => q.topic).filter(Boolean))
      const yset = new Set((data ?? []).map((q) => q.year).filter(Boolean))
      setTopics(Array.from(tset).sort())
      setYears(Array.from(yset).sort((a, b) => b - a))
    }
    load()
    return () => { active = false }
  }, [selectedExam, selectedSubjects])

  function toggleSubject(id) {
    setSelectedSubjects((prev) => (prev.includes(id) ? prev.filter((x) => x !== id) : [...prev, id]))
  }

  async function startFromBank() {
    if (selectedSubjects.length === 0) { toast('Selecione ao menos uma matéria.', 'error'); return }
    setLoadingQ(true)
    let query = supabase
      .from('questions')
      .select('id, prompt, options, option_images, stem_image_url, source_images, correct_index, explanation, difficulty, question_type, topic, year, subject_id, subjects(name, icon)')
      .eq('exam_id', selectedExam.id)
      .eq('status', 'published')
      .in('subject_id', selectedSubjects)
    if (selectedTopic) query = query.eq('topic', selectedTopic)
    if (selectedYear) query = query.eq('year', Number(selectedYear))
    if (difficulty !== 'all') query = query.eq('difficulty', difficulty)
    query = query.eq('question_type', questionType)
    const { data } = await query.order('sort_order')
    setLoadingQ(false)
    const qs = (data ?? []).sort(() => Math.random() - 0.5).slice(0, quantity)
    if (qs.length === 0) {
      toast('Esta prova ainda não tem questões cadastradas para as matérias selecionadas.', 'error')
      return
    }
    setQuestions(qs)
    setSession({ index: 0, answers: [], selected: null, confirmed: false, finished: false })
  }

  async function generateWithAI() {
    if (!isAIAvailable()) { toast('A IA nao esta configurada. Abra Convest IA > Configurar.', 'error'); return }
    if (selectedSubjects.length === 0) { toast('Selecione ao menos uma matéria.', 'error'); return }
    const subjectNames = subjects.filter((s) => selectedSubjects.includes(s.id)).map((s) => s.name).join(', ')
    const diffLabel = difficulty === 'all' ? 'variada' : difficulty === 'easy' ? 'fácil' : difficulty === 'medium' ? 'média' : 'difícil'
    setGenerating(true)
    try {
      const typeInstruction = questionType === 'true_false'
        ? 'Cada questão deve ser de Certo ou Errado, com duas alternativas: ["Certo", "Errado"].'
        : 'Cada questão deve ser de múltipla escolha com cinco alternativas (A-E).'
      const optionsTemplate = questionType === 'true_false'
        ? '["Certo", "Errado"]'
        : '["alternativa A", "alternativa B", "alternativa C", "alternativa D", "alternativa E"]'
      const prompt = `Gere ${quantity} questões no estilo da prova "${selectedExam.name}" (${selectedExam.description || ''}), matérias: ${subjectNames}${selectedTopic ? `, tema específico: ${selectedTopic}` : ''}.

Nível de dificuldade: ${diffLabel}. Textos de enunciado podem ser longos (até ~300 palavras), com contexto, tabelas descritas em texto, gráficos descritos, situações-problema realistas no estilo da banca.

Retorne APENAS um JSON válido (sem markdown, sem texto extra) no formato:
[
  {
    "prompt": "enunciado da questão (pode ser longo)",
    "options": ${optionsTemplate},
    "correct_index": 0,
    "explanation": "explicação didática da resposta correta",
    "topic": "tópico específico da questão",
    "difficulty": "${difficulty === 'all' ? 'medium' : difficulty}"
  }
]

Regras:
- ${typeInstruction}
- correct_index é o índice da alternativa correta.
- Estilo, vocabulário e dificuldade compatíveis com a prova ${selectedExam.name}.
- Questões claras, sem ambiguidade, com textos mais longos quando apropriado.
- Explicações didáticas e concisas.
- O campo "topic" deve ser o tópico específico (ex.: Eletrodinâmica, Hidrodinâmica, Revolução Francesa).
- Retorne somente o array JSON, nada mais.`

      const result = await chat({ messages: [{ role: 'user', content: prompt }], temperature: 0.7 })
      if (!result.ok) throw new Error(`${result.error.title} ${result.error.hint}`)
      const parsed = parseAIJson(result.text)
      if (!Array.isArray(parsed) || parsed.length === 0) throw new Error('Resposta invalida do modelo.')
      const qs = parsed.map((q, i) => ({
        id: `gen-${Date.now()}-${i}`,
        prompt: q.prompt,
        options: q.options,
        correct_index: q.correct_index,
        explanation: q.explanation,
        topic: q.topic || selectedTopic || null,
        difficulty: q.difficulty || (difficulty === 'all' ? 'medium' : difficulty),
        question_type: questionType,
        subject_id: selectedSubjects[0],
        subjects: subjects.find((s) => s.id === selectedSubjects[0]),
      }))
      setQuestions(qs)
      setSession({ index: 0, answers: [], selected: null, confirmed: false, finished: false })
    } catch (e) {
      toast(`⚠️ ${e.message}`, 'error')
    } finally {
      setGenerating(false)
    }
  }

  async function confirmAnswer() {
    if (session.selected === null) return
    const q = questions[session.index]
    const correct = session.selected === q.correct_index
    if (user) {
      const generated = String(q.id || '').startsWith('gen-')
      await supabase.from('question_attempts').insert({
        user_id: user.id,
        subject_id: q.subject_id,
        question_id: generated ? null : q.id,
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
  }

  function resetAll() {
    setSelectedExam(null)
    setQuestions([])
    setSession(null)
    setSelectedSubjects([])
    setSelectedTopic('')
    setSelectedYear('')
  }

  // ---------- Hub ----------
  if (!selectedExam) {
    return (
      <div className="page">
        <Link to="/" className="back-link">
          <ArrowLeft size={16} aria-hidden="true" /> Voltar ao início
        </Link>
        <header className="page-header">
          <h2>Provas e Bancas</h2>
          <p>Escolha a prova e as matérias que deseja praticar.</p>
        </header>

        <div className="exercise-mode-tabs">
          {CATEGORIES.map((c) => (
            <button key={c.key} type="button" className={`segment ${category === c.key ? 'is-active' : ''}`} onClick={() => setCategory(c.key)}>
              {c.label}
            </button>
          ))}
        </div>

        {!exams ? (
          <div className="subject-grid subject-grid-lg">
            {[0, 1, 2, 3].map((i) => <Card key={i}><div style={{ height: 80 }} /></Card>)}
          </div>
        ) : filteredExams.length === 0 ? (
          <Card><EmptyState icon={ClipboardList} title="Nenhuma prova nesta categoria" description="Em breve." /></Card>
        ) : (
          <div className="subject-grid subject-grid-lg">
            {filteredExams.map((e) => (
              <button key={e.id} type="button" className="subject-card-lg subject-card-btn" onClick={() => { setSelectedExam(e); setSelectedSubjects([]); setSelectedTopic(''); setSelectedYear('') }}>
                <h3>{e.name}</h3>
                <p>{e.description}</p>
                <span className="subject-badge">
                  {counts[e.id] || 0} questões no banco · Iniciar →
                </span>
              </button>
            ))}
          </div>
        )}
      </div>
    )
  }

  // ---------- Config ----------
  if (questions.length === 0) {
    return (
      <div className="page">
        <button type="button" className="back-link" onClick={resetAll}>
          <ArrowLeft size={16} aria-hidden="true" /> Voltar às provas
        </button>
        <header className="page-header">
          <h2>{selectedExam.name}</h2>
          <p>{selectedExam.description}</p>
        </header>

        <Card className="gen-card">
          <h3 className="section-title">Configurar prova</h3>
          <div className="field">
            <label>Matérias</label>
            <div className="subject-checkboxes">
              {subjects.map((s) => (
                <label key={s.id} className="checkbox-row">
                  <input type="checkbox" checked={selectedSubjects.includes(s.id)} onChange={() => toggleSubject(s.id)} />
                  <SubjectIcon name={s.icon} size={14} />
                  <span>{s.name}</span>
                </label>
              ))}
            </div>
            <button type="button" className="btn btn-ghost btn-sm" onClick={() => setSelectedSubjects(subjects.map((s) => s.id))}>
              Selecionar todas
            </button>
          </div>
          <div className="field">
            <label htmlFor="pv-topic">Tópico (opcional)</label>
            <select id="pv-topic" className="input" value={selectedTopic} onChange={(e) => setSelectedTopic(e.target.value)}>
              <option value="">Todos os tópicos</option>
              {topics.map((t) => <option key={t} value={t}>{t}</option>)}
            </select>
          </div>
          {years.length > 0 && (
            <div className="field">
              <label htmlFor="pv-year">Ano da prova (opcional)</label>
              <select id="pv-year" className="input" value={selectedYear} onChange={(e) => setSelectedYear(e.target.value)}>
                <option value="">Todos os anos</option>
                {years.map((y) => <option key={y} value={y}>{y}</option>)}
              </select>
            </div>
          )}
          <div className="field">
            <label htmlFor="pv-diff">Dificuldade</label>
            <select id="pv-diff" className="input" value={difficulty} onChange={(e) => setDifficulty(e.target.value)}>
              <option value="all">Todas</option>
              <option value="easy">Fácil</option>
              <option value="medium">Médio</option>
              <option value="hard">Difícil</option>
            </select>
          </div>
          <div className="field">
            <label htmlFor="pv-type">Tipo de questão</label>
            <select id="pv-type" className="input" value={questionType} onChange={(e) => setQuestionType(e.target.value)}>
              <option value="multiple_choice">Múltipla escolha</option>
              <option value="true_false">Certo ou Errado</option>
            </select>
          </div>
          <div className="field">
            <label htmlFor="pv-qty">Quantidade</label>
            <select id="pv-qty" className="input" value={quantity} onChange={(e) => setQuantity(Number(e.target.value))}>
              {QUESTION_COUNT_OPTIONS.map((option) => (
                <option key={option.value} value={option.value}>
                  {questionCountLabel(option)}
                </option>
              ))}
            </select>
          </div>
          {premiumCountMessage(quantity) && (
            <p className="gen-hint">{premiumCountMessage(quantity)}</p>
          )}
          <p className="gen-desc">
            {counts[selectedExam.id]
              ? `${counts[selectedExam.id]} questões no banco para esta prova${selectedTopic ? ` (tópico: ${selectedTopic})` : ''}${difficulty !== 'all' ? ` · dificuldade ${difficulty}` : ''}.`
              : 'Nenhuma questão cadastrada ainda — use "Gerar com IA".'}
          </p>
          <div className="task-form-actions">
            <button type="button" className="btn btn-outline" onClick={startFromBank} disabled={loadingQ || selectedSubjects.length === 0}>
              {loadingQ ? <Loader2 size={16} className="spin" aria-hidden="true" /> : <ClipboardList size={16} aria-hidden="true" />}
              Usar banco de questões
            </button>
            <button type="button" className="btn btn-primary" onClick={generateWithAI} disabled={generating || selectedSubjects.length === 0}>
              {generating ? <Loader2 size={16} className="spin" aria-hidden="true" /> : <Sparkles size={16} aria-hidden="true" />}
              {generating ? 'Gerando…' : 'Gerar com IA'}
            </button>
          </div>
          {generating && <p className="gen-hint">Gerando questões no estilo {selectedExam.name}…</p>}
        </Card>
      </div>
    )
  }

  // ---------- Resultado ----------
  if (session?.finished) {
    const correct = session.answers.filter((a) => a.correct).length
    const skipped = session.skipped || 0
    const answered = session.answers.length
    const total = questions.length
    const pct = answered > 0 ? Math.round((correct / answered) * 100) : 0
    return (
      <div className="page">
        <header className="page-header">
          <h2>Resultado — {selectedExam.name}</h2>
          <p>Você acertou {correct} de {answered} questões respondidas{skipped > 0 ? ` (${skipped} puladas)` : ''}.</p>
        </header>
        <Card className="result-card">
          <div className="result-score"><strong>{pct}%</strong><span>{correct}/{total}</span></div>
          <ProgressBar value={correct} max={total} label="Resultado" />
          <p className="result-message">
            {pct >= 80 ? 'Excelente! 🎉' : pct >= 50 ? 'Bom trabalho. Revise as erradas.' : 'Vale revisar o conteúdo.'}
          </p>
          <div className="result-actions">
            <button type="button" className="btn btn-outline" onClick={resetAll}>Voltar</button>
            <button type="button" className="btn btn-primary" onClick={() => { setQuestions([]); setSession(null) }}>Nova prova</button>
          </div>
        </Card>
      </div>
    )
  }

  // ---------- Runner ----------
  const q = questions[session.index]
  const sourceImages = q.source_images?.length ? q.source_images : q.stem_image_url ? [q.stem_image_url] : []
  return (
    <div className="page">
      <header className="page-header">
        <button type="button" className="back-link" onClick={() => { setQuestions([]); setSession(null) }}>
          <ArrowLeft size={16} aria-hidden="true" /> Sair
        </button>
        <h2>{selectedExam.name}</h2>
        <p>Questão {session.index + 1} de {questions.length}</p>
        <ProgressBar value={session.index + (session.confirmed ? 1 : 0)} max={questions.length} label="Progresso" />
      </header>
      <Card className="question-card">
        <div className="question-prompt">
          <Markdown text={q.prompt} />
          {sourceImages.map((url, i) => (
            <a key={url} className="question-image-link" href={url} target="_blank" rel="noopener noreferrer">
              <img className="question-image" src={url} alt={`Figura da questão ${i + 1}; abrir em tamanho real`} loading="lazy" />
              <span>Ver figura {i + 1} em tamanho real ↗</span>
            </a>
          ))}
        </div>
        <div className="question-options">
          {q.options.map((opt, idx) => {
            const selected = session.selected === idx
            const confirmed = session.confirmed
            const isCorrect = idx === q.correct_index
            const img = q.option_images?.[idx]
            let cls = 'question-option'
            if (selected) cls += ' is-selected'
            if (confirmed) { if (isCorrect) cls += ' is-correct'; else if (selected) cls += ' is-wrong' }
            return (
              <button key={idx} type="button" className={cls} disabled={confirmed} onClick={() => setSession((s) => ({ ...s, selected: idx }))}>
                <span className="option-letter">{String.fromCharCode(65 + idx)}</span>
                <span className="option-body">
                  {opt && <span>{opt}</span>}
                  {img && <img className="option-image" src={img} alt={`Imagem da alternativa ${String.fromCharCode(65 + idx)}`} loading="lazy" />}
                </span>
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
            <button type="button" className="btn btn-primary" disabled={session.selected === null} onClick={confirmAnswer}>Confirmar resposta</button>
            <button type="button" className="btn btn-ghost" onClick={skipQuestion}>Pular questão</button>
          </div>
        ) : (
          <div className="question-feedback">
            {session.index > 0 && (
              <button type="button" className="btn btn-ghost" onClick={prevQuestion} style={{ alignSelf: 'flex-start' }}>← Anterior</button>
            )}
            {session.selected === q.correct_index ? <p className="feedback-ok"><CheckCircle2 size={16} aria-hidden="true" /> Correta!</p> : <p className="feedback-bad"><XCircle size={16} aria-hidden="true" /> Incorreta.</p>}
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
