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
  const [typedHighlights, setTypedHighlights] = useState([])
  const [currentHighlight, setCurrentHighlight] = useState(0)
  const [typingHighlight, setTypingHighlight] = useState('')

  useEffect(() => {
    let i = 0
    setTypedTagline('')
    const timer = setInterval(() => {
      i++
      setTypedTagline(TAGLINE.slice(0, i))
      if (i >= TAGLINE.length) {
        clearInterval(timer)
        // Start typing highlights
        let hi = 0
        let ci = 0
        const hTimer = setInterval(() => {
          if (hi >= HIGHLIGHTS.length) {
            clearInterval(hTimer)
            return
          }
          ci++
          setTypingHighlight(HIGHLIGHTS[hi].slice(0, ci))
          if (ci >= HIGHLIGHTS[hi].length) {
            setTypedHighlights((prev) => [...prev, HIGHLIGHTS[hi]])
            setTypingHighlight('')
            hi++
            ci = 0
          }
        }, 30)
      }
    }, 45)
    return () => clearInterval(timer)
  }, [])

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
          {typedTagline.length < TAGLINE.length && <span className="typing-caret" aria-hidden="true">|</span>}
        </p>
        <ul className="auth-highlights">
          {typedHighlights.map((h, i) => (
            <li key={i}>{h}</li>
          ))}
          {typingHighlight && (
            <li>
              {typingHighlight}
              <span className="typing-caret" aria-hidden="true">|</span>
            </li>
          )}
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
