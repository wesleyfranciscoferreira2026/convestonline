-- Remove questoes nao-exatas do FUVEST 2025 (biologia + unknown).
-- Atualiza subject_id para fisica e quimica.

delete from public.questions where source_ref in (
  'fuvest-2025-Q02',
  'fuvest-2025-Q29',
  'fuvest-2025-Q31',
  'fuvest-2025-Q46',
  'fuvest-2025-Q48',
  'fuvest-2025-Q50',
  'fuvest-2025-Q58',
  'fuvest-2025-Q59',
  'fuvest-2025-Q60',
  'fuvest-2025-Q64',
  'fuvest-2025-Q67',
  'fuvest-2025-Q79'
);

update public.questions set subject_id = (select id from public.subjects where slug='fisica') where source_ref in (
  'fuvest-2025-Q03',
  'fuvest-2025-Q13',
  'fuvest-2025-Q18',
  'fuvest-2025-Q19',
  'fuvest-2025-Q20',
  'fuvest-2025-Q22',
  'fuvest-2025-Q23',
  'fuvest-2025-Q26',
  'fuvest-2025-Q28',
  'fuvest-2025-Q32',
  'fuvest-2025-Q33',
  'fuvest-2025-Q37',
  'fuvest-2025-Q38',
  'fuvest-2025-Q49',
  'fuvest-2025-Q51',
  'fuvest-2025-Q61',
  'fuvest-2025-Q65',
  'fuvest-2025-Q73',
  'fuvest-2025-Q74',
  'fuvest-2025-Q80',
  'fuvest-2025-Q82',
  'fuvest-2025-Q83',
  'fuvest-2025-Q84',
  'fuvest-2025-Q89'
);

update public.questions set subject_id = (select id from public.subjects where slug='quimica') where source_ref in (
  'fuvest-2025-Q63',
  'fuvest-2025-Q76'
);
