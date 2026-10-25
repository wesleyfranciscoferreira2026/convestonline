const STORAGE_KEY = 'aura-theme'
const media = window.matchMedia('(prefers-color-scheme: dark)')

/** Aplica 'light' | 'dark' | 'system' no <html> e persiste a escolha. */
export function applyTheme(theme) {
  const resolved =
    theme === 'dark' || (theme === 'system' && media.matches) ? 'dark' : 'light'
  document.documentElement.dataset.theme = resolved
  try {
    localStorage.setItem(STORAGE_KEY, theme)
  } catch {
    // localStorage indisponível (modo privado etc.) — segue sem persistir
  }
}

// Se a escolha for "system", acompanha mudanças do tema do SO em tempo real.
media.addEventListener('change', () => {
  let stored = 'system'
  try {
    stored = localStorage.getItem(STORAGE_KEY) || 'system'
  } catch {
    // ignora
  }
  if (stored === 'system') applyTheme('system')
})
