import { useEffect, useRef, useState } from 'react'
import { Link } from 'react-router-dom'
import {
  ArrowLeft,
  Bot,
  Check,
  Copy,
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
- Use Markdown (titulos, listas, negrito) para organizar a resposta.
- Escreva TODAS as formulas matematicas em LaTeX.
  - Formula inline (no meio do texto): $x^2 + y^2 = z^2$
  - Formula em bloco (sozinha, com dois cifreses):
      $$
      \\int_0^1 x^2\\,dx = \\frac{1}{3}
      $$
  - Exemplos validos: $\\sqrt{2}$, $\\frac{a}{b}$, $e^{i\\pi} + 1 = 0$, $\\int_0^1 x^2\\,dx = \\frac{1}{3}$.
  - Comandos LaTeX uteis: \\frac \\sqrt \\int \\sum \\lim \\infty \\cdot \\times \\pi \\alpha \\beta \\theta \\partial \\left \\right.
  - NUNCA escreva formulas sem os delimitadores $ ... $, e nunca use \\[ ... \\].
  - Antes de responder, confira que toda formula tem os cifreses $.
- Em calculos, mostre o desenvolvimento passo a passo e destaque o resultado final.
- Ao final de CADA resposta, inclua uma secao de fontes no formato exato abaixo:
  ---
  📚 Fontes
  - Nome da fonte - https://url.com/da/fonte
  - Outra fonte - https://outra/url
  ---
  Regras das fontes:
  - Cada fonte fica em uma linha propria, comecando por "- ".
  - Sempre inclua o link completo (https://...) depois do nome, em TODAS as linhas.
  - Nao escreva frases de encerramento (como "Boa pratica!") depois da secao de fontes.
  - Use fontes confiaveis (Wikipedia, Khan Academy, manuais e livros didaticos, sites oficiais, artigos cientificos).
  - Seja honesta: se nao tiver certeza de uma fonte, diga.
- Não invente dados ou citações. Se não souber, diga que não sabe e sugira onde pesquisar.
- Se a pergunta for fora do escopo educacional, responda brevemente e redirecione para estudos.`

/** Separa o corpo da resposta da secao de fontes (no mesmo estilo do ChatGPT). */
function splitSources(content) {
  const text = content || ''
  const marker = text.search(/📚\s*(\*\*)?Fontes?/i)
  if (marker === -1) return { body: text, sources: [] }
  const body = text.slice(0, marker).replace(/\n*---\s*$/, '').trimEnd()
  const tail = text.slice(marker).replace(/^[^\n]*\n?/, '')
  const sources = tail
    .split('\n')
    .map((line) => line.trim())
    .filter((line) => line && line !== '---')
    .map((line) => line.replace(/^[-*•]\s*/, ""))
    .filter((line) => /https?:\/\//i.test(line))
  return { body, sources }
}

/** Extrai rotulo e url de uma linha de fonte, removendo marcacao do Markdown. */
function parseSource(line) {
  const clean = (s) =>
    s
      .replace(/\[([^\]]+)\]\([^)\s]+\)/g, '$1')
      .replace(/[*_`~]/g, '')
      .replace(/\s+/g, ' ')
      .trim()

  const link = line.match(/\[([^\]]+)\]\(([^)\s]+)\)/)
  if (link) return { label: clean(link[1]), url: link[2] }

  const url = line.match(/https?:\/\/[^\s)\]]+/)
  if (!url) return { label: clean(line), url: null }

  let label = line.replace(url[0], '')
  label = label.replace(/\(\s*\)/g, '')
  label = label.replace(/[\s\-–—:|,(]+$/, '')
  label = label.replace(/^[\s\-–—:|,(]+/, '')

  return { label: clean(label) || clean(line), url: url[0] }
}

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
  const [typedSubtitle, setTypedSubtitle] = useState('')
  const [siteReady, setSiteReady] = useState(null)
  const [copiedIndex, setCopiedIndex] = useState(null)
  const inputRef = useRef(null)
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
    if (needsKey) {
      setConfigOpen(true)
      return
    }

    const userMsg = { role: 'user', content: question }
    const next = [...messages, userMsg]
    setMessages(next)
    // Limpa o campo imediatamente (estado + DOM) para o aluno ja digitar de novo.
    setInput('')
    if (inputRef.current) inputRef.current.value = ''
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

  async function copyMessage(text, index) {
    try {
      await navigator.clipboard.writeText(text)
    } catch {
      const area = document.createElement('textarea')
      area.value = text
      area.style.position = 'fixed'
      area.style.opacity = '0'
      document.body.appendChild(area)
      area.select()
      try { document.execCommand('copy') } catch { /* ignora */ }
      document.body.removeChild(area)
    }
    setCopiedIndex(index)
    setTimeout(() => setCopiedIndex((current) => (current === index ? null : current)), 1800)
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

  // Nunca bloqueia a digitacao por falta de configuracao: se a IA do site
  // estiver indisponivel, o erro aparece na conversa.
  const configured = true
  const needsKey = mode === 'own' && !config.apiKey

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

      {mode === 'site' && siteReady === false && needsKey === false && (
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

          {messages.map((m, i) => {
            const { body, sources } = m.role === 'assistant' ? splitSources(m.content) : { body: m.content, sources: [] }
            const copied = copiedIndex === i
            return (
              <div key={i} className={`ai-msg ai-msg-${m.role}`}>
                {m.role === 'assistant' && (
                  <span className="ai-msg-avatar">
                    <Bot size={16} aria-hidden="true" />
                  </span>
                )}
                <div className="ai-msg-body">
                  <div className="ai-msg-bubble">
                    <Markdown text={body} />
                  </div>
                  <div className="ai-msg-actions">
                    <button
                      type="button"
                      className="ai-msg-action"
                      onClick={() => copyMessage(m.role === 'assistant' ? body : m.content, i)}
                      aria-label={copied ? 'Copiado' : 'Copiar mensagem'}
                      title={copied ? 'Copiado' : 'Copiar'}
                    >
                      {copied ? <Check size={14} aria-hidden="true" /> : <Copy size={14} aria-hidden="true" />}
                      <span>{copied ? 'Copiado' : 'Copiar'}</span>
                    </button>
                  </div>
                  {sources.length > 0 && (
                    <div className="ai-sources">
                      <span className="ai-sources-label">Fontes</span>
                      <div className="ai-sources-list">
                        {sources.map((source, k) => {
                          const parsed = parseSource(source)
                          const pill = (
                            <span className="ai-source-pill" title={parsed.label}>
                              {parsed.label}
                            </span>
                          )
                          return parsed.url ? (
                            <a
                              key={k}
                              className="ai-source-link"
                              href={parsed.url}
                              target="_blank"
                              rel="noopener noreferrer"
                              title={parsed.label}
                            >
                              {pill}
                            </a>
                          ) : (
                            <span key={k}>{pill}</span>
                          )
                        })}
                      </div>
                    </div>
                  )}
                </div>
              </div>
            )
          })}

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
            ref={inputRef}
            type="text"
            className="input"
            placeholder={needsKey ? 'Cole sua chave em Configurar para começar' : 'Digite sua dúvida.'}
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