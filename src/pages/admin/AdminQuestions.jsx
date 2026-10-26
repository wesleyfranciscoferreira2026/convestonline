import { useEffect, useState } from 'react'
import { ClipboardList, Loader2, Pencil, Plus, Trash2, X } from 'lucide-react'
import { supabase } from '../../lib/supabaseClient'
import { useToast } from '../../components/Toast'
import { Card, EmptyState } from '../../components/ui'

const BUCKET = 'question-images'

async function uploadImage(file) {
  const ext = (file.name.split('.').pop() || 'png').toLowerCase()
  const path = `${crypto.randomUUID()}.${ext}`
  const { error } = await supabase.storage.from(BUCKET).upload(path, file, {
    contentType: file.type,
    upsert: false,
  })
  if (error) throw error
  return supabase.storage.from(BUCKET).getPublicUrl(path).data.publicUrl
}

export default function AdminQuestions() {
  const toast = useToast()
  const [subjects, setSubjects] = useState([])
  const [exams, setExams] = useState([])
  const [lessons, setLessons] = useState([])
  const [questions, setQuestions] = useState(null)
  const [filterSubject, setFilterSubject] = useState('')
  const [editing, setEditing] = useState(null)
  const [saving, setSaving] = useState(false)

  const blank = {
    subject_id: '',
    lesson_id: '',
    exam_id: '',
    year: '',
    topic: '',
    prompt: '',
    stem_image_url: null,
    options: ['', '', '', ''],
    option_images: [null, null, null, null],
    correct_index: 0,
    explanation: '',
    difficulty: 'medium',
    status: 'draft',
    sort_order: 0,
  }

  async function load() {
    const [{ data: subs }, { data: ex }, { data: ls }, { data: qs }] = await Promise.all([
      supabase.from('subjects').select('id, name').order('sort_order'),
      supabase.from('exams').select('id, name').order('sort_order'),
      supabase.from('lessons').select('id, title, subject_id').order('sort_order'),
      supabase
        .from('questions')
        .select('id, prompt, options, option_images, stem_image_url, correct_index, explanation, difficulty, topic, year, exam_id, status, sort_order, subject_id, lesson_id, subjects(name), lessons(title), exams(name)')
        .order('created_at', { ascending: false }),
    ])
    setSubjects(subs ?? [])
    setExams(ex ?? [])
    setLessons(ls ?? [])
    setQuestions(qs ?? [])
  }

  useEffect(() => { load() }, [])

  const filtered = filterSubject ? (questions ?? []).filter((q) => q.subject_id === filterSubject) : (questions ?? [])
  const filteredLessons = editing ? lessons.filter((l) => l.subject_id === editing.subject_id) : []

  async function save(form) {
    const opts = form.options.map((o) => o.trim())
    const imgs = opts.map((_, i) => form.option_images?.[i] || null)
    if (opts.length < 2) { toast('Adicione pelo menos 2 alternativas.', 'error'); return }
    const empty = opts.findIndex((o, i) => !o && !imgs[i])
    if (empty !== -1) { toast(`A alternativa ${String.fromCharCode(65 + empty)} está vazia (texto ou imagem).`, 'error'); return }
    if (Number(form.correct_index) >= opts.length) { toast('Índice da resposta correta inválido.', 'error'); return }

    setSaving(true)
    const payload = {
      subject_id: form.subject_id,
      lesson_id: form.lesson_id || null,
      exam_id: form.exam_id || null,
      year: form.year ? Number(form.year) : null,
      topic: form.topic.trim() || null,
      prompt: form.prompt.trim(),
      stem_image_url: form.stem_image_url || null,
      options: opts,
      option_images: imgs,
      correct_index: Number(form.correct_index),
      explanation: form.explanation.trim() || null,
      difficulty: form.difficulty,
      status: form.status,
      sort_order: Number(form.sort_order) || 0,
    }
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
          <p>Cadastre questões por prova, ano e tópico, com imagens no enunciado e nas alternativas.</p>
        </div>
        <button type="button" className="btn btn-primary" onClick={() => setEditing({ ...blank, options: ['', '', '', ''], option_images: [null, null, null, null] })}>
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
                <strong>{q.prompt.length > 140 ? q.prompt.slice(0, 140) + '…' : q.prompt}</strong>
                <span>
                  {q.subjects?.name}
                  {q.exams?.name ? ` · ${q.exams.name}` : ''}
                  {q.year ? ` ${q.year}` : ''}
                  {q.topic ? ` · ${q.topic}` : ''}
                  {` · ${q.options.length} alt. · ${q.difficulty}`}
                  {q.stem_image_url || q.option_images?.some(Boolean) ? ' · com imagem' : ''}
                </span>
              </div>
              <span className={`status-pill ${q.status === 'published' ? 'is-published' : 'is-draft'}`}>
                {q.status === 'published' ? 'Publicada' : 'Rascunho'}
              </span>
              <div className="admin-row-actions">
                <button
                  type="button"
                  className="icon-btn"
                  aria-label="Editar"
                  onClick={() => setEditing({
                    ...q,
                    lesson_id: q.lesson_id ?? '',
                    exam_id: q.exam_id ?? '',
                    year: q.year ?? '',
                    topic: q.topic ?? '',
                    stem_image_url: q.stem_image_url ?? null,
                    options: [...q.options],
                    option_images: q.options.map((_, i) => q.option_images?.[i] ?? null),
                  })}
                >
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
              exams={exams}
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

function ImageField({ id, label, url, onChange, onError }) {
  const [uploading, setUploading] = useState(false)

  async function handleFile(e) {
    const file = e.target.files?.[0]
    if (!file) return
    if (!file.type.startsWith('image/')) { onError('Envie um arquivo de imagem (PNG, JPG, WEBP).'); return }
    if (file.size > 3 * 1024 * 1024) { onError('A imagem deve ter no máximo 3 MB.'); return }
    setUploading(true)
    try {
      onChange(await uploadImage(file))
    } catch (err) {
      onError('Falha no upload: ' + err.message)
    } finally {
      setUploading(false)
      e.target.value = ''
    }
  }

  return (
    <div className="image-field">
      <label htmlFor={id} className="image-field-label">{label}</label>
      {url && (
        <div className="image-preview">
          <img src={url} alt="Pré-visualização da imagem" />
          <button type="button" className="btn btn-ghost btn-sm" onClick={() => onChange(null)}>Remover</button>
        </div>
      )}
      <input id={id} type="file" accept="image/*" onChange={handleFile} disabled={uploading} />
      {uploading && <span className="gen-hint">Enviando imagem…</span>}
    </div>
  )
}

function QuestionForm({ initial, subjects, exams, lessons, allLessons, saving, onSave, onCancel, onSubjectChange }) {
  const [form, setForm] = useState(initial)
  const [formError, setFormError] = useState('')
  useEffect(() => { setForm(initial) }, [initial])
  function update(k, v) { setForm((f) => ({ ...f, [k]: v })) }
  function updateOption(i, v) {
    setForm((f) => {
      const opts = [...f.options]
      opts[i] = v
      return { ...f, options: opts }
    })
  }
  function updateOptionImage(i, url) {
    setForm((f) => {
      const imgs = [...(f.option_images ?? f.options.map(() => null))]
      imgs[i] = url
      return { ...f, option_images: imgs }
    })
  }
  function addOption() {
    setForm((f) => ({ ...f, options: [...f.options, ''], option_images: [...(f.option_images ?? []), null] }))
  }
  const subjectLessons = allLessons.filter((l) => l.subject_id === form.subject_id)

  return (
    <form className="form" onSubmit={(e) => { e.preventDefault(); setFormError(''); onSave(form) }}>
      <div className="field">
        <label htmlFor="qf-subject">Matéria</label>
        <select id="qf-subject" className="input" required value={form.subject_id} onChange={(e) => onSubjectChange(e.target.value)}>
          <option value="">Selecione…</option>
          {subjects.map((s) => <option key={s.id} value={s.id}>{s.name}</option>)}
        </select>
      </div>

      <div className="task-form-row">
        <div className="field">
          <label htmlFor="qf-exam">Prova / banca</label>
          <select id="qf-exam" className="input" value={form.exam_id ?? ''} onChange={(e) => update('exam_id', e.target.value)}>
            <option value="">Nenhuma</option>
            {exams.map((x) => <option key={x.id} value={x.id}>{x.name}</option>)}
          </select>
        </div>
        <div className="field">
          <label htmlFor="qf-year">Ano</label>
          <input id="qf-year" type="number" className="input" min={1990} max={2100} placeholder="ex.: 2023" value={form.year ?? ''} onChange={(e) => update('year', e.target.value)} />
        </div>
        <div className="field">
          <label htmlFor="qf-topic">Tópico</label>
          <input id="qf-topic" className="input" placeholder="ex.: Eletrodinâmica" value={form.topic ?? ''} onChange={(e) => update('topic', e.target.value)} />
        </div>
      </div>

      <div className="field">
        <label htmlFor="qf-lesson">Aula (opcional)</label>
        <select id="qf-lesson" className="input" value={form.lesson_id ?? ''} onChange={(e) => update('lesson_id', e.target.value)}>
          <option value="">Nenhuma</option>
          {subjectLessons.map((l) => <option key={l.id} value={l.id}>{l.title}</option>)}
        </select>
      </div>

      <div className="field">
        <label htmlFor="qf-prompt">Enunciado (texto longo permitido; use linha em branco para separar parágrafos)</label>
        <textarea id="qf-prompt" className="input textarea" rows={8} required value={form.prompt} onChange={(e) => update('prompt', e.target.value)} />
      </div>

      <ImageField
        id="qf-stem-img"
        label="Imagem após o texto do enunciado (opcional)"
        url={form.stem_image_url}
        onChange={(url) => update('stem_image_url', url)}
        onError={setFormError}
      />

      <div className="field">
        <label>Alternativas (texto e/ou imagem)</label>
        {form.options.map((opt, i) => (
          <div key={i} className="option-edit-block">
            <div className="option-edit-row">
              <span className="option-letter">{String.fromCharCode(65 + i)}</span>
              <input
                type="text"
                className="input"
                aria-label={`Texto da alternativa ${String.fromCharCode(65 + i)}`}
                placeholder={`Alternativa ${String.fromCharCode(65 + i)}`}
                value={opt}
                onChange={(e) => updateOption(i, e.target.value)}
              />
              <label className="correct-radio">
                <input type="radio" name="correct" checked={form.correct_index === i} onChange={() => update('correct_index', i)} />
                correta
              </label>
            </div>
            <ImageField
              id={`qf-opt-img-${i}`}
              label={`Imagem da alternativa ${String.fromCharCode(65 + i)} (opcional)`}
              url={form.option_images?.[i] ?? null}
              onChange={(url) => updateOptionImage(i, url)}
              onError={setFormError}
            />
          </div>
        ))}
        <button type="button" className="btn btn-ghost btn-sm" onClick={addOption}>+ Alternativa</button>
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

      {formError && <p className="form-error" role="alert">{formError}</p>}

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
