import { useState } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { Loader2 } from 'lucide-react'
import AuthLayout from '../../components/AuthLayout'
import { useAuth } from '../../lib/auth'
import { supabase } from '../../lib/supabaseClient'

export default function ResetPassword() {
  const { user } = useAuth()
  const navigate = useNavigate()
  const [password, setPassword] = useState('')
  const [confirm, setConfirm] = useState('')
  const [error, setError] = useState('')
  const [submitting, setSubmitting] = useState(false)

  // Sem sessão (link expirado ou acessado diretamente), volta ao login.
  if (!user) {
    return (
      <AuthLayout
        title="Link inválido ou expirado"
        subtitle="Solicite um novo link de recuperação para redefinir sua senha."
        footer={
          <p>
            <Link to="/recuperar">Solicitar novo link</Link>
          </p>
        }
      >
        <Link to="/login" className="btn btn-primary btn-block">
          Voltar ao login
        </Link>
      </AuthLayout>
    )
  }

  async function onSubmit(event) {
    event.preventDefault()
    setError('')
    if (password.length < 6) {
      setError('A senha precisa ter pelo menos 6 caracteres.')
      return
    }
    if (password !== confirm) {
      setError('As senhas não coincidem.')
      return
    }
    setSubmitting(true)
    const { error: updateError } = await supabase.auth.updateUser({ password })
    setSubmitting(false)
    if (updateError) {
      setError('Não foi possível redefinir a senha. Solicite um novo link.')
      return
    }
    navigate('/', { replace: true })
  }

  return (
    <AuthLayout
      title="Redefinir senha"
      subtitle="Escolha uma nova senha para sua conta."
      footer={
        <p>
          <Link to="/login">Voltar ao login</Link>
        </p>
      }
    >
      <form className="form" onSubmit={onSubmit}>
        <div className="field">
          <label htmlFor="password">Nova senha</label>
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
        <div className="field">
          <label htmlFor="confirm">Confirmar senha</label>
          <input
            id="confirm"
            type="password"
            className="input"
            autoComplete="new-password"
            required
            minLength={6}
            value={confirm}
            onChange={(e) => setConfirm(e.target.value)}
            placeholder="Repita a senha"
          />
        </div>

        {error && (
          <p className="form-error" role="alert">
            {error}
          </p>
        )}

        <button type="submit" className="btn btn-primary btn-block" disabled={submitting}>
          {submitting && <Loader2 size={17} className="spin" aria-hidden="true" />}
          {submitting ? 'Salvando…' : 'Salvar nova senha'}
        </button>
      </form>
    </AuthLayout>
  )
}
