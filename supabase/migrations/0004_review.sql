-- ============================================================================
-- Convest — Fase 3: Revisão inteligente
-- Rastreia questões marcadas como revisadas pelo aluno.
-- ============================================================================
create table if not exists public.reviewed_questions (
  user_id uuid not null references auth.users (id) on delete cascade,
  question_id uuid not null references public.questions (id) on delete cascade,
  reviewed_at timestamptz not null default now(),
  primary key (user_id, question_id)
);

alter table public.reviewed_questions enable row level security;
drop policy if exists "reviewed_all_own" on public.reviewed_questions;
create policy "reviewed_all_own" on public.reviewed_questions
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
