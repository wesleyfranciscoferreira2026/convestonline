import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { ArrowLeft, Loader2, Trash2, X } from 'lucide-react'
import { supabase } from '../lib/supabaseClient'
import { useToast } from '../components/Toast'
import { Card, EmptyState } from '../components/ui'

export default function ManageQuestions() {
  const toast = useToast()
  const [questions, setQuestions] = useState(null)
  const [subjects, setSubjects] = useState([])
  const [exams, setExams] = useState([])
  const [filterSubject, setFilterSubject] = useState('')
  const [filterExam, setFilterExam] = useState('')
  const [deleting, setDeleting] = useState(null)

  useEffect(() => {
    Promise.all([
      supabase.from('subjects').select('id, name').order('sort_order'),
      supabase.from('exams').select('id, name').order('sort_order'),
      supabase.from('questions').select('id, prompt, stem_image_url, year, subject_id, exam_id, subjects(name), exams(name)').order('created_at', { ascending: false }),
    ]).then(([subs, ex, qs]) => {
      setSubjects(subs.data ?? [])
      setExams(ex.data ?? [])
      setQuestions(qs.data ?? [])
    })
  }, [])

  const filtered = (questions ?? []).filter((q) => {
    if (filterSubject && q.subject_id !== filterSubject) return false
    if (filterExam && q.exam_id !== filterExam) return false
    return true
  })

  async function remove(q) {
    if (!confirm('Excluir esta questão?')) return
    setDeleting(q.id)
    const { error } = await supabase.from('questions').delete().eq('id', q.id)
    setDeleting(null)
    if (error) { toast('Erro: ' + error.message, 'error'); return }
    toast('Questão excluída.')
    setQuestions((prev) => prev.filter((x) => x.id !== q.id))
  }

  return (
    <div className="page">
      <header className="page-header">
        <Link to="/" className="back-link">
          <ArrowLeft size={16} aria-hidden="true" /> Voltar ao início
        </Link>
        <h2>Gerenciar Questões</h2>
        <p>Visualize e exclua questões cadastradas.</p>
      </header>

      <div className="admin-filter" style={{ display: 'flex', gap: 8, marginBottom: 16 }}>
        <select className="input" value={filterSubject} onChange={(e) => setFilterSubject(e.target.value)} aria-label="Filtrar por matéria">
          <option value="">Todas as matérias</option>
          {subjects.map((s) => <option key={s.id} value={s.id}>{s.name}</option>)}
        </select>
        <select className="input" value={filterExam} onChange={(e) => setFilterExam(e.target.value)} aria-label="Filtrar por prova">
          <option value="">Todas as provas</option>
          {exams.map((x) => <option key={x.id} value={x.id}>{x.name}</option>)}
        </select>
      </div>

      {!questions ? (
        <Card><div style={{ height: 80 }} /></Card>
      ) : filtered.length === 0 ? (
        <Card>
          <EmptyState icon={ClipboardList} title="Nenhuma questão" description="Nenhuma questão encontrada com os filtros selecionados." />
        </Card>
      ) : (
        <div style={{ display: 'flex', flexDirection: 'column', gap: 12 }}>
          {filtered.map((q) => (
            <Card key={q.id}>
              <div style={{ display: 'flex', gap: 12, alignItems: 'flex-start' }}>
                {q.stem_image_url && (
                  <img src={q.stem_image_url} alt="" style={{ width: 120, height: 80, objectFit: 'cover', borderRadius: 6, flexShrink: 0 }} />
                )}
                <div style={{ flex: 1, minWidth: 0 }}>
                  <strong style={{ fontSize: 14 }}>{q.prompt || '(sem texto)'}</strong>
                  <p style={{ fontSize: 12, color: 'var(--color-text-secondary)', marginTop: 4 }}>
                    {q.subjects?.name || '—'} · {q.exams?.name || '—'} · {q.year || '—'} · Resposta: {['A','B','C','D','E'][q.correct_index] || '?'}
                  </p>
                </div>
                <button
                  type="button"
                  className="icon-btn icon-btn-danger"
                  aria-label="Excluir"
                  onClick={() => remove(q)}
                  disabled={deleting === q.id}
                >
                  {deleting === q.id ? <Loader2 size={16} className="spin" /> : <Trash2 size={16} />}
                </button>
              </div>
            </Card>
          ))}
        </div>
      )}
    </div>
  )
}
