import { useState } from 'react'
import { Link } from 'react-router-dom'
import { Loader2 } from 'lucide-react'
import AuthLayout from '../../components/AuthLayout'
import { useAuth } from '../../lib/auth'

export default function ForgotPassword() {
  const { resetPassword } = useAuth()
  const [email, setEmail] = useState('')
  const [error, setError] = useState('')
  const [sent, setSent] = useState(false)
  const [submitting, setSubmitting] = useState(false)

  async function onSubmit(event) {
    event.preventDefault()
    setError('')
    setSubmitting(true)
    const { error: authError } = await resetPassword(email.trim())
    setSubmitting(false)
    if (authError) {
      setError('Não foi possível enviar o e-mail de recuperação. Tente novamente.')
      return
    }
    setSent(true)
  }

  return (
    <AuthLayout
      title="Recuperar senha"
      subtitle="Enviaremos um link de redefinição para o seu e-mail."
      footer={
        <p>
          Lembrou a senha? <Link to="/login">Voltar ao login</Link>
        </p>
      }
    >
      {sent ? (
        <div className="form-notice" role="status">
          <p>
            Se este e-mail estiver cadastrado, você receberá o link de recuperação em
            alguns minutos. Verifique também a caixa de spam.
          </p>
        </div>
      ) : (
        <form className="form" onSubmit={onSubmit}>
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

          {error && (
            <p className="form-error" role="alert">
              {error}
            </p>
          )}

          <button type="submit" className="btn btn-primary btn-block" disabled={submitting}>
            {submitting && <Loader2 size={17} className="spin" aria-hidden="true" />}
            {submitting ? 'Enviando…' : 'Enviar link de recuperação'}
          </button>
        </form>
      )}
    </AuthLayout>
  )
}
