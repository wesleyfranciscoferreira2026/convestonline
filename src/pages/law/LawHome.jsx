import { useState } from 'react'
import { Link } from 'react-router-dom'
import {
  ArrowRight,
  BookOpen,
  Briefcase,
  FileText,
  Gavel,
  Globe2,
  Landmark,
  Lock,
  Scale,
  Sparkles,
  Target,
  Users,
} from 'lucide-react'
import { Card, SectionHeader } from '../../components/ui'
import LawQuestions from './LawQuestions'

const LAW_SUBJECTS = [
  { slug: 'direito-administrativo', name: 'Direito Administrativo', icon: Briefcase, desc: 'Administracao publica, atos e servicos publicos.' },
  { slug: 'direito-ambiental', name: 'Direito Ambiental', icon: Sparkles, desc: 'Protecao ambiental e responsabilidade por danos.' },
  { slug: 'direito-civil', name: 'Direito Civil', icon: BookOpen, desc: 'Pessoas, obrigacoes, contratos e responsabilidade.' },
  { slug: 'direito-constitucional', name: 'Direito Constitucional', icon: Scale, desc: 'Constituicao, direitos fundamentais e Estado.' },
  { slug: 'direito-do-consumidor', name: 'Direito do Consumidor', icon: Target, desc: 'Relacoes de consumo e protecao do consumidor.' },
  { slug: 'direito-eleitoral', name: 'Direito Eleitoral', icon: Landmark, desc: 'Processo eleitoral, partidos e propaganda.' },
  { slug: 'direito-empresarial', name: 'Direito Empresarial e Comercial', icon: Briefcase, desc: 'Empresa, titulos de credito e falencia.' },
  { slug: 'direito-financeiro-e-economico', name: 'Direito Financeiro e Economico', icon: Landmark, desc: 'Financas publicas, orcamento e ordem economica.' },
  { slug: 'direito-do-trabalho', name: 'Direito do Trabalho', icon: Briefcase, desc: 'Relacoes de trabalho e direitos trabalhistas.' },
  { slug: 'direito-internacional', name: 'Direito Internacional', icon: Globe2, desc: 'Relacoes internacionais e conflitos de leis.' },
  { slug: 'direito-penal', name: 'Direito Penal', icon: Gavel, desc: 'Teoria do crime, penas e principios penais.' },
  { slug: 'direito-previdenciario', name: 'Direito Previdenciario', icon: Users, desc: 'Beneficios previdenciarios e seguridade social.' },
  { slug: 'processo-civil', name: 'Processo Civil', icon: FileText, desc: 'Jurisdicao, procedimento e tutela de direitos.' },
  { slug: 'processo-penal', name: 'Processo Penal', icon: Gavel, desc: 'Investigacao, acao penal e garantias processuais.' },
  { slug: 'direito-tributario', name: 'Direito Tributario', icon: FileText, desc: 'Tributos, competencia e obrigacoes tributarias.' },
  { slug: 'direitos-difusos-coletivos', name: 'Direitos Difusos e Coletivos', icon: Users, desc: 'Tutela coletiva de interesses difusos.' },
  { slug: 'direitos-humanos', name: 'Direitos Humanos', icon: Scale, desc: 'Direitos fundamentais e sistemas de protecao.' },
  { slug: 'estatuto-crianca-adolescente', name: 'Estatuto da Crianca e do Adolescente', icon: Users, desc: 'Protecao integral da crianca e do adolescente.' },
  { slug: 'etica-legislacao-profissional', name: 'Etica e Legislacao Profissional', icon: Scale, desc: 'Etica profissional e estatuto da OAB.' },
]

const CONCURSOS = [
  { name: 'Polícia Federal (PF)', desc: 'Agente, Escrivão e Delegado — provas com Direito Constitucional e Penal', area: 'Policial' },
  { name: 'Polícia Civil (PC)', desc: 'Inspetor, Investigador, Delegado — direito é matéria-chave', area: 'Policial' },
  { name: 'Polícia Militar (PM-RJ e outros)', desc: 'Soldado e Oficial — prova específica de direito', area: 'Policial' },
  { name: 'Guarda Municipal', desc: 'Provas de direito constitucional e penal', area: 'Policial' },
  { name: 'Tribunal de Justiça (TJ)', desc: 'Analista e Técnico — direito é essencial', area: 'Judiciário' },
  { name: 'Ministério Público (MP)', desc: 'Promotor e Analista — alto nível de direito', area: 'Judiciário' },
  { name: 'Defensoria Pública', desc: 'Defensor e Analista — foco em direitos fundamentais', area: 'Judiciário' },
  { name: 'OAB (Exame de Ordem)', desc: '1ª e 2ª fase — direito constitucional e penal', area: 'Jurídico' },
  { name: 'TRT / TRF / TRE', desc: 'Técnico e Analista Judiciário', area: 'Judiciário' },
  { name: 'Receita Federal', desc: 'Auditor e Analista — direito tributário e constitucional', area: 'Fiscal' },
]

export default function LawHome() {
  const [section, setSection] = useState('conceitos')

  return (
    <div className="law-page">
      <header className="law-hero">
        <div className="law-hero-text">
          <span className="law-hero-badge">
            <Scale size={14} aria-hidden="true" /> Área de Direito
          </span>
          <h1>Sou estudante de Direito</h1>
          <p>
            Estude por disciplina e pratique questões autorais organizadas por banca e perfil de concurso.
          </p>
        </div>
      </header>

      <div className="law-tabs">
        <button type="button" className={`law-tab ${section === 'conceitos' ? 'is-active' : ''}`} onClick={() => setSection('conceitos')}>
          <BookOpen size={16} aria-hidden="true" /> Conceitos
        </button>
        <button type="button" className={`law-tab ${section === 'questoes' ? 'is-active' : ''}`} onClick={() => setSection('questoes')}>
          <Target size={16} aria-hidden="true" /> Questões
        </button>
        <button type="button" className={`law-tab ${section === 'apostilas' ? 'is-active' : ''}`} onClick={() => setSection('apostilas')}>
          <FileText size={16} aria-hidden="true" /> Apostilas
        </button>
        <button type="button" className={`law-tab ${section === 'concursos' ? 'is-active' : ''}`} onClick={() => setSection('concursos')}>
          <Briefcase size={16} aria-hidden="true" /> Concursos
        </button>
      </div>

      {/* ---------- Conceitos ---------- */}
      {section === 'conceitos' && (
        <div className="law-section">
          <div className="subject-grid subject-grid-lg">
            {LAW_SUBJECTS.map((s) => (
              <Link key={s.slug} to={`/materia/${s.slug}`} className="subject-card-link">
                <Card className="subject-card-lg" as="article">
                  <span className="subject-icon">
                    <s.icon size={22} aria-hidden="true" />
                  </span>
                  <h3>{s.name}</h3>
                  <p>{s.desc}</p>
                  <span className="subject-badge">
                    Ver conceitos <ArrowRight size={12} aria-hidden="true" />
                  </span>
                </Card>
              </Link>
            ))}
          </div>
          <Card>
            <p className="settings-note">
              As questões disponíveis nesta área são autorais e identificadas como questões de treino — não são questões oficiais de concursos ou bancas.
            </p>
          </Card>
        </div>
      )}

      {/* ---------- Questões ---------- */}
      {section === 'questoes' && (
        <div className="law-section">
          <LawQuestions />
        </div>
      )}

      {/* ---------- Apostilas (pago) ---------- */}
      {section === 'apostilas' && (
        <div className="law-section">
          <Card className="law-paid-card">
            <div className="law-paid-header">
              <Lock size={24} aria-hidden="true" />
              <div>
                <h3>Apostilas de Direito — Conteúdo Premium</h3>
                <p>Material de estudo aprofundado para Direito Constitucional e Direito Penal.</p>
              </div>
            </div>
            <div className="law-paid-grid">
              <div className="law-paid-item">
                <FileText size={20} aria-hidden="true" />
                <div>
                  <strong>Apostila de Direito Constitucional</strong>
                  <span>Princípios, direitos fundamentais, organização do Estado, controle de constitucionalidade, poderes.</span>
                </div>
                <span className="law-paid-badge">Em breve</span>
              </div>
              <div className="law-paid-item">
                <FileText size={20} aria-hidden="true" />
                <div>
                  <strong>Apostila de Direito Penal</strong>
                  <span>Teoria do crime, tipicidade, ilicitude, culpabilidade, penas, excludentes.</span>
                </div>
                <span className="law-paid-badge">Em breve</span>
              </div>
            </div>
            <p className="settings-note" style={{ marginTop: 12 }}>
              As apostilas serão disponibilizadas como conteúdo premium. Cadastre-se para ser avisado do lançamento.
            </p>
            <Link to="/planos" className="btn btn-primary" style={{ marginTop: 8 }}>
              Ver planos
            </Link>
          </Card>
        </div>
      )}

      {/* ---------- Concursos ---------- */}
      {section === 'concursos' && (
        <div className="law-section">
          <Card>
            <SectionHeader title="Concursos que exigem Direito" subtitle="Provas de concursos públicos que cobram Direito Constitucional e Penal" />
            <div className="concurso-list">
              {CONCURSOS.map((c) => (
                <div key={c.name} className="concurso-item">
                  <div className="concurso-info">
                    <strong>{c.name}</strong>
                    <span>{c.desc}</span>
                  </div>
                  <span className="concurso-area">{c.area}</span>
                </div>
              ))}
            </div>
          </Card>
        </div>
      )}
    </div>
  )
}
