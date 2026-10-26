-- ============================================================================
-- Convest+ — FK entre question_attempts e questions (para joins do PostgREST)
-- ============================================================================
-- Limpa referências órfãs (questões geradas/deletadas) antes de criar a FK.
update public.question_attempts
set question_id = null
where question_id is not null
  and question_id not in (select id from public.questions);

alter table public.question_attempts
  drop constraint if exists question_attempts_question_id_fkey;

alter table public.question_attempts
  add constraint question_attempts_question_id_fkey
  foreign key (question_id) references public.questions (id) on delete set null;
