-- ============================================================================
-- Remove todas as questoes de ENEM e ESA.
-- Mantem apenas ITA, IME, AFA e FGV (se houver).
-- ============================================================================

-- Remove questoes de ENEM
delete from public.questions
where exam_id in (
  select id from public.exams where slug = 'enem'
);

-- Remove questoes de ESA
delete from public.questions
where exam_id in (
  select id from public.exams where slug = 'esa'
);

-- Remove exames ENEM e ESA (opcional)
-- delete from public.exams where slug in ('enem', 'esa');
