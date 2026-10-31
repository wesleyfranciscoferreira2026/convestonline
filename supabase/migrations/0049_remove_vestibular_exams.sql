-- ============================================================================
-- Remove tudo relacionado a vestibulares (exames e questoes).
-- Mantem apenas ENEM e Cursos Militares.
-- ============================================================================

-- Remove questoes de vestibulares
delete from public.questions
where exam_id in (
  select id from public.exams where category = 'vestibular'
);

-- Remove exames vestibulares
delete from public.exams where category = 'vestibular';

-- Remove a categoria 'vestibular' do check constraint (opcional)
-- alter table public.exams drop constraint if exists exams_category_check;
-- alter table public.exams add constraint exams_category_check check (category in ('enem', 'militar'));
