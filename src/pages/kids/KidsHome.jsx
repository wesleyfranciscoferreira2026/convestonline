import { Link } from 'react-router-dom'
import { BookOpen, Sparkles, Star, Trophy } from 'lucide-react'
import { Card, EmptyState } from '../../components/ui'

const KIDS_SUBJECTS = [
  { slug: 'portugues', name: 'Português', emoji: '📖', desc: 'Leitura, escrita e gramática', color: '#ec4899' },
  { slug: 'matematica', name: 'Matemática', emoji: '🔢', desc: 'Números, operações e geometria', color: '#f97316' },
  { slug: 'ciencias', name: 'Ciências', emoji: '🔬', desc: 'Natureza, corpo humano e plantas', color: '#22c55e' },
  { slug: 'historia', name: 'História', emoji: '🏰', desc: 'Brasil e nossa comunidade', color: '#8b5cf6' },
  { slug: 'geografia', name: 'Geografia', emoji: '🌍', desc: 'Mapas, natureza e lugares', color: '#3b82f6' },
  { slug: 'ingles', name: 'Inglês', emoji: '🗣️', desc: 'Vocabulário e conversação básica', color: '#eab308' },
]

const GRADES = [
  { label: '1º ao 5º ano', desc: 'Ensino Fundamental I' },
  { label: '6º ao 9º ano', desc: 'Ensino Fundamental II' },
]

export default function KidsHome() {
  return (
    <div className="kids-page">
      <section className="kids-hero">
        <div className="kids-hero-text">
          <span className="kids-hero-badge">
            <Sparkles size={14} aria-hidden="true" /> Reforço escolar
          </span>
          <h1>Olá, pequeno estudante! 👋</h1>
          <p>Aqui você aprende brincando. Escolha uma matéria e comece sua aventura!</p>
        </div>
        <div className="kids-hero-mascot" aria-hidden="true">🦊</div>
      </section>

      <section className="kids-section">
        <h2>Escolha sua matéria</h2>
        <div className="kids-subject-grid">
          {KIDS_SUBJECTS.map((s) => (
            <Link key={s.slug} to={`/kids/materia/${s.slug}`} className="kids-subject-card" style={{ '--kid-color': s.color }}>
              <span className="kids-subject-emoji">{s.emoji}</span>
              <strong>{s.name}</strong>
              <span>{s.desc}</span>
            </Link>
          ))}
        </div>
      </section>

      <section className="kids-section">
        <h2>Níveis de ensino</h2>
        <div className="kids-grades">
          {GRADES.map((g) => (
            <Card key={g.label} className="kids-grade-card">
              <Star size={20} aria-hidden="true" />
              <div>
                <strong>{g.label}</strong>
                <span>{g.desc}</span>
              </div>
            </Card>
          ))}
        </div>
      </section>

      <section className="kids-section">
        <Card className="kids-info-card">
          <Trophy size={24} aria-hidden="true" />
          <div>
            <h3>Pratique com exercícios!</h3>
            <p>Teste seus conhecimentos com questões adaptadas para cada nível de ensino.</p>
            <Link to="/kids/exercicios" className="btn btn-primary" style={{ marginTop: 12 }}>
              Começar exercícios
            </Link>
          </div>
        </Card>
      </section>
    </div>
  )
}
