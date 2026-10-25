# AGENTS.md — Convest+

Contexto para agentes de código que trabalham neste projeto.

## Visão geral

Convest+ é uma plataforma web responsiva de estudos (ver PRD na raiz do produto).
Identidade visual "Aura": minimalista, tecnológica, sofisticada — turquesa (#66CCCC) usada
com moderação, muito espaço negativo, cartões brancos com bordas discretas.

## Stack

- **React 18 + Vite** (JavaScript, não TypeScript) + React Router v6
- **Supabase** (Auth + PostgreSQL + RLS) via `@supabase/supabase-js`
- **Lucide React** para ícones lineares · fonte **Inter** (fallback da Pacaembu)
- CSS puro em `src/index.css` com design tokens (CSS custom properties). Sem framework de CSS.

## Comandos

- `npm run dev` — desenvolvimento
- `npm run build` — build de produção (use para validar antes de finalizar tarefas)
- Banco: aplicar `supabase/migrations/0001_initial_schema.sql` no SQL Editor do Supabase

## Deploy (GitHub Pages)

- Site publicado: https://wesleyfranciscoferreira2026.github.io/convestonline/
- Workflow `.github/workflows/deploy.yml`: push na `main` → build → Pages.
- **Base path:** o build usa `/convestonline/` (vite.config.js, função por `command`);
  dev local fica em `/`. O `BrowserRouter` usa `basename={import.meta.env.BASE_URL}`.
- SPA no Pages: o workflow copia `dist/index.html` → `dist/404.html` (não há
  rewrites no Pages). Se mudar de plataforma, remova o base path.
- Segredos do site publicado (`VITE_SUPABASE_URL`, `VITE_SUPABASE_ANON_KEY`):
  Settings → Secrets and variables → Actions. Sem eles o site mostra a SetupNotice.
- Windows: use `npm.cmd`/`npx.cmd` (a política de execução do PowerShell bloqueia `.ps1`).

## Estrutura

```
src/
  main.jsx            — entry point (providers: Toast > Auth > Router)
  App.jsx             — rotas
  index.css           — design tokens + todos os estilos (seções comentadas)
  lib/
    supabaseClient.js — client Supabase; exporta isSupabaseConfigured
    auth.jsx          — AuthContext (session, profile, signIn/signUp/signOut)
    theme.js          — applyTheme ('light' | 'dark' | 'system')
  utils/date.js       — saudação, datas pt-BR, streak, minutos → texto
  components/
    AppLayout.jsx     — sidebar (desktop) + bottom nav (mobile) + topbar
    AuthLayout.jsx    — layout das telas de autenticação
    ProtectedRoute.jsx
    ui.jsx            — Card, StatCard, EmptyState, ProgressBar, Skeleton, Toggle...
    Toast.jsx         — sistema de toasts (useToast)
  pages/
    auth/             — Login, Signup, ForgotPassword
    Dashboard.jsx     — página inicial (dados reais do Supabase)
    Explore.jsx       — catálogo de matérias (busca funcional)
    Settings.jsx      — perfil, meta diária, tema, notificações
    ComingSoon.jsx    — estado honesto para áreas das Fases 2/3
supabase/migrations/  — SQL do schema (aplicar manualmente no SQL Editor)
```

## Convenções

- **Idioma da UI:** português (pt-BR). Identificadores de código em inglês.
- **Dados:** nunca usar dados fictícios como se fossem reais. Sem dados → EmptyState
  com CTA. Funcionalidade futura → ComingSoon identificado com a fase do PRD.
- **Tema:** controlado por `data-theme` no `<html>`; tokens em `:root` e
  `[data-theme='dark']`. Nunca hardcodar cores — usar `var(--token)`.
- **Ícones de matérias:** o campo `subjects.icon` guarda o nome do ícone Lucide
  (string); o mapa string→componente fica em `src/components/SubjectIcon.jsx`.
- **Segurança:** RLS habilitado em todas as tabelas; front-end nunca confia em
  validação local; apenas a chave anon no `.env.local` (nunca commitar).
- **Animações:** 180–300ms, `prefers-reduced-motion` respeitado.
- Ao concluir uma tarefa de estudo, o app registra uma `study_session` com os
  minutos estimados (source='task') — é isso que alimenta as estatísticas de tempo.

## Estado do roadmap

- ✅ **Fase 1** (atual): fundação completa
- ⏳ **Fase 2:** aulas/conteúdo (tabela `lessons` já existe), exercícios de múltipla
  escolha (tabela `question_attempts` já existe; falta tabela `questions`)
- ⏳ **Fase 3:** revisão, estatísticas detalhadas
- ⏳ **Fase 4:** painel admin (campo `profiles.role = 'admin'` já existe)

## Gotchas

- Se `VITE_SUPABASE_URL`/`.env.local` não existirem, o app mostra uma tela de
  configuração (SetupNotice) em vez de quebrar.
- O perfil é criado por trigger no cadastro; se um usuário antigo não tiver perfil,
  o AuthContext faz fallback para `user_metadata.full_name`.
