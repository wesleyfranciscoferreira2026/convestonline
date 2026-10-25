import { createContext, useCallback, useContext, useEffect, useState } from 'react'
import { supabase, isSupabaseConfigured } from './supabaseClient'
import { applyTheme } from './theme'
import { useToast } from '../components/Toast'

const AuthContext = createContext(null)

export function AuthProvider({ children }) {
  const [session, setSession] = useState(null)
  const [profile, setProfile] = useState(null)
  const [loading, setLoading] = useState(true)
  const toast = useToast()

  // Mensagem de boas-vindas quando o usuário confirma o e-mail (link do e-mail).
  function handleEmailConfirmation() {
    const hash = window.location.hash || ''
    if (hash.includes('type=signup') || hash.includes('type=email')) {
      toast('E-mail confirmado! Bem-vindo ao Aura Study.')
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
    supabase.auth.getSession().then(async ({ data }) => {
      if (!active) return
      setSession(data.session)
      if (data.session?.user) {
        const p = await fetchProfile(data.session.user.id)
        applyTheme(p?.theme ?? 'system')
        handleEmailConfirmation()
      }
      if (active) setLoading(false)
    })

    const {
      data: { subscription },
    } = supabase.auth.onAuthStateChange((event, nextSession) => {
      setSession(nextSession)
      if (nextSession?.user) {
        // setTimeout evita deadlock do onAuthStateChange com chamadas ao Supabase
        setTimeout(async () => {
          const p = await fetchProfile(nextSession.user.id)
          applyTheme(p?.theme ?? 'system')
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
        options: { data: { full_name: name } },
      }),
    [],
  )

  const resetPassword = useCallback(
    (email) =>
      supabase.auth.resetPasswordForEmail(email, {
        redirectTo: `${window.location.origin}/redefinir-senha`,
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
