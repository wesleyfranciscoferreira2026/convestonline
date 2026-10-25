import { useEffect, useState } from 'react'
import { CheckCircle2, ClipboardList, Loader2, Pencil, Plus, Trash2, X } from 'lucide-react'
import { supabase } from '../../lib/supabaseClient'
import { useToast } from '../../components/Toast'
import { Card, EmptyState } from '../../components/ui'

export default function AdminQuestions() {
  const toast = useToast()
  const [subjects, setSubjects] = useState([])
  const [lessons, setLessons] = useState([])
  const [questions, setQuestions] = useState(null)
  const [filterSubject, setFilterSubject] = useState('')
  const [editing, setEditing] = useState(null)
  const [saving, setSaving] = useState(false)

  const blank = { subject_id: '', lesson_id: '', prompt: '', options: ['', '', '', ''], correct_index: 0, explanation: '', difficulty: 'medium', status: 'draft', sort_order: 0 }

  async function load() {
    const [{ data: subs }, { data: ls }, { data: qs }] = await Promise.all([
      supabase.from('subjects').select('id, name').order('sort_order'),
      supabase.from('lessons').select('id, title, subject_id').order('sort_order'),
      supabase.from('questions').select('id, prompt, options, correct_index, explanation, difficulty, status, sort_order, subject_id, lesson_id, subjects(name), lessons(title)').order('created_at', { ascending: false }),
    ])
    setSubjects(subs ?? [])
    setLessons(ls ?? [])
    setQuestions(qs ?? [])
  }

  useEffect(() => { load() }, [])

  const filtered = filterSubject ? (questions ?? []).filter((q) => q.subject_id === filterSubject) : (questions ?? [])
  const filteredLessons = editing ? lessons.filter((l) => l.subject_id === editing.subject_id) : []

  async function save(form) {
    setSaving(true)
    const payload = {
      subject_id: form.subject_id,
      lesson_id: form.lesson_id || null,
      prompt: form.prompt.trim(),
      options: form.options.map((o) => o.trim()).filter(Boolean),
      correct_index: Number(form.correct_index),
      explanation: form.explanation.trim() || null,
      difficulty: form.difficulty,
      status: form.status,
      sort_order: Number(form.sort_order) || 0,
    }
    if (payload.options.length < 2) { setSaving(false); toast('Adicione pelo menos 2 alternativas.', 'error'); return }
    if (payload.correct_index >= payload.options.length) { setSaving(false); toast('Índice da resposta correta inválido.', 'error'); return }
    let error
    if (form.id) {
      ({ error } = await supabase.from('questions').update(payload).eq('id', form.id))
    } else {
      ({ error } = await supabase.from('questions').insert(payload))
    }
    setSaving(false)
    if (error) { toast('Erro: ' + error.message, 'error'); return }
    toast(form.id ? 'Questão atualizada.' : 'Questão criada.')
    setEditing(null)
    load()
  }

  async function togglePublish(q) {
    const next = q.status === 'published' ? 'draft' : 'published'
    const { error } = await supabase.from('questions').update({ status: next }).eq('id', q.id)
    if (error) { toast('Erro: ' + error.message, 'error'); return }
    toast(next === 'published' ? 'Questão publicada.' : 'Questão despublicada.')
    load()
  }

  async function remove(q) {
    if (!confirm('Excluir esta questão?')) return
    const { error } = await supabase.from('questions').delete().eq('id', q.id)
    if (error) { toast('Erro: ' + error.message, 'error'); return }
    toast('Questão excluída.')
    load()
  }

  return (
    <div className="page">
      <header className="page-header admin-page-header">
        <div>
          <h2>Questões</h2>
          <p>Cadastre questões de múltipla escolha com gabarito e explicação.</p>
        </div>
        <button type="button" className="btn btn-primary" onClick={() => setEditing({ ...blank, options: ['', '', '', ''] })}>
          <Plus size={16} aria-hidden="true" /> Nova questão
        </button>
      </header>

      <div className="admin-filter">
        <select className="input" value={filterSubject} onChange={(e) => setFilterSubject(e.target.value)} aria-label="Filtrar por matéria">
          <option value="">Todas as matérias</option>
          {subjects.map((s) => <option key={s.id} value={s.id}>{s.name}</option>)}
        </select>
      </div>

      {!questions ? (
        <Card><div style={{ height: 80 }} /></Card>
      ) : filtered.length === 0 ? (
        <Card>
          <EmptyState icon={ClipboardList} title="Nenhuma questão" description="Crie a primeira questão com o botão acima." />
        </Card>
      ) : (
        <div className="admin-table">
          {filtered.map((q) => (
            <div key={q.id} className="admin-row admin-row-question">
              <div className="admin-row-info">
                <strong>{q.prompt}</strong>
                <span>{q.subjects?.name} · {q.lessons?.title ?? 'sem aula'} · {q.options.length} alt. · {q.difficulty}</span>
              </div>
              <span className={`status-pill ${q.status === 'published' ? 'is-published' : 'is-draft'}`}>
                {q.status === 'published' ? 'Publicada' : 'Rascunho'}
              </span>
              <div className="admin-row-actions">
                <button type="button" className="icon-btn" aria-label="Editar" onClick={() => setEditing({ ...q, options: [...q.options], lesson_id: q.lesson_id ?? '' })}>
                  <Pencil size={16} />
                </button>
                <button type="button" className={`btn btn-sm ${q.status === 'published' ? 'btn-ghost' : 'btn-primary'}`} onClick={() => togglePublish(q)}>
                  {q.status === 'published' ? 'Despublicar' : 'Publicar'}
                </button>
                <button type="button" className="icon-btn icon-btn-danger" aria-label="Excluir" onClick={() => remove(q)}>
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
              <strong>{editing.id ? 'Editar questão' : 'Nova questão'}</strong>
              <button type="button" className="icon-btn" aria-label="Fechar" onClick={() => setEditing(null)}>
                <X size={19} />
              </button>
            </div>
            <QuestionForm
              initial={editing}
              subjects={subjects}
              lessons={filteredLessons}
              allLessons={lessons}
              saving={saving}
              onSave={save}
              onCancel={() => setEditing(null)}
              onSubjectChange={(sid) => setEditing((e) => ({ ...e, subject_id: sid, lesson_id: '' }))}
            />
          </div>
        </div>
      )}
    </div>
  )
}

function QuestionForm({ initial, subjects, lessons, allLessons, saving, onSave, onCancel, onSubjectChange }) {
  const [form, setForm] = useState(initial)
  useEffect(() => { setForm(initial) }, [initial])
  function update(k, v) { setForm((f) => ({ ...f, [k]: v })) }
  function updateOption(i, v) {
    setForm((f) => {
      const opts = [...f.options]
      opts[i] = v
      return { ...f, options: opts }
    })
  }
  const subjectLessons = allLessons.filter((l) => l.subject_id === form.subject_id)

  return (
    <form className="form" onSubmit={(e) => { e.preventDefault(); onSave(form) }}>
      <div className="field">
        <label htmlFor="qf-subject">Matéria</label>
        <select id="qf-subject" className="input" required value={form.subject_id} onChange={(e) => onSubjectChange(e.target.value)}>
          <option value="">Selecione…</option>
          {subjects.map((s) => <option key={s.id} value={s.id}>{s.name}</option>)}
        </select>
      </div>
      <div className="field">
        <label htmlFor="qf-lesson">Aula (opcional)</label>
        <select id="qf-lesson" className="input" value={form.lesson_id ?? ''} onChange={(e) => update('lesson_id', e.target.value)}>
          <option value="">Nenhuma</option>
          {subjectLessons.map((l) => <option key={l.id} value={l.id}>{l.title}</option>)}
        </select>
      </div>
      <div className="field">
        <label htmlFor="qf-prompt">Enunciado</label>
        <textarea id="qf-prompt" className="input textarea" rows={3} required value={form.prompt} onChange={(e) => update('prompt', e.target.value)} />
      </div>
      <div className="field">
        <label>Alternativas</label>
        {form.options.map((opt, i) => (
          <div key={i} className="option-edit-row">
            <span className="option-letter">{String.fromCharCode(65 + i)}</span>
            <input
              type="text"
              className="input"
              placeholder={`Alternativa ${String.fromCharCode(65 + i)}`}
              value={opt}
              onChange={(e) => updateOption(i, e.target.value)}
            />
            <label className="correct-radio">
              <input type="radio" name="correct" checked={form.correct_index === i} onChange={() => update('correct_index', i)} />
              correta
            </label>
          </div>
        ))}
        <button type="button" className="btn btn-ghost btn-sm" onClick={() => update('options', [...form.options, ''])}>
          + Alternativa
        </button>
      </div>
      <div className="field">
        <label htmlFor="qf-expl">Explicação (gabarito)</label>
        <textarea id="qf-expl" className="input textarea" rows={3} value={form.explanation ?? ''} onChange={(e) => update('explanation', e.target.value)} />
      </div>
      <div className="task-form-row">
        <div className="field">
          <label htmlFor="qf-diff">Dificuldade</label>
          <select id="qf-diff" className="input" value={form.difficulty} onChange={(e) => update('difficulty', e.target.value)}>
            <option value="easy">Fácil</option>
            <option value="medium">Médio</option>
            <option value="hard">Difícil</option>
          </select>
        </div>
        <div className="field">
          <label htmlFor="qf-status">Status</label>
          <select id="qf-status" className="input" value={form.status} onChange={(e) => update('status', e.target.value)}>
            <option value="draft">Rascunho</option>
            <option value="published">Publicada</option>
          </select>
        </div>
        <div className="field">
          <label htmlFor="qf-order">Ordem</label>
          <input id="qf-order" type="number" className="input" value={form.sort_order} onChange={(e) => update('sort_order', e.target.value)} />
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
