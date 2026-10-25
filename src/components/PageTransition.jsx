import { useLocation } from 'react-router-dom'

/**
 * Envolve o conteúdo de uma rota para que, a cada mudança de caminho, a tela
 * anterior saia e a nova entre com uma animação suave (sem biblioteca extra).
 * O `key` força o React a remontar o wrapper, disparando a animação CSS.
 */
export default function PageTransition({ children }) {
  const location = useLocation()
  return (
    <div key={location.pathname} className="page-transition">
      {children}
    </div>
  )
}
