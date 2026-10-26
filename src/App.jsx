import { Navigate, Route, Routes } from 'react-router-dom'
import { isSupabaseConfigured } from './lib/supabaseClient'
import ProtectedRoute from './components/ProtectedRoute'
import AdminRoute from './components/AdminRoute'
import AppLayout from './components/AppLayout'
import AdminLayout from './pages/admin/AdminLayout'
import PageTransition from './components/PageTransition'
import SetupNotice from './components/SetupNotice'
import Login from './pages/auth/Login'
import Signup from './pages/auth/Signup'
import ForgotPassword from './pages/auth/ForgotPassword'
import ResetPassword from './pages/auth/ResetPassword'
import AITutor from './pages/AITutor'
import KidsLayout from './pages/kids/KidsLayout'
import KidsHome from './pages/kids/KidsHome'
import KidsSubjects from './pages/kids/KidsSubjects'
import SubjectLessons from './pages/SubjectLessons'
import LessonReader from './pages/LessonReader'
import Exercises from './pages/Exercises'
import MyStudies from './pages/MyStudies'
import Stats from './pages/Stats'
import Review from './pages/Review'
import Provas from './pages/Provas'
import Plans from './pages/Plans'
import AdminDashboard from './pages/admin/AdminDashboard'
import AdminLessons from './pages/admin/AdminLessons'
import AdminQuestions from './pages/admin/AdminQuestions'
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

      <Route path="/kids" element={<KidsLayout />}>
        <Route index element={<PageTransition><KidsHome /></PageTransition>} />
        <Route path="materias" element={<PageTransition><KidsHome /></PageTransition>} />
        <Route path="materia/:slug" element={<PageTransition><KidsSubjects /></PageTransition>} />
      </Route>
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
        <Route path="/provas" element={<PageTransition><Provas /></PageTransition>} />
        <Route path="/planos" element={<PageTransition><Plans /></PageTransition>} />
        <Route path="/revisao" element={<PageTransition><Review /></PageTransition>} />
        <Route path="/estatisticas" element={<PageTransition><Stats /></PageTransition>} />
        <Route path="/perfil" element={<Settings />} />
      </Route>

      <Route
        path="/admin"
        element={
          <AdminRoute>
            <AdminLayout />
          </AdminRoute>
        }
      >
        <Route index element={<AdminDashboard />} />
        <Route path="aulas" element={<AdminLessons />} />
        <Route path="questoes" element={<AdminQuestions />} />
      </Route>

      <Route path="*" element={<Navigate to="/" replace />} />
    </Routes>
  )
}
