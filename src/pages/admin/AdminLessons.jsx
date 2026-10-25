import { useEffect, useState } from 'react'
import { BookOpen, Loader2, Pencil, Plus, Trash2, X } from 'lucide-react'
import { supabase } from '../../lib/supabaseClient'
import { useToast } from '../../components/Toast'
import { Card, EmptyState } from '../../components/ui'

export default function AdminLessons() {
  const toast = useToast()
  const [subjects, setSubjects] = useState([])
  const [lessons, setLessons] = useState(null)
  const [filterSubject, setFilterSubject] = useState('')
  const [editing, setEditing] = useState(null) // null | 'new' | lesson object
  const [saving, setSaving] = useState(false)

  const blank = { subject_id: '', title: '', description: '', content: '', estimated_minutes: 15, sort_order: 0, status: 'draft' }

  async function load() {
    const [{ data: subs }, { data: ls }] = await Promise.all([
      supabase.from('subjects').select('id, name').order('sort_order'),
      supabase.from('lessons').select('id, title, description, status, estimated_minutes, sort_order, subject_id, subjects(name)').order('created_at', { ascending: false }),
    ])
    setSubjects(subs ?? [])
    setLessons(ls ?? [])
  }

  useEffect(() => { load() }, [])

  const filtered = filterSubject ? (lessons ?? []).filter((l) => l.subject_id === filterSubject) : (lessons ?? [])

  async function save(form) {
    setSaving(true)
    const payload = {
      subject_id: form.subject_id,
      title: form.title.trim(),
      description: form.description.trim() || null,
      content: form.content,
      estimated_minutes: Number(form.estimated_minutes) || 15,
      sort_order: Number(form.sort_order) || 0,
      status: form.status,
    }
    let error
    if (form.id) {
      ({ error } = await supabase.from('lessons').update(payload).eq('id', form.id))
    } else {
      ({ error } = await supabase.from('lessons').insert(payload))
    }
    setSaving(false)
    if (error) { toast('Erro ao salvar aula: ' + error.message, 'error'); return }
    toast(form.id ? 'Aula atualizada.' : 'Aula criada.')
    setEditing(null)
    load()
  }

  async function togglePublish(lesson) {
    const next = lesson.status === 'published' ? 'draft' : 'published'
    const { error } = await supabase.from('lessons').update({ status: next }).eq('id', lesson.id)
    if (error) { toast('Erro: ' + error.message, 'error'); return }
    toast(next === 'published' ? 'Aula publicada.' : 'Aula despublicada.')
    load()
  }

  async function remove(lesson) {
    if (!confirm(`Excluir a aula "${lesson.title}"?`)) return
    const { error } = await supabase.from('lessons').delete().eq('id', lesson.id)
    if (error) { toast('Erro: ' + error.message, 'error'); return }
    toast('Aula excluída.')
    load()
  }

  return (
    <div className="page">
      <header className="page-header admin-page-header">
        <div>
          <h2>Aulas</h2>
          <p>Crie, edite e publique aulas (conteúdo em Markdown).</p>
        </div>
        <button type="button" className="btn btn-primary" onClick={() => setEditing({ ...blank })}>
          <Plus size={16} aria-hidden="true" /> Nova aula
        </button>
      </header>

      <div className="admin-filter">
        <select className="input" value={filterSubject} onChange={(e) => setFilterSubject(e.target.value)} aria-label="Filtrar por matéria">
          <option value="">Todas as matérias</option>
          {subjects.map((s) => <option key={s.id} value={s.id}>{s.name}</option>)}
        </select>
      </div>

      {!lessons ? (
        <Card><div style={{ height: 80 }} /></Card>
      ) : filtered.length === 0 ? (
        <Card>
          <EmptyState icon={BookOpen} title="Nenhuma aula" description="Crie a primeira aula com o botão acima." />
        </Card>
      ) : (
        <div className="admin-table">
          {filtered.map((l) => (
            <div key={l.id} className="admin-row">
              <div className="admin-row-info">
                <strong>{l.title}</strong>
                <span>{l.subjects?.name} · {l.estimated_minutes}min · ordem {l.sort_order}</span>
              </div>
              <span className={`status-pill ${l.status === 'published' ? 'is-published' : 'is-draft'}`}>
                {l.status === 'published' ? 'Publicada' : 'Rascunho'}
              </span>
              <div className="admin-row-actions">
                <button type="button" className="icon-btn" aria-label="Editar" onClick={() => setEditing({ ...l, subject_id: l.subject_id })}>
                  <Pencil size={16} />
                </button>
                <button type="button" className={`btn btn-sm ${l.status === 'published' ? 'btn-ghost' : 'btn-primary'}`} onClick={() => togglePublish(l)}>
                  {l.status === 'published' ? 'Despublicar' : 'Publicar'}
                </button>
                <button type="button" className="icon-btn icon-btn-danger" aria-label="Excluir" onClick={() => remove(l)}>
                  <Trash2 size={16} />
                </button>
              </div>
            </div>
          ))}
        </div>
      )}

      {editing && (
        <div className="sheet-overlay" onClick={() => setEditing(null)}>
          <div className="sheet admin-sheet" role="dialog" aria-modal="true" onClick={(e) => e.stopPropagation()}>
            <div className="sheet-header">
              <strong>{editing.id ? 'Editar aula' : 'Nova aula'}</strong>
              <button type="button" className="icon-btn" aria-label="Fechar" onClick={() => setEditing(null)}>
                <X size={19} />
              </button>
            </div>
            <LessonForm
              initial={editing}
              subjects={subjects}
              saving={saving}
              onSave={save}
              onCancel={() => setEditing(null)}
            />
          </div>
        </div>
      )}
    </div>
  )
}

function LessonForm({ initial, subjects, saving, onSave, onCancel }) {
  const [form, setForm] = useState(initial)
  useEffect(() => { setForm(initial) }, [initial])
  function update(k, v) { setForm((f) => ({ ...f, [k]: v })) }

  return (
    <form className="form" onSubmit={(e) => { e.preventDefault(); onSave(form) }}>
      <div className="field">
        <label htmlFor="lf-subject">Matéria</label>
        <select id="lf-subject" className="input" required value={form.subject_id} onChange={(e) => update('subject_id', e.target.value)}>
          <option value="">Selecione…</option>
          {subjects.map((s) => <option key={s.id} value={s.id}>{s.name}</option>)}
        </select>
      </div>
      <div className="field">
        <label htmlFor="lf-title">Título</label>
        <input id="lf-title" className="input" required value={form.title} onChange={(e) => update('title', e.target.value)} />
      </div>
      <div className="field">
        <label htmlFor="lf-desc">Descrição</label>
        <input id="lf-desc" className="input" value={form.description ?? ''} onChange={(e) => update('description', e.target.value)} />
      </div>
      <div className="field">
        <label htmlFor="lf-content">Conteúdo (Markdown)</label>
        <textarea id="lf-content" className="input textarea" rows={12} value={form.content ?? ''} onChange={(e) => update('content', e.target.value)} />
      </div>
      <div className="task-form-row">
        <div className="field">
          <label htmlFor="lf-min">Duração (min)</label>
          <input id="lf-min" type="number" className="input" min={1} value={form.estimated_minutes} onChange={(e) => update('estimated_minutes', e.target.value)} />
        </div>
        <div className="field">
          <label htmlFor="lf-order">Ordem</label>
          <input id="lf-order" type="number" className="input" value={form.sort_order} onChange={(e) => update('sort_order', e.target.value)} />
        </div>
        <div className="field">
          <label htmlFor="lf-status">Status</label>
          <select id="lf-status" className="input" value={form.status} onChange={(e) => update('status', e.target.value)}>
            <option value="draft">Rascunho</option>
            <option value="published">Publicada</option>
          </select>
        </div>
      </div>
      <div className="task-form-actions">
        <button type="button" className="btn btn-ghost btn-sm" onClick={onCancel}>Cancelar</button>
        <button type="submit" className="btn btn-primary btn-sm" disabled={saving}>
          {saving && <Loader2 size={15} className="spin" aria-hidden="true" />}
          {saving ? 'Salvando…' : 'Salvar'}
        </button>
      </div>
    </form>
  )
}
