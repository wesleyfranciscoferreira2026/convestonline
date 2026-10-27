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
import {
  AI_MODES,
  DEFAULT_AI_CONFIG,
  chat,
  chatWithConfig,
  getAIConfig,
  getAIMode,
  getAIModeLabel,
  isSiteAIAvailable,
  saveAIConfig,
  setAIMode,
  testAIConnection,
} from '../lib/ai'

const HISTORY_KEY = 'convest-ai-history'

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
  const [config, setConfig] = useState(() => getAIConfig())
  const [mode, setMode] = useState(() => getAIMode())
  const [draftMode, setDraftMode] = useState(() => getAIMode())
  const [siteReady, setSiteReady] = useState(null)
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
  const [draft, setDraft] = useState(() => ({ ...DEFAULT_AI_CONFIG, ...config }))
  const [testStatus, setTestStatus] = useState('')
  const scrollRef = useRef(null)

  useEffect(() => {
    scrollRef.current?.scrollTo({ top: scrollRef.current.scrollHeight, behavior: 'smooth' })
  }, [messages, loading])

  useEffect(() => {
    localStorage.setItem(HISTORY_KEY, JSON.stringify(messages.slice(-40)))
  }, [messages])

  useEffect(() => {
    const full = 'Sua tutora particular — tire dúvidas de matemática, física, história, geografia e muito mais.'
    let i = 0
    setTypedSubtitle('')
    const timer = setInterval(() => {
      i++
      setTypedSubtitle(full.slice(0, i))
      if (i >= full.length) clearInterval(timer)
    }, 35)
    return () => clearInterval(timer)
  }, [])

  function saveConfig() {
    saveAIConfig(draft)
    setConfig(draft)
    setAIMode(draftMode)
    setMode(draftMode)
    setConfigOpen(false)
  }

  async function testConnection() {
    setTestStatus('Testando conexao...')
    if (draftMode === 'own') {
      const result = await chatWithConfig({
        messages: [{ role: 'user', content: 'Responda apenas: OK' }],
        config: draft,
        temperature: 0,
        maxTokens: 16,
      })
      if (!result.ok) {
        setTestStatus(`${result.error.title} ${result.error.hint}`)
        return
      }
      setTestStatus(`Conexao OK! Resposta: ${(result.text || 'OK').slice(0, 40)}`)
      return
    }
    const result = await testAIConnection()
    if (!result.ok) {
      setTestStatus(`${result.title} ${result.hint}`)
      return
    }
    setTestStatus(`Conexao OK! Resposta: ${(result.text || 'OK').slice(0, 40)}`)
  }

  async function send(text) {
    const question = (text ?? input).trim()
    if (!question || loading) return

    const userMsg = { role: 'user', content: question }
    const next = [...messages, userMsg]
    setMessages(next)
    setInput('')
    setLoading(true)

    const result = await chat({
      messages: [{ role: 'system', content: SYSTEM_PROMPT }, ...next],
      temperature: 0.4,
    })

    if (result.ok) {
      setMessages((m) => [...m, { role: 'assistant', content: result.text || 'Nao consegui gerar uma resposta.' }])
    } else {
      setMessages((m) => [
        ...m,
        { role: 'assistant', content: `**${result.error.title}**

${result.error.hint}` },
      ])
    }
    setLoading(false)
  }

  function clearHistory() {
    setMessages([])
    localStorage.removeItem(HISTORY_KEY)
  }

  useEffect(() => {
    let active = true
    isSiteAIAvailable().then((ok) => {
      if (active) setSiteReady(ok)
    })
    return () => { active = false }
  }, [])

  const configured = mode === 'own' ? Boolean(config.apiKey) : siteReady !== false

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
          <p>{typedSubtitle}<span className="typing-caret" aria-hidden="true">|</span></p>
        </div>
        <div className="ai-header-actions">
          <button type="button" className="btn btn-ghost btn-sm" onClick={clearHistory} disabled={messages.length === 0}>
            <Trash2 size={15} aria-hidden="true" /> Limpar
          </button>
          <button type="button" className="btn btn-outline btn-sm" onClick={() => { setDraft(config); setDraftMode(mode); setConfigOpen(true) }}>
            <SettingsIcon size={15} aria-hidden="true" /> Configurar
          </button>
        </div>
      </header>

      {mode === 'site' && siteReady === true && (
        <Card className="ai-setup-card">
          <EmptyState
            icon={Sparkles}
            title="Convest IA pronta para usar"
            description="As respostas usam a IA do proprio Convest+. Nao precisa cadastrar chave nenhuma: e so perguntar."
            action={
              <div className="ai-setup-actions">
                <button type="button" className="btn btn-outline" onClick={() => { setDraft(config); setDraftMode('own'); setConfigOpen(true) }}>
                  Usar minha propria chave
                </button>
                <button type="button" className="btn btn-primary" onClick={() => { setDraft(config); setDraftMode('site'); setConfigOpen(true) }}>
                  Ver configuracoes
                </button>
              </div>
            }
          />
          <p className="ai-setup-note">
            O uso passa pelo servidor e pode respeitar limites de uso do provedor. Se aparecer um aviso de limite,
            aguarde alguns minutos ou ative o modo "Minha chave".
          </p>
        </Card>
      )}

      {mode === 'site' && siteReady === false && (
        <Card className="ai-setup-card">
          <EmptyState
            icon={Key}
            title="IA do site ainda nao ativada"
            description="A funcao de IA do site ainda nao foi publicada no Supabase. Enquanto isso, use sua propria chave do Groq (gratuita) e tudo funciona normalmente."
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
                <button type="button" className="btn btn-primary" onClick={() => { setDraft(config); setDraftMode('own'); setConfigOpen(true) }}>
                  Colar minha chave
                </button>
              </div>
            }
          />
          <p className="ai-setup-note">
            A chave fica salva apenas no seu navegador (localStorage). Nunca e enviada para nossos servidores.
          </p>
        </Card>
      )}

      {mode === 'own' && !config.apiKey && (
        <Card className="ai-setup-card">
          <EmptyState
            icon={Key}
            title="Configure sua chave de API"
            description="Voce escolheu usar sua propria chave. Crie uma conta no Groq (gratuito) e cole a chave abaixo."
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
                <button type="button" className="btn btn-primary" onClick={() => { setDraft(config); setDraftMode('own'); setConfigOpen(true) }}>
                  Colar minha chave
                </button>
              </div>
            }
          />
          <p className="ai-setup-note">
            A chave fica salva apenas no seu navegador (localStorage). Nunca e enviada para nossos servidores.
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
            placeholder={mode === 'own' ? (config.apiKey ? 'Digite sua dúvida.' : 'Cole sua chave em Configurar para começar') : (siteReady === false ? 'IA do site ainda não ativada — use sua chave em Configurar' : 'Digite sua dúvida.')}
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
                <label htmlFor="ai-mode">Como usar a IA</label>
                <select id="ai-mode" className="input" value={draftMode} onChange={(e) => setDraftMode(e.target.value)}>
                  <option value="site">{AI_MODES.site} (recomendado, nao precisa de chave)</option>
                  <option value="own">{AI_MODES.own} (usar a chave do provedor)</option>
                </select>
                <small className="settings-note">
                  No modo "{AI_MODES.site}" a chamada passa pelo servidor do Convest+ e qualquer visitante pode usar.
                  No modo "{AI_MODES.own}" a chave fica apenas no seu navegador.
                </small>
              </div>
              {draftMode === 'own' && (
                <>
                <div className="field">
                  <label htmlFor="ai-key">Chave de API</label>
                  <input
                    id="ai-key"
                    type="password"
                    className="input"
                    placeholder="gsk_... (Groq) ou sk-... (OpenAI)"
                    value={draft.apiKey || ''}
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
                    value={draft.baseUrl || DEFAULT_AI_CONFIG.baseUrl}
                    onChange={(e) => setDraft({ ...draft, baseUrl: e.target.value })}
                  />
                </div>
                <div className="field">
                  <label htmlFor="ai-model">Modelo</label>
                  <input
                    id="ai-model"
                    type="text"
                    className="input"
                    placeholder="openai/gpt-oss-120b"
                    value={draft.model || DEFAULT_AI_CONFIG.model}
                    onChange={(e) => setDraft({ ...draft, model: e.target.value })}
                  />
                </div>
                </>
              )}
              <p className="settings-note">
                Modo atual: <strong>{getAIModeLabel()}</strong>. Compatível com provedores no formato OpenAI
                (Groq, OpenAI, Together, OpenRouter…).
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