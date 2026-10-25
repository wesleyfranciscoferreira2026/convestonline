import { NavLink, Outlet } from 'react-router-dom'
import { BarChart3, BookOpen, ClipboardList, LogOut, Settings } from 'lucide-react'
import { useAuth } from '../../lib/auth'
import { Avatar } from '../../components/ui'

const ITEMS = [
  { to: '/admin', label: 'Visão geral', icon: BarChart3, end: true },
  { to: '/admin/aulas', label: 'Aulas', icon: BookOpen },
  { to: '/admin/questoes', label: 'Questões', icon: ClipboardList },
]

export default function AdminLayout() {
  const { profile, user, signOut } = useAuth()
  async function onSignOut() { await signOut() }

  return (
    <div className="app-shell admin-shell">
      <aside className="sidebar">
        <div className="sidebar-logo">
          <span className="brand-mark">convest</span>
          <span className="brand-sub">admin</span>
        </div>
        <nav className="sidebar-nav" aria-label="Navegação admin">
          {ITEMS.map(({ to, label, icon: Icon, end }) => (
            <NavLink key={to} to={to} end={end} className={({ isActive }) => `nav-item ${isActive ? 'is-active' : ''}`}>
              <Icon size={19} aria-hidden="true" />
              <span>{label}</span>
            </NavLink>
          ))}
          <NavLink to="/" className="nav-item">
            <ArrowBackIcon /> <span>Voltar ao site</span>
          </NavLink>
        </nav>
        <div className="sidebar-footer">
          <div style={{ display: 'flex', alignItems: 'center', gap: 10 }}>
            <Avatar name={profile?.full_name || ''} url={profile?.avatar_url} size={32} />
            <div>
              <strong style={{ fontSize: 13 }}>{profile?.full_name || 'Admin'}</strong>
              <p style={{ fontSize: 11, color: 'var(--color-text-secondary)' }}>{user?.email}</p>
            </div>
          </div>
          <button type="button" className="nav-item nav-item-btn" onClick={onSignOut} style={{ marginTop: 8 }}>
            <LogOut size={19} aria-hidden="true" /> <span>Sair</span>
          </button>
        </div>
      </aside>
      <div className="app-main">
        <main className="page-content">
          <Outlet />
        </main>
      </div>
    </div>
  )
}

function ArrowBackIcon() {
  return (
    <svg width="19" height="19" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">
      <line x1="19" y1="12" x2="5" y2="12" />
      <polyline points="12 19 5 12 12 5" />
    </svg>
  )
}
