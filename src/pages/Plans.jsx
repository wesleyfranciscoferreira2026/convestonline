import { Link } from 'react-router-dom'
import { ArrowLeft, Check, Crown, Sparkles, Star, Zap } from 'lucide-react'
import { Card } from '../components/ui'

const PLANS = [
  {
    id: 'basic',
    name: 'Básico',
    price: '29,90',
    period: '/mês',
    description: 'Para quem está começando a organizar os estudos.',
    features: [
      'Acesso a todas as matérias e aulas',
      'Exercícios de múltipla escolha',
      'Revisão de estatísticas: 1 por dia',
      'Convest IA (tutor) — perguntas diárias',
      'Planejamento de estudos e metas',
      'Estatísticas básicas',
      'Favoritos e histórico',
      'Modo claro e escuro',
    ],
    cta: 'Começar com o Básico',
    highlight: false,
  },
  {
    id: 'pro',
    name: 'Pro',
    price: '59,90',
    period: '/mês',
    description: 'Para quem quer evoluir com consistência e foco.',
    badge: 'Mais popular',
    features: [
      'Tudo do Básico, mais:',
      'Coleções de exercícios e simulados',
      'Revisão de estatísticas: até 5 por dia',
      'Gerador de questões por banca (IA) ilimitado',
      'Revisão inteligente com repetição espaçada',
      'Estatísticas detalhadas e comparativos',
      'Aulas com conteúdo premium',
      'Suporte prioritário por e-mail',
      'Sem anúncios',
    ],
    cta: 'Assinar o Pro',
    highlight: true,
  },
  {
    id: 'premium',
    name: 'Premium',
    price: '89,90',
    period: '/mês',
    description: 'Para quem quer o máximo de desempenho.',
    badge: 'Completo',
    features: [
      'Tudo do Pro, mais:',
      'Acesso a todos os conteúdos premium',
      'Simulados completos com cronômetro',
      'Revisão de estatísticas ilimitada',
      'Correção detalhada de redações (IA)',
      'Planos de estudo personalizados',
      'Mentoria e acompanhamento',
      'Recursos exclusivos de IA (resumos, flashcards)',
      'Acesso antecipado a novidades',
    ],
    cta: 'Assinar o Premium',
    highlight: false,
  },
]

const FAQ = [
  {
    q: 'Posso cancelar a qualquer momento?',
    a: 'Sim. O cancelamento é imediato e você mantém o acesso até o fim do período já pago. Sem multa, sem burocracia.',
  },
  {
    q: 'Os pagamentos são seguros?',
    a: 'Sim. Utilizamos provedores de pagamento certificados (PCI-DSS). Seus dados de cartão nunca são armazenados em nossos servidores.',
  },
  {
    q: 'Posso trocar de plano depois?',
    a: 'Sim. Você pode fazer upgrade ou downgrade a qualquer momento. A diferença é calculada proporcionalmente.',
  },
  {
    q: 'Existe período de teste?',
    a: 'Estamos preparando um período de teste gratuito para novos usuários. Cadastre-se para ser avisado do lançamento.',
  },
  {
    q: 'Quais formas de pagamento são aceitas?',
    a: 'Cartão de crédito, PIX e boleto bancário. Assinaturas são cobradas mensalmente.',
  },
]

export default function Plans() {
  return (
    <div className="page plans-page">
      <Link to="/" className="back-link">
        <ArrowLeft size={16} aria-hidden="true" /> Voltar ao início
      </Link>

      <header className="plans-hero">
        <span className="plans-hero-badge">
          <Sparkles size={14} aria-hidden="true" /> Planos Convest+
        </span>
        <h1>Escolha o plano ideal para seus estudos</h1>
        <p>
          Todos os planos incluem acesso à plataforma, exercícios e a Convest IA.
          Sem compromisso — cancele quando quiser.
        </p>
      </header>

      <div className="plans-grid">
        {PLANS.map((plan) => (
          <Card
            key={plan.id}
            className={`plan-card ${plan.highlight ? 'plan-card-highlight' : ''}`}
          >
            {plan.badge && <span className="plan-badge">{plan.badge}</span>}
            <div className="plan-header">
              <h3>{plan.name}</h3>
              <p className="plan-desc">{plan.description}</p>
            </div>
            <div className="plan-price">
              <span className="plan-currency">R$</span>
              <strong>{plan.price}</strong>
              <span className="plan-period">{plan.period}</span>
            </div>
            <button
              type="button"
              className={`btn ${plan.highlight ? 'btn-primary' : 'btn-outline'} btn-block`}
              onClick={() => alert('Pagamentos em fase de testes. Em breve!')}
            >
              {plan.highlight ? <Crown size={16} aria-hidden="true" /> : <Zap size={16} aria-hidden="true" />}
              {plan.cta}
            </button>
            <ul className="plan-features">
              {plan.features.map((f, i) => (
                <li key={i} className={f.startsWith('Tudo do') ? 'plan-feature-group' : ''}>
                  <Check size={16} aria-hidden="true" />
                  <span>{f}</span>
                </li>
              ))}
            </ul>
          </Card>
        ))}
      </div>

      <Card className="plans-note-card">
        <p className="plans-note">
          <Star size={16} aria-hidden="true" />
          <strong>Pagamentos em fase de preparação.</strong> A cobrança recorrente será ativada em breve
          com um provedor de pagamentos seguro. Cadastre-se para ser avisado do lançamento.
        </p>
      </Card>

      <section className="plans-faq">
        <h2>Perguntas frequentes</h2>
        <div className="faq-list">
          {FAQ.map((item, i) => (
            <details key={i} className="faq-item">
              <summary>{item.q}</summary>
              <p>{item.a}</p>
            </details>
          ))}
        </div>
      </section>
    </div>
  )
}
