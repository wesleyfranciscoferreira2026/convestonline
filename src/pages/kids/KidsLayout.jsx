import { NavLink, Outlet, useNavigate } from 'react-router-dom'
import { ArrowLeft, BookOpen, Home, LogOut, Sparkles } from 'lucide-react'
import { useAuth } from '../../lib/auth'
import { Avatar } from '../../components/ui'

const KIDS_NAV = [
  { to: '/kids', label: 'Início', icon: Home, end: true },
  { to: '/kids/materias', label: 'Matérias', icon: BookOpen },
]

export default function KidsLayout() {
  const { profile, user, signOut } = useAuth()
  const navigate = useNavigate()
  const displayName = profile?.full_name || user?.user_metadata?.full_name || ''

  async function onSignOut() {
    await signOut()
    navigate('/login', { replace: true })
  }

  return (
    <div className="kids-shell" data-kids="true">
      <header className="kids-topbar">
        <NavLink to="/kids" className="kids-logo" aria-label="Convest+ Kids">
          <span className="brand-mark kids-brand">convest+</span>
          <span className="kids-badge">KIDS</span>
        </NavLink>
        <nav className="kids-nav" aria-label="Navegação Kids">
          {KIDS_NAV.map(({ to, label, icon: Icon, end }) => (
            <NavLink key={to} to={to} end={end} className={({ isActive }) => `kids-nav-item ${isActive ? 'is-active' : ''}`}>
              <Icon size={18} aria-hidden="true" />
              <span>{label}</span>
            </NavLink>
          ))}
        </nav>
        <div className="kids-topbar-actions">
          <NavLink to="/" className="kids-back-link" aria-label="Voltar ao início">
            <ArrowLeft size={16} aria-hidden="true" /> Voltar ao início
          </NavLink>
          {user && (
            <button type="button" className="kids-avatar-btn" onClick={onSignOut} aria-label="Sair">
              <Avatar name={displayName} url={profile?.avatar_url} size={32} />
            </button>
          )}
        </div>
      </header>
      <main className="kids-content">
        <Outlet />
      </main>
    </div>
  )
}
