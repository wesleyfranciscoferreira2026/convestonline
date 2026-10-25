/** Utilitários de data e formatação (pt-BR). */

export function getGreeting(fullName = '') {
  const hour = new Date().getHours()
  const period = hour < 6 ? 'Boa madrugada' : hour < 12 ? 'Bom dia' : hour < 18 ? 'Boa tarde' : 'Boa noite'
  const firstName = fullName.trim().split(' ')[0]
  return firstName ? `${period}, ${firstName}` : period
}

export function formatToday() {
  const text = new Intl.DateTimeFormat('pt-BR', {
    weekday: 'long',
    day: 'numeric',
    month: 'long',
  }).format(new Date())
  return text.charAt(0).toUpperCase() + text.slice(1)
}

/** '2026-10-25' — formato da coluna planned_date (date). */
export function toISODate(date = new Date()) {
  const y = date.getFullYear()
  const m = String(date.getMonth() + 1).padStart(2, '0')
  const d = String(date.getDate()).padStart(2, '0')
  return `${y}-${m}-${d}`
}

/** 90 → '1h 30min' · 45 → '45min' · 0 → '0min' */
export function minutesToHuman(minutes) {
  if (!minutes || minutes <= 0) return '0min'
  const h = Math.floor(minutes / 60)
  const m = minutes % 60
  if (h === 0) return `${m}min`
  if (m === 0) return `${h}h`
  return `${h}h ${m}min`
}

/**
 * Calcula a sequência atual de dias estudados a partir de uma lista de
 * timestamps (ISO strings) de sessões de estudo.
 */
export function computeStreak(timestamps) {
  const days = new Set(timestamps.map((t) => toISODate(new Date(t))))
  let streak = 0
  const cursor = new Date()
  // Se hoje ainda não tem sessão, a sequência pode começar em ontem.
  if (!days.has(toISODate(cursor))) cursor.setDate(cursor.getDate() - 1)
  while (days.has(toISODate(cursor))) {
    streak += 1
    cursor.setDate(cursor.getDate() - 1)
  }
  return streak
}

/** Rótulos dos últimos 7 dias para o gráfico semanal: [{ key, label, minutes }] */
export function buildWeekBuckets(sessions) {
  const buckets = []
  const today = new Date()
  for (let i = 6; i >= 0; i -= 1) {
    const day = new Date(today)
    day.setDate(today.getDate() - i)
    const key = toISODate(day)
    const label = new Intl.DateTimeFormat('pt-BR', { weekday: 'narrow' })
      .format(day)
      .toUpperCase()
    buckets.push({ key, label, minutes: 0, isToday: i === 0 })
  }
  const byKey = Object.fromEntries(buckets.map((b) => [b.key, b]))
  for (const s of sessions) {
    const key = toISODate(new Date(s.studied_at))
    if (byKey[key]) byKey[key].minutes += s.duration_minutes
  }
  return buckets
}
