import {
  Atom,
  BookOpen,
  BookText,
  Brain,
  Briefcase,
  Calculator,
  Code2,
  FileText,
  FlaskConical,
  Gavel,
  Globe2,
  GraduationCap,
  Landmark,
  Languages,
  Leaf,
  Palette,
  Scale,
  Sparkles,
  Target,
  Users,
} from 'lucide-react'

/** Mapa do campo subjects.icon (string) para o componente Lucide. */
const ICONS = {
  Atom,
  BookOpen,
  BookText,
  Brain,
  Briefcase,
  Calculator,
  Code2,
  FileText,
  FlaskConical,
  Gavel,
  Globe2,
  Landmark,
  Languages,
  Leaf,
  Palette,
  Scale,
  Sparkles,
  Target,
  Users,
}

export default function SubjectIcon({ name, size = 20, ...rest }) {
  const Icon = ICONS[name] ?? GraduationCap
  return <Icon size={size} aria-hidden="true" {...rest} />
}
