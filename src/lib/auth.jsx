import { createContext, useCallback, useContext, useEffect, useState } from 'react'
import { supabase, isSupabaseConfigured } from './supabaseClient'
import { applyTheme, applyAccent } from './theme'
import { useToast } from '../components/Toast'

const AuthContext = createContext(null)

export function AuthProvider({ children }) {
  const [session, setSession] = useState(null)
  const [profile, setProfile] = useState(null)
  const [loading, setLoading] = useState(true)
  // True quando a URL contém tokens de confirmação/recuperação de e-mail.
  const [handlingAuth, setHandlingAuth] = useState(() => {
    if (typeof window === 'undefined') return false
    const hash = window.location.hash || ''
    const search = window.location.search || ''
    return hash.includes('access_token') || hash.includes('type=') || search.includes('code=') || search.includes('token_hash=')
  })
  const [isGuest, setIsGuest] = useState(() => {
    try { return localStorage.getItem('convest-guest') === '1' } catch { return false }
  })
  const toast = useToast()

  function continueAsGuest() {
    try { localStorage.setItem('convest-guest', '1') } catch { /* ignora */ }
    setIsGuest(true)
  }

  function exitGuest() {
    try { localStorage.removeItem('convest-guest') } catch { /* ignora */ }
    setIsGuest(false)
  }

  // Mensagem de boas-vindas quando o usuário confirma o e-mail (link do e-mail).
  function handleEmailConfirmation() {
    const hash = window.location.hash || ''
    if (hash.includes('type=signup') || hash.includes('type=email')) {
      toast('E-mail confirmado! Bem-vindo ao Convest+.')
      // Limpa o hash para não repetir a mensagem ao recarregar.
      if (window.history && window.history.replaceState) {
        window.history.replaceState(null, '', window.location.pathname + window.location.search)
      }
    }
  }

  const fetchProfile = useCallback(async (userId) => {
    const { data, error } = await supabase
      .from('profiles')
      .select('*')
      .eq('id', userId)
      .maybeSingle()
    if (error) console.error('Erro ao carregar perfil:', error.message)
    setProfile(data ?? null)
    // Não aplica o tema aqui — quem chama decide (evita sobrescrever uma escolha
    // feita pelo usuário com um valor defasado vindo do banco).
    return data
  }, [])

  useEffect(() => {
    if (!isSupabaseConfigured) {
      setLoading(false)
      return
    }

    let active = true
    async function establishSession() {
      // 1) Tenta detectar tokens no hash (fluxo implícito)
      const hash = window.location.hash || ''
      const search = window.location.search || ''
      const params = new URLSearchParams(search)
      const code = params.get('code')
      const tokenHash = params.get('token_hash')
      const type = params.get('type') || (hash.includes('type=') ? new URLSearchParams(hash.slice(1)).get('type') : null)

      // 2) Se tem code (PKCE), troca explicitamente
      if (code) {
        const { data, error } = await supabase.auth.exchangeCodeForSession(code)
        if (error) {
          console.error('exchangeCodeForSession error:', error.message)
          if (active) toast('O link de confirmação é inválido ou expirou. Solicite um novo.', 'error')
          return null
        }
        return data.session
      }

      // 3) Se tem token_hash (fluxo de verificação de e-mail)
      if (tokenHash && type) {
        const { data, error } = await supabase.auth.verifyOtp({ token_hash: tokenHash, type: type })
        if (error) {
          console.error('verifyOtp error:', error.message)
          if (active) toast('O link de confirmação é inválido ou expirou. Solicite um novo.', 'error')
          return null
        }
        return data.session
      }

      // 4) Fluxo implícito (tokens no hash) — getSession detecta automaticamente
      const { data } = await supabase.auth.getSession()
      return data.session
    }

    establishSession().then(async (session) => {
      if (!active) return
      setSession(session)
      if (session?.user) {
        try { localStorage.removeItem('convest-guest') } catch { /* ignora */ }
        setIsGuest(false)
        const p = await fetchProfile(session.user.id)
        applyTheme(p?.theme ?? 'system')
        applyAccent(p?.accent ?? 'turquoise')
        handleEmailConfirmation()
        // Limpa a URL (remove tokens)
        if (window.history && window.history.replaceState) {
          window.history.replaceState(null, '', window.location.pathname)
        }
      } else if (handlingAuth) {
        toast('O link de confirmação é inválido ou expirou. Solicite um novo.', 'error')
      }
      if (active) { setLoading(false); setHandlingAuth(false) }
    })

    const {
      data: { subscription },
    } = supabase.auth.onAuthStateChange((event, nextSession) => {
      setSession(nextSession)
      if (nextSession?.user) {
        // Login real cancela o modo visitante.
        try { localStorage.removeItem('convest-guest') } catch { /* ignora */ }
        setIsGuest(false)
        setHandlingAuth(false)
        // setTimeout evita deadlock do onAuthStateChange com chamadas ao Supabase
        setTimeout(async () => {
          const p = await fetchProfile(nextSession.user.id)
          applyTheme(p?.theme ?? 'system')
          applyAccent(p?.accent ?? 'turquoise')
          if (event === 'SIGNED_IN') handleEmailConfirmation()
        }, 0)
      } else {
        setProfile(null)
        applyTheme('system')
      }
    })

    return () => {
      active = false
      subscription.unsubscribe()
    }
  }, [fetchProfile])

  const signIn = useCallback(
    (email, password) => supabase.auth.signInWithPassword({ email, password }),
    [],
  )

  const signUp = useCallback(
    (name, email, password) =>
      supabase.auth.signUp({
        email,
        password,
        options: {
          data: { full_name: name },
          emailRedirectTo: `${window.location.origin}${import.meta.env.BASE_URL}`,
        },
      }),
    [],
  )

  const resetPassword = useCallback(
    (email) =>
      supabase.auth.resetPasswordForEmail(email, {
        redirectTo: `${window.location.origin}${import.meta.env.BASE_URL}redefinir-senha`,
      }),
    [],
  )

  const signOut = useCallback(() => supabase.auth.signOut(), [])

  const refreshProfile = useCallback(async () => {
    if (session?.user) await fetchProfile(session.user.id)
  }, [session, fetchProfile])

  const value = {
    session,
    user: session?.user ?? null,
    profile,
    loading,
    configured: isSupabaseConfigured,
    handlingAuth,
    isGuest,
    continueAsGuest,
    exitGuest,
    signIn,
    signUp,
    resetPassword,
    signOut,
    refreshProfile,
  }

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>
}

export function useAuth() {
  const ctx = useContext(AuthContext)
  if (!ctx) throw new Error('useAuth deve ser usado dentro de <AuthProvider>')
  return ctx
}
