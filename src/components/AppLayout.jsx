import { useEffect, useRef, useState } from 'react'
import { NavLink, Outlet, useNavigate } from 'react-router-dom'
import {
  BarChart3,
  Bell,
  BookOpen,
  ClipboardList,
  Compass,
  GraduationCap,
  Home,
  LogOut,
  Menu,
  RotateCcw,
  Search,
  Settings,
  Shield,
  Sparkles,
  X,
} from 'lucide-react'
import { useAuth } from '../lib/auth'
import { getGreeting, formatToday } from '../utils/date'
import { Avatar } from './ui'
import PageTransition from './PageTransition'

const NAV_ITEMS = [
  { to: '/', label: 'Início', icon: Home, end: true },
  { to: '/ia', label: 'Convest IA', icon: Sparkles },
  { to: '/explorar', label: 'Explorar', icon: Compass },
  { to: '/estudos', label: 'Meus estudos', icon: BookOpen },
  { to: '/exercicios', label: 'Exercícios', icon: ClipboardList },
  { to: '/provas', label: 'Provas', icon: GraduationCap },
  { to: '/revisao', label: 'Revisão', icon: RotateCcw },
  { to: '/estatisticas', label: 'Estatísticas', icon: BarChart3 },
  { to: '/perfil', label: 'Perfil', icon: Settings },
]

const BOTTOM_ITEMS = [
  { to: '/', label: 'Início', icon: Home, end: true },
  { to: '/ia', label: 'IA', icon: Sparkles },
  { to: '/explorar', label: 'Explorar', icon: Compass },
  { to: '/exercicios', label: 'Exercícios', icon: ClipboardList },
]

export default function AppLayout() {
  const { profile, user, isGuest, exitGuest, signOut } = useAuth()
  const navigate = useNavigate()
  const [menuOpen, setMenuOpen] = useState(false)
  const [profileOpen, setProfileOpen] = useState(false)
  const [notifOpen, setNotifOpen] = useState(false)
  const [query, setQuery] = useState('')
  const profileRef = useRef(null)
  const activeSecondsRef = useRef(0)
  const notifRef = useRef(null)

  const displayName = profile?.full_name || user?.user_metadata?.full_name || ''

  useEffect(() => {
    function onClickOutside(event) {
      if (profileRef.current && !profileRef.current.contains(event.target)) setProfileOpen(false)
      if (notifRef.current && !notifRef.current.contains(event.target)) setNotifOpen(false)
    }
    document.addEventListener('mousedown', onClickOutside)
    return () => document.removeEventListener('mousedown', onClickOutside)
  }, [])

  // Rastreia tempo ativo no site (aba visível e com foco) para as estatísticas.
  useEffect(() => {
    const TICK = 30
    const FLUSH = 5 * 60
    let acc = 0
    let lastFlush = 0
    const interval = window.setInterval(() => {
      if (document.visibilityState === 'visible' && document.hasFocus()) {
        acc += TICK
        if (acc - lastFlush >= FLUSH) {
          flushActive(acc - lastFlush)
          lastFlush = acc
        }
      }
    }, TICK * 1000)
    const flush = () => {
      const remaining = acc - lastFlush
      if (remaining > 0) flushActive(remaining)
    }
    const onVis = () => { if (document.visibilityState === 'hidden') flush() }
    document.addEventListener('visibilitychange', onVis)
    window.addEventListener('beforeunload', flush)
    return () => {
      clearInterval(interval)
      document.removeEventListener('visibilitychange', onVis)
      window.removeEventListener('beforeunload', flush)
      flush()
    }
  }, [])

  function flushActive(seconds) {
    const today = new Date().toISOString().slice(0, 10)
    let data = {}
    try { data = JSON.parse(localStorage.getItem('convest-active') || '{}') } catch { data = {} }
    data[today] = (data[today] || 0) + seconds
    try { localStorage.setItem('convest-active', JSON.stringify(data)) } catch { /* ignora */ }
  }

  function onSearchSubmit(event) {
    event.preventDefault()
    const q = query.trim()
    navigate(q ? `/explorar?q=${encodeURIComponent(q)}` : '/explorar')
  }

  async function onSignOut() {
    await signOut()
    navigate('/login', { replace: true })
  }

  return (
    <div className="app-shell">
      {/* ---------------- Sidebar (desktop) ---------------- */}
      <aside className="sidebar">
        <NavLink to="/" className="sidebar-logo" aria-label="Aura Study — Início">
          <span className="brand-mark">convest</span>
        </NavLink>
        <nav className="sidebar-nav" aria-label="Navegação principal">
          {NAV_ITEMS.map(({ to, label, icon: Icon, end }) => (
            <NavLink
              key={to}
              to={to}
              end={end}
              className={({ isActive }) => `nav-item ${isActive ? 'is-active' : ''}`}
            >
              <Icon size={19} aria-hidden="true" />
              <span>{label}</span>
            </NavLink>
          ))}
          {profile?.role === 'admin' && (
            <NavLink to="/admin" className={({ isActive }) => `nav-item ${isActive ? 'is-active' : ''}`}>
              <Shield size={19} aria-hidden="true" />
              <span>Admin</span>
            </NavLink>
          )}
        </nav>
        <div className="sidebar-footer">
          <p className="sidebar-goal-hint">Seu próximo nível começa com o que você aprende hoje.</p>
        </div>
      </aside>

      {/* ---------------- Conteúdo ---------------- */}
      <div className="app-main">
        <header className="topbar">
          <div className="topbar-greeting">
            <h1>{getGreeting(displayName)}</h1>
            <p>{formatToday()}</p>
          </div>

          <form className="topbar-search" role="search" onSubmit={onSearchSubmit}>
            <Search size={17} aria-hidden="true" />
            <input
              type="search"
              placeholder="Buscar matérias e conteúdos…"
              aria-label="Buscar matérias e conteúdos"
              value={query}
              onChange={(e) => setQuery(e.target.value)}
            />
          </form>

          <div className="topbar-actions">
            <div className="popover-wrap" ref={notifRef}>
              <button
                type="button"
                className="icon-btn"
                aria-label="Notificações"
                aria-expanded={notifOpen}
                onClick={() => setNotifOpen((v) => !v)}
              >
                <Bell size={19} />
              </button>
              {notifOpen && (
                <div className="popover" role="dialog" aria-label="Notificações">
                  <p className="popover-title">Notificações</p>
                  <p className="popover-empty">Você não tem notificações no momento.</p>
                </div>
              )}
            </div>

            {isGuest ? (
              <div className="guest-actions">
                <Link to="/login" className="btn btn-primary btn-sm">Entrar</Link>
                <button type="button" className="btn btn-ghost btn-sm" onClick={() => { exitGuest(); navigate('/login') }}>
                  Sair do modo visitante
                </button>
              </div>
            ) : (
              <div className="popover-wrap" ref={profileRef}>
                <button
                  type="button"
                  className="avatar-btn"
                  aria-label="Menu do perfil"
                  aria-expanded={profileOpen}
                  onClick={() => setProfileOpen((v) => !v)}
                >
                  <Avatar name={displayName} url={profile?.avatar_url} size={36} />
                </button>
                {profileOpen && (
                  <div className="popover popover-right" role="menu">
                    <div className="popover-user">
                      <strong>{displayName || 'Estudante'}</strong>
                      <span>{user?.email}</span>
                    </div>
                    <NavLink to="/perfil" role="menuitem" onClick={() => setProfileOpen(false)}>
                      <Settings size={16} aria-hidden="true" /> Perfil e configurações
                    </NavLink>
                    <button type="button" role="menuitem" onClick={onSignOut}>
                      <LogOut size={16} aria-hidden="true" /> Sair
                    </button>
                  </div>
                )}
              </div>
            )}
          </div>
        </header>

        {isGuest && (
          <div className="guest-banner">
            <span>Você está no modo visitante — seu progresso não será salvo.</span>
            <Link to="/login" className="guest-banner-link">Entrar ou criar conta</Link>
          </div>
        )}
        <main className="page-content">
          <PageTransition>
            <Outlet />
          </PageTransition>
        </main>
      </div>

      {/* ---------------- Navegação inferior (mobile) ---------------- */}
      <nav className="bottom-nav" aria-label="Navegação principal">
        {BOTTOM_ITEMS.map(({ to, label, icon: Icon, end }) => (
          <NavLink
            key={to}
            to={to}
            end={end}
            className={({ isActive }) => `bottom-item ${isActive ? 'is-active' : ''}`}
          >
            <Icon size={20} aria-hidden="true" />
            <span>{label}</span>
          </NavLink>
        ))}
        <button
          type="button"
          className={`bottom-item ${menuOpen ? 'is-active' : ''}`}
          aria-label="Abrir menu completo"
          aria-expanded={menuOpen}
          onClick={() => setMenuOpen(true)}
        >
          <Menu size={20} aria-hidden="true" />
          <span>Menu</span>
        </button>
      </nav>

      {/* ---------------- Sheet do menu (mobile) ---------------- */}
      {menuOpen && (
        <div className="sheet-overlay" onClick={() => setMenuOpen(false)}>
          <div
            className="sheet"
            role="dialog"
            aria-modal="true"
            aria-label="Menu"
            onClick={(e) => e.stopPropagation()}
          >
            <div className="sheet-header">
              <span className="brand-mark">convest</span>
              <button type="button" className="icon-btn" aria-label="Fechar menu" onClick={() => setMenuOpen(false)}>
                <X size={19} />
              </button>
            </div>
            <nav className="sheet-nav" aria-label="Menu completo">
              {NAV_ITEMS.map(({ to, label, icon: Icon, end }) => (
                <NavLink
                  key={to}
                  to={to}
                  end={end}
                  className={({ isActive }) => `nav-item ${isActive ? 'is-active' : ''}`}
                  onClick={() => setMenuOpen(false)}
                >
                  <Icon size={19} aria-hidden="true" />
                  <span>{label}</span>
                </NavLink>
              ))}
              <button type="button" className="nav-item nav-item-btn" onClick={onSignOut}>
                <LogOut size={19} aria-hidden="true" />
                <span>Sair</span>
              </button>
            </nav>
          </div>
        </div>
      )}
    </div>
  )
}
