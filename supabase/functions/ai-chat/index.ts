// Edge Function: ai-chat
// Proxy server-side para a IA. A chave do provedor fica em um secret do
// Supabase (GROQ_API_KEY) e nunca chega ao navegador.
//
// Deploy:
//   supabase functions deploy ai-chat --no-verify-jwt
//   supabase secrets set GROQ_API_KEY=gsk_...
//
// Variaveis opcionais:
//   GROQ_BASE_URL (padrao https://api.groq.com/openai/v1)
//   GROQ_MODEL    (padrao openai/gpt-oss-120b)

const CORS_HEADERS = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
  'Access-Control-Allow-Methods': 'POST, OPTIONS',
}

const DEFAULT_BASE_URL = 'https://api.groq.com/openai/v1'
const DEFAULT_MODEL = 'openai/gpt-oss-120b'

function json(body, status = 200) {
  return new Response(JSON.stringify(body), {
    status,
    headers: { ...CORS_HEADERS, 'Content-Type': 'application/json' },
  })
}

function errorBody(title, hint, status) {
  return {
    ok: false,
    error: { title, hint, status },
  }
}

Deno.serve(async (request) => {
  if (request.method === 'OPTIONS') {
    return new Response('ok', { headers: CORS_HEADERS })
  }
  if (request.method !== 'POST') {
    return json(errorBody('Metodo nao permitido.', 'Use POST para conversar com a IA.', 405), 405)
  }

  const apiKey = Deno.env.get('GROQ_API_KEY')
  if (!apiKey) {
    return json(
      errorBody(
        'IA do site ainda nao configurada.',
        'O secret GROQ_API_KEY nao esta definido no projeto do Supabase. Rode: supabase secrets set GROQ_API_KEY=gsk_...',
        503,
      ),
      503,
    )
  }

  let payload
  try {
    payload = await request.json()
  } catch {
    return json(errorBody('Corpo da requisicao invalido.', 'Envie JSON com o campo messages.', 400), 400)
  }

  const messages = Array.isArray(payload?.messages) ? payload.messages : null
  if (!messages || messages.length === 0) {
    return json(errorBody('Mensagem vazia.', 'Envie ao menos uma mensagem em messages.', 400), 400)
  }

  const baseUrl = (Deno.env.get('GROQ_BASE_URL') || DEFAULT_BASE_URL).replace(/\/$/, '')
  const model = payload?.model || Deno.env.get('GROQ_MODEL') || DEFAULT_MODEL
  const temperature = typeof payload?.temperature === 'number' ? payload.temperature : 0.6
  const maxTokens = typeof payload?.max_completion_tokens === 'number' ? payload.max_completion_tokens : null

  const body = {
    model,
    messages,
    temperature,
    top_p: 1,
    stream: false,
  }
  if (maxTokens) body.max_completion_tokens = maxTokens
  // Modelos de raciocinio (gpt-oss) aceitam reasoning_effort.
  if (/gpt-oss/i.test(model)) body.reasoning_effort = 'medium'

  let response
  try {
    response = await fetch(`${baseUrl}/chat/completions`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${apiKey}` },
      body: JSON.stringify(body),
    })
  } catch {
    return json(
      errorBody('Falha de rede ao falar com o provedor.', 'O provedor nao respondeu. Tente novamente em instantes.', 502),
      502,
    )
  }

  const raw = await response.text()

  if (!response.ok) {
    let hint = raw.slice(0, 300)
    let title = `Erro ${response.status} do provedor de IA.`
    if (response.status === 429) {
      title = 'Limite de uso atingido no provedor de IA.'
      hint = 'O provedor recusou novas chamadas por excesso de requisicoes. Tente novamente em alguns minutos.'
    } else if (response.status === 401) {
      title = 'Chave de API do servidor invalida.'
      hint = 'Atualize o secret: supabase secrets set GROQ_API_KEY=gsk_...'
    } else if (response.status === 404) {
      title = 'Modelo nao encontrado no provedor.'
      hint = `Verifique o nome do modelo (padrao: ${DEFAULT_MODEL}).`
    }
    return json(errorBody(title, hint, response.status), response.status)
  }

  let data
  try {
    data = JSON.parse(raw)
  } catch {
    return json(errorBody('Resposta invalida do provedor.', 'Nao foi possivel ler o retorno do modelo.', 502), 502)
  }

  const message = data?.choices?.[0]?.message ?? {}
  const text = typeof message.content === 'string' && message.content.trim()
    ? message.content
    : (typeof message.reasoning === 'string' ? message.reasoning : '')

  return json({ ok: true, text, usage: data?.usage ?? null, model })
})
