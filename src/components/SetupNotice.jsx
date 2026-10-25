import { KeyRound } from 'lucide-react'

/**
 * Exibida quando VITE_SUPABASE_URL / VITE_SUPABASE_ANON_KEY não estão definidas.
 * Estado de configuração explícito — nunca quebra o app silenciosamente.
 */
export default function SetupNotice() {
  return (
    <main className="setup-screen">
      <div className="setup-card">
        <span className="brand-mark" aria-hidden="true">
          convest+
        </span>
        <div className="setup-icon">
          <KeyRound size={22} />
        </div>
        <h1>Conecte o Supabase</h1>
        <p>
          O Aura Study está pronto, mas precisa das credenciais do seu projeto Supabase
          para funcionar.
        </p>
        <ol>
          <li>
            Crie o arquivo <code>.env.local</code> na raiz do projeto (use o{' '}
            <code>.env.example</code> como modelo).
          </li>
          <li>
            Preencha <code>VITE_SUPABASE_URL</code> e <code>VITE_SUPABASE_ANON_KEY</code>{' '}
            (Supabase → Project Settings → API, chave <strong>anon public</strong>).
          </li>
          <li>
            Execute o SQL de <code>supabase/migrations/0001_initial_schema.sql</code> no
            SQL Editor do Supabase.
          </li>
          <li>
            Reinicie o servidor com <code>npm run dev</code>.
          </li>
        </ol>
      </div>
    </main>
  )
}
