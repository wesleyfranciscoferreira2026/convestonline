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
  X,
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

export default function Exercises() {
  const { user, profile } = useAuth()
  const toast = useToast()
  const [subjects, setSubjects] = useState(null)
  const [counts, setCounts] = useState({})
  const [activeSubject, setActiveSubject] = useState(null)
  const [questions, setQuestions] = useState([])
  const [loadingQ, setLoadingQ] = useState(false)
  const [session, setSession] = useState(null) // { index, answers: [{selected, correct}], finished }
  const [mode, setMode] = useState('bank') // 'bank' | 'generate'
  const [selectedYear, setSelectedYear] = useState('') // '' = todos os anos
  const [availableYears, setAvailableYears] = useState([])
  const [genConfig, setGenConfig] = useState({ banca: 'ENEM', subjectId: '', topic: '', difficulty: 'medium', count: 5 })
  const [generating, setGenerating] = useState(false)
  const [genError, setGenError] = useState('')

  useEffect(() => {
    let active = true
    async function load() {
      const { data: subs } = await supabase.from('subjects').select('id, slug, name, icon').order('sort_order')
      if (!active) return
      setSubjects(subs ?? [])
      // Contagem de questões por matéria
      const allQs = []
      let from = 0
      const PAGE = 1000
      while (true) {
        const { data: batch } = await supabase.from('questions').select('subject_id, year').eq('status', 'published').range(from, from + PAGE - 1)
        if (!batch || batch.length === 0) break
        allQs.push(...batch)
        if (batch.length < PAGE) break
        from += PAGE
      }
      const c = {}
      const years = new Set()
      for (const q of allQs) {
        c[q.subject_id] = (c[q.subject_id] || 0) + 1
        if (q.year) years.add(q.year)
      }
      setCounts(c)
      setAvailableYears(Array.from(years).sort((a, b) => b - a))
    }
    load()
    return () => { active = false }
  }, [])

  async function start(subject) {
    // Visitantes podem resolver; o progresso só é salvo para usuários logados.
    setActiveSubject(subject)
    setLoadingQ(true)
    let query = supabase
      .from('questions')
      .select('id, prompt, options, option_images, stem_image_url, source_images, correct_index, explanation, difficulty, year')
      .eq('subject_id', subject.id)
      .eq('status', 'published')
      .order('sort_order')
    if (selectedYear) {
      query = query.eq('year', Number(selectedYear))
    }
    const { data } = await query
    setLoadingQ(false)
    const qs = (data ?? []).sort(() => Math.random() - 0.5)
    if (qs.length === 0) {
      toast('Esta matéria ainda não tem exercícios' + (selectedYear ? ' para ' + selectedYear : '') + '.', 'error')
      setActiveSubject(null)
      return
    }
    setQuestions(qs)
    setSession({ index: 0, answers: [], selected: null, confirmed: false, finished: false })
  }

  async function generateQuestions() {
    setGenError('')
    if (!isAIAvailable()) {
      setGenError('A IA nao esta configurada. Abra Convest IA > Configurar para ativar.')
      return
    }
    if (!genConfig.subjectId) {
      setGenError('Selecione uma matéria.')
      return
    }
    const subject = subjects.find((s) => s.id === genConfig.subjectId)
    setGenerating(true)
    try {
      const diffLabel = genConfig.difficulty === 'easy' ? 'fácil' : genConfig.difficulty === 'hard' ? 'difícil' : 'média'
      const prompt = `Gere ${genConfig.count} questões de múltipla escolha no estilo da banca "${genConfig.banca}", sobre a matéria "${subject.name}"${genConfig.topic ? `, tema: ${genConfig.topic}` : ''}.

Nível de dificuldade: ${diffLabel}. Textos de enunciado podem ser longos (até ~300 palavras), com contexto, situações-problema realistas no estilo da banca.

Retorne APENAS um JSON válido (sem markdown, sem texto extra) no formato:
[
  {
    "prompt": "enunciado da questão (pode ser longo)",
    "options": ["alternativa A", "alternativa B", "alternativa C", "alternativa D", "alternativa E"],
    "correct_index": 0,
    "explanation": "explicação didática da resposta correta",
    "topic": "tópico específico da questão",
    "difficulty": "${genConfig.difficulty}"
  }
]

Regras:
- 5 alternativas por questão (A-E), como nas bancas brasileiras.
- correct_index é o índice (0-4) da alternativa correta.
- Estilo, vocabulário e dificuldade compatíveis com a banca ${genConfig.banca}.
- Questões claras, sem ambiguidade, com textos mais longos quando apropriado.
- Explicações didáticas e concisas.
- O campo "topic" deve ser o tópico específico (ex.: Eletrodinâmica, Hidrodinâmica).
- Retorne somente o array JSON, nada mais.`

      const result = await chat({
        messages: [{ role: 'user', content: prompt }],
        temperature: 0.7,
      })
      if (!result.ok) throw new Error(`${result.error.title} ${result.error.hint}`)
      const parsed = parseAIJson(result.text)
      if (!Array.isArray(parsed) || parsed.length === 0) throw new Error('Resposta invalida do modelo.')
      const qs = parsed.map((q, i) => ({
        id: `gen-${Date.now()}-${i}`,
        prompt: q.prompt,
        options: q.options,
        correct_index: q.correct_index,
        explanation: q.explanation,
        topic: q.topic || genConfig.topic || null,
        difficulty: q.difficulty || genConfig.difficulty,
      }))
      setQuestions(qs)
      setActiveSubject(subject)
      setSession({ index: 0, answers: [], selected: null, confirmed: false, finished: false })
    } catch (e) {
      setGenError(`⚠️ ${e.message}`)
    } finally {
      setGenerating(false)
    }
  }

  async function confirmAnswer() {
    if (session.selected === null) return
    const q = questions[session.index]
    const correct = session.selected === q.correct_index
    // Registra a tentativa apenas se estiver logado; IDs gerados pela IA não
    // são UUIDs do banco, mas ainda contam nas estatísticas do aluno.
    if (user) {
      await supabase.from('question_attempts').insert({
        user_id: user.id,
        subject_id: activeSubject.id,
        question_id: String(q.id || '').startsWith('gen-') ? null : q.id,
        is_correct: correct,
      })
    }
    setSession((s) => ({
      ...s,
      confirmed: true,
      answers: [...s.answers, { selected: s.selected, correct }],
    }))
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
      if (nextIndex >= questions.length) {
        return { ...s, finished: true, selected: null, confirmed: false, skipped: (s.skipped || 0) + 1 }
      }
      return { ...s, index: nextIndex, selected: null, confirmed: false, skipped: (s.skipped || 0) + 1 }
    })
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
        <Link to="/" className="back-link">
          <ArrowLeft size={16} aria-hidden="true" /> Voltar ao início
        </Link>
        <header className="page-header">
          <h2>Exercícios</h2>
          <p>Resolva questões do banco ou gere novas com a Convest IA por banca, matéria e tema.</p>
        </header>

        <div className="exercise-mode-tabs">
          <button
            type="button"
            className={`segment ${mode === 'bank' ? 'is-active' : ''}`}
            onClick={() => setMode('bank')}
          >
            <ClipboardList size={16} aria-hidden="true" /> Banco de questões
          </button>
          <button
            type="button"
            className={`segment ${mode === 'generate' ? 'is-active' : ''}`}
            onClick={() => setMode('generate')}
          >
            <Wand2 size={16} aria-hidden="true" /> Gerar com IA
          </button>
        </div>

        {mode === 'bank' && availableYears.length > 1 && (
          <div style={{ marginBottom: 16, display: 'flex', alignItems: 'center', gap: 8 }}>
            <label htmlFor="year-filter" style={{ fontSize: 13, fontWeight: 600 }}>Ano da prova:</label>
            <select
              id="year-filter"
              className="input"
              value={selectedYear}
              onChange={(e) => setSelectedYear(e.target.value)}
              style={{ width: 'auto' }}
            >
              <option value="">Todos os anos</option>
              {availableYears.map((y) => (
                <option key={y} value={y}>{y}</option>
              ))}
            </select>
          </div>
        )}
        {mode === 'bank' && (
          !subjects ? (
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
                description="Os exercícios serão publicados em breve. Enquanto isso, estude as aulas disponíveis ou gere questões com a IA."
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
          )
        )}

        {mode === 'generate' && (
          <Card className="gen-card">
            <h3 className="section-title">Gerar questões com IA</h3>
            <p className="gen-desc">
              Escolha a banca, a matéria e o tema. A Convest IA cria uma lista de questões no estilo da banca selecionada.
              Requer chave de API configurada na aba Convest IA.
            </p>
            <div className="gen-form">
              <div className="field">
                <label htmlFor="gen-banca">Banca</label>
                <select
                  id="gen-banca"
                  className="input"
                  value={genConfig.banca}
                  onChange={(e) => setGenConfig({ ...genConfig, banca: e.target.value })}
                >
                  <option>ENEM</option>
                  <option>ITA</option>
                  <option>IME</option>
                  <option>Concursos</option>
                </select>
              </div>
              <div className="field">
                <label htmlFor="gen-subject">Matéria</label>
                <select
                  id="gen-subject"
                  className="input"
                  value={genConfig.subjectId}
                  onChange={(e) => setGenConfig({ ...genConfig, subjectId: e.target.value })}
                >
                  <option value="">Selecione…</option>
                  {(subjects ?? []).map((s) => (
                    <option key={s.id} value={s.id}>{s.name}</option>
                  ))}
                </select>
              </div>
              <div className="field">
                <label htmlFor="gen-topic">Tema / assunto (opcional)</label>
                <input
                  id="gen-topic"
                  type="text"
                  className="input"
                  placeholder="Ex.: hidrodinâmica, Revolução Francesa, funções"
                  value={genConfig.topic}
                  onChange={(e) => setGenConfig({ ...genConfig, topic: e.target.value })}
                />
              </div>
              <div className="field">
                <label htmlFor="gen-diff">Dificuldade</label>
                <select
                  id="gen-diff"
                  className="input"
                  value={genConfig.difficulty}
                  onChange={(e) => setGenConfig({ ...genConfig, difficulty: e.target.value })}
                >
                  <option value="easy">Fácil</option>
                  <option value="medium">Médio</option>
                  <option value="hard">Difícil</option>
                </select>
              </div>
              <div className="field">
                <label htmlFor="gen-count">Quantidade</label>
                <select
                  id="gen-count"
                  className="input"
                  value={genConfig.count}
                  onChange={(e) => setGenConfig({ ...genConfig, count: Number(e.target.value) })}
                >
                  {QUESTION_COUNT_OPTIONS.map((option) => (
                    <option key={option.value} value={option.value}>
                      {questionCountLabel(option)}
                    </option>
                  ))}
                </select>
              </div>
              {premiumCountMessage(genConfig.count) && (
                <p className="gen-hint">{premiumCountMessage(genConfig.count)}</p>
              )}
            </div>
            {genError && <p className="form-error" role="alert">{genError}</p>}
            <button
              type="button"
              className="btn btn-primary"
              onClick={generateQuestions}
              disabled={generating}
            >
              {generating ? <Loader2 size={17} className="spin" aria-hidden="true" /> : <Sparkles size={17} aria-hidden="true" />}
              {generating ? 'Gerando questões…' : 'Gerar questões'}
            </button>
            {generating && <p className="gen-hint">Isso pode levar alguns segundos.</p>}
          </Card>
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
    const skipped = session.skipped || 0
    const answered = session.answers.length
    const total = questions.length
    const pct = answered > 0 ? Math.round((correct / answered) * 100) : 0
    return (
      <div className="page">
        <header className="page-header">
          <h2>Resultado — {activeSubject.name}</h2>
          <p>Você acertou {correct} de {answered} questões respondidas{skipped > 0 ? ` (${skipped} puladas)` : ''}.</p>
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
  const sourceImages = q.source_images?.length ? q.source_images : q.stem_image_url ? [q.stem_image_url] : []
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
        <button
          type="button"
          className="icon-btn icon-btn-danger"
          style={{ position: 'absolute', top: 8, right: 8, zIndex: 10, background: 'rgba(220, 38, 38, 0.9)', color: 'white', borderRadius: '50%', width: 28, height: 28, display: 'flex', alignItems: 'center', justifyContent: 'center' }}
          aria-label="Excluir questão"
          onClick={async () => {
            if (!confirm('Excluir esta questão?')) return
            const { error } = await supabase.from('questions').delete().eq('id', q.id)
            if (error) { toast('Erro: ' + error.message, 'error'); return }
            toast('Questão excluída.')
            setQuestions((prev) => prev.filter((x) => x.id !== q.id))
          }}
        >
          <X size={16} />
        </button>
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
                <span className="option-body">
                  {opt && <span>{opt}</span>}
                  {q.option_images?.[idx] && <img className="option-image" src={q.option_images[idx]} alt={`Imagem da alternativa ${String.fromCharCode(65 + idx)}`} loading="lazy" />}
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
              <button type="button" className="btn btn-ghost" onClick={prevQuestion}>
                ← Anterior
              </button>
            )}
            <button
              type="button"
              className="btn btn-primary"
              disabled={session.selected === null}
              onClick={confirmAnswer}
            >
              Confirmar resposta
            </button>
            <button type="button" className="btn btn-ghost" onClick={skipQuestion}>
              Pular questão
            </button>
          </div>
        ) : (
          <div className="question-actions">
            {session.index > 0 && (
              <button type="button" className="btn btn-ghost" onClick={prevQuestion}>
                ← Anterior
              </button>
            )}
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
          </div>
        )}
      </Card>
    </div>
  )
}
