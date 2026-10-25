import { Navigate } from 'react-router-dom'
import { useAuth } from '../lib/auth'
import { FullPageLoader } from './ui'

export default function AdminRoute({ children }) {
  const { user, profile, loading } = useAuth()
  if (loading) return <FullPageLoader />
  if (!user) return <Navigate to="/login" replace />
  if (profile?.role !== 'admin') return <Navigate to="/" replace />
  return children
}
