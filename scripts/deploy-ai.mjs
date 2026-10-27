// Publica a Edge Function de IA e o secret do provedor no Supabase.
// Uso: npm run ai:deploy
// Requer login previo: npx supabase login  (ou npm run ai:login)

import { spawnSync } from 'node:child_process'
import { existsSync, readFileSync } from 'node:fs'
import { homedir } from 'node:os'
import { join } from 'node:path'

const PROJECT_REF = 'fyujuqqjjadrtmsnqzrb'
const ENV_FILE = '.env.secrets.local'
const npx = process.platform === 'win32' ? 'npx.cmd' : 'npx'

function hasAccessToken() {
  if (process.env.SUPABASE_ACCESS_TOKEN) return true
  const candidates = [
    join(homedir(), '.supabase', 'access-token'),
    join(homedir(), '.supabase', 'config.json'),
  ]
  return candidates.some((path) => existsSync(path))
}

function readSecretKey() {
  if (!existsSync(ENV_FILE)) return null
  const match = readFileSync(ENV_FILE, 'utf8').match(/GROQ_API_KEY=(.+)/)
  return match ? match[1].trim() : null
}

function run(args, label) {
  console.log(`\n> ${label}`)
  const result = spawnSync(npx, args, { stdio: 'inherit', shell: process.platform === 'win32' })
  if (result.status !== 0) {
    console.error(`\nFalhou: ${label}`)
    process.exit(result.status ?? 1)
  }
}

if (!hasAccessToken()) {
  console.error('\nVoce ainda nao fez login no Supabase CLI.')
  console.error('Rode uma vez:\n  npm run ai:login   (ou: npx supabase login)\n')
  process.exit(1)
}

if (!readSecretKey()) {
  console.error(`\nChave do provedor nao encontrada em ${ENV_FILE}.`)
  console.error('Adicione a linha GROQ_API_KEY=gsk_... nesse arquivo.\n')
  process.exit(1)
}

run(
  ['supabase', 'secrets', 'set', '--env-file', ENV_FILE, '--project-ref', PROJECT_REF],
  'Publicando os secrets (GROQ_API_KEY, GROQ_BASE_URL, GROQ_MODEL)',
)

run(
  ['supabase', 'functions', 'deploy', 'ai-chat', '--no-verify-jwt', '--project-ref', PROJECT_REF],
  'Publicando a Edge Function ai-chat',
)

console.log('\nPronto! A IA do site esta ativa. Teste em Convest IA > Configurar > Testar conexao.\n')
