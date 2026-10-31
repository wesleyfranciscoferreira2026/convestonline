-- Remove questoes nao-exatas do FUVEST 2025 (biologia + unknown).
-- Atualiza subject_id para fisica e quimica.

delete from public.questions where source_ref in (
  'FUVEST-2025-Q02',
  'FUVEST-2025-Q29',
  'FUVEST-2025-Q31',
  'FUVEST-2025-Q46',
  'FUVEST-2025-Q48',
  'FUVEST-2025-Q50',
  'FUVEST-2025-Q58',
  'FUVEST-2025-Q59',
  'FUVEST-2025-Q60',
  'FUVEST-2025-Q64',
  'FUVEST-2025-Q67',
  'FUVEST-2025-Q79'
);

update public.questions set subject_id = (select id from public.subjects where slug='fisica') where source_ref in (
  'FUVEST-2025-Q03',
  'FUVEST-2025-Q13',
  'FUVEST-2025-Q18',
  'FUVEST-2025-Q19',
  'FUVEST-2025-Q20',
  'FUVEST-2025-Q22',
  'FUVEST-2025-Q23',
  'FUVEST-2025-Q26',
  'FUVEST-2025-Q28',
  'FUVEST-2025-Q32',
  'FUVEST-2025-Q33',
  'FUVEST-2025-Q37',
  'FUVEST-2025-Q38',
  'FUVEST-2025-Q49',
  'FUVEST-2025-Q51',
  'FUVEST-2025-Q61',
  'FUVEST-2025-Q65',
  'FUVEST-2025-Q73',
  'FUVEST-2025-Q74',
  'FUVEST-2025-Q80',
  'FUVEST-2025-Q82',
  'FUVEST-2025-Q83',
  'FUVEST-2025-Q84',
  'FUVEST-2025-Q89'
);

update public.questions set subject_id = (select id from public.subjects where slug='quimica') where source_ref in (
  'FUVEST-2025-Q63',
  'FUVEST-2025-Q76'
);
