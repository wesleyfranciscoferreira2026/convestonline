-- ============================================================================
-- Convest+ — Tabela de questões (schema, sem seed)
-- ============================================================================
create table if not exists public.questions (
  id uuid primary key default gen_random_uuid(),
  subject_id uuid not null references public.subjects (id) on delete cascade,
  lesson_id uuid references public.lessons (id) on delete set null,
  exam_id uuid references public.exams (id) on delete set null,
  prompt text not null default '',
  options jsonb not null default '[]'::jsonb,
  option_images jsonb not null default '[]'::jsonb,
  stem_image_url text,
  source_images jsonb not null default '[]'::jsonb,
  source_ref text,
  correct_index integer not null default 0 check (correct_index >= 0),
  explanation text,
  difficulty text not null default 'medium' check (difficulty in ('easy', 'medium', 'hard')),
  topic text,
  year integer,
  question_type text not null default 'multiple_choice'
    check (question_type in ('multiple_choice', 'true_false')),
  level text not null default 'regular'
    check (level in ('regular', 'kids1', 'kids2')),
  grade integer check (grade between 1 and 9),
  track text not null default 'regular'
    check (track in ('regular', 'intro')),
  intro_level integer check (intro_level between 1 and 3),
  status text not null default 'draft' check (status in ('draft', 'published')),
  sort_order integer not null default 0,
  created_at timestamptz not null default now()
);

alter table public.questions enable row level security;
drop policy if exists "questions_select_published" on public.questions;
create policy "questions_select_published" on public.questions
  for select using (status = 'published');

drop policy if exists "questions_admin_all" on public.questions;
create policy "questions_admin_all" on public.questions
  for all using (public.is_admin()) with check (public.is_admin());

create unique index if not exists questions_source_ref_unique on public.questions(source_ref) where source_ref is not null;

create index if not exists questions_topic_idx on public.questions (topic);
create index if not exists questions_level_idx on public.questions (level);
create index if not exists questions_grade_idx on public.questions (grade);
create index if not exists questions_track_idx on public.questions (track);
create index if not exists questions_exam_year_idx on public.questions (exam_id, year);
