import { useEffect, useState } from 'react'
import { Link, useParams } from 'react-router-dom'
import { ArrowLeft, ArrowRight, BookOpen, CheckCircle2, Clock } from 'lucide-react'
import { supabase } from '../lib/supabaseClient'
import { useAuth } from '../lib/auth'
import SubjectIcon from '../components/SubjectIcon'
import { Card, EmptyState, ProgressBar, Skeleton } from '../components/ui'

export default function SubjectLessons() {
  const { slug } = useParams()
  const { user } = useAuth()
  const [subject, setSubject] = useState(null)
  const [lessons, setLessons] = useState(null)
  const [progress, setProgress] = useState({})

  useEffect(() => {
    let active = true
    async function load() {
      const { data: subj } = await supabase.from('subjects').select('*').eq('slug', slug).maybeSingle()
      if (!active) return
      setSubject(subj)
      if (!subj) { setLessons([]); return }
      const { data: ls } = await supabase
        .from('lessons')
        .select('id, title, description, estimated_minutes, sort_order')
        .eq('subject_id', subj.id)
        .eq('status', 'published')
        .order('sort_order')
      if (!active) return
      setLessons(ls ?? [])
      if (user && (ls ?? []).length) {
        const { data: prog } = await supabase
          .from('user_lesson_progress')
          .select('lesson_id, progress_percent, completed_at')
          .eq('user_id', user.id)
          .in('lesson_id', (ls ?? []).map((l) => l.id))
        const map = {}
        for (const p of prog ?? []) map[p.lesson_id] = p
        setProgress(map)
      }
    }
    load()
    return () => { active = false }
  }, [slug, user])

  if (!subject) {
    return (
      <div className="page">
        <Card><Skeleton height={24} width="40%" /><Skeleton height={14} width="60%" /></Card>
      </div>
    )
  }

  return (
    <div className="page">
      <Link to="/explorar" className="back-link">
        <ArrowLeft size={16} aria-hidden="true" /> Voltar para Explorar
      </Link>

      <header className="subject-hero">
        <span className="subject-icon subject-icon-lg">
          <SubjectIcon name={subject.icon} size={28} />
        </span>
        <div>
          <h2>{subject.name}</h2>
          <p>{subject.description}</p>
        </div>
      </header>

      {!lessons ? (
        <div className="lesson-list">
          {[0, 1, 2].map((i) => (
            <Card key={i}><Skeleton height={16} width="50%" /><Skeleton height={12} width="80%" /></Card>
          ))}
        </div>
      ) : lessons.length === 0 ? (
        <Card>
          <EmptyState
            icon={BookOpen}
            title="Aulas em preparação"
            description={`As aulas de ${subject.name} serão publicadas em breve. Volte mais tarde!`}
          />
        </Card>
      ) : (
        <div className="lesson-list">
          {lessons.map((lesson, idx) => {
            const p = progress[lesson.id]
            const done = Boolean(p?.completed_at)
            return (
              <Link key={lesson.id} to={`/aula/${lesson.id}`} className="lesson-row">
                <span className={`lesson-status ${done ? 'is-done' : ''}`}>
                  {done ? <CheckCircle2 size={20} aria-hidden="true" /> : <span className="lesson-num">{idx + 1}</span>}
                </span>
                <div className="lesson-row-info">
                  <strong>{lesson.title}</strong>
                  <span>{lesson.description}</span>
                  {p && !done && (
                    <ProgressBar value={p.progress_percent} label={`Progresso de ${lesson.title}`} />
                  )}
                </div>
                <span className="lesson-row-meta">
                  <Clock size={14} aria-hidden="true" /> {lesson.estimated_minutes}min
                  <ArrowRight size={16} aria-hidden="true" />
                </span>
              </Link>
            )
          })}
        </div>
      )}
    </div>
  )
}
