import { Link } from 'react-router-dom'
import { Sparkles } from 'lucide-react'

/** Layout das telas públicas (login, cadastro, recuperar senha). */
export default function AuthLayout({ title, subtitle, children, footer }) {
  return (
    <main className="auth-screen">
      <div className="auth-panel">
        <Link to="/login" className="auth-brand" aria-label="Convest+">
          <span className="brand-mark">convest+</span>
        </Link>
        <p className="auth-tagline">
          <Sparkles size={16} aria-hidden="true" />
          Seu próximo nível começa com o que você aprende hoje.
        </p>
        <ul className="auth-highlights">
          <li>Rotina de estudos organizada em poucos cliques</li>
          <li>Progresso e consistência sempre visíveis</li>
          <li>Conteúdo, exercícios e revisão em um só lugar</li>
        </ul>
      </div>

      <div className="auth-form-area">
        <div className="auth-card">
          <h1>{title}</h1>
          {subtitle && <p className="auth-subtitle">{subtitle}</p>}
          {children}
          {footer && <div className="auth-footer">{footer}</div>}
        </div>
      </div>
    </main>
  )
}
