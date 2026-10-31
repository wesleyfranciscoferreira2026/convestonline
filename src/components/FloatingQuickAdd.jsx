import { useState } from 'react'
import QuickAdd from '../pages/QuickAdd'

export default function FloatingQuickAdd() {
  const [open, setOpen] = useState(false)
  return (
    <>
      <button
        type="button"
        className="quick-add-fab"
        onClick={() => setOpen(true)}
        aria-label="Adicionar questão"
        title="Adicionar questão"
        style={{ position: 'fixed', bottom: 24, right: 24, zIndex: 9999 }}
      >
        <span style={{ fontSize: 28, lineHeight: 1 }}>+</span>
      </button>
      {open && <QuickAdd onClose={() => setOpen(false)} />}
    </>
  )
}
