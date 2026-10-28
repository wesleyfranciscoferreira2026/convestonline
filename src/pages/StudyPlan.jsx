import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import {
  ArrowLeft,
  Calendar,
  CheckCircle2,
  Clock,
  Plus,
  Target,
  Trash2,
  X,
} from 'lucide-react'
import { supabase } from '../lib/supabaseClient'
import { useAuth } from '../lib/auth'
import { useToast } from '../components/Toast'
import SubjectIcon from '../components/SubjectIcon'
import { Card, EmptyState } from '../components/ui'

const STORAGE_KEY = 'convest-study-plans'

function loadPlans(userId) {
  try {
    const raw = localStorage.getItem(STORAGE_KEY + ':' + (userId || 'guest'))
    return raw ? JSON.parse(raw) : []
  } catch {
    return []
  }
}

function savePlans(userId, plans) {
  try {
    localStorage.setItem(STORAGE_KEY + ':' + (userId || 'guest'), JSON.stringify(plans))
  } catch { /* ignora */ }
}

const WEEKDAYS = ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb']

export default function StudyPlan() {
  const { user } = useAuth()
  const toast = useToast()
  const [subjects, setSubjects] = useState([])
  const [plans, setPlans] = useState([])
  const [loading, setLoading] = useState(true)
  const [creating, setCreating] = useState(false)

  // Form state
  const [name, setName] = useState('')
  const [selectedSubjects, setSelectedSubjects] = useState([])
  const [dailyMinutes, setDailyMinutes] = useState(60)
  const [weeks, setWeeks] = useState(4)
  const [daysPerWeek, setDaysPerWeek] = useState(5)

  useEffect(() => {
    let active = true
    async function load() {
      const { data } = await supabase
        .from('subjects')
        .select('id, slug, name, icon')
        .order('sort_order')
      if (!active) return
      setSubjects(data ?? [])
      setPlans(loadPlans(user?.id))
      setLoading(false)
    }
    load()
    return () => { active = false }
  }, [user])

  function toggleSubject(id) {
    setSelectedSubjects((prev) =>
      prev.includes(id) ? prev.filter((x) => x !== id) : [...prev, id]
    )
  }

  function generateSchedule() {
    // Distribui as matérias selecionadas pelos dias da semana ativos.
    const activeDays = []
    // Começa na segunda (1) e conta daysPerWeek dias.
    for (let i = 0; i < daysPerWeek; i++) {
      activeDays.push(((1 + i) % 7))
    }
    const chosen = subjects.filter((s) => selectedSubjects.includes(s.id))
    if (chosen.length === 0) return []
    const schedule = activeDays.map((day, idx) => ({
      day,
      subjects: [chosen[idx % chosen.length]],
    }))
    return schedule
  }

  function handleCreate(e) {
    e.preventDefault()
    if (!name.trim()) { toast('Dê um nome ao plano.', 'error'); return }
    if (selectedSubjects.length === 0) { toast('Selecione ao menos uma matéria.', 'error'); return }
    const plan = {
      id: 'plan-' + Date.now(),
      name: name.trim(),
      subjectIds: selectedSubjects,
      dailyMinutes,
      weeks,
      daysPerWeek,
      schedule: generateSchedule(),
      createdAt: new Date().toISOString(),
      completedDays: [],
    }
    const next = [plan, ...plans]
    setPlans(next)
    savePlans(user?.id, next)
    setCreating(false)
    setName('')
    setSelectedSubjects([])
    setDailyMinutes(60)
    setWeeks(4)
    setDaysPerWeek(5)
    toast('Plano de estudos criado!')
  }

  function handleDelete(id) {
    const next = plans.filter((p) => p.id !== id)
    setPlans(next)
    savePlans(user?.id, next)
    toast('Plano removido.')
  }

  function toggleDay(planId, dayIndex) {
    setPlans((prev) => {
      const next = prev.map((p) => {
        if (p.id !== planId) return p
        const set = new Set(p.completedDays)
        if (set.has(dayIndex)) set.delete(dayIndex)
        else set.add(dayIndex)
        return { ...p, completedDays: Array.from(set) }
      })
      savePlans(user?.id, next)
      return next
    })
  }

  if (loading) {
    return (
      <div className="page">
        <Card><div style={{ height: 80 }} /></Card>
      </div>
    )
  }

  return (
    <div className="page">
      <Link to="/" className="back-link">
        <ArrowLeft size={16} aria-hidden="true" /> Voltar ao início
      </Link>
      <header className="page-header">
        <h2>Plano de estudos</h2>
        <p>Crie e acompanhe seu plano de estudos personalizado.</p>
      </header>

      {!creating && (
        <div style={{ marginBottom: 16 }}>
          <button type="button" className="btn btn-primary" onClick={() => setCreating(true)}>
            <Plus size={16} aria-hidden="true" /> Criar novo plano
          </button>
        </div>
      )}

      {creating && (
        <Card>
          <form onSubmit={handleCreate} className="form-grid" style={{ display: 'grid', gap: 12 }}>
            <div>
              <label className="form-label" style={{ display: 'block', marginBottom: 4, fontSize: 13, fontWeight: 600 }}>Nome do plano</label>
              <input
                type="text"
                className="input"
                value={name}
                onChange={(e) => setName(e.target.value)}
                placeholder="Ex.: Revisão para a prova de Direito"
                style={{ width: '100%' }}
              />
            </div>

            <div>
              <label className="form-label" style={{ display: 'block', marginBottom: 6, fontSize: 13, fontWeight: 600 }}>Matérias</label>
              <div style={{ display: 'flex', flexWrap: 'wrap', gap: 8 }}>
                {subjects.map((s) => {
                  const active = selectedSubjects.includes(s.id)
                  return (
                    <button
                      key={s.id}
                      type="button"
                      className={`btn btn-sm ${active ? 'btn-primary' : 'btn-outline'}`}
                      onClick={() => toggleSubject(s.id)}
                    >
                      <SubjectIcon name={s.icon} size={14} /> {s.name}
                    </button>
                  )
                })}
              </div>
            </div>

            <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr 1fr', gap: 12 }}>
              <div>
                <label className="form-label" style={{ display: 'block', marginBottom: 4, fontSize: 13, fontWeight: 600 }}>Minutos por dia</label>
                <input
                  type="number"
                  min={10}
                  max={240}
                  className="input"
                  value={dailyMinutes}
                  onChange={(e) => setDailyMinutes(Number(e.target.value) || 60)}
                  style={{ width: '100%' }}
                />
              </div>
              <div>
                <label className="form-label" style={{ display: 'block', marginBottom: 4, fontSize: 13, fontWeight: 600 }}>Duração (semanas)</label>
                <input
                  type="number"
                  min={1}
                  max={24}
                  className="input"
                  value={weeks}
                  onChange={(e) => setWeeks(Number(e.target.value) || 4)}
                  style={{ width: '100%' }}
                />
              </div>
              <div>
                <label className="form-label" style={{ display: 'block', marginBottom: 4, fontSize: 13, fontWeight: 600 }}>Dias por semana</label>
                <input
                  type="number"
                  min={1}
                  max={7}
                  className="input"
                  value={daysPerWeek}
                  onChange={(e) => setDaysPerWeek(Number(e.target.value) || 5)}
                  style={{ width: '100%' }}
                />
              </div>
            </div>

            <div style={{ display: 'flex', gap: 8 }}>
              <button type="submit" className="btn btn-primary">Salvar plano</button>
              <button type="button" className="btn btn-ghost" onClick={() => setCreating(false)}>
                <X size={16} aria-hidden="true" /> Cancelar
              </button>
            </div>
          </form>
        </Card>
      )}

      {plans.length === 0 && !creating ? (
        <Card>
          <EmptyState
            icon={Calendar}
            title="Nenhum plano de estudos"
            description="Crie seu primeiro plano para organizar sua rotina de estudos."
            action={<button type="button" className="btn btn-primary" onClick={() => setCreating(true)}>Criar plano</button>}
          />
        </Card>
      ) : (
        <div style={{ display: 'grid', gap: 16 }}>
          {plans.map((plan) => {
            const chosen = subjects.filter((s) => plan.subjectIds.includes(s.id))
            const totalDays = plan.weeks * plan.daysPerWeek
            const doneCount = (plan.completedDays || []).length
            return (
              <Card key={plan.id}>
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', marginBottom: 12 }}>
                  <div>
                    <h3 style={{ margin: 0 }}>{plan.name}</h3>
                    <p className="muted" style={{ margin: '4px 0 0', fontSize: 13 }}>
                      {plan.weeks} semanas · {plan.daysPerWeek} dias/sem · {plan.dailyMinutes} min/dia
                    </p>
                  </div>
                  <button type="button" className="icon-btn" aria-label="Remover plano" onClick={() => handleDelete(plan.id)}>
                    <Trash2 size={16} />
                  </button>
                </div>

                <div style={{ display: 'flex', flexWrap: 'wrap', gap: 6, marginBottom: 12 }}>
                  {chosen.map((s) => (
                    <span key={s.id} className="chip" style={{ display: 'inline-flex', alignItems: 'center', gap: 4, padding: '4px 8px', borderRadius: 999, background: 'var(--bg-soft, #f3f4f6)', fontSize: 12 }}>
                      <SubjectIcon name={s.icon} size={12} /> {s.name}
                    </span>
                  ))}
                </div>

                <div style={{ marginBottom: 8, fontSize: 13, fontWeight: 600 }}>
                  Rotina semanal
                </div>
                <div style={{ display: 'grid', gridTemplateColumns: 'repeat(7, 1fr)', gap: 6, marginBottom: 12 }}>
                  {WEEKDAYS.map((wd, i) => {
                    const entry = (plan.schedule || []).find((e) => e.day === i)
                    const subs = entry ? entry.subjects : []
                    return (
                      <div
                        key={i}
                        style={{
                          padding: 6,
                          borderRadius: 8,
                          border: '1px solid var(--border, #e5e7eb)',
                          textAlign: 'center',
                          fontSize: 11,
                          background: subs.length ? 'var(--bg-soft, #f3f4f6)' : 'transparent',
                        }}
                      >
                        <strong>{wd}</strong>
                        {subs.map((s) => (
                          <div key={s.id} style={{ marginTop: 4 }}>
                            <SubjectIcon name={s.icon} size={12} />
                          </div>
                        ))}
                      </div>
                    )
                  })}
                </div>

                <div style={{ display: 'flex', alignItems: 'center', gap: 8, fontSize: 13 }}>
                  <Target size={14} aria-hidden="true" />
                  <span>Progresso: {doneCount} de {totalDays} dias concluídos</span>
                </div>
                <div style={{ display: 'flex', flexWrap: 'wrap', gap: 4, marginTop: 8 }}>
                  {Array.from({ length: totalDays }).map((_, i) => {
                    const done = (plan.completedDays || []).includes(i)
                    return (
                      <button
                        key={i}
                        type="button"
                        title={`Dia ${i + 1}`}
                        onClick={() => toggleDay(plan.id, i)}
                        style={{
                          width: 22,
                          height: 22,
                          borderRadius: 4,
                          border: '1px solid var(--border, #e5e7eb)',
                          background: done ? 'var(--accent, #66CCCC)' : 'transparent',
                          cursor: 'pointer',
                          fontSize: 9,
                          color: done ? '#fff' : 'inherit',
                        }}
                      >
                        {done ? '✓' : i + 1}
                      </button>
                    )
                  })}
                </div>
              </Card>
            )
          })}
        </div>
      )}
    </div>
  )
}
