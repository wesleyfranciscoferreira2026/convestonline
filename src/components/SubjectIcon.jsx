import {
  Atom,
  BookOpen,
  Calculator,
  Code2,
  FlaskConical,
  Globe2,
  GraduationCap,
  Landmark,
  Languages,
} from 'lucide-react'

/** Mapa do campo subjects.icon (string) para o componente Lucide. */
const ICONS = {
  Atom,
  BookOpen,
  Calculator,
  Code2,
  FlaskConical,
  Globe2,
  Landmark,
  Languages,
}

export default function SubjectIcon({ name, size = 20, ...rest }) {
  const Icon = ICONS[name] ?? GraduationCap
  return <Icon size={size} aria-hidden="true" {...rest} />
}
