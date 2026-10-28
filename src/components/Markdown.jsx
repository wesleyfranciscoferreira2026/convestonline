/** Renderizador de Markdown com suporte a LaTeX (KaTeX).
 *
 *  - titulos (#, ##, ###), listas (-, *), negrito (**), italico (*), codigo (`)
 *  - matematica inline: $...$, \\(...\\)
 *  - matematica em bloco: $$...$$, \\[...\\]
 *  - LaTeX "solto" (sem delimitadores), comum em respostas de calculo
 *  - links [texto](url) e URLs soltas
 */
import { useMemo } from 'react'
import katex from 'katex'
import 'katex/dist/katex.min.css'

/** Comandos LaTeX que indicam inicio de uma expressao matematica. */
const KNOWN_COMMANDS = new Set([
  'frac', 'dfrac', 'tfrac', 'sqrt', 'int', 'oint', 'iint', 'iiint', 'sum', 'prod',
  'lim', 'infty', 'partial', 'nabla', 'cdot', 'times', 'div', 'pm', 'mp', 'leq',
  'leq', 'geq', 'neq', 'approx', 'equiv', 'sim', 'propto', 'to', 'rightarrow',
  'Rightarrow', 'leftarrow', 'in', 'notin', 'subset', 'subseteq', 'supset',
  'cup', 'cap', 'forall', 'exists', 'emptyset', 'infty', 'pi', 'alpha', 'beta',
  'gamma', 'delta', 'theta', 'lambda', 'mu', 'sigma', 'omega', 'Delta', 'Sigma',
  'Omega', 'Gamma', 'Theta', 'Lambda', 'Phi', 'Psi', 'Lambda', 'ell', 'hbar',
  'mathrm', 'mathbf', 'mathbb', 'mathcal', 'mathsf', 'mathit', 'text', 'textbf',
  'textit', 'operatorname', 'boxed', 'overline', 'underline', 'vec', 'hat',
  'tilde', 'bar', 'dot', 'ddot', 'widehat', 'widetilde', 'begin', 'end',
  'ldots', 'cdots', 'vdots', 'ddots', 'log', 'ln', 'exp', 'sin', 'cos', 'tan',
  'sec', 'csc', 'cot', 'arcsin', 'arccos', 'arctan', 'sinh', 'cosh', 'tanh',
  'left', 'right', 'big', 'Big', 'bigg', 'Bigg', 'binom', 'choose', 'atop',
  'overline', 'substack', 'displaystyle', 'tfrac', 'sfrac',
])

function katexHtml(tex, displayMode) {
  try {
    const html = katex.renderToString(tex, {
      displayMode,
      throwOnError: false,
      strict: false,
      output: 'html',
      trust: false,
    })
    if (html.includes('katex-error')) return null
    return html
  } catch {
    return null
  }
}

/** Procura o fim de um \( ... \) respeitando parenteses aninhados. */
function findClosingParen(text, from) {
  let depth = 1
  for (let i = from; i < text.length; i++) {
    const ch = text[i]
    if (ch === '\\') { i += 1; continue }
    if (ch === '(') depth += 1
    else if (ch === ')') {
      depth -= 1
      if (depth === 0) return i
    } else if (ch === '\n') return -1
  }
  return -1
}

/** Procura o proximo $ que nao esteja escapado. */
function findClosingDollar(text, from) {
  for (let i = from; i < text.length; i++) {
    const ch = text[i]
    if (ch === '\\') { i += 1; continue }
    if (ch === '\n') return -1
    if (ch === '$') {
      if (text[i + 1] === '$') return -1
      return i
    }
  }
  return -1
}

/** Le a expressao matematica a partir de um comando LaTeX. */
function scanMathRun(text, start) {
  let i = start
  const n = text.length
  while (i < n) {
    const ch = text[i]
    if (ch === '\\') {
      i += 1
      if (i < n && /[A-Za-z]/.test(text[i])) {
        while (i < n && /[A-Za-z]/.test(text[i])) i += 1
      } else {
        i += 1
      }
      continue
    }
    if (/[0-9A-Za-z]/.test(ch)) { i += 1; continue }
    if ('{}_^()[]'.includes(ch)) { i += 1; continue }
    if ('+-=*/&|^<>!'.includes(ch)) { i += 1; continue }
    if (ch === ' ') {
      if (text[i + 1] === ' ') break
      i += 1
      continue
    }
    if (ch === '.' || ch === ',' || ch === ';') {
      const next = text[i + 1]
      if (next === ' ' || next === '\n' || next === undefined) break
      i += 1
      continue
    }
    break
  }
  return i
}

/**
 * Quebra o texto em pedacos de matematica e texto comum.
 * @returns {Array<{type:'math'|'text', value:string, display?:boolean}>}
 */
function splitMath(text) {
  const out = []
  let i = 0
  const n = text.length
  let buf = ''

  const flush = () => {
    if (buf) { out.push({ type: 'text', value: buf }); buf = '' }
  }

  while (i < n) {
    const rest = text.slice(i)

    if (rest.startsWith('\\(')) {
      const end = findClosingParen(text, i + 2)
      if (end !== -1) {
        flush()
        out.push({ type: 'math', value: text.slice(i + 2, end) })
        i = end + 2
        continue
      }
    }

    if (text[i] === '$' && text[i + 1] !== '$') {
      const end = findClosingDollar(text, i + 1)
      if (end !== -1 && end > i + 1) {
        flush()
        out.push({ type: 'math', value: text.slice(i + 1, end) })
        i = end + 1
        continue
      }
    }

    // LaTeX solto: \comando...
    if (text[i] === '\\' && i + 1 < n && /[A-Za-z]/.test(text[i + 1])) {
      let cmd = ''
      let j = i + 1
      while (j < n && /[A-Za-z]/.test(text[j])) { cmd += text[j]; j += 1 }
      if (KNOWN_COMMANDS.has(cmd)) {
        const end = scanMathRun(text, i)
        const expr = text.slice(i, end).trim()
        const html = katexHtml(expr, false)
        if (html) {
          flush()
          out.push({ type: 'math', value: expr })
          i = end
          continue
        }
      }
    }

    buf += text[i]
    i += 1
  }
  flush()
  return out
}

/** Aplica negrito, italico, codigo, links e URLs no texto comum. */
function renderRich(s, keyBase) {
  const parts = s.split(/(\*\*[^*]+\*\*|\*[^*\n]+\*|`[^`]+`|\[[^\]]+\]\([^)\s]+\))/g)
  return parts.map((p, i) => {
    if (!p) return null
    const key = `${keyBase}-${i}`
    if (p.startsWith('**') && p.endsWith('**') && p.length > 4) return <strong key={key}>{p.slice(2, -2)}</strong>
    if (p.startsWith('*') && p.endsWith('*') && p.length > 2) return <em key={key}>{p.slice(1, -1)}</em>
    if (p.startsWith('`') && p.endsWith('`') && p.length > 2) return <code key={key}>{p.slice(1, -1)}</code>
    const link = p.match(/^\[([^\]]+)\]\(([^)\s]+)\)$/)
    if (link) {
      return (
        <a key={key} href={link[2]} target="_blank" rel="noopener noreferrer">
          {link[1]}
        </a>
      )
    }
    // URLs soltas
    const urlParts = p.split(/(https?:\/\/[^\s)]+)/g)
    return urlParts.map((u, k) => {
      if (/^https?:\/\//.test(u)) {
        return (
          <a key={`${key}-u${k}`} href={u} target="_blank" rel="noopener noreferrer">
            {u}
          </a>
        )
      }
      return u
    })
  })
}

/** Renderiza uma linha de texto comum, convertendo a matematica encontrada. */
function renderLine(line, keyBase) {
  const pieces = splitMath(line)
  return pieces.map((piece, i) => {
    if (piece.type === 'math') {
      const html = katexHtml(piece.value, false)
      if (!html) return <code key={`${keyBase}-m${i}`}>{piece.value}</code>
      return <span key={`${keyBase}-m${i}`} className="md-math" dangerouslySetInnerHTML={{ __html: html }} />
    }
    return <span key={`${keyBase}-t${i}`}>{renderRich(piece.value, `${keyBase}-r${i}`)}</span>
  })
}

export default function Markdown({ text }) {
  const blocks = useMemo(() => {
    const raw = (text || '').replace(/\r\n/g, '\n')
    const lines = raw.split('\n')
    const out = []
    let list = []
    let mathBuf = null

    const flushList = () => {
      if (list.length) {
        out.push(
          <ul key={`ul-${out.length}`} className="md-list">
            {list.map((l, i) => (
              <li key={i}>{renderLine(l, `li-${out.length}-${i}`)}</li>
            ))}
          </ul>,
        )
        list = []
      }
    }

    const flushMath = () => {
      if (!mathBuf) return
      const { buf, close } = mathBuf
      mathBuf = null
      const tex = buf.join('\n').trim()
      const html = katexHtml(tex, true)
      if (html) {
        out.push(<div key={`math-${out.length}`} className="md-math-block" dangerouslySetInnerHTML={{ __html: html }} />)
      } else {
        out.push(<pre key={`math-${out.length}`} className="md-math-raw">{tex}</pre>)
      }
    }

    for (let i = 0; i < lines.length; i++) {
      const rawLine = lines[i]
      const trimmed = rawLine.trim()

      // Dentro de um bloco de matematica
      if (mathBuf) {
        const { close } = mathBuf
        if (trimmed.endsWith(close)) {
          const before = trimmed.slice(0, trimmed.length - close.length)
          if (before.trim()) mathBuf.buf.push(before)
          flushMath()
        } else {
          mathBuf.buf.push(rawLine)
        }
        continue
      }

      // Abertura de bloco: $$ ... $$ ou \[ ... \]
      const opener = trimmed.startsWith('$$') ? '$$' : trimmed.startsWith('\\[') ? '\\[' : null
      if (opener) {
        flushList()
        const rest = trimmed.slice(opener.length)
        const close = opener === '$$' ? '$$' : '\\]'
        if (rest.trim().endsWith(close) && rest.trim().length > close.length) {
          const tex = rest.trim().slice(0, rest.trim().length - close.length)
          const html = katexHtml(tex, true)
          if (html) {
            out.push(<div key={`math-${out.length}`} className="md-math-block" dangerouslySetInnerHTML={{ __html: html }} />)
          } else {
            out.push(<pre key={`math-${out.length}`} className="md-math-raw">{tex}</pre>)
          }
        } else {
          mathBuf = { buf: [rest], close }
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
        out.push(<h4 key={`h-${out.length}`}>{renderLine(trimmed.slice(4), `h4-${out.length}`)}</h4>)
      } else if (trimmed.startsWith('## ')) {
        out.push(<h3 key={`h-${out.length}`}>{renderLine(trimmed.slice(3), `h3-${out.length}`)}</h3>)
      } else if (trimmed.startsWith('# ')) {
        out.push(<h2 key={`h-${out.length}`}>{renderLine(trimmed.slice(2), `h2-${out.length}`)}</h2>)
      } else if (/^---+$/.test(trimmed)) {
        out.push(<hr key={`hr-${out.length}`} className="md-hr" />)
      } else {
        out.push(<p key={`p-${out.length}`}>{renderLine(trimmed, `p-${out.length}`)}</p>)
      }
    }
    flushList()
    flushMath()
    return out
  }, [text])

  return <div className="md">{blocks}</div>
}
