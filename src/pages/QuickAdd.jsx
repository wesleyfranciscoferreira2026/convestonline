import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { ClipboardList, Loader2, Plus, X, Upload } from 'lucide-react'
import { supabase } from '../lib/supabaseClient'
import { useToast } from '../components/Toast'
import { Card, EmptyState } from '../components/ui'

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

export default function QuickAdd() {
  const toast = useToast()
  const [subjects, setSubjects] = useState([])
  const [exams, setExams] = useState([])
  const [saving, setSaving] = useState(false)
  const [form, setForm] = useState({
    subject_id: '',
    exam_id: '',
    year: '',
    topic: '',
    imageFile: null,
    imagePreview: null,
    correct_index: 0,
    hasImage: true,
  })

  useEffect(() => {
    Promise.all([
      supabase.from('subjects').select('id, name').order('sort_order'),
      supabase.from('exams').select('id, name').order('sort_order'),
    ]).then(([subs, ex]) => {
      setSubjects(subs.data ?? [])
      setExams(ex.data ?? [])
    })
  }, [])

  function handleFile(e) {
    const file = e.target.files?.[0]
    if (!file) return
    if (!file.type.startsWith('image/')) { toast('Envie uma imagem.', 'error'); return }
    setForm((f) => ({ ...f, imageFile: file, imagePreview: URL.createObjectURL(file) }))
  }

  async function save() {
    if (!form.subject_id) { toast('Selecione a matéria.', 'error'); return }
    setSaving(true)
    try {
      let imageUrl = null
      if (form.hasImage && form.imageFile) {
        imageUrl = await uploadImage(form.imageFile)
      }
      const { error } = await supabase.from('questions').insert({
        subject_id: form.subject_id,
        exam_id: form.exam_id || null,
        year: form.year ? Number(form.year) : null,
        topic: form.topic.trim() || null,
        question_type: 'multiple_choice',
        prompt: '',
        stem_image_url: imageUrl,
        options: ['A', 'B', 'C', 'D', 'E'],
        option_images: [null, null, null, null, null],
        correct_index: Number(form.correct_index),
        difficulty: 'medium',
        status: 'draft',
        sort_order: 0,
      })
      if (error) throw error
      toast('Questão criada!')
      setForm({ subject_id: form.subject_id, exam_id: form.exam_id, year: form.year, topic: form.topic, imageFile: null, imagePreview: null, correct_index: 0, hasImage: true })
    } catch (err) {
      toast('Erro: ' + err.message, 'error')
    } finally {
      setSaving(false)
    }
  }

  return (
    <div className="page">
      <header className="page-header">
        <div>
          <h2>Adicionar Questão Rápida</h2>
          <p>Adicione questões com imagem e selecione a alternativa correta.</p>
        </div>
      </header>

      <Card>
        <div className="form">
          <div className="field">
            <label>Matéria *</label>
            <select className="input" value={form.subject_id} onChange={(e) => setForm((f) => ({ ...f, subject_id: e.target.value }))}>
              <option value="">Selecione…</option>
              {subjects.map((s) => <option key={s.id} value={s.id}>{s.name}</option>)}
            </select>
          </div>
          <div className="task-form-row">
            <div className="field">
              <label>Prova / banca</label>
              <select className="input" value={form.exam_id} onChange={(e) => setForm((f) => ({ ...f, exam_id: e.target.value }))}>
                <option value="">Nenhuma</option>
                {exams.map((x) => <option key={x.id} value={x.id}>{x.name}</option>)}
              </select>
            </div>
            <div className="field">
              <label>Ano</label>
              <input type="number" className="input" placeholder="ex.: 2023" value={form.year} onChange={(e) => setForm((f) => ({ ...f, year: e.target.value }))} />
            </div>
            <div className="field">
              <label>Tópico</label>
              <input className="input" placeholder="ex.: Cinemática" value={form.topic} onChange={(e) => setForm((f) => ({ ...f, topic: e.target.value }))} />
            </div>
          </div>

          <div className="field">
            <label>Imagem da questão (opcional)</label>
            <label style={{ display: 'flex', alignItems: 'center', gap: 8, cursor: 'pointer' }}>
              <input type="checkbox" checked={form.hasImage} onChange={(e) => setForm((f) => ({ ...f, hasImage: e.target.checked }))} />
              Incluir imagem
            </label>
            {form.hasImage && (
              <>
                <input type="file" accept="image/*" onChange={handleFile} />
                {form.imagePreview && (
                  <div className="image-preview" style={{ marginTop: 8 }}>
                    <img src={form.imagePreview} alt="Preview" style={{ maxWidth: 300, maxHeight: 200 }} />
                    <button type="button" className="btn btn-ghost btn-sm" onClick={() => setForm((f) => ({ ...f, imageFile: null, imagePreview: null }))}>Remover</button>
                  </div>
                )}
              </>
            )}
          </div>

          <div className="field">
            <label>Alternativa correta</label>
            <div style={{ display: 'flex', gap: 8 }}>
              {['A', 'B', 'C', 'D', 'E'].map((letter, i) => (
                <button
                  key={letter}
                  type="button"
                  className={`btn btn-sm ${form.correct_index === i ? 'btn-primary' : 'btn-ghost'}`}
                  onClick={() => setForm((f) => ({ ...f, correct_index: i }))}
                >
                  {letter}
                </button>
              ))}
            </div>
          </div>

          <div className="task-form-actions">
            <button type="button" className="btn btn-primary btn-sm" onClick={save} disabled={saving}>
              {saving && <Loader2 size={15} className="spin" aria-hidden="true" />}
              {saving ? 'Salvando…' : 'Criar questão'}
            </button>
          </div>
        </div>
      </Card>
    </div>
  )
}
