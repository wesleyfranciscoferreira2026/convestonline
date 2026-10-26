-- ============================================================================
-- Convest+ — Cor de destaque personalizável
-- ============================================================================
alter table public.profiles
  add column if not exists accent text not null default 'turquoise'
  check (accent in ('turquoise','pink','yellow','orange','purple','blue','green','red'));
