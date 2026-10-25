import { useState } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { Loader2 } from 'lucide-react'
import AuthLayout from '../../components/AuthLayout'
import { useAuth } from '../../lib/auth'

export default function Signup() {
  const { signUp } = useAuth()
  const navigate = useNavigate()
  const [name, setName] = useState('')
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [error, setError] = useState('')
  const [notice, setNotice] = useState('')
  const [submitting, setSubmitting] = useState(false)

  async function onSubmit(event) {
    event.preventDefault()
    setError('')
    setNotice('')
    setSubmitting(true)
    const { data, error: authError } = await signUp(name.trim(), email.trim(), password)
    setSubmitting(false)

    if (authError) {
      setError(
        authError.message.includes('already registered')
          ? 'Este e-mail já está cadastrado. Tente entrar na sua conta.'
          : 'Não foi possível criar sua conta. Verifique os dados e tente novamente.',
      )
      return
    }

    // Se a confirmação de e-mail estiver ativa, não há sessão imediata.
    if (!data.session) {
      setNotice('Conta criada! Confirme seu e-mail para começar a estudar.')
      return
    }
    navigate('/', { replace: true })
  }

  return (
    <AuthLayout
      title="Criar sua conta"
      subtitle="Leva menos de um minuto para começar."
      footer={
        <p>
          Já tem uma conta? <Link to="/login">Entrar</Link>
        </p>
      }
    >
      <form className="form" onSubmit={onSubmit}>
        <div className="field">
          <label htmlFor="name">Nome completo</label>
          <input
            id="name"
            type="text"
            className="input"
            autoComplete="name"
            required
            value={name}
            onChange={(e) => setName(e.target.value)}
            placeholder="Como devemos te chamar?"
          />
        </div>
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
            autoComplete="new-password"
            required
            minLength={6}
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            placeholder="Mínimo de 6 caracteres"
          />
        </div>

        {error && (
          <p className="form-error" role="alert">
            {error}
          </p>
        )}
        {notice && (
          <p className="form-notice" role="status">
            {notice}
          </p>
        )}

        <button type="submit" className="btn btn-primary btn-block" disabled={submitting}>
          {submitting && <Loader2 size={17} className="spin" aria-hidden="true" />}
          {submitting ? 'Criando conta…' : 'Criar conta'}
        </button>
      </form>
    </AuthLayout>
  )
}
