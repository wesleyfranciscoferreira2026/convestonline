import { useState } from 'react'
import { Link } from 'react-router-dom'
import {
  ArrowRight,
  BookOpen,
  Briefcase,
  FileText,
  Gavel,
  Lock,
  Scale,
  Sparkles,
  Target,
} from 'lucide-react'
import { Card, EmptyState, SectionHeader } from '../../components/ui'

const LAW_SUBJECTS = [
  { slug: 'direito-constitucional', name: 'Direito Constitucional', icon: Scale, desc: 'Constituição, direitos fundamentais, organização do Estado.', color: '#1e40af' },
  { slug: 'direito-penal', name: 'Direito Penal', icon: Gavel, desc: 'Crime, tipicidade, culpabilidade e penas.', color: '#7c2d12' },
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
            Conceitos, questões, apostilas e concursos para quem estuda Direito.
            Foco em Direito Constitucional e Direito Penal.
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
                  <span className="subject-icon" style={{ background: s.color + '18', color: s.color }}>
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
              Os conceitos de Direito Constitucional e Direito Penal serão adicionados em breve.
              Enquanto isso, explore as matérias disponíveis e resolva questões.
            </p>
          </Card>
        </div>
      )}

      {/* ---------- Questões ---------- */}
      {section === 'questoes' && (
        <div className="law-section">
          <Card>
            <SectionHeader title="Questões de Direito" subtitle="Selecione a matéria, o tópico e o nível de dificuldade." />
            <p className="settings-note">
              Em breve: questões de Direito Constitucional e Penal organizadas por tópico
              (princípios fundamentais, direitos e garantias, controle de constitucionalidade,
              teoria do crime, dolo e culpa, penas, excludentes de ilicitude, etc.)
              com 3 níveis de dificuldade (fácil, médio, difícil).
            </p>
            <Link to="/exercicios" className="btn btn-primary" style={{ marginTop: 12 }}>
              Ir para exercícios gerais
            </Link>
          </Card>
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
