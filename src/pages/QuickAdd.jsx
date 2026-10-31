import { useEffect, useRef, useState } from 'react'
import { Link } from 'react-router-dom'
import { ClipboardList, Loader2, Plus, X, Upload, Crop, ArrowLeft, Scissors } from 'lucide-react'
import { supabase } from '../lib/supabaseClient'
import { useToast } from '../components/Toast'
import { Card } from '../components/ui'

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

export default function QuickAdd({ onClose }) {
  const toast = useToast()
  const [subjects, setSubjects] = useState([])
  const [saving, setSaving] = useState(false)
  const [files, setFiles] = useState([])
  const [cropIndex, setCropIndex] = useState(null)
  const [form, setForm] = useState({
    subject_id: '',
    year: '',
    correct_index: 0,
  })

  useEffect(() => {
    supabase.from('subjects').select('id, name').order('sort_order').then(({ data }) => {
      setSubjects(data ?? [])
    })
  }, [])

  function handleFiles(e) {
    const selected = Array.from(e.target.files || [])
    if (selected.length === 0) return
    const newFiles = selected.map((f) => ({
      file: f,
      preview: URL.createObjectURL(f),
      croppedFile: null,
      crop: null,
    }))
    setFiles((prev) => [...prev, ...newFiles])
    e.target.value = ''
  }

  function removeFile(idx) {
    setFiles((prev) => prev.filter((_, i) => i !== idx))
    if (cropIndex === idx) setCropIndex(null)
  }

  async function saveAll() {
    if (!form.subject_id) { toast('Selecione a matéria.', 'error'); return }
    if (files.length === 0) { toast('Selecione pelo menos uma imagem.', 'error'); return }
    setSaving(true)
    let done = 0
    let errors = 0
    const errorMessages = []
    for (const f of files) {
      try {
        const fileToUpload = f.croppedFile || f.file
        const url = await uploadImage(fileToUpload)
        const { error } = await supabase.from('questions').insert({
          subject_id: form.subject_id,
          year: form.year ? Number(form.year) : null,
          question_type: 'multiple_choice',
          prompt: '',
          stem_image_url: url,
          options: ['A', 'B', 'C', 'D', 'E'],
          option_images: [null, null, null, null, null],
          correct_index: Number(form.correct_index),
          difficulty: 'medium',
          status: 'published',
          sort_order: 0,
        })
        if (error) throw new Error(error.message)
        done++
      } catch (err) {
        errors++
        errorMessages.push(err.message)
        console.error('Insert error:', err)
      }
    }
    setSaving(false)
    if (errors > 0) {
      toast(`${done} criada(s), ${errors} erro(s): ${errorMessages[0]}`, 'error')
    } else {
      toast(`${done} questão(ões) criada(s) com sucesso!`)
    }
    if (done > 0) {
      setFiles([])
      if (onClose) onClose()
    }
  }

  const content = (
    <div className="form">
      <div className="field">
        <label>Matéria *</label>
        <select className="input" value={form.subject_id} onChange={(e) => setForm((f) => ({ ...f, subject_id: e.target.value }))}>
          <option value="">Selecione…</option>
          {subjects.map((s) => <option key={s.id} value={s.id}>{s.name}</option>)}
        </select>
      </div>
      <div className="field">
        <label>Ano</label>
        <input type="number" className="input" placeholder="ex.: 2023" value={form.year} onChange={(e) => setForm((f) => ({ ...f, year: e.target.value }))} />
      </div>

      <div className="field">
        <label>Alternativa correta (aplicada a todas)</label>
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

      <div className="field">
        <label>Imagens das questões (selecione quantas quiser)</label>
        <input type="file" accept="image/*" multiple onChange={handleFiles} />
      </div>

      {files.length > 0 && (
        <div style={{ display: 'flex', flexWrap: 'wrap', gap: 12, marginTop: 12 }}>
          {files.map((f, idx) => (
            <InlineCrop
              key={idx}
              file={f}
              onCrop={(cropped) => {
                setFiles((prev) => prev.map((x, i) => i === idx ? { ...x, croppedFile: cropped, preview: URL.createObjectURL(cropped) } : x))
              }}
              onRemove={() => removeFile(idx)}
            />
          ))}
        </div>
      )}

      <div className="task-form-actions" style={{ marginTop: 16 }}>
        <button type="button" className="btn btn-primary btn-sm" onClick={saveAll} disabled={saving || files.length === 0}>
          {saving && <Loader2 size={15} className="spin" aria-hidden="true" />}
          {saving ? 'Enviando…' : `Criar ${files.length} questão(ões)`}
        </button>
      </div>
    </div>
  )

  if (onClose) {
    return (
      <div className="sheet-overlay" onClick={onClose} style={{ zIndex: 50 }}>
        <div className="sheet admin-sheet" role="dialog" aria-modal="true" onClick={(e) => e.stopPropagation()}>
          <div className="sheet-header">
            <strong>Adicionar Questões</strong>
            <button type="button" className="icon-btn" aria-label="Fechar" onClick={onClose}>
              <X size={19} />
            </button>
          </div>
          {content}
        </div>
      </div>
    )
  }

  return (
    <div className="page">
      <header className="page-header">
        <div>
          <h2>Adicionar Questões</h2>
          <p>Adicione questões com imagem e selecione a alternativa correta. Você pode recortar cada imagem antes de enviar.</p>
        </div>
        <Link to="/" className="btn btn-ghost btn-sm">
          <ArrowLeft size={16} aria-hidden="true" /> Voltar ao início
        </Link>
      </header>
      <Card>
        {content}
      </Card>
    </div>
  )
}

// Inline crop component - shows image with drag-to-crop
function InlineCrop({ file, onCrop, onRemove }) {
  const canvasRef = useRef(null)
  const imgRef = useRef(null)
  const [ready, setReady] = useState(false)
  const [crop, setCrop] = useState(null)
  const [dragging, setDragging] = useState(false)
  const [start, setStart] = useState(null)
  const [cropped, setCropped] = useState(false)

  useEffect(() => {
    const image = new Image()
    imgRef.current = image
    image.onload = () => {
      setReady(true)
      const c = canvasRef.current
      if (c) {
        c.width = image.width
        c.height = image.height
        const ctx = c.getContext('2d')
        ctx.drawImage(image, 0, 0)
      }
    }
    image.src = URL.createObjectURL(file.file || file)
    return () => URL.revokeObjectURL(image.src)
  }, [file])

  function getPos(e) {
    const c = canvasRef.current
    if (!c) return { x: 0, y: 0 }
    const rect = c.getBoundingClientRect()
    const scaleX = c.width / rect.width
    const scaleY = c.height / rect.height
    return {
      x: Math.round((e.clientX - rect.left) * scaleX),
      y: Math.round((e.clientY - rect.top) * scaleY),
    }
  }

  function onMouseDown(e) {
    if (!ready) return
    setDragging(true)
    setStart(getPos(e))
    setCrop(null)
  }

  function onMouseMove(e) {
    if (!dragging || !start) return
    const pos = getPos(e)
    setCrop({
      x: Math.min(start.x, pos.x),
      y: Math.min(start.y, pos.y),
      w: Math.abs(pos.x - start.x),
      h: Math.abs(pos.y - start.y),
    })
  }

  function onMouseUp() {
    setDragging(false)
    // Redraw with crop selection
    const c = canvasRef.current
    const img = imgRef.current
    if (!c || !img) return
    const ctx = c.getContext('2d')
    ctx.drawImage(img, 0, 0)
    if (crop && crop.w > 0 && crop.h > 0) {
      ctx.strokeStyle = '#66cccc'
      ctx.lineWidth = 3
      ctx.strokeRect(crop.x, crop.y, crop.w, crop.h)
      ctx.fillStyle = 'rgba(102, 204, 204, 0.2)'
      ctx.fillRect(crop.x, crop.y, crop.w, crop.h)
    }
  }

  // Redraw when crop changes
  useEffect(() => {
    const c = canvasRef.current
    const img = imgRef.current
    if (!c || !img || !ready) return
    const ctx = c.getContext('2d')
    ctx.drawImage(img, 0, 0)
    if (crop && crop.w > 0 && crop.h > 0) {
      ctx.strokeStyle = '#66cccc'
      ctx.lineWidth = 3
      ctx.strokeRect(crop.x, crop.y, crop.w, crop.h)
      ctx.fillStyle = 'rgba(102, 204, 204, 0.2)'
      ctx.fillRect(crop.x, crop.y, crop.w, crop.h)
    }
  }, [crop, ready])

  function confirmCrop() {
    const img = imgRef.current
    if (!crop || crop.w < 10 || crop.h < 10 || !img) {
      onCrop(file.file || file)
      setCropped(true)
      return
    }
    const c = document.createElement('canvas')
    c.width = crop.w
    c.height = crop.h
    const ctx = c.getContext('2d')
    ctx.drawImage(img, crop.x, crop.y, crop.w, crop.h, 0, 0, crop.w, crop.h)
    c.toBlob((blob) => {
      if (!blob) { onCrop(file.file || file); return }
      const croppedFile = new File([blob], (file.file || file).name.replace(/\.\w+$/, '.jpg'), { type: 'image/jpeg' })
      onCrop(croppedFile)
      setCropped(true)
    }, 'image/jpeg', 0.92)
  }

  return (
    <div style={{ position: 'relative', width: 160, textAlign: 'center' }}>
      <div style={{ overflow: 'auto', maxHeight: 200, border: '1px solid var(--color-border)', borderRadius: 6, background: '#111' }}>
        {!ready && <p style={{ padding: 10, textAlign: 'center', color: '#fff', fontSize: 11 }}>Carregando…</p>}
        <canvas
          ref={canvasRef}
          style={{ maxWidth: '100%', cursor: 'crosshair', display: ready ? 'block' : 'none' }}
          onMouseDown={onMouseDown}
          onMouseMove={onMouseMove}
          onMouseUp={onMouseUp}
          onMouseLeave={onMouseUp}
        />
      </div>
      <div style={{ display: 'flex', gap: 4, marginTop: 4, justifyContent: 'center' }}>
        <button
          type="button"
          className="btn btn-ghost btn-sm"
          style={{ fontSize: 10, padding: '2px 6px' }}
          onClick={confirmCrop}
          disabled={!ready}
        >
          <Scissors size={10} /> Recortar
        </button>
        <button
          type="button"
          className="icon-btn icon-btn-danger"
          style={{ width: 20, height: 20 }}
          onClick={onRemove}
        >
          <X size={12} />
        </button>
      </div>
      {cropped && <span style={{ fontSize: 10, color: 'green' }}>✓ recortado</span>}
    </div>
  )
}
