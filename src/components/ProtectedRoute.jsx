import { Navigate, useLocation } from 'react-router-dom'
import { useAuth } from '../lib/auth'
import { FullPageLoader } from './ui'

export default function ProtectedRoute({ children }) {
  const { user, isGuest, loading, handlingAuth } = useAuth()
  const location = useLocation()

  if (loading || handlingAuth) return <FullPageLoader />
  if (!user && !isGuest) return <Navigate to="/login" replace state={{ from: location }} />
  return children
}
