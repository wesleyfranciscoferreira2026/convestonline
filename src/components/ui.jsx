/** Primitivos de UI reutilizáveis do Convest+. */

export function FullPageLoader() {
  return (
    <div className="fullpage-loader" role="status" aria-label="Carregando">
      <span className="brand-mark">convest+</span>
      <span className="loader-bar" />
    </div>
  )
}

export function Card({ as: Tag = 'section', className = '', children, ...rest }) {
  return (
    <Tag className={`card ${className}`.trim()} {...rest}>
      {children}
    </Tag>
  )
}

export function SectionHeader({ title, subtitle, action }) {
  return (
    <div className="section-header">
      <div>
        <h2>{title}</h2>
        {subtitle && <p>{subtitle}</p>}
      </div>
      {action}
    </div>
  )
}

export function ProgressBar({ value, max = 100, label }) {
  const percent = max > 0 ? Math.min(100, Math.round((value / max) * 100)) : 0
  return (
    <div
      className="progress"
      role="progressbar"
      aria-valuenow={percent}
      aria-valuemin={0}
      aria-valuemax={100}
      aria-label={label}
    >
      <span className="progress-fill" style={{ width: `${percent}%` }} />
    </div>
  )
}

export function CountUp({ value, duration = 850, format }) {
  const [display, setDisplay] = useState(0)
  const ref = useRef(null)
  useEffect(() => {
    const target = Number(value) || 0
    if (window.matchMedia('(prefers-reduced-motion: reduce)').matches) {
      setDisplay(target)
      return
    }
    let start = null
    let raf = 0
    const step = (ts) => {
      if (!start) start = ts
      const progress = Math.min(1, (ts - start) / duration)
      const eased = 1 - Math.pow(1 - progress, 3)
      setDisplay(Math.round(eased * target))
      if (progress < 1) raf = requestAnimationFrame(step)
    }
    raf = requestAnimationFrame(step)
    return () => cancelAnimationFrame(raf)
  }, [value, duration])
  const formatted = format ? format(display) : display
  return <span>{formatted}</span>
}

export function StatCard({ icon: Icon, label, value, suffix = '', format, animated = false, hint }) {
  const numeric = typeof value === 'number' ? value : null
  return (
    <Card className="stat-card">
      <div className="stat-card-text">
        <span className="stat-label">{label}</span>
        <strong className="stat-value">
          {animated && numeric !== null ? (
            <CountUp value={numeric} format={format} />
          ) : (
            value
          )}
          {suffix}
        </strong>
        {hint && <span className="stat-hint">{hint}</span>}
      </div>
      {Icon && (
        <span className="stat-icon">
          <Icon size={20} aria-hidden="true" />
        </span>
      )}
    </Card>
  )
}

export function EmptyState({ icon: Icon, title, description, action }) {
  return (
    <div className="empty-state">
      {Icon && (
        <span className="empty-icon">
          <Icon size={22} aria-hidden="true" />
        </span>
      )}
      <h3>{title}</h3>
      {description && <p>{description}</p>}
      {action}
    </div>
  )
}

export function Skeleton({ width = '100%', height = 14, radius = 8 }) {
  return <span className="skeleton" style={{ width, height, borderRadius: radius }} />
}

export function Toggle({ checked, onChange, label, id }) {
  return (
    <button
      type="button"
      role="switch"
      aria-checked={checked}
      aria-label={label}
      id={id}
      className={`toggle ${checked ? 'is-on' : ''}`}
      onClick={() => onChange(!checked)}
    >
      <span className="toggle-thumb" />
    </button>
  )
}

export function Avatar({ name = '', url, size = 38 }) {
  const initials = name
    .trim()
    .split(/\s+/)
    .slice(0, 2)
    .map((p) => p[0])
    .join('')
    .toUpperCase()
  if (url) {
    return (
      <img
        className="avatar"
        src={url}
        alt=""
        width={size}
        height={size}
        style={{ width: size, height: size }}
      />
    )
  }
  return (
    <span className="avatar avatar-fallback" style={{ width: size, height: size }} aria-hidden="true">
      {initials || '?'}
    </span>
  )
}
