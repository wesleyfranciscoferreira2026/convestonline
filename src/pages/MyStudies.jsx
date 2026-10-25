import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { ArrowRight, BookOpen, CheckCircle2, Heart, Loader2 } from 'lucide-react'
import { supabase } from '../lib/supabaseClient'
import { useAuth } from '../lib/auth'
import SubjectIcon from '../components/SubjectIcon'
import { Card, EmptyState } from '../components/ui'

export default function MyStudies() {
  const { user } = useAuth()
  const [loading, setLoading] = useState(true)
  const [inProgress, setInProgress] = useState([])
  const [completed, setCompleted] = useState([])
  const [favorites, setFavorites] = useState([])

  useEffect(() => {
    if (!user) { setLoading(false); return }
    let active = true
    async function load() {
      const [{ data: prog }, { data: favs }] = await Promise.all([
        supabase
          .from('user_lesson_progress')
          .select('progress_percent, completed_at, last_accessed_at, lessons(id, title, estimated_minutes, subjects(name, slug, icon))')
          .eq('user_id', user.id)
          .order('last_accessed_at', { ascending: false }),
        supabase
          .from('favorites')
          .select('created_at, lessons(id, title, estimated_minutes, subjects(name, slug, icon))')
          .eq('user_id', user.id)
          .order('created_at', { ascending: false }),
      ])
      if (!active) return
      const ip = []
      const done = []
      for (const p of prog ?? []) {
        if (!p.lessons) continue
        if (p.completed_at) done.push(p)
        else ip.push(p)
      }
      setInProgress(ip)
      setCompleted(done)
      setFavorites((favs ?? []).filter((f) => f.lessons))
      setLoading(false)
    }
    load()
    return () => { active = false }
  }, [user])

  if (!user) {
    return (
      <div className="page">
        <Card>
          <EmptyState
            icon={BookOpen}
            title="Entre na sua conta"
            description="Seus estudos, progresso e favoritos ficam salvos na sua conta."
          />
        </Card>
      </div>
    )
  }

  if (loading) {
    return (
      <div className="page">
        <Card><div style={{ height: 80 }} /></Card>
      </div>
    )
  }

  return (
    <div className="page">
      <header className="page-header">
        <h2>Meus estudos</h2>
        <p>Sua trilha de aulas, progresso e favoritos.</p>
      </header>

      <Card>
        <h3 className="section-title">Continuar estudando</h3>
        {inProgress.length === 0 ? (
          <EmptyState
            icon={BookOpen}
            title="Nenhuma aula em andamento"
            description="Abra uma aula para começar sua trilha."
            action={<Link to="/explorar" className="btn btn-primary">Explorar matérias</Link>}
          />
        ) : (
          <ul className="continue-list">
            {inProgress.map((p) => (
              <li key={p.lessons.id} className="continue-item">
                <div className="continue-info">
                  <span className="continue-subject">
                    <SubjectIcon name={p.lessons.subjects?.icon} size={12} /> {p.lessons.subjects?.name}
                  </span>
                  <strong>{p.lessons.title}</strong>
                  <span className="continue-meta">{p.progress_percent ?? 0}% concluído</span>
                </div>
                <Link to={`/aula/${p.lessons.id}`} className="btn btn-outline btn-sm">
                  Continuar <ArrowRight size={14} aria-hidden="true" />
                </Link>
              </li>
            ))}
          </ul>
        )}
      </Card>

      <Card>
        <h3 className="section-title">Concluídas</h3>
        {completed.length === 0 ? (
          <EmptyState icon={CheckCircle2} title="Nenhuma aula concluída ainda" description="Marque aulas como concluídas para vê-las aqui." />
        ) : (
          <ul className="lesson-simple-list">
            {completed.map((p) => (
              <li key={p.lessons.id}>
                <Link to={`/aula/${p.lessons.id}`}>
                  <CheckCircle2 size={16} aria-hidden="true" />
                  <span>{p.lessons.title}</span>
                  <span className="muted">{p.lessons.subjects?.name}</span>
                </Link>
              </li>
            ))}
          </ul>
        )}
      </Card>

      <Card>
        <h3 className="section-title">Favoritos</h3>
        {favorites.length === 0 ? (
          <EmptyState icon={Heart} title="Nenhum favorito" description="Use o botão de coração em uma aula para salvá-la aqui." />
        ) : (
          <ul className="lesson-simple-list">
            {favorites.map((f) => (
              <li key={f.lessons.id}>
                <Link to={`/aula/${f.lessons.id}`}>
                  <Heart size={16} aria-hidden="true" />
                  <span>{f.lessons.title}</span>
                  <span className="muted">{f.lessons.subjects?.name}</span>
                </Link>
              </li>
            ))}
          </ul>
        )}
      </Card>
    </div>
  )
}
