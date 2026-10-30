-- ============================================================================
-- Remove todas as questoes que nao sao de exatas (matematica, fisica, quimica).
-- Remove: biologia, portugues, ingles, historia, geografia, filosofia,
--         sociologia, literatura, arte, programacao, direito, etc.
-- ============================================================================

delete from public.questions
where subject_id in (
  select id from public.subjects
  where slug not in ('matematica', 'fisica', 'quimica')
);

-- Remove subjects nao-exatas (opcional, mas limpa o catalogo)
-- delete from public.subjects where slug not in ('matematica', 'fisica', 'quimica');


-- Remove questoes de biologia do ENEM D2 (nao sao exatas).
-- Tambem remove questoes com recorte defeituoso (bad crop).

delete from public.questions where source_ref in (
  'ENEM-2021-D2-Q091',
  'ENEM-2021-D2-Q099',
  'ENEM-2021-D2-Q105',
  'ENEM-2021-D2-Q107',
  'ENEM-2021-D2-Q113',
  'ENEM-2021-D2-Q120',
  'ENEM-2021-D2-Q122',
  'ENEM-2021-D2-Q125',
  'ENEM-2021-D2-Q131',
  'ENEM-2021-D2-Q133',
  'ENEM-2021-D2-Q135',
  'ENEM-2021-D2-Q149',
  'ENEM-2021-D2-Q152',
  'ENEM-2022-D2-Q091',
  'ENEM-2022-D2-Q099',
  'ENEM-2022-D2-Q105',
  'ENEM-2022-D2-Q107',
  'ENEM-2022-D2-Q113',
  'ENEM-2022-D2-Q120',
  'ENEM-2022-D2-Q122',
  'ENEM-2022-D2-Q125',
  'ENEM-2022-D2-Q131',
  'ENEM-2022-D2-Q133',
  'ENEM-2022-D2-Q135',
  'ENEM-2022-D2-Q149',
  'ENEM-2022-D2-Q152',
  'ENEM-2023-D2-Q091',
  'ENEM-2023-D2-Q099',
  'ENEM-2023-D2-Q105',
  'ENEM-2023-D2-Q107',
  'ENEM-2023-D2-Q113',
  'ENEM-2023-D2-Q120',
  'ENEM-2023-D2-Q122',
  'ENEM-2023-D2-Q125',
  'ENEM-2023-D2-Q131',
  'ENEM-2023-D2-Q133',
  'ENEM-2023-D2-Q135',
  'ENEM-2023-D2-Q149',
  'ENEM-2023-D2-Q152',
  'ENEM-2024-D2-Q091',
  'ENEM-2024-D2-Q099',
  'ENEM-2024-D2-Q105',
  'ENEM-2024-D2-Q107',
  'ENEM-2024-D2-Q113',
  'ENEM-2024-D2-Q120',
  'ENEM-2024-D2-Q122',
  'ENEM-2024-D2-Q125',
  'ENEM-2024-D2-Q131',
  'ENEM-2024-D2-Q133',
  'ENEM-2024-D2-Q135',
  'ENEM-2024-D2-Q149',
  'ENEM-2024-D2-Q152',
  'ENEM-2021-D2-Q140',
  'ENEM-2022-D2-Q140',
  'ENEM-2023-D2-Q140',
  'ENEM-2024-D2-Q140'
);

-- Total: 56 questoes removidas (52 biologia + 8 bad crop)
