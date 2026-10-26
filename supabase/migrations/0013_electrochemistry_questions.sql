-- ============================================================================
-- Convest+ — Questões de Eletroquímica (ENEM)
-- ============================================================================

insert into public.questions
  (source_ref, subject_id, exam_id, year, topic, question_type, prompt,
   source_images, option_images, stem_image_url, options, correct_index,
   explanation, difficulty, status, sort_order)
values
-- ----------------------------------------------------------------------------
-- Questão 07 (2009.1) — Pilha de óxido de prata
-- ----------------------------------------------------------------------------
(
  'ELETRO-Q007', (select id from public.subjects where slug='fisica'),
  (select id from public.exams where slug='enem'), 2009, 'Eletroquímica',
  'multiple_choice',
  '',
  '["https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q007.png"]'::jsonb,
  '[]'::jsonb,
  'https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q007.png',
  '["é uma pilha ácida.", "apresenta o óxido de prata como o ânodo.", "apresenta o zinco como o agente oxidante.", "tem como reação da célula: Zn(s) + Ag₂O(s) → ZnO(s) + 2Ag(s).", "apresenta fluxo de elétrons na pilha do eletrodo de Ag₂O para o Zn."]'::jsonb,
  3,
  'Na pilha de óxido de prata, o zinco é oxidado (ânodo) e o óxido de prata é reduzido (cátodo). A reação global é Zn + Ag₂O → ZnO + 2Ag. O fluxo de elétrons vai do ânodo (Zn) para o cátodo (Ag₂O), não o contrário.',
  'medium', 'published', 7
),
-- ----------------------------------------------------------------------------
-- Questão 13 (2009.2) — Purificação eletrolítica do cobre
-- ----------------------------------------------------------------------------
(
  'ELETRO-Q013', (select id from public.subjects where slug='fisica'),
  (select id from public.exams where slug='enem'), 2009, 'Eletroquímica',
  'multiple_choice',
  '',
  '["https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q013.png"]'::jsonb,
  '[]'::jsonb,
  'https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q013.png',
  '["Au, Pt, Ag, Zn, Ni e Pb.", "Au, Pt e Ag.", "Zn, Ni e Pb.", "Au e Zn.", "Ag e Pb."]'::jsonb,
  1,
  'Metais menos reativos que o cobre (Au, Pt, Ag) não são oxidados e se desprendem do ânodo, sedimentando-se abaixo dele. Metais mais reativos (Zn, Ni, Pb) são oxidados e passam para a solução.',
  'medium', 'published', 13
),
-- ----------------------------------------------------------------------------
-- Questão 16 (2009.2) — Poluição por metais pesados
-- ----------------------------------------------------------------------------
(
  'ELETRO-Q016', (select id from public.subjects where slug='fisica'),
  (select id from public.exams where slug='enem'), 2009, 'Química ambiental',
  'multiple_choice',
  '',
  '["https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q016.png"]'::jsonb,
  '[]'::jsonb,
  'https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q016.png',
  '["deixar de consumir aparelhos elétricos que utilizem pilha ou bateria como fonte de energia.", "usar apenas pilhas ou baterias recarregáveis e de vida útil longa e evitar ingerir alimentos contaminados, especialmente peixes.", "devolver pilhas e baterias, após o esgotamento da energia armazenada, à rede de assistência técnica especializada para repasse a fabricantes e/ou importadores.", "criar nas cidades, especialmente naquelas com mais de 100 mil habitantes, pontos estratégicos de coleta de baterias e pilhas, para posterior repasse a fabricantes e/ou importadores.", "exigir que fabricantes invistam em pesquisa para a substituição desses metais tóxicos por substâncias menos nocivas ao homem e ao ambiente, e que não sejam bioacumulativas."]'::jsonb,
  4,
  'A coleta e o repasse de pilhas/baterias usadas aos fabricantes para descarte adequado é a medida mais eficaz para evitar a contaminação ambiental.',
  'medium', 'published', 16
),
-- ----------------------------------------------------------------------------
-- Questão 32 (2010.1) — Eletrólise do cobre
-- ----------------------------------------------------------------------------
(
  'ELETRO-Q032', (select id from public.subjects where slug='fisica'),
  (select id from public.exams where slug='enem'), 2010, 'Eletroquímica',
  'multiple_choice',
  '',
  '["https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q032.png"]'::jsonb,
  '[]'::jsonb,
  'https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q032.png',
  '["0,02 g.", "0,04 g.", "2,40 g.", "35,59 g.", "71,09 g."]'::jsonb,
  3,
  'Massa de Cu = (I × t × M) / (n × F) = (10 × 10800 × 63,5) / (2 × 96500) ≈ 35,6 g.',
  'medium', 'published', 32
),
-- ----------------------------------------------------------------------------
-- Questão 36 (2010.1) — Baterias de Ni-Cd
-- ----------------------------------------------------------------------------
(
  'ELETRO-Q036', (select id from public.subjects where slug='fisica'),
  (select id from public.exams where slug='enem'), 2010, 'Eletroquímica',
  'multiple_choice',
  '',
  '["https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q036.png"]'::jsonb,
  '[]'::jsonb,
  'https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q036.png',
  '["as moléculas X e Y atuam como extratores catiônicos uma vez que a parte polar da molécula troca o íon H⁺ pelo cátion do metal.", "as moléculas X e Y atuam como extratores aniônicos uma vez que a parte polar da molécula troca o íon H⁺ pelo cátion do metal.", "as moléculas X e Y atuam como extratores catiônicos uma vez que a parte polar da molécula troca o íon PO₄³⁻ pelo cátion do metal.", "as moléculas X e Y atuam como extratores aniônicos uma vez que a parte polar da molécula troca o íon PO₄³⁻ pelo cátion do metal.", "as moléculas X e Y fazem ligações com os íons metálicos resultando em compostos com caráter apolar o que justifica a eficácia da extração."]'::jsonb,
  0,
  'As moléculas X e Y são extratores catiônicos: a parte polar (grupo ácido) troca o H⁺ pelo cátion do metal (Cd²⁺, Ni²⁺, Co²⁺), formando um complexo que se solubiliza na fase orgânica.',
  'hard', 'published', 36
),
-- ----------------------------------------------------------------------------
-- Questão 46 (2010.2) — Toxicidade do cádmio
-- ----------------------------------------------------------------------------
(
  'ELETRO-Q046', (select id from public.subjects where slug='fisica'),
  (select id from public.exams where slug='enem'), 2010, 'Química inorgânica',
  'multiple_choice',
  '',
  '["https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q046.png"]'::jsonb,
  '[]'::jsonb,
  'https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q046.png',
  '["Apresentar baixa energia de ionização, o que favorece a formação do íon e facilita sua ligação a outros compostos.", "Possuir tendência de atuar em processos biológicos mediados por cátions metálicos com cargas que variam de +1 a +3.", "Possuir raio e carga relativamente próximos aos de íons metálicos que atuam nos processos biológicos, causando interferência nesses processos.", "Apresentar raio iônico grande, permitindo que ele cause interferência nos processos biológicos em que, normalmente, íons menores participam.", "Apresentar carga +2, o que permite que ele cause interferência nos processos biológicos em que, normalmente, íons com cargas menores participam."]'::jsonb,
  2,
  'O íon Cd²⁺ tem raio e carga próximos aos de Ca²⁺ e Zn²⁺, permitindo que ele substitua esses cátions em processos biológicos, causando interferência.',
  'medium', 'published', 46
)
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
  explanation = excluded.explanation,
  difficulty = excluded.difficulty,
  status = excluded.status;
