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

      <Route
        element={
          <ProtectedRoute>
            <AppLayout />
          </ProtectedRoute>
        }
      >
        <Route path="/" element={<Dashboard />} />
        <Route path="/explorar" element={<Explore />} />
        <Route
          path="/estudos"
          element={
            <ComingSoon
              icon={BookOpen}
              title="Meus estudos"
              description="Sua trilha de aulas, tópicos e progresso por matéria chega na Fase 2 do produto. Por enquanto, explore as matérias e monte seu plano de hoje."
            />
          }
        />
        <Route
          path="/exercicios"
          element={
            <ComingSoon
              icon={ClipboardList}
              title="Exercícios"
              description="Questões de múltipla escolha com correção e explicações chegam na Fase 2. Suas estatísticas de acertos já estão sendo preparadas para recebê-las."
            />
          }
        />
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
