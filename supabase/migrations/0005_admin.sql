-- ============================================================================
-- Convest — Fase 4: Painel administrativo
-- Função is_admin() + políticas de escrita para admins.
-- ============================================================================
create or replace function public.is_admin()
returns boolean
language sql
security definer
stable
set search_path = public
as $$
  select exists (
    select 1 from public.profiles
    where id = auth.uid() and role = 'admin'
  );
$$;

-- Perfis: admin pode ler todos (gestão de usuários)
drop policy if exists "profiles_admin_select" on public.profiles;
create policy "profiles_admin_select" on public.profiles
  for select using (public.is_admin());

-- Matérias: admin pode criar/editar/apagar
drop policy if exists "subjects_admin_all" on public.subjects;
create policy "subjects_admin_all" on public.subjects
  for all using (public.is_admin()) with check (public.is_admin());

-- Aulas: admin pode criar/editar/apagar (além de ler publicadas)
drop policy if exists "lessons_admin_all" on public.lessons;
create policy "lessons_admin_all" on public.lessons
  for all using (public.is_admin()) with check (public.is_admin());

-- Questões: admin pode criar/editar/apagar
drop policy if exists "questions_admin_all" on public.questions;
create policy "questions_admin_all" on public.questions
  for all using (public.is_admin()) with check (public.is_admin());

-- Para promover um usuário a admin, execute no SQL Editor:
-- update public.profiles set role = 'admin' where id = '<uuid-do-usuario>';
