import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { BookOpen, ClipboardList, Users, FileText } from 'lucide-react'
import { supabase } from '../../lib/supabaseClient'
import { Card, StatCard } from '../../components/ui'

export default function AdminDashboard() {
  const [stats, setStats] = useState({ subjects: 0, lessons: 0, publishedLessons: 0, questions: 0, publishedQuestions: 0, users: 0 })

  useEffect(() => {
    let active = true
    async function load() {
      const [s, l, q, u] = await Promise.all([
        supabase.from('subjects').select('id', { count: 'exact', head: true }),
        supabase.from('lessons').select('id, status', { count: 'exact' }),
        supabase.from('questions').select('id, status', { count: 'exact' }),
        supabase.from('profiles').select('id', { count: 'exact', head: true }),
      ])
      if (!active) return
      const lessons = l.data ?? []
      const questions = q.data ?? []
      setStats({
        subjects: s.count ?? 0,
        lessons: lessons.length,
        publishedLessons: lessons.filter((x) => x.status === 'published').length,
        questions: questions.length,
        publishedQuestions: questions.filter((x) => x.status === 'published').length,
        users: u.count ?? 0,
      })
    }
    load()
    return () => { active = false }
  }, [])

  return (
    <div className="page">
      <header className="page-header">
        <h2>Painel administrativo</h2>
        <p>Gerencie conteúdos, questões e usuários.</p>
      </header>

      <div className="stats-grid">
        <StatCard icon={BookOpen} label="Matérias" value={stats.subjects} />
        <StatCard icon={FileText} label="Aulas (publicadas)" value={`${stats.publishedLessons}/${stats.lessons}`} />
        <StatCard icon={ClipboardList} label="Questões (publicadas)" value={`${stats.publishedQuestions}/${stats.questions}`} />
        <StatCard icon={Users} label="Usuários" value={stats.users} />
      </div>

      <div className="admin-quick-links">
        <Link to="/admin/aulas" className="admin-quick-link">
          <BookOpen size={20} aria-hidden="true" />
          <div>
            <strong>Gerenciar aulas</strong>
            <span>Criar, editar e publicar aulas.</span>
          </div>
        </Link>
        <Link to="/admin/questoes" className="admin-quick-link">
          <ClipboardList size={20} aria-hidden="true" />
          <div>
            <strong>Gerenciar questões</strong>
            <span>Cadastrar questões e gabaritos.</span>
          </div>
        </Link>
      </div>

      <Card>
        <h3 className="section-title">Como promover um usuário a admin</h3>
        <p className="settings-note">
          No SQL Editor do Supabase, execute:
        </p>
        <code className="code-block">update public.profiles set role = 'admin' where id = '&lt;uuid-do-usuario&gt;';</code>
        <p className="settings-note" style={{ marginTop: 8 }}>
          O UUID do usuário pode ser encontrado em Authentication → Users.
        </p>
      </Card>
    </div>
  )
}
