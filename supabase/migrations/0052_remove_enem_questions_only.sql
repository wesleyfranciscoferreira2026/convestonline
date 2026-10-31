-- ============================================================================
-- Remove todas as questoes de ENEM (mas mantem o exame no catalogo).
-- ============================================================================

delete from public.questions
where exam_id in (
  select id from public.exams where slug = 'enem'
);
