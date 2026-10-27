import { useEffect, useMemo, useState } from 'react'
import { ArrowLeft, CheckCircle2, ClipboardList, Loader2, XCircle } from 'lucide-react'
import { supabase } from '../../lib/supabaseClient'
import { useAuth } from '../../lib/auth'
import { Card, EmptyState, ProgressBar, SectionHeader } from '../../components/ui'
import Markdown from '../../components/Markdown'

const SUBJECT_SLUGS = [
  'direito-administrativo',
  'direito-constitucional',
  'direito-penal',
  'direito-civil',
  'processo-civil',
  'processo-penal',
  'direito-do-trabalho',
  'direito-tributario',
  'direito-do-consumidor',
  'direito-ambiental',
]

const BANKS = [
  { value: 'FGV', label: 'FGV (formato autoral)' },
  { value: 'CEBRASPE', label: 'CEBRASPE (formato autoral)' },
  { value: 'FCC', label: 'FCC (formato autoral)' },
  { value: 'VUNESP', label: 'VUNESP (formato autoral)' },
]

const CONTEST_PROFILES = [
  'OAB',
  'Carreiras policiais',
  'Tribunais',
  'Área fiscal',
  'Geral',
]

function getStoredAIConfig() {
  try { return JSON.parse(localStorage.getItem('convest-ai-config') || '{}') } catch { return {} }
}

export default function LawQuestions() {
  const { user } = useAuth()
  const [subjects, setSubjects] = useState([])
  const [questions, setQuestions] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')
  const [filters, setFilters] = useState({ subject: 'all', topic: 'all', banca: 'all', concurso: 'all' })
  const [runQuestions, setRunQuestions] = useState(null)
  const [session, setSession] = useState(null)
  const [hasAIKey, setHasAIKey] = useState(() => Boolean(getStoredAIConfig().apiKey))
  const [generateContinuously, setGenerateContinuously] = useState(false)
  const [generatingNext, setGeneratingNext] = useState(false)
  const [generationError, setGenerationError] = useState('')

  useEffect(() => {
    let active = true
    async function load() {
      setHasAIKey(Boolean(getStoredAIConfig().apiKey))
      setLoading(true)
      const { data: subjectRows, error: subjectError } = await supabase
        .from('subjects')
        .select('id, slug, name')
        .in('slug', SUBJECT_SLUGS)
        .order('sort_order')

      if (!active) return
      if (subjectError) {
        setError('Não foi possível carregar as disciplinas agora.')
        setLoading(false)
        return
      }

      const availableSubjects = subjectRows ?? []
      setSubjects(availableSubjects)
      if (availableSubjects.length === 0) {
        setQuestions([])
        setLoading(false)
        return
      }

      const { data: questionRows, error: questionError } = await supabase
        .from('questions')
        .select('id, subject_id, prompt, options, correct_index, explanation, topic, difficulty, banca, concurso, sort_order, subjects(name, slug)')
        .in('subject_id', availableSubjects.map((subject) => subject.id))
        .eq('status', 'published')
        .not('banca', 'is', null)
        .order('sort_order')

      if (!active) return
      if (questionError) {
        setError('O banco autoral ainda não está instalado. Aplique a migration de Direito para liberar as questões.')
      } else {
        setQuestions(questionRows ?? [])
      }
      setLoading(false)
    }

    load()
    return () => { active = false }
  }, [])

  const filteredQuestions = useMemo(() => questions.filter((question) => (
    (filters.subject === 'all' || question.subjects?.slug === filters.subject)
    && (filters.topic === 'all' || question.topic === filters.topic)
    && (filters.banca === 'all' || question.banca === filters.banca)
    && (filters.concurso === 'all' || question.concurso === filters.concurso)
  )), [questions, filters])

  const availableTopics = useMemo(() => [...new Set(questions
    .filter((question) => filters.subject === 'all' || question.subjects?.slug === filters.subject)
    .map((question) => question.topic)
    .filter(Boolean))].sort((a, b) => a.localeCompare(b, 'pt-BR')), [questions, filters.subject])

  function startPractice() {
    const selected = [...filteredQuestions].sort(() => Math.random() - 0.5)
    if (selected.length === 0) return
    setRunQuestions(selected)
    setSession({ index: 0, selected: null, confirmed: false, correct: 0 })
  }

  async function confirmAnswer() {
    if (session?.selected == null) return
    const question = runQuestions[session.index]
    const isCorrect = session.selected === question.correct_index
    if (user) {
      await supabase.from('question_attempts').insert({
        user_id: user.id,
        subject_id: question.subject_id,
        question_id: String(question.id).startsWith('gen-') ? null : question.id,
        is_correct: isCorrect,
      })
    }
    setSession((current) => ({
      ...current,
      confirmed: true,
      correct: current.correct + (isCorrect ? 1 : 0),
    }))
  }

  async function nextQuestion() {
    setGenerationError('')
    const currentQuestion = runQuestions[session.index]

    if (generateContinuously) {
      const config = getStoredAIConfig()
      if (config.apiKey) {
        setGeneratingNext(true)
        try {
          const previousPrompts = runQuestions
            .slice(0, session.index + 1)
            .filter((question) => question.subject_id === currentQuestion.subject_id)
            .slice(-5)
            .map((question) => question.prompt)
          const topic = filters.topic !== 'all' ? filters.topic : currentQuestion.topic
          const prompt = `Crie uma questão jurídica AUTORAL e inédita de múltipla escolha. Não copie nem adapte questões de livros, apostilas ou provas existentes.

Disciplina: ${currentQuestion.subjects?.name || 'Direito'}.
Tópico: ${topic || 'escolha um tópico fundamental da disciplina'}.
Perfil de concurso: ${currentQuestion.concurso || 'Geral'}.
Formato de referência: ${currentQuestion.banca || 'questão autoral'} (use apenas características gerais do formato, sem alegar que é uma questão oficial).

Evite repetir estes enunciados já usados na sessão:
${previousPrompts.map((text, index) => `${index + 1}. ${text}`).join('\n')}

Escreva enunciado claro, cinco alternativas A-E, apenas uma correta e comentário curto explicando a resposta. Evite depender de legislação local ou de informação não indicada no enunciado. Retorne somente JSON válido neste formato: {"prompt":"...","options":["...","...","...","...","..."],"correct_index":0,"explanation":"...","topic":"...","difficulty":"medium"}.`
          const endpoint = `${(config.baseUrl || 'https://api.openai.com/v1').replace(/\/$/, '')}/chat/completions`
          const response = await fetch(endpoint, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${config.apiKey}` },
            body: JSON.stringify({
              model: config.model || 'llama-3.3-70b-versatile',
              messages: [{ role: 'user', content: prompt }],
              temperature: 0.8,
            }),
          })
          if (!response.ok) throw new Error(`Erro ${response.status} ao gerar questão.`)
          const result = await response.json()
          const raw = result?.choices?.[0]?.message?.content ?? ''
          const cleaned = raw.replace(/^```(?:json)?/i, '').replace(/```$/i, '').trim()
          const parsed = JSON.parse(cleaned)
          if (!parsed.prompt || !Array.isArray(parsed.options) || parsed.options.length !== 5
            || !Number.isInteger(parsed.correct_index) || parsed.correct_index < 0 || parsed.correct_index > 4) {
            throw new Error('A resposta da IA veio em formato inválido.')
          }
          const generated = {
            id: `gen-${Date.now()}`,
            subject_id: currentQuestion.subject_id,
            subjects: currentQuestion.subjects,
            prompt: parsed.prompt,
            options: parsed.options,
            correct_index: parsed.correct_index,
            explanation: parsed.explanation || '',
            topic: parsed.topic || topic || currentQuestion.topic,
            difficulty: parsed.difficulty || 'medium',
            banca: currentQuestion.banca,
            concurso: currentQuestion.concurso,
          }
          setRunQuestions((current) => [...current, generated])
          setSession((current) => ({ ...current, index: current.index + 1, selected: null, confirmed: false }))
          return
        } catch (cause) {
          setGenerationError(`${cause.message} Vou continuar com as questões autorais já cadastradas.`)
        } finally {
          setGeneratingNext(false)
        }
      } else {
        setGenerationError('Configure uma chave de API em Convest IA para gerar questões novas. Vou continuar com o banco autoral.')
      }
    }

    setSession((current) => {
      if (current.index + 1 >= runQuestions.length) return { ...current, finished: true }
      return { ...current, index: current.index + 1, selected: null, confirmed: false }
    })
  }

  function leavePractice() {
    setRunQuestions(null)
    setSession(null)
  }

  if (runQuestions && session?.finished) {
    const percent = Math.round((session.correct / runQuestions.length) * 100)
    return (
      <Card>
        <SectionHeader title="Prática concluída" subtitle="Resultado das questões autorais de Direito." />
        <div className="law-result-score">{session.correct} de {runQuestions.length} corretas · {percent}%</div>
        <button type="button" className="btn btn-primary" onClick={leavePractice}>Voltar às disciplinas</button>
      </Card>
    )
  }

  if (runQuestions && session) {
    const question = runQuestions[session.index]
    return (
      <div className="law-question-runner">
        <header className="page-header">
          <button type="button" className="back-link" onClick={leavePractice}>
            <ArrowLeft size={16} aria-hidden="true" /> Sair das questões
          </button>
          <h2>{question.subjects?.name}</h2>
          <p>Questão {session.index + 1}{generateContinuously ? '' : ` de ${runQuestions.length}`} · {question.banca} (autoral)</p>
          <ProgressBar value={session.index + (session.confirmed ? 1 : 0)} max={runQuestions.length} label="Progresso das questões de Direito" />
        </header>
        <Card className="question-card">
          <div className="law-question-meta">
            <span>{question.topic}</span>
            <span>{question.concurso}</span>
          </div>
          <div className="question-prompt"><Markdown text={question.prompt} /></div>
          <div className="question-options">
            {(question.options ?? []).map((option, index) => {
              const selected = session.selected === index
              const correct = question.correct_index === index
              let className = 'question-option'
              if (selected) className += ' is-selected'
              if (session.confirmed && correct) className += ' is-correct'
              if (session.confirmed && selected && !correct) className += ' is-wrong'
              return (
                <button
                  key={index}
                  type="button"
                  className={className}
                  disabled={session.confirmed}
                  onClick={() => setSession((current) => ({ ...current, selected: index }))}
                >
                  <span className="option-letter">{String.fromCharCode(65 + index)}</span>
                  <span className="option-body">{option}</span>
                  {session.confirmed && correct && <CheckCircle2 size={18} aria-hidden="true" />}
                  {session.confirmed && selected && !correct && <XCircle size={18} aria-hidden="true" />}
                </button>
              )
            })}
          </div>
          {session.confirmed && question.explanation && (
            <div className="law-answer-explanation">
              <strong>Comentário</strong>
              <Markdown text={question.explanation} />
            </div>
          )}
          {generationError && <p className="form-error" role="status">{generationError}</p>}
          <div className="question-actions">
            {!session.confirmed ? (
              <button type="button" className="btn btn-primary" onClick={confirmAnswer} disabled={session.selected == null}>
                Confirmar resposta
              </button>
            ) : (
              <button type="button" className="btn btn-primary" onClick={nextQuestion} disabled={generatingNext}>
                {generatingNext ? <><Loader2 className="spin" size={16} aria-hidden="true" /> Gerando questão…</> : generateContinuously ? 'Gerar próxima questão' : session.index + 1 === runQuestions.length ? 'Ver resultado' : 'Próxima questão'}
              </button>
            )}
          </div>
        </Card>
      </div>
    )
  }

  return (
    <Card>
      <SectionHeader title="Banco de questões autorais" subtitle="Filtre por disciplina, tópico, banca de referência e perfil de concurso." />
      <p className="law-bank-disclaimer">
        Questões inéditas criadas para treino. Os nomes de bancas indicam apenas o formato de referência; não são questões oficiais nem foram copiadas do arquivo enviado.
      </p>
      {loading ? (
        <div className="law-loading"><Loader2 className="spin" size={20} aria-hidden="true" /> Carregando questões…</div>
      ) : error ? (
        <p className="form-error" role="alert">{error}</p>
      ) : questions.length === 0 ? (
        <EmptyState icon={ClipboardList} title="Questões em preparação" description="As questões autorais serão exibidas aqui depois que a migration de Direito for aplicada no Supabase." />
      ) : (
        <>
          <div className="law-question-filters">
            <div className="field">
              <label htmlFor="law-subject-filter">Disciplina</label>
              <select id="law-subject-filter" className="input" value={filters.subject} onChange={(event) => setFilters((current) => ({ ...current, subject: event.target.value, topic: 'all' }))}>
                <option value="all">Todas as disciplinas</option>
                {subjects.map((subject) => <option key={subject.id} value={subject.slug}>{subject.name}</option>)}
              </select>
            </div>
            <div className="field">
              <label htmlFor="law-topic-filter">Tópico</label>
              <select id="law-topic-filter" className="input" value={filters.topic} onChange={(event) => setFilters((current) => ({ ...current, topic: event.target.value }))}>
                <option value="all">Todos os tópicos</option>
                {availableTopics.map((topic) => <option key={topic} value={topic}>{topic}</option>)}
              </select>
            </div>
            <div className="field">
              <label htmlFor="law-bank-filter">Banca de referência</label>
              <select id="law-bank-filter" className="input" value={filters.banca} onChange={(event) => setFilters((current) => ({ ...current, banca: event.target.value }))}>
                <option value="all">Todas as bancas</option>
                {BANKS.map((bank) => <option key={bank.value} value={bank.value}>{bank.label}</option>)}
              </select>
            </div>
            <div className="field">
              <label htmlFor="law-contest-filter">Perfil de concurso</label>
              <select id="law-contest-filter" className="input" value={filters.concurso} onChange={(event) => setFilters((current) => ({ ...current, concurso: event.target.value }))}>
                <option value="all">Todos os perfis</option>
                {CONTEST_PROFILES.map((profile) => <option key={profile} value={profile}>{profile}</option>)}
              </select>
            </div>
          </div>
          <label className={`law-ai-toggle ${!hasAIKey ? 'is-disabled' : ''}`}>
            <input type="checkbox" checked={generateContinuously} disabled={!hasAIKey} onChange={(event) => setGenerateContinuously(event.target.checked)} />
            <span>
              <strong>Gerar uma questão inédita após cada resposta</strong>
              <small>{hasAIKey ? 'Usa a chave de API configurada em Convest IA e gera uma questão por vez.' : 'Configure uma chave de API em Convest IA para habilitar a geração contínua.'}</small>
            </span>
          </label>
          <div className="law-practice-footer">
            <span>{filteredQuestions.length} {filteredQuestions.length === 1 ? 'questão disponível' : 'questões disponíveis'}</span>
            <button type="button" className="btn btn-primary" onClick={startPractice} disabled={!filteredQuestions.length}>
              Começar prática
            </button>
          </div>
        </>
      )}
    </Card>
  )
}
