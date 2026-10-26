import { Link, useParams } from 'react-router-dom'
import { ArrowLeft, BookOpen } from 'lucide-react'
import { Card, EmptyState } from '../../components/ui'

const SUBJECT_NAMES = {
  portugues: 'Português',
  matematica: 'Matemática',
  ciencias: 'Ciências',
  historia: 'História',
  geografia: 'Geografia',
  ingles: 'Inglês',
}

export default function KidsSubjects() {
  const { slug } = useParams()
  const name = SUBJECT_NAMES[slug] || slug

  return (
    <div className="kids-page">
      <Link to="/kids" className="kids-back-link">
        <ArrowLeft size={16} aria-hidden="true" /> Voltar
      </Link>
      <header className="kids-page-header">
        <h1>{name}</h1>
        <p>Aulas e exercícios de {name} para crianças.</p>
      </header>

      <Card className="kids-info-card">
        <BookOpen size={24} aria-hidden="true" />
        <div>
          <h3>Conteúdo em preparação</h3>
          <p>As aulas e exercícios de {name} para o ensino fundamental serão adicionados em breve. Enquanto isso, explore as matérias do site principal.</p>
          <Link to="/explorar" className="btn btn-primary" style={{ marginTop: 12 }}>
            Explorar matérias
          </Link>
        </div>
      </Card>
    </div>
  )
}
