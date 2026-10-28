import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { BookOpen, ClipboardList, Users, FileText, Crown } from 'lucide-react'
import { supabase } from '../../lib/supabaseClient'
import { Card, StatCard } from '../../components/ui'
import { PLAN_LIMITS } from '../../lib/plans'

export default function AdminDashboard() {
  const [stats, setStats] = useState({ subjects: 0, lessons: 0, publishedLessons: 0, questions: 0, publishedQuestions: 0, users: 0 })
  const [users, setUsers] = useState([])
  const [savingPlan, setSavingPlan] = useState(null)

  useEffect(() => {
    let active = true
    async function load() {
      const [s, l, q, u, us] = await Promise.all([
        supabase.from('subjects').select('id', { count: 'exact', head: true }),
        supabase.from('lessons').select('id, status', { count: 'exact' }),
        supabase.from('questions').select('id, status', { count: 'exact' }),
        supabase.from('profiles').select('id', { count: 'exact', head: true }),
        supabase.from('profiles').select('id, full_name, plan').order('created_at', { ascending: false }).limit(50),
      ])
      if (!active) return
      const lessons = l.data ?? []
      const questions = q.data ?? []
      setUsers(us.data ?? [])
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

  async function changePlan(userId, plan) {
    setSavingPlan(userId)
    const { error } = await supabase.from('profiles').update({ plan }).eq('id', userId)
    if (error) {
      console.error('Erro ao alterar plano:', error.message)
      setSavingPlan(null)
      return
    }
    setUsers((current) => current.map((u) => (u.id === userId ? { ...u, plan } : u)))
    setSavingPlan(null)
  }

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
        <h3 className="section-title">
          <Crown size={16} aria-hidden="true" /> Planos dos alunos
        </h3>
        <p className="settings-note">
          Altera o plano do aluno. O plano define quantas revisões de estatísticas ele pode fazer por dia.
        </p>
        {users.length === 0 ? (
          <p className="settings-note">Nenhum aluno cadastrado.</p>
        ) : (
          <div className="admin-plan-list">
            {users.map((u) => (
              <div key={u.id} className="admin-plan-row">
                <div className="admin-plan-info">
                  <strong>{u.full_name || u.id.slice(0, 8)}</strong>
                  <span>
                    {PLAN_LIMITS[u.plan || 'free']?.statsReviewsPerDay === Infinity ? 'revisões ilimitadas' : `${PLAN_LIMITS[u.plan || 'free']?.statsReviewsPerDay ?? 1} revisão(ões)/dia`}
                  </span>
                </div>
                <select
                  className="input admin-plan-select"
                  value={u.plan || 'free'}
                  disabled={savingPlan === u.id}
                  onChange={(e) => changePlan(u.id, e.target.value)}
                >
                  {Object.keys(PLAN_LIMITS).map((key) => (
                    <option key={key} value={key}>
                      {PLAN_LIMITS[key].label}
                    </option>
                  ))}
                </select>
              </div>
            ))}
          </div>
        )}
      </Card>
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
