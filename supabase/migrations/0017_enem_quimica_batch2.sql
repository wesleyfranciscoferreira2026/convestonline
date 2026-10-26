-- ============================================================================
-- Convest+ — Questões de Química do ENEM (lote 2) — apenas imagem
-- ============================================================================

insert into public.questions
  (source_ref, subject_id, exam_id, year, topic, question_type,
   prompt, source_images, option_images, stem_image_url,
   options, correct_index, explanation, difficulty, status, sort_order)
values
-- Q92 (2012.2) — Bioquímica — fosfatidilserina
('ENEM-Q092',
  (select id from public.subjects where slug='quimica'),
  (select id from public.exams where slug='enem'),
  2012, 'Bioquímica', 'multiple_choice',
  '',
  '["https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q092.png"]'::jsonb,
  '[]'::jsonb,
  'https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q092.png',
  '["iônica somente com o grupo aniônico fosfato, já que o cálcio livre é um cátion monovalente.", "iônica com os grupos aniônicos fosfato e carboxila, porque o cálcio em sua forma livre é um cátion divalente.", "iônica com o cátion amônio, porque o cálcio livre é representado como um ânion monovalente.", "covalente com qualquer dos grupos não carregados da fosfatidilserina, uma vez que estes podem doar elétrons ao cálcio livre para formar a ligação.", "covalente com qualquer grupo catiônico da fosfatidilserina, visto que o cálcio na sua forma livre poderá compartilhar seus elétrons com tais grupos."]'::jsonb,
  1, null, 'medium', 'published', 92),

-- Q105 (2013.1) — Química orgânica — glifosato
('ENEM-Q105',
  (select id from public.subjects where slug='quimica'),
  (select id from public.exams where slug='enem'),
  2013, 'Química orgânica', 'multiple_choice',
  '',
  '["https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q105.png"]'::jsonb,
  '[]'::jsonb,
  'https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q105.png',
  '["A", "B", "C", "D", "E"]'::jsonb,
  1, null, 'medium', 'published', 105),

-- Q112 (2013.1) — Química orgânica — NanoKid
('ENEM-Q112',
  (select id from public.subjects where slug='quimica'),
  (select id from public.exams where slug='enem'),
  2013, 'Química orgânica', 'multiple_choice',
  '',
  '["https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q112.png"]'::jsonb,
  '[]'::jsonb,
  'https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q112.png',
  '["Mãos.", "Cabeça.", "Tórax.", "Abdômen.", "Pés."]'::jsonb,
  0, null, 'medium', 'published', 112),

-- Q116 (2013.2) — Química orgânica — ácidos graxos
('ENEM-Q116',
  (select id from public.subjects where slug='quimica'),
  (select id from public.exams where slug='enem'),
  2013, 'Química orgânica', 'multiple_choice',
  '',
  '["https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q116.png"]'::jsonb,
  '[]'::jsonb,
  'https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q116.png',
  '["palmítico e linolênico.", "esteárico e oleico.", "palmítico e esteárico.", "linolênico e esteárico.", "linolênico e linoleico."]'::jsonb,
  4, null, 'medium', 'published', 116),

-- Q133 (2014.1) — Química orgânica — fármaco não planar
('ENEM-Q133',
  (select id from public.subjects where slug='quimica'),
  (select id from public.exams where slug='enem'),
  2014, 'Química orgânica', 'multiple_choice',
  '',
  '["https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q133.png"]'::jsonb,
  '[]'::jsonb,
  'https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q133.png',
  '["A", "B", "C", "D", "E"]'::jsonb,
  0, null, 'hard', 'published', 133),

-- Q134 (2014.1) — Química orgânica — fenol/acetona
('ENEM-Q134',
  (select id from public.subjects where slug='quimica'),
  (select id from public.exams where slug='enem'),
  2014, 'Química orgânica', 'multiple_choice',
  '',
  '["https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q134.png"]'::jsonb,
  '[]'::jsonb,
  'https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q134.png',
  '["filtração.", "ventilação.", "decantação.", "evaporação.", "destilação fracionada."]'::jsonb,
  4, null, 'medium', 'published', 134)

on conflict (source_ref) do update set
  subject_id = excluded.subject_id,
  exam_id = excluded.exam_id,
  year = excluded.year,
  topic = excluded.topic,
  question_type = excluded.question_type,
  prompt = excluded.prompt,
  source_images = excluded.source_images,
  stem_image_url = excluded.stem_image_url,
  options = excluded.options,
  correct_index = excluded.correct_index,
  difficulty = excluded.difficulty,
  status = excluded.status;
