import { Link } from 'react-router-dom'
import { Sparkles } from 'lucide-react'
import { useEffect, useState } from 'react'

const TAGLINE = 'Seu próximo nível começa com o que você aprende hoje.'
const HIGHLIGHTS = [
  'Rotina de estudos organizada em poucos cliques',
  'Progresso e consistência sempre visíveis',
  'Conteúdo, exercícios e revisão em um só lugar',
]

/** Layout das telas públicas (login, cadastro, recuperar senha). */
export default function AuthLayout({ title, subtitle, children, footer }) {
  const [typedTagline, setTypedTagline] = useState('')
  const [typedHighlights, setTypedHighlights] = useState([false, false, false])
  const [taglineDone, setTaglineDone] = useState(false)

  useEffect(() => {
    let i = 0
    setTypedTagline('')
    setTypedHighlights([false, false, false])
    setTaglineDone(false)

    const timer = setInterval(() => {
      i++
      setTypedTagline(TAGLINE.slice(0, i))
      if (i >= TAGLINE.length) {
        clearInterval(timer)
        setTaglineDone(true)
      }
    }, 45)
    return () => clearInterval(timer)
  }, [])

  useEffect(() => {
    if (!taglineDone) return
    const timers = []
    HIGHLIGHTS.forEach((h, idx) => {
      const t = setTimeout(() => {
        setTypedHighlights((prev) => {
          const next = [...prev]
          next[idx] = true
          return next
        })
      }, idx * 600 + 200)
      timers.push(t)
    })
    return () => timers.forEach(clearTimeout)
  }, [taglineDone])

  return (
    <main className="auth-screen">
      <div className="auth-panel">
        <div className="auth-float-circles" aria-hidden="true">
          <span className="auth-circle auth-circle-1" />
          <span className="auth-circle auth-circle-2" />
          <span className="auth-circle auth-circle-3" />
          <span className="auth-circle auth-circle-4" />
          <span className="auth-circle auth-circle-5" />
        </div>
        <Link to="/login" className="auth-brand" aria-label="Convest+">
          <span className="brand-mark">convest+</span>
        </Link>
        <p className="auth-tagline">
          <Sparkles size={16} aria-hidden="true" />
          {typedTagline}
          {!taglineDone && <span className="typing-caret" aria-hidden="true">|</span>}
        </p>
        <ul className="auth-highlights">
          {HIGHLIGHTS.map((h, i) => (
            <li
              key={i}
              style={{
                opacity: typedHighlights[i] ? 1 : 0.2,
                transform: typedHighlights[i] ? 'translateY(0)' : 'translateY(6px)',
                transition: 'opacity 0.5s ease, transform 0.5s ease',
              }}
            >
              {h}
            </li>
          ))}
        </ul>
      </div>

      <div className="auth-form-area">
        <div className="auth-card">
          <h1>{title}</h1>
          {subtitle && <p className="auth-subtitle">{subtitle}</p>}
          {children}
          {footer && <div className="auth-footer">{footer}</div>}
        </div>
      </div>
    </main>
  )
}
