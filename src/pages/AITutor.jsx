import { useEffect, useRef, useState } from 'react'
import { Link } from 'react-router-dom'
import {
  ArrowLeft,
  Bot,
  Key,
  Loader2,
  Send,
  Settings as SettingsIcon,
  Sparkles,
  Trash2,
  X,
} from 'lucide-react'
import { Card, EmptyState } from '../components/ui'
import Markdown from '../components/Markdown'

const STORAGE_KEY = 'convest-ai-config'
const HISTORY_KEY = 'convest-ai-history'

const DEFAULT_CONFIG = {
  apiKey: '',
  baseUrl: 'https://api.groq.com/openai/v1',
  model: 'llama-3.3-70b-versatile',
}

const SYSTEM_PROMPT = `Você é a Convest IA, uma tutora educacional especializada em tirar dúvidas de estudantes do ensino fundamental, médio e superior.

Você domina: matemática, física, química, biologia, português, inglês, história, geografia, filosofia, sociologia, literatura e arte.

Regras de resposta:
- Responda sempre em português, de forma clara, didática e organizada.
- Explique passo a passo quando for cálculo, problema ou raciocínio.
- Use Markdown (títulos, listas, negrito) e LaTeX entre $$ quando útil para fórmulas.
- Ao final de CADA resposta, inclua uma seção "📚 Fontes" listando fontes confiáveis (Wikipedia, Khan Academy, manuais e livros didáticos, sites oficiais, artigos científicos) que sustentam o que você disse. Seja honesta: se não tiver certeza de uma fonte, diga.
- Não invente dados ou citações. Se não souber, diga que não sabe e sugira onde pesquisar.
- Se a pergunta for fora do escopo educacional, responda brevemente e redirecione para estudos.`

const SUGGESTIONS = [
  'Explique a Lei de Ohm com um exemplo prático.',
  'Resolva: 2x + 5 = 13. Mostre os passos.',
  'Quais foram as causas da Revolução Francesa?',
  'O que é fotossíntese? Resuma em tópicos.',
]

export default function AITutor() {
  const [config, setConfig] = useState(() => {
    try {
      return { ...DEFAULT_CONFIG, ...JSON.parse(localStorage.getItem(STORAGE_KEY) || '{}') }
    } catch {
      return DEFAULT_CONFIG
    }
  })
  const [messages, setMessages] = useState(() => {
    try {
      return JSON.parse(localStorage.getItem(HISTORY_KEY) || '[]')
    } catch {
      return []
    }
  })
  const [input, setInput] = useState('')
  const [loading, setLoading] = useState(false)
  const [configOpen, setConfigOpen] = useState(false)
  const [draft, setDraft] = useState(config)
  const [testStatus, setTestStatus] = useState('')
  const scrollRef = useRef(null)

  useEffect(() => {
    scrollRef.current?.scrollTo({ top: scrollRef.current.scrollHeight, behavior: 'smooth' })
  }, [messages, loading])

  useEffect(() => {
    localStorage.setItem(HISTORY_KEY, JSON.stringify(messages.slice(-40)))
  }, [messages])

  function saveConfig() {
    setConfig(draft)
    localStorage.setItem(STORAGE_KEY, JSON.stringify(draft))
    setConfigOpen(false)
  }

  async function testConnection() {
    if (!draft.apiKey) {
      setTestStatus('Cole uma chave de API primeiro.')
      return
    }
    setTestStatus('Testando…')
    try {
      const res = await fetch(`${draft.baseUrl.replace(/\/$/, '')}/chat/completions`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          Authorization: `Bearer ${draft.apiKey}`,
        },
        body: JSON.stringify({
          model: draft.model,
          messages: [{ role: 'user', content: 'Responda apenas: OK' }],
          temperature: 0,
          max_tokens: 5,
        }),
      })
      if (!res.ok) {
        const err = await res.text()
        setTestStatus(`Falhou (${res.status}): ${err.slice(0, 120)}`)
        return
      }
      setTestStatus('✅ Conexão OK! Chave válida.')
    } catch (e) {
      setTestStatus(`⚠️ Erro de rede/CORS: ${e.message}. Use o Groq (suporta navegador).`)
    }
  }

  async function send(text) {
    const question = (text ?? input).trim()
    if (!question || loading) return
    if (!config.apiKey) {
      setConfigOpen(true)
      return
    }

    const userMsg = { role: 'user', content: question }
    const next = [...messages, userMsg]
    setMessages(next)
    setInput('')
    setLoading(true)

    try {
      const res = await fetch(`${config.baseUrl.replace(/\/$/, '')}/chat/completions`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          Authorization: `Bearer ${config.apiKey}`,
        },
        body: JSON.stringify({
          model: config.model,
          messages: [{ role: 'system', content: SYSTEM_PROMPT }, ...next],
          temperature: 0.4,
        }),
      })
      if (!res.ok) {
        const err = await res.text()
        throw new Error(`Erro ${res.status}: ${err.slice(0, 200)}`)
      }
      const data = await res.json()
      const answer = data?.choices?.[0]?.message?.content ?? 'Não consegui gerar uma resposta.'
      setMessages((m) => [...m, { role: 'assistant', content: answer }])
    } catch (e) {
      const msg = e?.message || ''
      const isNetwork = /failed to fetch|networkerror|load failed/i.test(msg)
      const hint = isNetwork
        ? 'Parece um bloqueio de rede/CORS. A OpenAI bloqueia chamadas diretas do navegador — use o Groq (grátis, compatível) em console.groq.com/keys, ou um provedor com CORS habilitado.'
        : 'Verifique sua chave de API, o endpoint e o nome do modelo.'
      setMessages((m) => [
        ...m,
        { role: 'assistant', content: `⚠️ ${msg || 'Erro desconhecido'}\n\n${hint}` },
      ])
    } finally {
      setLoading(false)
    }
  }

  function clearHistory() {
    setMessages([])
    localStorage.removeItem(HISTORY_KEY)
  }

  const configured = Boolean(config.apiKey)

  return (
    <div className="page ai-page">
      <Link to="/" className="back-link">
        <ArrowLeft size={16} aria-hidden="true" /> Voltar ao início
      </Link>
      <header className="page-header ai-header">
        <div>
          <h2>
            <Sparkles size={22} aria-hidden="true" /> Convest IA
          </h2>
          <p>Sua tutora particular — tire dúvidas de matemática, física, história, geografia e muito mais.</p>
        </div>
        <div className="ai-header-actions">
          <button type="button" className="btn btn-ghost btn-sm" onClick={clearHistory} disabled={messages.length === 0}>
            <Trash2 size={15} aria-hidden="true" /> Limpar
          </button>
          <button type="button" className="btn btn-outline btn-sm" onClick={() => { setDraft(config); setConfigOpen(true) }}>
            <SettingsIcon size={15} aria-hidden="true" /> Configurar
          </button>
        </div>
      </header>

      {!configured && (
        <Card className="ai-setup-card">
          <EmptyState
            icon={Key}
            title="Configure sua chave de API"
            description="A Convest IA usa um modelo de linguagem para responder. É gratuito: crie uma conta no Groq (recomendado) e cole a chave abaixo."
            action={
              <div className="ai-setup-actions">
                <a
                  href="https://console.groq.com/keys"
                  target="_blank"
                  rel="noopener noreferrer"
                  className="btn btn-outline"
                >
                  Criar chave no Groq
                </a>
                <button type="button" className="btn btn-primary" onClick={() => { setDraft(config); setConfigOpen(true) }}>
                  Colar minha chave
                </button>
              </div>
            }
          />
          <p className="ai-setup-note">
            A chave fica salva apenas no seu navegador (localStorage). Nunca é enviada para nossos servidores.
          </p>
        </Card>
      )}

      <Card className="ai-chat-card">
        <div className="ai-messages" ref={scrollRef}>
          {messages.length === 0 && (
            <div className="ai-welcome">
              <span className="ai-avatar">
                <Bot size={26} aria-hidden="true" />
              </span>
              <h3>Olá! Eu sou a Convest IA.</h3>
              <p>Pergunte o que quiser sobre suas matérias. Explico passo a passo e cito as fontes que usei.</p>
              <div className="ai-suggestions">
                {SUGGESTIONS.map((s) => (
                  <button key={s} type="button" className="ai-suggestion" onClick={() => send(s)}>
                    {s}
                  </button>
                ))}
              </div>
            </div>
          )}

          {messages.map((m, i) => (
            <div key={i} className={`ai-msg ai-msg-${m.role}`}>
              {m.role === 'assistant' && (
                <span className="ai-msg-avatar">
                  <Bot size={16} aria-hidden="true" />
                </span>
              )}
              <div className="ai-msg-bubble">
                <Markdown text={m.content} />
              </div>
            </div>
          ))}

          {loading && (
            <div className="ai-msg ai-msg-assistant">
              <span className="ai-msg-avatar">
                <Bot size={16} aria-hidden="true" />
              </span>
              <div className="ai-msg-bubble ai-typing">
                <span /><span /><span />
              </div>
            </div>
          )}
        </div>

        <form
          className="ai-input-bar"
          onSubmit={(e) => {
            e.preventDefault()
            send()
          }}
        >
          <input
            type="text"
            className="input"
            placeholder={configured ? 'Digite sua dúvida…' : 'Configure sua chave de API para começar'}
            value={input}
            onChange={(e) => setInput(e.target.value)}
            disabled={loading || !configured}
          />
          <button type="submit" className="btn btn-primary" disabled={loading || !configured || !input.trim()}>
            {loading ? <Loader2 size={17} className="spin" aria-hidden="true" /> : <Send size={17} aria-hidden="true" />}
          </button>
        </form>
      </Card>

      {configOpen && (
        <div className="sheet-overlay" onClick={() => setConfigOpen(false)}>
          <div className="sheet ai-config-sheet" role="dialog" aria-modal="true" aria-label="Configurar IA" onClick={(e) => e.stopPropagation()}>
            <div className="sheet-header">
              <strong>Configurar Convest IA</strong>
              <button type="button" className="icon-btn" aria-label="Fechar" onClick={() => setConfigOpen(false)}>
                <X size={19} />
              </button>
            </div>
            <div className="form">
              <div className="field">
                <label htmlFor="ai-key">Chave de API</label>
                <input
                  id="ai-key"
                  type="password"
                  className="input"
                  placeholder="gsk_... (Groq) ou sk-... (OpenAI)"
                  value={draft.apiKey}
                  onChange={(e) => setDraft({ ...draft, apiKey: e.target.value })}
                />
              </div>
              <div className="field">
                <label htmlFor="ai-url">Endpoint (base URL)</label>
                <input
                  id="ai-url"
                  type="url"
                  className="input"
                  placeholder="https://api.groq.com/openai/v1"
                  value={draft.baseUrl}
                  onChange={(e) => setDraft({ ...draft, baseUrl: e.target.value })}
                />
              </div>
              <div className="field">
                <label htmlFor="ai-model">Modelo</label>
                <input
                  id="ai-model"
                  type="text"
                  className="input"
                  placeholder="llama-3.3-70b-versatile"
                  value={draft.model}
                  onChange={(e) => setDraft({ ...draft, model: e.target.value })}
                />
              </div>
              <p className="settings-note">
                Compatível com qualquer provedor no formato OpenAI (Groq, OpenAI, Together, OpenRouter…).
                A chave fica apenas no seu navegador.
              </p>
              {testStatus && <p className="form-notice">{testStatus}</p>}
              <div className="task-form-actions">
                <button type="button" className="btn btn-ghost btn-sm" onClick={testConnection}>
                  Testar conexão
                </button>
                <button type="button" className="btn btn-ghost btn-sm" onClick={() => setConfigOpen(false)}>
                  Cancelar
                </button>
                <button type="button" className="btn btn-primary btn-sm" onClick={saveConfig}>
                  Salvar
                </button>
              </div>
            </div>
          </div>
        </div>
      )}
    </div>
  )
}

/* Markdown renderizado pelo componente compartilhado src/components/Markdown.jsx */