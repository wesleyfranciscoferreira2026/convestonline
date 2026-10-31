import { useState } from 'react'
import { Link } from 'react-router-dom'
import { Plus } from 'lucide-react'
import QuickAdd from '../pages/QuickAdd'

export default function QuickAddButton() {
  const [open, setOpen] = useState(false)
  return (
    <>
      <button
        type="button"
        className="quick-add-fab"
        onClick={() => setOpen(true)}
        aria-label="Adicionar questão"
        title="Adicionar questão"
      >
        <Plus size={24} aria-hidden="true" />
      </button>
      {open && <QuickAdd onClose={() => setOpen(false)} />}
    </>
  )
}
