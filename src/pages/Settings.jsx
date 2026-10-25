import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { Loader2, LogOut, Moon, Sun, SunMoon } from 'lucide-react'
import { supabase } from '../lib/supabaseClient'
import { useAuth } from '../lib/auth'
import { useToast } from '../components/Toast'
import { applyTheme } from '../lib/theme'
import { Avatar, Card, SectionHeader, Toggle } from '../components/ui'

const THEME_OPTIONS = [
  { value: 'light', label: 'Claro', icon: Sun },
  { value: 'dark', label: 'Escuro', icon: Moon },
  { value: 'system', label: 'Automático', icon: SunMoon },
]

export default function Settings() {
  const { user, profile, refreshProfile, signOut } = useAuth()
  const toast = useToast()
  const navigate = useNavigate()

  const [name, setName] = useState('')
  const [dailyGoal, setDailyGoal] = useState(60)
  const [theme, setTheme] = useState('system')
  const [notify, setNotify] = useState(true)
  const [savingProfile, setSavingProfile] = useState(false)
  const [savingPrefs, setSavingPrefs] = useState(false)

  useEffect(() => {
    if (profile) {
      setName(profile.full_name ?? '')
      setDailyGoal(profile.daily_goal_minutes ?? 60)
      setTheme(profile.theme ?? 'system')
      setNotify(profile.notify_updates ?? true)
    }
  }, [profile])

  async function saveProfile(event) {
    event.preventDefault()
    setSavingProfile(true)
    const { error } = await supabase
      .from('profiles')
      .update({ full_name: name.trim() })
      .eq('id', user.id)
    setSavingProfile(false)
    if (error) {
      toast('Não foi possível salvar seu perfil.', 'error')
      return
    }
    await refreshProfile()
    toast('Perfil atualizado.')
  }

  async function savePreferences(patch) {
    setSavingPrefs(true)
    const { error } = await supabase.from('profiles').update(patch).eq('id', user.id)
    setSavingPrefs(false)
    if (error) {
      toast('Não foi possível salvar as preferências.', 'error')
      return
    }
    await refreshProfile()
  }

  function onChangeTheme(next) {
    setTheme(next)
    applyTheme(next)
    // Atualiza o perfil local de forma otimista para a UI não voltar ao valor antigo.
    savePreferences({ theme: next })
  }

  function onChangeGoal(event) {
    const value = Number(event.target.value)
    setDailyGoal(value)
    savePreferences({ daily_goal_minutes: value })
  }

  function onChangeNotify(next) {
    setNotify(next)
    savePreferences({ notify_updates: next })
  }

  async function onSignOut() {
    await signOut()
    navigate('/login', { replace: true })
  }

  const displayName = profile?.full_name || user?.user_metadata?.full_name || ''

  return (
    <div className="page page-narrow">
      <header className="page-header">
        <h2>Perfil e configurações</h2>
        <p>Gerencie sua conta e personalize sua experiência de estudo.</p>
      </header>

      {/* ---------- Conta ---------- */}
      <Card>
        <SectionHeader title="Sua conta" />
        <div className="settings-account">
          <Avatar name={displayName} url={profile?.avatar_url} size={56} />
          <div>
            <strong>{displayName || 'Estudante'}</strong>
            <span>{user?.email}</span>
          </div>
        </div>
        <form className="form" onSubmit={saveProfile}>
          <div className="field">
            <label htmlFor="full-name">Nome completo</label>
            <input
              id="full-name"
              type="text"
              className="input"
              required
              value={name}
              onChange={(e) => setName(e.target.value)}
            />
          </div>
          <button type="submit" className="btn btn-primary" disabled={savingProfile}>
            {savingProfile && <Loader2 size={16} className="spin" aria-hidden="true" />}
            Salvar perfil
          </button>
        </form>
      </Card>

      {/* ---------- Preferências de estudo ---------- */}
      <Card>
        <SectionHeader
          title="Preferências de estudo"
          subtitle="Elas são salvas automaticamente e permanecem quando você sair e entrar de novo."
        />
        <div className="field">
          <label htmlFor="daily-goal">Meta diária de estudo</label>
          <div className="goal-row">
            <input
              id="daily-goal"
              type="range"
              min={15}
              max={240}
              step={15}
              value={dailyGoal}
              onChange={(e) => setDailyGoal(Number(e.target.value))}
              onMouseUp={onChangeGoal}
              onTouchEnd={onChangeGoal}
              onKeyUp={onChangeGoal}
              aria-valuetext={`${dailyGoal} minutos por dia`}
            />
            <output htmlFor="daily-goal" className="goal-value">
              {dailyGoal}min
            </output>
          </div>
        </div>

        <div className="field">
          <span className="field-label" id="theme-label">
            Tema
          </span>
          <div className="segmented" role="radiogroup" aria-labelledby="theme-label">
            {THEME_OPTIONS.map(({ value, label, icon: Icon }) => (
              <button
                key={value}
                type="button"
                role="radio"
                aria-checked={theme === value}
                className={`segment ${theme === value ? 'is-active' : ''}`}
                onClick={() => onChangeTheme(value)}
                disabled={savingPrefs}
              >
                <Icon size={16} aria-hidden="true" />
                {label}
              </button>
            ))}
          </div>
        </div>

        <div className="setting-row">
          <div>
            <strong>Novidades do Convest+</strong>
            <p>Receber avisos sobre novos conteúdos e melhorias da plataforma.</p>
          </div>
          <Toggle checked={notify} onChange={onChangeNotify} label="Novidades do Convest+" id="notify" />
        </div>
      </Card>

      {/* ---------- Sessão ---------- */}
      <Card>
        <SectionHeader title="Sessão" />
        <button type="button" className="btn btn-outline" onClick={onSignOut}>
          <LogOut size={16} aria-hidden="true" /> Sair da conta
        </button>
        <p className="settings-note">
          Exportação e exclusão de dados estarão disponíveis em breve, conforme os
          requisitos legais aplicáveis (LGPD).
        </p>
      </Card>
    </div>
  )
}
