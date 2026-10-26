const THEME_KEY = 'convest-theme'
const LEGACY_THEME_KEY = 'aura-theme'
const ACCENT_KEY = 'convest-accent'

export const ACCENT_PRESETS = {
  turquoise: { name: 'Turquesa', primary: '#66cccc', dark: '#54afac' },
  pink: { name: 'Rosa', primary: '#ec4899', dark: '#db2777' },
  yellow: { name: 'Amarelo', primary: '#eab308', dark: '#ca8a04' },
  orange: { name: 'Laranja', primary: '#f97316', dark: '#ea580c' },
  purple: { name: 'Roxo', primary: '#8b5cf6', dark: '#7c3aed' },
  blue: { name: 'Azul', primary: '#3b82f6', dark: '#2563eb' },
  green: { name: 'Verde', primary: '#22c55e', dark: '#16a34a' },
  red: { name: 'Vermelho', primary: '#ef4444', dark: '#dc2626' },
}

/** Aplica 'light' | 'dark' | 'system' no <html> e persiste a escolha. */
export function applyTheme(theme) {
  const media = window.matchMedia('(prefers-color-scheme: dark)')
  const resolved =
    theme === 'dark' || (theme === 'system' && media.matches) ? 'dark' : 'light'
  document.documentElement.dataset.theme = resolved
  try {
    localStorage.setItem(THEME_KEY, theme)
  } catch {
    // localStorage indisponível (modo privado etc.) — segue sem persistir
  }
}

/** Aplica a cor de destaque no <html> e persiste a escolha. */
export function applyAccent(accent) {
  const preset = ACCENT_PRESETS[accent] || ACCENT_PRESETS.turquoise
  const root = document.documentElement
  root.style.setProperty('--color-primary', preset.primary)
  root.style.setProperty('--color-primary-dark', preset.dark)
  try {
    localStorage.setItem(ACCENT_KEY, accent)
  } catch {
    // ignora
  }
}

export function getStoredAccent() {
  try {
    return localStorage.getItem(ACCENT_KEY) || 'turquoise'
  } catch {
    return 'turquoise'
  }
}

export function getStoredTheme() {
  try {
    return localStorage.getItem(THEME_KEY) || localStorage.getItem(LEGACY_THEME_KEY) || 'system'
  } catch {
    return 'system'
  }
}

const media = window.matchMedia('(prefers-color-scheme: dark)')

// Se a escolha for "system", acompanha mudanças do tema do SO em tempo real.
media.addEventListener('change', () => {
  let stored = 'system'
  try {
    stored = localStorage.getItem(THEME_KEY) || localStorage.getItem(LEGACY_THEME_KEY) || 'system'
  } catch {
    // ignora
  }
  if (stored === 'system') applyTheme('system')
})
