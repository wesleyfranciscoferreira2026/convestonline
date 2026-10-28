// Limites por plano do Convest+.
//
// Revisoes de estatisticas por dia (relatorio pessoal com IA):
//   free    -> 1 por dia
//   basic   -> ate 5 por dia
//   pro     -> ate 10 por dia
//   premium -> ilimitado
export const PLAN_LIMITS = {
  free: { statsReviewsPerDay: 1, label: 'Gratuito', name: 'Gratuito' },
  basic: { statsReviewsPerDay: 5, label: 'Basico', name: 'Basico' },
  pro: { statsReviewsPerDay: 10, label: 'Pro', name: 'Pro' },
  premium: { statsReviewsPerDay: Infinity, label: 'Premium', name: 'Premium' },
}

export const DEFAULT_PLAN = 'free'

/** Limite diario de revisoes de estatisticas do plano. */
export function statsReviewsLimit(plan) {
  return PLAN_LIMITS[plan]?.statsReviewsPerDay ?? PLAN_LIMITS[DEFAULT_PLAN].statsReviewsPerDay
}

/** Nome amigavel do plano. */
export function planName(plan) {
  return PLAN_LIMITS[plan]?.name ?? PLAN_LIMITS[DEFAULT_PLAN].name
}

/**
 * Texto que explica o limite atual para o aluno.
 * @param {string} plan plano do aluno
 * @param {number} used revisoes ja feitas hoje
 */
export function statsLimitMessage(plan, used) {
  const limit = statsReviewsLimit(plan)
  if (limit === Infinity) {
    return `Plano ${planName(plan)}: revisoes de estatisticas ilimitadas.`
  }
  const remaining = Math.max(0, limit - used)
  if (remaining > 0) {
    return `Voce ainda pode fazer ${remaining} revisao${remaining === 1 ? '' : 'es'} de estatisticas hoje (limite: ${limit} por dia no plano ${planName(plan)}).`
  }
  return `Limite diario de ${limit} revisao${limit === 1 ? '' : 'es'} atingido no plano ${planName(plan)}. Assine um plano para aumentar.`
}

/** Plano necessario para mais revisoes hoje. */
export function suggestedPlan(plan) {
  const order = ['free', 'basic', 'pro', 'premium']
  const index = order.indexOf(plan)
  return order[Math.min(index + 1, order.length - 1)] || 'basic'
}
