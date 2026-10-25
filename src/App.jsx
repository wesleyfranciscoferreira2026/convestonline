import { Navigate, Route, Routes } from 'react-router-dom'
import { isSupabaseConfigured } from './lib/supabaseClient'
import ProtectedRoute from './components/ProtectedRoute'
import AppLayout from './components/AppLayout'
import PageTransition from './components/PageTransition'
import SetupNotice from './components/SetupNotice'
import Login from './pages/auth/Login'
import Signup from './pages/auth/Signup'
import ForgotPassword from './pages/auth/ForgotPassword'
import ResetPassword from './pages/auth/ResetPassword'
import AITutor from './pages/AITutor'
import SubjectLessons from './pages/SubjectLessons'
import LessonReader from './pages/LessonReader'
import Exercises from './pages/Exercises'
import MyStudies from './pages/MyStudies'
import Dashboard from './pages/Dashboard'
import Explore from './pages/Explore'
import Settings from './pages/Settings'
import ComingSoon from './pages/ComingSoon'
import { BookOpen, ClipboardList, LineChart, RotateCcw } from 'lucide-react'

export default function App() {
  if (!isSupabaseConfigured) return <SetupNotice />

  return (
    <Routes>
      <Route path="/login" element={<PageTransition><Login /></PageTransition>} />
      <Route path="/cadastro" element={<PageTransition><Signup /></PageTransition>} />
      <Route path="/recuperar" element={<PageTransition><ForgotPassword /></PageTransition>} />
      <Route path="/redefinir-senha" element={<PageTransition><ResetPassword /></PageTransition>} />
      <Route path="/ia" element={<PageTransition><AITutor /></PageTransition>} />

      <Route
        element={
          <ProtectedRoute>
            <AppLayout />
          </ProtectedRoute>
        }
      >
        <Route path="/" element={<Dashboard />} />
        <Route path="/explorar" element={<Explore />} />
        <Route path="/materia/:slug" element={<PageTransition><SubjectLessons /></PageTransition>} />
        <Route path="/aula/:id" element={<PageTransition><LessonReader /></PageTransition>} />
        <Route path="/estudos" element={<PageTransition><MyStudies /></PageTransition>} />
        <Route path="/exercicios" element={<PageTransition><Exercises /></PageTransition>} />
        <Route
          path="/revisao"
          element={
            <ComingSoon
              icon={RotateCcw}
              title="Revisão"
              description="A área de revisão de questões erradas, difíceis e favoritas chega na Fase 3, junto com o histórico completo."
            />
          }
        />
        <Route
          path="/estatisticas"
          element={
            <ComingSoon
              icon={LineChart}
              title="Estatísticas"
              description="Gráficos detalhados de evolução chegam na Fase 3. Os resumos da página inicial já mostram seus números reais."
            />
          }
        />
        <Route path="/perfil" element={<Settings />} />
      </Route>

      <Route path="*" element={<Navigate to="/" replace />} />
    </Routes>
  )
}
