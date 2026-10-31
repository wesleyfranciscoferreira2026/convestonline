-- ============================================================================
-- Remove todas as questoes de AFA.
-- Mantem apenas ITA e IME.
-- ============================================================================

-- Remove questoes de AFA
delete from public.questions
where exam_id in (
  select id from public.exams where slug = 'afa'
);

-- Remove exame AFA (opcional)
-- delete from public.exams where slug = 'afa';
