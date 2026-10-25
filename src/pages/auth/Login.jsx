import { useState } from 'react'
import { Link, useLocation, useNavigate } from 'react-router-dom'
import { Loader2 } from 'lucide-react'
import AuthLayout from '../../components/AuthLayout'
import { useAuth } from '../../lib/auth'
import { supabase } from '../../lib/supabaseClient'

export default function Login() {
  const { signIn, continueAsGuest } = useAuth()
  const navigate = useNavigate()
  const location = useLocation()
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [error, setError] = useState('')
  const [submitting, setSubmitting] = useState(false)
  const [resendStatus, setResendStatus] = useState('')

  async function onSubmit(event) {
    event.preventDefault()
    setError('')
    setSubmitting(true)
    const { error: authError } = await signIn(email.trim(), password)
    setSubmitting(false)
    if (authError) {
      const msg = (authError.message || '').toLowerCase()
      if (msg.includes('email not confirmed') || msg.includes('not confirmed')) {
        setError('Seu e-mail ainda não foi confirmado. Verifique sua caixa de entrada (e spam) e clique no link de confirmação antes de entrar.')
      } else if (msg.includes('invalid login credentials') || msg.includes('invalid credentials')) {
        setError('E-mail ou senha incorretos. Se você acabou de se cadastrar, confirme seu e-mail primeiro.')
      } else {
        setError('Não foi possível entrar agora. Tente novamente em instantes.')
      }
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
        <>
          <p>
            Ainda não tem conta? <Link to="/cadastro">Criar conta gratuita</Link>
          </p>
          <button
            type="button"
            className="btn btn-ghost btn-block"
            onClick={() => { continueAsGuest(); navigate('/', { replace: true }) }}
          >
            Continuar sem login
          </button>
        </>
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

        <button
          type="button"
          className="form-link form-link-muted"
          onClick={async () => {
            if (!email.trim()) {
              setResendStatus('Digite seu e-mail acima para reenviar a confirmação.')
              return
            }
            setResendStatus('Enviando…')
            const { error: resendError } = await supabase.auth.resend({
              type: 'signup',
              email: email.trim(),
            })
            setResendStatus(
              resendError
                ? 'Não foi possível reenviar. Verifique o e-mail digitado.'
                : 'E-mail de confirmação reenviado. Confira sua caixa de entrada.',
            )
          }}
        >
          Não recebeu o e-mail de confirmação? Reenviar
        </button>
        {resendStatus && <p className="form-notice">{resendStatus}</p>}
      </form>
    </AuthLayout>
  )
}
