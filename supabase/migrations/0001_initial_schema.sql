-- ============================================================================
-- Aura Study — Fase 1: Fundação
-- Schema inicial: perfis, matérias, aulas, progresso, tarefas, sessões,
-- favoritos e tentativas de questões. Tudo protegido por Row Level Security.
--
-- Como aplicar: Supabase Dashboard > SQL Editor > cole este arquivo e execute.
-- ============================================================================

-- ----------------------------------------------------------------------------
-- Perfis (estende auth.users)
-- ----------------------------------------------------------------------------
create table if not exists public.profiles (
  id uuid primary key references auth.users (id) on delete cascade,
  full_name text not null default '',
  avatar_url text,
  daily_goal_minutes integer not null default 60 check (daily_goal_minutes > 0),
  theme text not null default 'system' check (theme in ('light', 'dark', 'system')),
  notify_updates boolean not null default true,
  role text not null default 'student' check (role in ('student', 'admin')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

-- ----------------------------------------------------------------------------
-- Matérias (categorias de conteúdo)
-- ----------------------------------------------------------------------------
create table if not exists public.subjects (
  id uuid primary key default gen_random_uuid(),
  slug text unique not null,
  name text not null,
  description text,
  icon text,
  sort_order integer not null default 0,
  created_at timestamptz not null default now()
);

-- ----------------------------------------------------------------------------
-- Aulas / conteúdos (estrutura pronta para a Fase 2; rascunho x publicado)
-- ----------------------------------------------------------------------------
create table if not exists public.lessons (
  id uuid primary key default gen_random_uuid(),
  subject_id uuid not null references public.subjects (id) on delete cascade,
  title text not null,
  description text,
  content text,
  estimated_minutes integer not null default 15 check (estimated_minutes > 0),
  sort_order integer not null default 0,
  status text not null default 'draft' check (status in ('draft', 'published')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

-- ----------------------------------------------------------------------------
-- Progresso do usuário nas aulas
-- ----------------------------------------------------------------------------
create table if not exists public.user_lesson_progress (
  user_id uuid not null references auth.users (id) on delete cascade,
  lesson_id uuid not null references public.lessons (id) on delete cascade,
  progress_percent integer not null default 0 check (progress_percent between 0 and 100),
  completed_at timestamptz,
  last_accessed_at timestamptz not null default now(),
  primary key (user_id, lesson_id)
);

-- ----------------------------------------------------------------------------
-- Tarefas de estudo (Plano de hoje / planejamento)
-- ----------------------------------------------------------------------------
create table if not exists public.study_tasks (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users (id) on delete cascade,
  title text not null,
  subject_id uuid references public.subjects (id) on delete set null,
  planned_date date not null default current_date,
  estimated_minutes integer not null default 30 check (estimated_minutes > 0),
  status text not null default 'pending' check (status in ('pending', 'in_progress', 'completed')),
  completed_at timestamptz,
  created_at timestamptz not null default now()
);

-- ----------------------------------------------------------------------------
-- Sessões de estudo (origem das estatísticas de tempo)
-- ----------------------------------------------------------------------------
create table if not exists public.study_sessions (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users (id) on delete cascade,
  subject_id uuid references public.subjects (id) on delete set null,
  lesson_id uuid references public.lessons (id) on delete set null,
  duration_minutes integer not null check (duration_minutes > 0),
  studied_at timestamptz not null default now(),
  source text not null default 'manual' check (source in ('manual', 'task', 'lesson', 'exercise')),
  created_at timestamptz not null default now()
);

-- ----------------------------------------------------------------------------
-- Favoritos
-- ----------------------------------------------------------------------------
create table if not exists public.favorites (
  user_id uuid not null references auth.users (id) on delete cascade,
  lesson_id uuid not null references public.lessons (id) on delete cascade,
  created_at timestamptz not null default now(),
  primary key (user_id, lesson_id)
);

-- ----------------------------------------------------------------------------
-- Tentativas de questões (estrutura pronta para a Fase 2)
-- question_id ficará referenciando a futura tabela de questões.
-- ----------------------------------------------------------------------------
create table if not exists public.question_attempts (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users (id) on delete cascade,
  subject_id uuid references public.subjects (id) on delete set null,
  question_id uuid,
  is_correct boolean not null,
  answered_at timestamptz not null default now()
);

-- ============================================================================
-- Trigger: cria o perfil automaticamente quando um usuário se cadastra
-- ============================================================================
create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer set search_path = public
as $$
begin
  insert into public.profiles (id, full_name)
  values (new.id, coalesce(new.raw_user_meta_data ->> 'full_name', ''))
  on conflict (id) do nothing;
  return new;
end;
$$;

drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function public.handle_new_user();

-- ----------------------------------------------------------------------------
-- Trigger: mantém updated_at atualizado
-- ----------------------------------------------------------------------------
create or replace function public.set_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists profiles_updated_at on public.profiles;
create trigger profiles_updated_at
  before update on public.profiles
  for each row execute function public.set_updated_at();

drop trigger if exists lessons_updated_at on public.lessons;
create trigger lessons_updated_at
  before update on public.lessons
  for each row execute function public.set_updated_at();

-- ============================================================================
-- Row Level Security
-- ============================================================================
alter table public.profiles enable row level security;
alter table public.subjects enable row level security;
alter table public.lessons enable row level security;
alter table public.user_lesson_progress enable row level security;
alter table public.study_tasks enable row level security;
alter table public.study_sessions enable row level security;
alter table public.favorites enable row level security;
alter table public.question_attempts enable row level security;

-- Perfis: cada usuário vê e edita apenas o próprio perfil
create policy "profiles_select_own" on public.profiles
  for select using (auth.uid() = id);
create policy "profiles_update_own" on public.profiles
  for update using (auth.uid() = id) with check (auth.uid() = id);

-- Matérias: leitura pública (catálogo), escrita apenas via painel/service role
create policy "subjects_select_all" on public.subjects
  for select using (true);

-- Aulas: apenas publicadas ficam visíveis para estudantes
create policy "lessons_select_published" on public.lessons
  for select using (status = 'published');

-- Dados pessoais: dono vê, insere, edita e apaga apenas os próprios registros
create policy "progress_all_own" on public.user_lesson_progress
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

create policy "tasks_all_own" on public.study_tasks
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

create policy "sessions_all_own" on public.study_sessions
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

create policy "favorites_all_own" on public.favorites
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

create policy "attempts_all_own" on public.question_attempts
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

-- ============================================================================
-- Seed: 8 matérias iniciais do PRD
-- ============================================================================
insert into public.subjects (slug, name, description, icon, sort_order) values
  ('matematica',  'Matemática',  'Álgebra, geometria, funções e muito mais.',   'Calculator',    1),
  ('fisica',      'Física',      'Mecânica, eletricidade, ondas e termologia.', 'Atom',          2),
  ('quimica',     'Química',     'Atomística, ligações químicas e reações.',    'FlaskConical',  3),
  ('biologia',    'Biologia',    'Citologia, genética, ecologia e evolução.',   'Leaf',          4),
  ('portugues',   'Português',   'Gramática, interpretação de texto e redação.','BookOpen',      5),
  ('ingles',      'Inglês',      'Vocabulário, gramática e leitura.',           'Languages',     6),
  ('historia',    'História',    'História do Brasil, geral e contemporânea.',  'Landmark',      7),
  ('geografia',   'Geografia',   'Geografia física, humana e geopolítica.',     'Globe2',        8),
  ('filosofia',   'Filosofia',   'Ética, lógica, política e metafísica.',      'Brain',         9),
  ('sociologia',  'Sociologia',  'Sociedade, cultura e instituições sociais.',   'Users',         10),
  ('literatura',  'Literatura',  'Movimentos literários e análise de textos.',   'BookText',      11),
  ('arte',        'Arte',        'História da arte, estilos e expressões.',     'Palette',       12),
  ('programacao', 'Programação', 'Lógica, algoritmos e linguagens.',            'Code2',         13)
on conflict (slug) do nothing;
