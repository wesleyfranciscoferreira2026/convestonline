-- ============================================================================
-- Convest+ — Figuras específicas das questões de Química do ENEM
-- ============================================================================

update public.questions
set source_images = '["https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q002.jpg"]'::jsonb
where source_ref = 'ENEM-2009.1-Q2';

update public.questions
set source_images = '["https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q003.jpg"]'::jsonb
where source_ref = 'ENEM-2009.1-Q3';

update public.questions
set source_images = '["https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q004.jpg"]'::jsonb
where source_ref = 'ENEM-2009.1-Q4';

update public.questions
set source_images = '["https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q005.jpg"]'::jsonb
where source_ref = 'ENEM-2009.1-Q5';

update public.questions
set source_images = '["https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q006.jpg"]'::jsonb
where source_ref = 'ENEM-2009.1-Q6';

update public.questions
set source_images = '["https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q013a.jpg","https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q013b.jpg"]'::jsonb
where source_ref = 'ENEM-2009.2-Q13';
