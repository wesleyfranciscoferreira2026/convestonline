-- Origem identificável permite importar os cadernos novamente sem duplicar.
alter table public.questions
  add column if not exists source_ref text,
  add column if not exists source_name text;

create unique index if not exists questions_source_ref_unique
  on public.questions (source_ref);
