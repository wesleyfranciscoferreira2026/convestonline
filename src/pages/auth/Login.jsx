import { useState } from 'react'
import { Link, useLocation, useNavigate } from 'react-router-dom'
import { Loader2 } from 'lucide-react'
import AuthLayout from '../../components/AuthLayout'
import { useAuth } from '../../lib/auth'

export default function Login() {
  const { signIn } = useAuth()
  const navigate = useNavigate()
  const location = useLocation()
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [error, setError] = useState('')
  const [submitting, setSubmitting] = useState(false)

  async function onSubmit(event) {
    event.preventDefault()
    setError('')
    setSubmitting(true)
    const { error: authError } = await signIn(email.trim(), password)
    setSubmitting(false)
    if (authError) {
      setError(
        authError.message === 'Invalid login credentials'
          ? 'E-mail ou senha incorretos. Tente novamente.'
          : 'Não foi possível entrar agora. Tente novamente em instantes.',
      )
      return
    }
    const destination = location.state?.from?.pathname ?? '/'
    navigate(destination, { replace: true })
  }

  return (
    <AuthLayout
      title="Entrar na sua conta"
      subtitle="Continue de onde parou nos seus estudos."
      footer={
        <p>
          Ainda não tem conta? <Link to="/cadastro">Criar conta gratuita</Link>
        </p>
      }
    >
      <form className="form" onSubmit={onSubmit} noValidate={false}>
        <div className="field">
          <label htmlFor="email">E-mail</label>
          <input
            id="email"
            type="email"
            className="input"
            autoComplete="email"
            required
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            placeholder="voce@exemplo.com"
          />
        </div>
        <div className="field">
          <label htmlFor="password">Senha</label>
          <input
            id="password"
            type="password"
            className="input"
            autoComplete="current-password"
            required
            minLength={6}
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            placeholder="Sua senha"
          />
        </div>

        {error && (
          <p className="form-error" role="alert">
            {error}
          </p>
        )}

        <button type="submit" className="btn btn-primary btn-block" disabled={submitting}>
          {submitting && <Loader2 size={17} className="spin" aria-hidden="true" />}
          {submitting ? 'Entrando…' : 'Entrar'}
        </button>

        <Link to="/recuperar" className="form-link">
          Esqueci minha senha
        </Link>
      </form>
    </AuthLayout>
  )
}
