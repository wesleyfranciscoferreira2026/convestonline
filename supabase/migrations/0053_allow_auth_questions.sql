-- ============================================================================
-- Permite que qualquer usuario autenticado crie/edit/delete questoes.
-- (Resolve erro de RLS ao adicionar questoes pelo site.)
-- ============================================================================
drop policy if exists "questions_admin_all" on public.questions;
drop policy if exists "questions_insert_auth" on public.questions;
drop policy if exists "questions_update_auth" on public.questions;
drop policy if exists "questions_delete_auth" on public.questions;
drop policy if exists "questions_select_all" on public.questions;

create policy "questions_select_all" on public.questions
  for select using (true);
create policy "questions_insert_auth" on public.questions
  for insert with check (auth.uid() is not null);
create policy "questions_update_auth" on public.questions
  for update using (auth.uid() is not null) with check (auth.uid() is not null);
create policy "questions_delete_auth" on public.questions
  for delete using (auth.uid() is not null);
