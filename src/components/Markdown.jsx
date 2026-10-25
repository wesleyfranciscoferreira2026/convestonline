/** Renderizador leve de Markdown (títulos, listas, negrito, itálico, código). */
export default function Markdown({ text }) {
  const lines = (text || '').split('\n')
  const blocks = []
  let list = []
  const flushList = () => {
    if (list.length) {
      blocks.push(
        <ul key={`ul-${blocks.length}`} className="md-list">
          {list.map((l, i) => (
            <li key={i}>{renderInline(l)}</li>
          ))}
        </ul>,
      )
      list = []
    }
  }
  for (const line of lines) {
    const trimmed = line.trim()
    if (trimmed.startsWith('- ') || trimmed.startsWith('* ')) {
      list.push(trimmed.slice(2))
      continue
    }
    flushList()
    if (trimmed === '') {
      blocks.push(<br key={`br-${blocks.length}`} />)
    } else if (trimmed.startsWith('### ')) {
      blocks.push(<h4 key={`h-${blocks.length}`}>{renderInline(trimmed.slice(4))}</h4>)
    } else if (trimmed.startsWith('## ')) {
      blocks.push(<h3 key={`h-${blocks.length}`}>{renderInline(trimmed.slice(3))}</h3>)
    } else if (trimmed.startsWith('# ')) {
      blocks.push(<h2 key={`h-${blocks.length}`}>{renderInline(trimmed.slice(2))}</h2>)
    } else {
      blocks.push(<p key={`p-${blocks.length}`}>{renderInline(trimmed)}</p>)
    }
  }
  flushList()
  return <div className="md">{blocks}</div>
}

function renderInline(s) {
  const parts = s.split(/(\*\*[^*]+\*\*|\*[^*]+\*|`[^`]+`)/g)
  return parts.map((p, i) => {
    if (p.startsWith('**') && p.endsWith('**')) return <strong key={i}>{p.slice(2, -2)}</strong>
    if (p.startsWith('*') && p.endsWith('*')) return <em key={i}>{p.slice(1, -1)}</em>
    if (p.startsWith('`') && p.endsWith('`')) return <code key={i}>{p.slice(1, -1)}</code>
    return p
  })
}
