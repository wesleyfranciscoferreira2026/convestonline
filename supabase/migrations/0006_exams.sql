-- ============================================================================
-- Convest — Provas e Bancas
-- Tabela de provas/vestibulares e vínculo com questões.
-- ============================================================================
create table if not exists public.exams (
  id uuid primary key default gen_random_uuid(),
  slug text unique not null,
  name text not null,
  category text not null check (category in ('enem', 'vestibular', 'militar')),
  description text,
  sort_order integer not null default 0,
  created_at timestamptz not null default now()
);

alter table public.exams enable row level security;
drop policy if exists "exams_select_all" on public.exams;
create policy "exams_select_all" on public.exams for select using (true);
drop policy if exists "exams_admin_all" on public.exams;
create policy "exams_admin_all" on public.exams for all using (public.is_admin()) with check (public.is_admin());

-- Vínculo questão -> prova
alter table public.questions add column if not exists exam_id uuid references public.exams (id) on delete set null;

-- ============================================================================
-- Seed: provas
-- ============================================================================
insert into public.exams (slug, name, category, description, sort_order) values
  -- ENEM
  ('enem', 'ENEM', 'enem', 'Exame Nacional do Ensino Médio', 1),
  -- Vestibulares
  ('fuvest', 'FUVEST (USP)', 'vestibular', 'Universidade de São Paulo', 2),
  ('unicamp', 'UNICAMP', 'vestibular', 'Universidade Estadual de Campinas', 3),
  ('unesp', 'UNESP', 'vestibular', 'Universidade Estadual Paulista', 4),
  ('uerj', 'UERJ', 'vestibular', 'Universidade do Estado do Rio de Janeiro', 5),
  ('ufrj', 'UFRJ', 'vestibular', 'Universidade Federal do Rio de Janeiro', 6),
  ('uff', 'UFF', 'vestibular', 'Universidade Federal Fluminense', 7),
  ('puc-rio', 'PUC-Rio', 'vestibular', 'Pontifícia Universidade Católica do Rio de Janeiro', 8),
  ('puc-sp', 'PUC-SP', 'vestibular', 'Pontifícia Universidade Católica de São Paulo', 9),
  ('mackenzie', 'Mackenzie', 'vestibular', 'Universidade Presbiteriana Mackenzie', 10),
  ('fgv', 'FGV', 'vestibular', 'Fundação Getulio Vargas', 11),
  ('ufmg', 'UFMG', 'vestibular', 'Universidade Federal de Minas Gerais', 12),
  ('ufpr', 'UFPR', 'vestibular', 'Universidade Federal do Paraná', 13),
  ('ufrgs', 'UFRGS', 'vestibular', 'Universidade Federal do Rio Grande do Sul', 14),
  ('ufsc', 'UFSC', 'vestibular', 'Universidade Federal de Santa Catarina', 15),
  ('ufba', 'UFBA', 'vestibular', 'Universidade Federal da Bahia', 16),
  ('ufpe', 'UFPE', 'vestibular', 'Universidade Federal de Pernambuco', 17),
  ('ufc', 'UFC', 'vestibular', 'Universidade Federal do Ceará', 18),
  ('ufam', 'UFAM', 'vestibular', 'Universidade Federal do Amazonas', 19),
  ('ufpa', 'UFPA', 'vestibular', 'Universidade Federal do Pará', 20),
  ('unb', 'UnB', 'vestibular', 'Universidade de Brasília', 21),
  ('uel', 'UEL', 'vestibular', 'Universidade Estadual de Londrina', 22),
  ('uem', 'UEM', 'vestibular', 'Universidade Estadual de Maringá', 23),
  -- Cursos Militares
  ('ita', 'ITA', 'militar', 'Instituto Tecnológico de Aeronáutica', 30),
  ('ime', 'IME', 'militar', 'Instituto Militar de Engenharia', 31),
  ('colegio-naval', 'Colégio Naval', 'militar', 'CN — Marinha do Brasil', 32),
  ('efomm', 'EFOMM', 'militar', 'Escola de Formação de Oficiais da Marinha Mercante', 33),
  ('epcar', 'EPCAR', 'militar', 'Escola Preparatória de Cadetes do Ar', 34),
  ('esa', 'ESA', 'militar', 'Escola de Sargento das Armas', 35),
  ('afa', 'AFA', 'militar', 'Academia da Força Aérea', 36),
  ('aman', 'AMAN', 'militar', 'Academia Militar das Agulhas Negras', 37),
  ('escola-naval', 'Escola Naval', 'militar', 'EN — Marinha do Brasil', 38)
on conflict (slug) do nothing;
