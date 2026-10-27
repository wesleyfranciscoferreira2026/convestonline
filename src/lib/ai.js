// Cliente de IA central do Convest+.
// Suporta dois modos:
//  - 'site': usa a chave guardada no servidor (Supabase Edge Function). Nao exige
//    que o visitante configure nada.
//  - 'own' : usa a chave que o proprio usuario colou na Convest IA (localStorage).
// Em ambos os casos passamos por `chat()`, que devolve mensagens amigaveis
// quando o provedor responde com limite de uso, chave invalida ou erro de rede.

import { supabase } from './supabaseClient'

export const AI_CONFIG_KEY = 'convest-ai-config'
export const AI_MODE_KEY = 'convest-ai-mode'

export const DEFAULT_AI_CONFIG = {
  apiKey: '',
  baseUrl: 'https://api.groq.com/openai/v1',
  model: 'openai/gpt-oss-120b',
}

export const AI_MODES = {
  site: 'IA do site',
  own: 'Minha chave',
}

export function getAIConfig() {
  try {
    const stored = JSON.parse(localStorage.getItem(AI_CONFIG_KEY) || '{}')
    return { ...DEFAULT_AI_CONFIG, ...stored }
  } catch {
    return { ...DEFAULT_AI_CONFIG }
  }
}

export function saveAIConfig(config) {
  localStorage.setItem(AI_CONFIG_KEY, JSON.stringify(config))
}

export function getAIMode() {
  const mode = localStorage.getItem(AI_MODE_KEY)
  return mode === 'own' ? 'own' : 'site'
}

export function setAIMode(mode) {
  localStorage.setItem(AI_MODE_KEY, mode === 'own' ? 'own' : 'site')
}

/** A IA esta disponivel se o modo site estiver ativo ou se houver chave propria. */
export function isAIAvailable() {
  if (getAIMode() === 'own') return Boolean(getAIConfig().apiKey)
  return true
}

/** Rotulo curto do modo em uso, para exibir na interface. */
export function getAIModeLabel() {
  return getAIMode() === 'own' ? AI_MODES.own : AI_MODES.site
}

function parseJsonSafe(text) {
  if (!text) return null
  try {
    return JSON.parse(text)
  } catch {
    return null
  }
}

/**
 * Traduz status HTTP do provedor em uma mensagem util para o aluno.
 * Retorna { title, hint }.
 */
export function friendlyAIError(status, body) {
  const data = parseJsonSafe(body)
  const message = data?.error?.message || data?.message || ''
  const lower = message.toLowerCase()

  if (status === 429) {
    const retry = data?.error?.metadata?.retry_after || data?.retry_after
    const quando = retry ? ` Tente novamente em ${retry}s.` : ''
    return {
      title: 'Limite de uso atingido no provedor de IA.',
      hint: `Voce fez many requests em pouco tempo e o provedor recusou novas chamadas (rate limit).${quando} Espere alguns minutos, reduza o tamanho do pedido ou use outro provedor.`,
    }
  }
  if (status === 401) {
    return {
      title: 'Chave de API invalida ou expirada.',
      hint: 'Verifique a chave em Convest IA > Configurar. No Groq, a chave fica em console.groq.com/keys.',
    }
  }
  if (status === 403) {
    return {
      title: 'Acesso negado pelo provedor de IA.',
      hint: 'A chave existe, mas nao tem permissao para este modelo ou para este endpoint.',
    }
  }
  if (status === 402) {
    return {
      title: 'Creditos esgotados no provedor.',
      hint: 'Adicione saldo ou use um provedor com plano gratuito.',
    }
  }
  if (status === 404) {
    return {
      title: 'Modelo ou endpoint nao encontrado.',
      hint: 'Confira o nome do modelo e a URL base nas configuracoes da Convest IA. Modelos atuais do Groq: openai/gpt-oss-120b, openai/gpt-oss-20b, llama-3.3-70b-versatile.',
    }
  }
  if (status === 413) {
    return {
      title: 'Pedido grande demais para o provedor.',
      hint: 'Reduza o tamanho do texto enviado ou divida a pergunta em partes menores.',
    }
  }
  if (status === 400) {
    return {
      title: 'O provedor recusou o formato da requisicao.',
      hint: lower.includes('max_tokens')
        ? 'Some o limite de tokens ou troque max_tokens por max_completion_tokens, conforme o modelo.'
        : 'Verifique o modelo, a temperatura e o formato do pedido.',
    }
  }
  if (status >= 500) {
    return {
      title: 'O provedor de IA esta com instabilidade.',
      hint: 'O erro veio do servidor do provedor (status do servidor). Tente novamente em instantes.',
    }
  }
  return {
    title: `Falha na chamada a IA (status ${status}).`,
    hint: message ? message.slice(0, 220) : 'Verifique a chave, o endpoint e o modelo configurados.',
  }
}

function networkError() {
  return {
    title: 'Nao foi possivel falar com o provedor de IA.',
    hint: 'Pode ser bloqueio de rede/CORS. O Groq (console.groq.com) aceita chamadas direto do navegador; a OpenAI bloqueia, nesse caso use o modo "IA do site" ou um provedor com CORS liberado.',
  }
}

function normalizeContent(data) {
  const choice = data?.choices?.[0]
  const message = choice?.message ?? {}
  const content = typeof message.content === 'string' ? message.content : ''
  const reasoning = typeof message.reasoning === 'string' ? message.reasoning : ''
  const text = content.trim() || reasoning.trim()
  const incomplete = !content.trim() && reasoning.trim().length > 0
  return { text, incomplete, raw: data, usage: data?.usage ?? null }
}

async function callOwnProvider({ messages, temperature, maxTokens, config }) {
  const base = (config.baseUrl || DEFAULT_AI_CONFIG.baseUrl).replace(/\/$/, '')
  const model = config.model || DEFAULT_AI_CONFIG.model
  const body = {
    model,
    messages,
    temperature: temperature ?? 0.6,
    top_p: 1,
    stream: false,
  }
  // Modelos de raciocinio (gpt-oss) precisam de um budget alto: o
  // "reasoning" consome tokens e o "content" voltaria vazio.
  const isReasoningModel = /gpt-oss/i.test(model)
  if (isReasoningModel) body.reasoning_effort = 'medium'
  if (maxTokens) body.max_completion_tokens = maxTokens
  else if (isReasoningModel) body.max_completion_tokens = 2048

  let res
  try {
    res = await fetch(`${base}/chat/completions`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${config.apiKey}` },
      body: JSON.stringify(body),
    })
  } catch {
    return { ok: false, error: networkError() }
  }

  if (!res.ok) {
    const raw = await res.text()
    return { ok: false, error: friendlyAIError(res.status, raw) }
  }
  const data = await res.json()
  return { ok: true, ...normalizeContent(data) }
}

async function callSiteProvider({ messages, temperature, maxTokens }) {
  if (!supabase) {
    return {
      ok: false,
      error: {
        title: 'IA do site indisponivel.',
        hint: 'O endereco do Supabase nao esta configurado neste ambiente. Configure VITE_SUPABASE_URL e VITE_SUPABASE_ANON_KEY ou use a sua propria chave.',
      },
    }
  }
  let data
  let error
  try {
    ;({ data, error } = await supabase.functions.invoke('ai-chat', {
      body: { messages, temperature: temperature ?? 0.6, max_completion_tokens: maxTokens ?? null },
    }))
  } catch (cause) {
    return { ok: false, error: { title: 'Falha ao chamar a IA do site.', hint: cause?.message || 'Verifique se a funcao ai-chat esta implantada no Supabase.' } }
  }
  if (error) {
    // supabase-js devolve FunctionsHttpError; o corpo vem em error.context.
    let body = ''
    let status = error.status || 0
    try {
      const ctx = error.context
      if (ctx && typeof ctx.json === 'function') body = JSON.stringify(await ctx.json())
      else if (ctx && typeof ctx.text === 'function') body = await ctx.text()
      if (ctx && ctx.status) status = ctx.status
    } catch {
      body = ''
    }
    if (!body) body = typeof error === 'string' ? error : JSON.stringify(error)
    const parsed = parseJsonSafe(body)
    if (parsed?.error?.title) return { ok: false, error: parsed.error }
    if (status === 404 || /edge function.*not found|function not found/i.test(body)) {
      return {
        ok: false,
        error: {
          title: 'A IA do site ainda nao foi implantada.',
          hint: 'Rode "npm run ai:deploy" no projeto para publicar a funcao ai-chat no Supabase. Enquanto isso, use o modo "Minha chave".',
        },
      }
    }
    return { ok: false, error: friendlyAIError(status || 500, body) }
  }
  if (!data?.ok) {
    return { ok: false, error: data?.error || { title: 'A IA do site nao respondeu.', hint: 'Tente novamente em instantes.' } }
  }
  return { ok: true, text: data?.text || '', raw: data?.raw ?? null, usage: data?.usage ?? null }
}

/**
 * Verifica se a Edge Function "ai-chat" esta publicada no Supabase.
 * A funcao responde 400 (mensagem vazia) quando existe, e 404 quando nao.
 */
export async function isSiteAIAvailable() {
  if (!supabase) return false
  try {
    const { data, error } = await supabase.functions.invoke('ai-chat', { body: { ping: true } })
    if (!error && data?.ok) return true
    const ctx = error?.context
    const status = ctx?.status || error?.status || 0
    if (status === 404) return false
    return false
  } catch {
    return false
  }
}

/**
 * Chama o provedor usando uma configuracao especifica (usado no "Testar conexao").
 * @returns {Promise<{ok: boolean, text?: string, error?: {title: string, hint: string}}>}
 */
export async function chatWithConfig({ messages, config, temperature = 0.6, maxTokens = null } = {}) {
  if (!messages?.length) {
    return { ok: false, error: { title: 'Mensagem vazia.', hint: 'Envie ao menos uma mensagem.' } }
  }
  if (!config?.apiKey) {
    return {
      ok: false,
      error: {
        title: 'Nenhuma chave de API configurada.',
        hint: 'Cole uma chave (Groq: gsk_..., OpenAI: sk-...).',
      },
    }
  }
  return callOwnProvider({ messages, temperature, maxTokens, config })
}

/**
 * Envia uma conversa para a IA e padroniza o resultado.
 * @returns {Promise<{ok: boolean, text?: string, error?: {title: string, hint: string}}>}
 */
export async function chat({ messages, temperature = 0.6, maxTokens = null } = {}) {
  if (!messages?.length) {
    return { ok: false, error: { title: 'Mensagem vazia.', hint: 'Escreva a pergunta antes de enviar.' } }
  }
  if (getAIMode() === 'own') {
    const config = getAIConfig()
    if (!config.apiKey) {
      return {
        ok: false,
        error: {
          title: 'Nenhuma chave de API configurada.',
          hint: 'Abra Convest IA > Configurar e cole sua chave, ou volte para o modo "IA do site".',
        },
      }
    }
    return callOwnProvider({ messages, temperature, maxTokens, config })
  }

  const siteResult = await callSiteProvider({ messages, temperature, maxTokens })
  if (siteResult.ok) return siteResult

  // Fallback: se a IA do site ainda nao estiver implantada (ou falhar) e o
  // aluno tiver a propria chave salva, usamos a chave dele em vez de erro.
  const own = getAIConfig()
  if (own.apiKey) {
    const ownResult = await callOwnProvider({ messages, temperature, maxTokens, config: own })
    if (ownResult.ok) return ownResult
  }
  return siteResult
}

/** Testa a conexao usada no momento (site ou chave propria). */
export async function testAIConnection() {
  const result = await chat({ messages: [{ role: 'user', content: 'Responda apenas: OK' }], temperature: 0, maxTokens: 2048 })
  if (!result.ok) return { ok: false, ...result.error }
  return { ok: true, text: result.text }
}

/** Converte a resposta da IA em JSON, removendo cercas de markdown. */
export function parseAIJson(raw) {
  const cleaned = String(raw || '').replace(/^```(?:json)?/i, '').replace(/```$/i, '').trim()
  const start = cleaned.search(/[[{]/)
  const end = Math.max(cleaned.lastIndexOf(']'), cleaned.lastIndexOf('}'))
  const slice = start >= 0 && end > start ? cleaned.slice(start, end + 1) : cleaned
  return JSON.parse(slice)
}
