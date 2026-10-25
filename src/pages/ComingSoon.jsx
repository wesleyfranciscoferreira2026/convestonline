import { Link } from 'react-router-dom'
import { ArrowRight } from 'lucide-react'
import { Card, EmptyState } from '../components/ui'

/** Estado honesto para áreas que chegam nas próximas fases do PRD. */
export default function ComingSoon({ icon, title, description }) {
  return (
    <div className="page page-narrow">
      <Card>
        <EmptyState
          icon={icon}
          title={title}
          description={description}
          action={
            <Link to="/" className="btn btn-outline">
              Voltar ao início <ArrowRight size={16} aria-hidden="true" />
            </Link>
          }
        />
      </Card>
    </div>
  )
}
