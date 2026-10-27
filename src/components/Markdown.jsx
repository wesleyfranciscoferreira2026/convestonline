/** Renderizador de Markdown com suporte a LaTeX (KaTeX).
 *
 *  - títulos (#, ##, ###)
 *  - listas (-, *)
 *  - negrito (**), itálico (*), código (`)
 *  - matemática inline ($...$) e em bloco ($$...$$, \[...\])
 */
import { useMemo } from 'react'
import katex from 'katex'
import 'katex/dist/katex.min.css'

function renderMath(tex, displayMode) {
  try {
    return katex.renderToString(tex, {
      displayMode,
      throwOnError: false,
      strict: false,
      output: 'html',
      trust: false,
    })
  } catch {
    return null
  }
}

/** Substitui matemática inline por marcadores + HTML gerado pelo KaTeX. */
function renderInline(s) {
  const parts = s.split(/(\*\*[^*]+\*\*|\*[^*]+\*|`[^`]+`|\$[^$\n]+\$|\\\([^)]*\\\))/g)
  return parts.map((p, i) => {
    if (!p) return null
    if (p.startsWith('**') && p.endsWith('**')) return <strong key={i}>{p.slice(2, -2)}</strong>
    if (p.startsWith('*') && p.endsWith('*')) return <em key={i}>{p.slice(1, -1)}</em>
    if (p.startsWith('`') && p.endsWith('`')) return <code key={i}>{p.slice(1, -1)}</code>
    if (p.startsWith('$') && p.endsWith('$') && p.length > 2) {
      const html = renderMath(p.slice(1, -1), false)
      if (html) return <span key={i} className="md-math" dangerouslySetInnerHTML={{ __html: html }} />
      return <code key={i}>{p.slice(1, -1)}</code>
    }
    if (p.startsWith('\\(') && p.endsWith('\\)')) {
      const html = renderMath(p.slice(2, -2), false)
      if (html) return <span key={i} className="md-math" dangerouslySetInnerHTML={{ __html: html }} />
      return <code key={i}>{p.slice(2, -2)}</code>
    }
    return p
  })
}

export default function Markdown({ text }) {
  const blocks = useMemo(() => {
    const lines = (text || '').split('\n')
    const out = []
    let list = []
    let mathBuffer = []

    const flushList = () => {
      if (list.length) {
        out.push(
          <ul key={`ul-${out.length}`} className="md-list">
            {list.map((l, i) => (
              <li key={i}>{renderInline(l)}</li>
            ))}
          </ul>,
        )
        list = []
      }
    }

    const flushMath = () => {
      if (!mathBuffer.length) return
      const tex = mathBuffer.join('\n').trim()
      mathBuffer = []
      const html = renderMath(tex, true)
      if (html) {
        out.push(
          <div key={`math-${out.length}`} className="md-math-block" dangerouslySetInnerHTML={{ __html: html }} />,
        )
      } else {
        out.push(<pre key={`math-${out.length}`} className="md-math-raw">{tex}</pre>)
      }
    }

    for (let i = 0; i < lines.length; i++) {
      const raw = lines[i]
      const trimmed = raw.trim()

      // Bloco de matemática: $$ ... $$ (mesma linha ou multilinha) e \[ ... \]
      if (trimmed.startsWith('$$')) {
        flushList()
        const rest = trimmed.slice(2)
        if (rest.trim().endsWith('$$') && rest.trim().length > 2) {
          const tex = rest.trim().slice(0, -2)
          const html = renderMath(tex, true)
          if (html) {
            out.push(<div key={`math-${out.length}`} className="md-math-block" dangerouslySetInnerHTML={{ __html: html }} />)
          } else {
            out.push(<pre key={`math-${out.length}`} className="md-math-raw">{tex}</pre>)
          }
        } else {
          mathBuffer = [rest]
          // Consome ate a linha de fechamento
          while (i + 1 < lines.length) {
            i += 1
            const next = lines[i].trim()
            if (next.endsWith('$$')) {
              mathBuffer.push(next.slice(0, -2))
              break
            }
            mathBuffer.push(next)
          }
          flushMath()
        }
        continue
      }

      if (trimmed.startsWith('\\[')) {
        flushList()
        const rest = trimmed.slice(2)
        if (rest.trim().endsWith('\\]')) {
          const tex = rest.trim().slice(0, -2)
          const html = renderMath(tex, true)
          if (html) {
            out.push(<div key={`math-${out.length}`} className="md-math-block" dangerouslySetInnerHTML={{ __html: html }} />)
          } else {
            out.push(<pre key={`math-${out.length}`} className="md-math-raw">{tex}</pre>)
          }
        } else {
          mathBuffer = [rest]
          while (i + 1 < lines.length) {
            i += 1
            const next = lines[i].trim()
            if (next.endsWith('\\]')) {
              mathBuffer.push(next.slice(0, -2))
              break
            }
            mathBuffer.push(next)
          }
          flushMath()
        }
        continue
      }

      if (trimmed.startsWith('- ') || trimmed.startsWith('* ')) {
        flushList()
        list.push(trimmed.slice(2))
        continue
      }

      flushList()
      if (trimmed === '') {
        out.push(<br key={`br-${out.length}`} />)
      } else if (trimmed.startsWith('### ')) {
        out.push(<h4 key={`h-${out.length}`}>{renderInline(trimmed.slice(4))}</h4>)
      } else if (trimmed.startsWith('## ')) {
        out.push(<h3 key={`h-${out.length}`}>{renderInline(trimmed.slice(3))}</h3>)
      } else if (trimmed.startsWith('# ')) {
        out.push(<h2 key={`h-${out.length}`}>{renderInline(trimmed.slice(2))}</h2>)
      } else if (/^---+$/.test(trimmed)) {
        out.push(<hr key={`hr-${out.length}`} className="md-hr" />)
      } else {
        out.push(<p key={`p-${out.length}`}>{renderInline(trimmed)}</p>)
      }
    }
    flushList()
    flushMath()
    return out
  }, [text])

  return <div className="md">{blocks}</div>
}
