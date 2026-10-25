import { useEffect, useState } from 'react'
import { Link, useParams, useNavigate } from 'react-router-dom'
import {
  ArrowLeft,
  ArrowRight,
  BookOpen,
  CheckCircle2,
  Clock,
  Heart,
  Loader2,
} from 'lucide-react'
import { supabase } from '../lib/supabaseClient'
import { useAuth } from '../lib/auth'
import { useToast } from '../components/Toast'
import Markdown from '../components/Markdown'
import SubjectIcon from '../components/SubjectIcon'
import { Card, EmptyState, ProgressBar } from '../components/ui'

export default function LessonReader() {
  const { id } = useParams()
  const navigate = useNavigate()
  const { user } = useAuth()
  const toast = useToast()
  const [lesson, setLesson] = useState(null)
  const [subject, setSubject] = useState(null)
  const [siblings, setSiblings] = useState([])
  const [progress, setProgress] = useState(null)
  const [favorite, setFavorite] = useState(false)
  const [saving, setSaving] = useState(false)

  useEffect(() => {
    let active = true
    async function load() {
      const { data: l } = await supabase
        .from('lessons')
        .select('id, title, description, content, estimated_minutes, subject_id, sort_order')
        .eq('id', id)
        .maybeSingle()
      if (!active || !l) { setLesson(l); return }
      setLesson(l)

      const [{ data: subj }, { data: sibs }] = await Promise.all([
        supabase.from('subjects').select('id, name, slug, icon').eq('id', l.subject_id).maybeSingle(),
        supabase
          .from('lessons')
          .select('id, title, sort_order')
          .eq('subject_id', l.subject_id)
          .eq('status', 'published')
          .order('sort_order'),
      ])
      if (!active) return
      setSubject(subj)
      setSiblings(sibs ?? [])

      if (user) {
        const [{ data: prog }, { data: fav }] = await Promise.all([
          supabase
            .from('user_lesson_progress')
            .select('progress_percent, completed_at')
            .eq('user_id', user.id)
            .eq('lesson_id', l.id)
            .maybeSingle(),
          supabase
            .from('favorites')
            .select('lesson_id')
            .eq('user_id', user.id)
            .eq('lesson_id', l.id)
            .maybeSingle(),
        ])
        if (!active) return
        setProgress(prog)
        setFavorite(Boolean(fav))
        // Marca como acessado (upsert com progresso atual).
        supabase
          .from('user_lesson_progress')
          .upsert(
            {
              user_id: user.id,
              lesson_id: l.id,
              progress_percent: prog?.progress_percent ?? 10,
              last_accessed_at: new Date().toISOString(),
            },
            { onConflict: 'user_id,lesson_id' },
          )
          .then(() => {})
      }
    }
    load()
    return () => { active = false }
  }, [id, user])

  const currentIndex = siblings.findIndex((s) => s.id === id)
  const prevLesson = currentIndex > 0 ? siblings[currentIndex - 1] : null
  const nextLesson = currentIndex < siblings.length - 1 ? siblings[currentIndex + 1] : null
  const completed = Boolean(progress?.completed_at)

  async function toggleComplete() {
    if (!user) { navigate('/login'); return }
    setSaving(true)
    const nowCompleted = !completed
    const { error } = await supabase
      .from('user_lesson_progress')
      .upsert(
        {
          user_id: user.id,
          lesson_id: id,
          progress_percent: nowCompleted ? 100 : 50,
          completed_at: nowCompleted ? new Date().toISOString() : null,
          last_accessed_at: new Date().toISOString(),
        },
        { onConflict: 'user_id,lesson_id' },
      )
    setSaving(false)
    if (error) { toast('Não foi possível salvar o progresso.', 'error'); return }
    setProgress((p) => ({ ...(p || {}), progress_percent: nowCompleted ? 100 : 50, completed_at: nowCompleted ? new Date().toISOString() : null }))
    toast(nowCompleted ? 'Aula concluída! Parabéns.' : 'Marcada como em andamento.')
  }

  async function toggleFavorite() {
    if (!user) { navigate('/login'); return }
    if (favorite) {
      await supabase.from('favorites').delete().eq('user_id', user.id).eq('lesson_id', id)
      setFavorite(false)
      toast('Removido dos favoritos.')
    } else {
      await supabase.from('favorites').insert({ user_id: user.id, lesson_id: id })
      setFavorite(true)
      toast('Adicionado aos favoritos.')
    }
  }

  if (!lesson) {
    return (
      <div className="page">
        <Card><EmptyState icon={BookOpen} title="Carregando aula…" /></Card>
      </div>
    )
  }

  return (
    <div className="page lesson-page">
      <Link to={subject ? `/materia/${subject.slug}` : '/explorar'} className="back-link">
        <ArrowLeft size={16} aria-hidden="true" /> {subject?.name ?? 'Voltar'}
      </Link>

      <div className="lesson-layout">
        <aside className="lesson-index">
          <h3>{subject?.name}</h3>
          <ol>
            {siblings.map((s, i) => (
              <li key={s.id} className={s.id === id ? 'is-current' : ''}>
                <Link to={`/aula/${s.id}`}>
                  <span className="lesson-idx">{i + 1}</span>
                  {s.title}
                </Link>
              </li>
            ))}
          </ol>
        </aside>

        <article className="lesson-article">
          <header className="lesson-header">
            <div className="lesson-header-top">
              {subject && (
                <span className="lesson-subject">
                  <SubjectIcon name={subject.icon} size={14} /> {subject.name}
                </span>
              )}
              <span className="lesson-time">
                <Clock size={14} aria-hidden="true" /> {lesson.estimated_minutes} min
              </span>
            </div>
            <h1>{lesson.title}</h1>
            {lesson.description && <p className="lesson-desc">{lesson.description}</p>}
            {progress && (
              <div className="lesson-progress">
                <ProgressBar value={progress.progress_percent ?? 0} label="Progresso da aula" />
              </div>
            )}
          </header>

          <div className="lesson-content">
            <Markdown text={lesson.content || ''} />
          </div>

          <footer className="lesson-footer">
            <button type="button" className="btn btn-outline" onClick={toggleFavorite}>
              <Heart size={16} aria-hidden="true" fill={favorite ? 'currentColor' : 'none'} />
              {favorite ? 'Favoritado' : 'Favoritar'}
            </button>
            <button type="button" className="btn btn-primary" onClick={toggleComplete} disabled={saving}>
              {saving && <Loader2 size={16} className="spin" aria-hidden="true" />}
              {completed ? 'Concluída ✓' : 'Marcar como concluída'}
            </button>
          </footer>

          <nav className="lesson-nav">
            {prevLesson ? (
              <Link to={`/aula/${prevLesson.id}`} className="lesson-nav-btn">
                <ArrowLeft size={16} aria-hidden="true" />
                <span>{prevLesson.title}</span>
              </Link>
            ) : <span />}
            {nextLesson && (
              <Link to={`/aula/${nextLesson.id}`} className="lesson-nav-btn lesson-nav-next">
                <span>{nextLesson.title}</span>
                <ArrowRight size={16} aria-hidden="true" />
              </Link>
            )}
          </nav>
        </article>
      </div>
    </div>
  )
}
