import { useEffect, useMemo, useState } from 'react'
import { Link, useSearchParams } from 'react-router-dom'
import { ArrowRight, Compass, Search } from 'lucide-react'
import { supabase } from '../lib/supabaseClient'
import SubjectIcon from '../components/SubjectIcon'
import { Card, EmptyState, Skeleton } from '../components/ui'

export default function Explore() {
  const [searchParams, setSearchParams] = useSearchParams()
  const query = searchParams.get('q') ?? ''
  const [subjects, setSubjects] = useState(null)

  useEffect(() => {
    let active = true
    supabase
      .from('subjects')
      .select('id, slug, name, description, icon')
      .order('sort_order')
      .then(({ data }) => {
        if (active) setSubjects(data ?? [])
      })
    return () => {
      active = false
    }
  }, [])

  const filtered = useMemo(() => {
    if (!subjects) return []
    const q = query.trim().toLowerCase()
    if (!q) return subjects
    return subjects.filter(
      (s) =>
        s.name.toLowerCase().includes(q) || (s.description ?? '').toLowerCase().includes(q),
    )
  }, [subjects, query])

  function onSearch(event) {
    const value = event.target.value
    setSearchParams(value ? { q: value } : {}, { replace: true })
  }

  return (
    <div className="page">
      <header className="page-header">
        <h2>Explorar conteúdos</h2>
        <p>Encontre sua próxima matéria e comece a estudar.</p>
      </header>

      <div className="explore-search" role="search">
        <Search size={17} aria-hidden="true" />
        <input
          type="search"
          className="input"
          placeholder="Buscar por matéria…"
          aria-label="Buscar por matéria"
          value={query}
          onChange={onSearch}
        />
      </div>

      {!subjects ? (
        <div className="subject-grid subject-grid-lg" aria-busy="true">
          {[0, 1, 2, 3, 4, 5].map((i) => (
            <Card key={i}>
              <Skeleton width={40} height={40} radius={12} />
              <Skeleton width="60%" height={16} />
              <Skeleton width="90%" height={12} />
            </Card>
          ))}
        </div>
      ) : filtered.length === 0 ? (
        <Card>
          <EmptyState
            icon={Compass}
            title={query ? 'Nenhuma matéria encontrada' : 'Catálogo em preparação'}
            description={
              query
                ? `Não encontramos resultados para "${query}". Tente outro termo.`
                : 'As matérias aparecerão aqui assim que forem cadastradas.'
            }
          />
        </Card>
      ) : (
        <div className="subject-grid subject-grid-lg">
          {filtered.map((s) => (
            <Link key={s.id} to={`/materia/${s.slug}`} className="subject-card-link">
              <Card className="subject-card-lg" as="article">
                <span className="subject-icon">
                  <SubjectIcon name={s.icon} size={22} />
                </span>
                <h3>{s.name}</h3>
                <p>{s.description}</p>
                <span className="subject-badge">
                  Ver aulas <ArrowRight size={12} aria-hidden="true" />
                </span>
              </Card>
            </Link>
          ))}
        </div>
      )}
    </div>
  )
}
