-- ============================================================================
-- Planos e revisoes diarias de estatisticas
-- ============================================================================
-- 1) profiles.plan: 'free' | 'basic' | 'pro' | 'premium'
-- 2) stats_reviews: registro das revisoes de estatisticas feitas por dia
-- ============================================================================

alter table public.profiles add column if not exists plan text not null default 'free';
do $$
begin
  if not exists (
    select 1 from pg_constraint where conname = 'profiles_plan_check'
  ) then
    alter table public.profiles
      add constraint profiles_plan_check check (plan in ('free', 'basic', 'pro', 'premium'));
  end if;
end
$$;

create table if not exists public.stats_reviews (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users (id) on delete cascade,
  review_date date not null default current_date,
  summary text,
  created_at timestamptz not null default now()
);

create index if not exists stats_reviews_user_date_idx
  on public.stats_reviews (user_id, review_date);

alter table public.stats_reviews enable row level security;

drop policy if exists "stats_reviews_select_own" on public.stats_reviews;
create policy "stats_reviews_select_own" on public.stats_reviews
  for select using (auth.uid() = user_id);

drop policy if exists "stats_reviews_insert_own" on public.stats_reviews;
create policy "stats_reviews_insert_own" on public.stats_reviews
  for insert with check (auth.uid() = user_id);

drop policy if exists "stats_reviews_delete_own" on public.stats_reviews;
create policy "stats_reviews_delete_own" on public.stats_reviews
  for delete using (auth.uid() = user_id);

-- Marca os planos ja assinados (idempotente).
update public.profiles set plan = 'free' where plan is null;
