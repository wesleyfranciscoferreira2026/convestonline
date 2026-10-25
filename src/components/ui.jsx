/** Primitivos de UI reutilizáveis do Aura Study. */

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

export function StatCard({ icon: Icon, label, value, hint }) {
  return (
    <Card className="stat-card">
      <div className="stat-card-text">
        <span className="stat-label">{label}</span>
        <strong className="stat-value">{value}</strong>
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
