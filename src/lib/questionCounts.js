// Opcoes de quantidade de questoes oferecidas nos seletores.
// Ate 50 questoes o aluno usa o plano atual.
// Acima de 50, o recurso e exclusivo do plano basico (rotulo no proprio campo).
export const FREE_QUESTION_LIMIT = 50

export const QUESTION_COUNT_OPTIONS = [
  { value: 10, label: '10 questoes' },
  { value: 20, label: '20 questoes' },
  { value: 30, label: '30 questoes' },
  { value: 40, label: '40 questoes' },
  { value: 50, label: '50 questoes' },
  { value: 60, label: '60 questoes', premium: true },
  { value: 70, label: '70 questoes', premium: true },
  { value: 80, label: '80 questoes', premium: true },
  { value: 90, label: '90 questoes', premium: true },
  { value: 100, label: '100 questoes', premium: true },
]

export const PREMIUM_COUNT_HINT = 'obtenha com plano basico'

/** Rotulo exibido no <option>, com aviso para as faixas acima do plano atual. */
export function questionCountLabel(option) {
  return option.premium ? `${option.label} - ${PREMIUM_COUNT_HINT}` : option.label
}

/** Mensagem exibida quando o aluno escolhe uma quantidade premium. */
export function premiumCountMessage(count) {
  if (count <= FREE_QUESTION_LIMIT) return ''
  return `Acima de ${FREE_QUESTION_LIMIT} questoes o recurso e do plano basico.`
}
