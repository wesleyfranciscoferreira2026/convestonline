-- ============================================================================
-- Convest+ — Corrige source_ref duplicado e imagens extras (Q140)
-- ============================================================================
-- 1. Remove o prefixo duplicado "ENEM-ENEM-" → "ENEM-"
update public.questions
set source_ref = replace(source_ref, 'ENEM-ENEM-', 'ENEM-')
where source_ref like 'ENEM-ENEM-%';

-- 2. Corrige Q140: remove a imagem extra (q140b.png é da Q156)
update public.questions
set source_images = '["https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q140.png"]'::jsonb,
    stem_image_url = 'https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q140.png'
where source_ref = 'ENEM-2014.2-Q140'
   or source_ref = 'ENEM-ENEM-2014.2-Q140';

-- 3. Verifica
select count(*) as total,
       count(*) filter (where source_ref like 'ENEM-ENEM-%') as com_prefixo_duplo
from public.questions
where source_ref like 'ENEM-%';
