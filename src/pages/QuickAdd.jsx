import { useEffect, useRef, useState } from 'react'
import { Link } from 'react-router-dom'
import { ClipboardList, Loader2, Plus, X, Upload, Crop, ArrowLeft } from 'lucide-react'
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

function CropModal({ file, onConfirm, onCancel }) {
  const canvasRef = useRef(null)
  const [img, setImg] = useState(null)
  const [crop, setCrop] = useState(null)
  const [dragging, setDragging] = useState(false)
  const [start, setStart] = useState(null)
  const [ready, setReady] = useState(false)

  useEffect(() => {
    const image = new Image()
    image.onload = () => {
      setImg(image)
      setReady(true)
      if (canvasRef.current) {
        const c = canvasRef.current
        c.width = image.width
        c.height = image.height
        const ctx = c.getContext('2d')
        ctx.drawImage(image, 0, 0)
      }
    }
    image.onerror = () => {
      console.error('Failed to load image')
      setReady(false)
    }
    image.src = URL.createObjectURL(file)
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
    if (!img) return
    setDragging(true)
    setStart(getPos(e))
    setCrop(null)
  }

  function onMouseMove(e) {
    if (!dragging || !start || !img) return
    const pos = getPos(e)
    const x = Math.min(start.x, pos.x)
    const y = Math.min(start.y, pos.y)
    const w = Math.abs(pos.x - start.x)
    const h = Math.abs(pos.y - start.y)
    setCrop({ x, y, w, h })
    const c = canvasRef.current
    const ctx = c.getContext('2d')
    ctx.drawImage(img, 0, 0)
    ctx.strokeStyle = '#66cccc'
    ctx.lineWidth = 2
    ctx.strokeRect(x, y, w, h)
    ctx.fillStyle = 'rgba(102, 204, 204, 0.15)'
    ctx.fillRect(x, y, w, h)
  }

  function onMouseUp() { setDragging(false) }

  function confirm() {
    if (!crop || crop.w < 10 || crop.h < 10 || !img) {
      onConfirm(file)
      return
    }
    const c = document.createElement('canvas')
    c.width = crop.w
    c.height = crop.h
    const ctx = c.getContext('2d')
    ctx.drawImage(img, crop.x, crop.y, crop.w, crop.h, 0, 0, crop.w, crop.h)
    c.toBlob((blob) => {
      if (!blob) { onConfirm(file); return }
      const croppedFile = new File([blob], file.name.replace(/\.\w+$/, '.jpg'), { type: 'image/jpeg' })
      onConfirm(croppedFile)
    }, 'image/jpeg', 0.92)
  }

  return (
    <div className="sheet-overlay" onClick={onCancel}>
      <div className="sheet" role="dialog" aria-modal="true" onClick={(e) => e.stopPropagation()} style={{ maxWidth: 700 }}>
        <div className="sheet-header">
          <strong>Recortar imagem</strong>
          <button type="button" className="icon-btn" aria-label="Fechar" onClick={onCancel}>
            <X size={19} />
          </button>
        </div>
        <p style={{ fontSize: 13, color: 'var(--color-text-secondary)', marginBottom: 8 }}>
          Arraste para selecionar a área da questão. Se não selecionar, a imagem inteira será usada.
        </p>
        <div style={{ overflow: 'auto', maxHeight: 400, border: '1px solid var(--color-border)', borderRadius: 8 }}>
          {!ready && <p style={{ padding: 20, textAlign: 'center' }}>Carregando imagem…</p>}
          <canvas
            ref={canvasRef}
            style={{ maxWidth: '100%', cursor: 'crosshair', display: ready ? 'block' : 'none' }}
            onMouseDown={onMouseDown}
            onMouseMove={onMouseMove}
            onMouseUp={onMouseUp}
            onMouseLeave={onMouseUp}
          />
        </div>
        <div className="task-form-actions" style={{ marginTop: 12 }}>
          <button type="button" className="btn btn-ghost btn-sm" onClick={onCancel}>Cancelar</button>
          <button type="button" className="btn btn-primary btn-sm" onClick={confirm} disabled={!ready}>
            <Crop size={15} aria-hidden="true" /> Confirmar recorte
          </button>
        </div>
      </div>
    </div>
  )
}

export default function QuickAdd({ onClose }) {
  const toast = useToast()
  const [subjects, setSubjects] = useState([])
  const [exams, setExams] = useState([])
  const [saving, setSaving] = useState(false)
  const [files, setFiles] = useState([])
  const [cropIndex, setCropIndex] = useState(null)
  const [form, setForm] = useState({
    subject_id: '',
    exam_id: '',
    year: '',
    correct_index: 0,
  })

  useEffect(() => {
    Promise.all([
      supabase.from('subjects').select('id, name').order('sort_order'),
      supabase.from('exams').select('id, name').order('sort_order'),
    ]).then(([subs, ex]) => {
      setSubjects(subs.data ?? [])
      setExams(ex.data ?? [])
      // Default to ENEM exam
      const enem = (ex.data ?? []).find((e) => e.name.toLowerCase().includes('enem'))
      if (enem) setForm((f) => ({ ...f, exam_id: enem.id }))
    })
  }, [])

  function handleFiles(e) {
    const selected = Array.from(e.target.files || [])
    if (selected.length === 0) return
    const newFiles = selected.map((f) => ({
      file: f,
      preview: URL.createObjectURL(f),
      croppedFile: null,
    }))
    setFiles((prev) => [...prev, ...newFiles])
    e.target.value = ''
  }

  function removeFile(idx) {
    setFiles((prev) => prev.filter((_, i) => i !== idx))
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
          exam_id: form.exam_id || null,
          year: form.year ? Number(form.year) : null,
          question_type: 'multiple_choice',
          prompt: '',
          stem_image_url: url,
          options: ['A', 'B', 'C', 'D', 'E'],
          option_images: [null, null, null, null, null],
          correct_index: Number(form.correct_index),
          difficulty: 'medium',
          status: 'draft',
          sort_order: 0,
        })
        if (error) throw new Error(error.message)
        done++
      } catch (err) {
        errors++
        errorMessages.push(err.message)
      }
    }
    setSaving(false)
    const subjectName = subjects.find((s) => s.id === form.subject_id)?.name || 'Matéria'
    const examName = exams.find((x) => x.id === form.exam_id)?.name || ''
    if (errors > 0) {
      toast(`${done} criada(s), ${errors} erro(s): ${errorMessages[0]}`, 'error')
    } else {
      toast(`${done} questão(ões) criada(s) em ${subjectName}${examName ? ' · ' + examName : ''}${form.year ? ' · ' + form.year : ''}!`)
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
            <div key={idx} style={{ position: 'relative', width: 120, textAlign: 'center' }}>
              <img src={f.preview} alt="" style={{ width: 120, height: 80, objectFit: 'cover', borderRadius: 6, border: '1px solid var(--color-border)' }} />
              <button
                type="button"
                className="btn btn-ghost btn-sm"
                style={{ marginTop: 4, fontSize: 11 }}
                onClick={() => setCropIndex(idx)}
              >
                <Crop size={12} /> Recortar
              </button>
              <button
                type="button"
                className="icon-btn icon-btn-danger"
                style={{ position: 'absolute', top: 2, right: 2 }}
                onClick={() => removeFile(idx)}
              >
                <X size={14} />
              </button>
              {f.croppedFile && <span style={{ fontSize: 10, color: 'green' }}>✓ recortado</span>}
            </div>
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
      <div className="sheet-overlay" onClick={onClose}>
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

      {cropIndex !== null && files[cropIndex] && (
        <CropModal
          file={files[cropIndex].croppedFile || files[cropIndex].file}
          onConfirm={(cropped) => {
            setFiles((prev) => prev.map((f, i) => i === cropIndex ? { ...f, croppedFile: cropped, preview: URL.createObjectURL(cropped) } : f))
            setCropIndex(null)
          }}
          onCancel={() => setCropIndex(null)}
        />
      )}
    </div>
  )
}
