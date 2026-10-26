-- ============================================================================
-- Convest+ — Questões de Química do ENEM (apenas imagem)
-- ============================================================================
-- As questões exibem apenas a imagem original (enunciado + alternativas).
-- O texto OCR foi removido; a imagem é a fonte autoritativa.
-- ============================================================================

insert into public.questions
  (source_ref, subject_id, exam_id, year, topic, question_type,
   prompt, source_images, option_images, stem_image_url,
   options, correct_index, explanation, difficulty, status, sort_order)
values
-- Q04 (2009.1) — Química ambiental — CETESB
('ENEM-Q004',
  (select id from public.subjects where slug='quimica'),
  (select id from public.exams where slug='enem'),
  2009, 'Química ambiental', 'multiple_choice',
  '',
  '["https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q004.png"]'::jsonb,
  '[]'::jsonb,
  'https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q004.png',
  '["A) no Parque Dom Pedro II.", "B) em São Caetano do Sul.", "C) em Congonhas.", "D) em Osasco.", "E) em Pinheiros."]'::jsonb,
  4, null, 'medium', 'published', 4),

-- Q14 (2009.2) — Atomística — isótopos do antimônio
('ENEM-Q014',
  (select id from public.subjects where slug='quimica'),
  (select id from public.exams where slug='enem'),
  2009, 'Atomística e tabela periódica', 'multiple_choice',
  '',
  '["https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q014.png"]'::jsonb,
  '[]'::jsonb,
  'https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q014.png',
  '["A) entre 12 e 24 nêutrons a menos que o número de prótons.", "B) exatamente o mesmo número de prótons e nêutrons.", "C) entre 0 e 12 nêutrons a mais que o número de prótons.", "D) entre 12 e 24 nêutrons a mais que o número de prótons.", "E) entre 0 e 12 nêutrons a menos que o número de prótons."]'::jsonb,
  3, null, 'medium', 'published', 14),

-- Q20 (2009.2) — Química geral — nanopartículas
('ENEM-Q020',
  (select id from public.subjects where slug='quimica'),
  (select id from public.exams where slug='enem'),
  2009, 'Química geral', 'multiple_choice',
  '',
  '["https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q020.png"]'::jsonb,
  '[]'::jsonb,
  'https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q020.png',
  '["A) as partículas, quanto menores, mais potentes e radiativas se tornam.", "B) as partículas podem ser manipuladas, mas não caracterizadas com a atual tecnologia.", "C) as propriedades biológicas das partículas somente podem ser testadas em microrganismos.", "D) as partículas podem atravessar poros e canais celulares, o que poderia causar impactos desconhecidos aos seres vivos e, até mesmo, aos ecossistemas.", "E) o organismo humano apresenta imunidade contra partículas tão pequenas, já que apresentam a mesma dimensão das bactérias (um bilionésimo de metro)."]'::jsonb,
  3, null, 'medium', 'published', 20),

-- Q23 (2009.3) — Química orgânica — AAS
('ENEM-Q023',
  (select id from public.subjects where slug='quimica'),
  (select id from public.exams where slug='enem'),
  2009, 'Química orgânica', 'multiple_choice',
  '',
  '["https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q023.png"]'::jsonb,
  '[]'::jsonb,
  'https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q023.png',
  '["A) C₃O₃H₃COOH.", "B) C₇O₂H₆COOH.", "C) C₆OH₅COOH.", "D) C₇O₂H₅COOH.", "E) C₆O₂H₅COOH."]'::jsonb,
  3, null, 'medium', 'published', 23),

-- Q24 (2009.3) — Transformações da matéria — estados físicos da água
('ENEM-Q024',
  (select id from public.subjects where slug='quimica'),
  (select id from public.exams where slug='enem'),
  2009, 'Transformações da matéria', 'multiple_choice',
  '',
  '["https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q024.png"]'::jsonb,
  '[]'::jsonb,
  'https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q024.png',
  '["A) sólidos afundam na água.", "B) a interação entre as moléculas está restrita ao estado sólido.", "C) a figura B é a que melhor representa a água no estado líquido.", "D) a figura A é a que melhor representa o gelo, ou seja, água no estado sólido.", "E) aumenta a distância entre as moléculas da substância à medida que a temperatura aumenta."]'::jsonb,
  3, null, 'medium', 'published', 24),

-- Q25 (2010.1) — Eletroquímica — célula a combustível
('ENEM-Q025',
  (select id from public.subjects where slug='quimica'),
  (select id from public.exams where slug='enem'),
  2010, 'Eletroquímica', 'multiple_choice',
  '',
  '["https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q025a.png","https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q025b.png"]'::jsonb,
  '[]'::jsonb,
  'https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q025a.png',
  '["A) transforma energia química em energia elétrica, sem causar danos ao meio ambiente, porque o principal subproduto formado é a água.", "B) converte a energia química contida nas moléculas dos componentes em energia térmica, sem que ocorra a produção de gases poluentes nocivos ao meio ambiente.", "C) transforma energia química em energia elétrica, porém emite gases poluentes da mesma forma que a produção de energia a partir dos combustíveis fósseis.", "D) converte energia elétrica proveniente dos combustíveis fósseis em energia química, retendo os gases poluentes produzidos no processo sem alterar a qualidade do meio ambiente.", "E) converte a energia potencial acumulada nas moléculas de água contidas no sistema em energia química, sem que ocorra a produção de gases poluentes nocivos ao meio ambiente."]'::jsonb,
  0, null, 'medium', 'published', 25),

-- Q27 (2010.1) — Bioquímica — loricíferos
('ENEM-Q027',
  (select id from public.subjects where slug='quimica'),
  (select id from public.exams where slug='enem'),
  2010, 'Bioquímica', 'multiple_choice',
  '',
  '["https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q027.png"]'::jsonb,
  '[]'::jsonb,
  'https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q027.png',
  '["A) S e CH₄.", "B) S e NO₃⁻.", "C) H₂ e NO₃⁻.", "D) CO₂ e CH₄.", "E) H₂ e CO₂."]'::jsonb,
  1, null, 'medium', 'published', 27),

-- Q28 (2010.1) — Termoquímica — energia solar
('ENEM-Q028',
  (select id from public.subjects where slug='quimica'),
  (select id from public.exams where slug='enem'),
  2010, 'Termoquímica', 'multiple_choice',
  '',
  '["https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q028.png"]'::jsonb,
  '[]'::jsonb,
  'https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q028.png',
  '["A) transformação de energia térmica em energia química.", "B) conversão de energia química em energia térmica.", "C) transformação de energia luminosa em energia química.", "D) conversão de energia térmica em energia luminosa.", "E) transformação de energia química em energia luminosa."]'::jsonb,
  3, null, 'medium', 'published', 28),

-- Q33 (2010.1) — Química orgânica — monofluoracetato
('ENEM-Q033',
  (select id from public.subjects where slug='quimica'),
  (select id from public.exams where slug='enem'),
  2010, 'Química orgânica', 'multiple_choice',
  '',
  '["https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q033.png"]'::jsonb,
  '[]'::jsonb,
  'https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q033.png',
  '["A) desidratação do ácido monofluoracético, com liberação de água.", "B) hidrólise do ácido monofluoracético, sem formação de água.", "C) perda de íons hidroxila do ácido monofluoracético, com liberação de hidróxido de sódio.", "D) neutralização do ácido monofluoracético, usando hidróxido de sódio, com liberação de água.", "E) substituição dos íons hidrogênio por sódio na estrutura do ácido monofluoracético, sem formação de água."]'::jsonb,
  3, null, 'medium', 'published', 33),

-- Q35 (2010.1) — Química orgânica — pesticidas
('ENEM-Q035',
  (select id from public.subjects where slug='quimica'),
  (select id from public.exams where slug='enem'),
  2010, 'Química orgânica', 'multiple_choice',
  '',
  '["https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q035.png"]'::jsonb,
  '[]'::jsonb,
  'https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q035.png',
  '["A) R-O-P(=O)-O-CH₃ com O-CH₃ e S.", "B) R-O-P(=S)-O-CH₃ com O-CH₃ e S.", "C) R-S-P(=O)-O-CH₃ com O-CH₃ e O.", "D) R-O-P(=O)-O-CH₂CH₃ com OCH₂CH₃ e O.", "E) R-O-P(=S)-O-CH₂CH₃ com OCH₂CH₃."]'::jsonb,
  4, null, 'medium', 'published', 35),

-- Q45 (2010.2) — Química orgânica — dioxinas
('ENEM-Q045',
  (select id from public.subjects where slug='quimica'),
  (select id from public.exams where slug='enem'),
  2010, 'Química orgânica', 'multiple_choice',
  '',
  '["https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q045.png"]'::jsonb,
  '[]'::jsonb,
  'https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q045.png',
  '["A) ligações iônicas.", "B) forças de London.", "C) ligações covalentes.", "D) forças dipolo-dipolo.", "E) ligações de hidrogênio."]'::jsonb,
  3, null, 'medium', 'published', 45),

-- Q51 (2010.2) — Propriedades da matéria — densímetro
('ENEM-Q051',
  (select id from public.subjects where slug='quimica'),
  (select id from public.exams where slug='enem'),
  2010, 'Propriedades da matéria', 'multiple_choice',
  '',
  '["https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q051a.png","https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q051b.png"]'::jsonb,
  '[]'::jsonb,
  'https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q051a.png',
  '["A) indica a variação da densidade do combustível com a temperatura.", "B) mostra a diferença de altura da coluna a ser corrigida.", "C) mede a temperatura ambiente no momento do abastecimento.", "D) regula a temperatura do densímetro de acordo com a do ambiente.", "E) corrige a altura de referência de acordo com a densidade do líquido."]'::jsonb,
  4, null, 'medium', 'published', 51),

-- Q56 (2011.1) — Química orgânica — glicerina
('ENEM-Q056',
  (select id from public.subjects where slug='quimica'),
  (select id from public.exams where slug='enem'),
  2011, 'Química orgânica', 'multiple_choice',
  '',
  '["https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q056.png"]'::jsonb,
  '[]'::jsonb,
  'https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q056.png',
  '["A) ligações iônicas.", "B) forças de London.", "C) ligações covalentes.", "D) forças dipolo-dipolo.", "E) ligações de hidrogênio."]'::jsonb,
  4, null, 'medium', 'published', 56),

-- Q76 (2012.1) — Termoquímica — CO₂
('ENEM-Q076',
  (select id from public.subjects where slug='quimica'),
  (select id from public.exams where slug='enem'),
  2012, 'Termoquímica', 'multiple_choice',
  '',
  '["https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q076a.png","https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q076b.png"]'::jsonb,
  '[]'::jsonb,
  'https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q076a.png',
  '["A) 0,25 kg.", "B) 0,33 kg.", "C) 1,0 kg.", "D) 1,3 kg.", "E) 3,0 kg."]'::jsonb,
  1, null, 'medium', 'published', 76),

-- Q80 (2012.1) — Química inorgânica — PVC
('ENEM-Q080',
  (select id from public.subjects where slug='quimica'),
  (select id from public.exams where slug='enem'),
  2012, 'Química inorgânica', 'multiple_choice',
  '',
  '["https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q080.png"]'::jsonb,
  '[]'::jsonb,
  'https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q080.png',
  '["A) água dura.", "B) água de cal.", "C) água salobra.", "D) água destilada.", "E) água desmineralizada."]'::jsonb,
  1, null, 'medium', 'published', 80),

-- Q84 (2012.1) — Bioquímica — fosfolipídeos
('ENEM-Q084',
  (select id from public.subjects where slug='quimica'),
  (select id from public.exams where slug='enem'),
  2012, 'Bioquímica', 'multiple_choice',
  '',
  '["https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q084.png"]'::jsonb,
  '[]'::jsonb,
  'https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q084.png',
  '["A) polar, ou seja, serem inteiramente solúveis em água.", "B) apolar, ou seja, não serem solúveis em solução aquosa.", "C) anfotérica, ou seja, podem comportar-se como ácidos e bases.", "D) insaturada, ou seja, possuírem duplas ligações em sua estrutura.", "E) anfifílica, ou seja, possuírem uma parte hidrofílica e outra hidrofóbica."]'::jsonb,
  4, null, 'medium', 'published', 84),

-- Q88 (2012.2) — Química geral — cafeína
('ENEM-Q088',
  (select id from public.subjects where slug='quimica'),
  (select id from public.exams where slug='enem'),
  2012, 'Química geral', 'multiple_choice',
  '',
  '["https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q088.png"]'::jsonb,
  '[]'::jsonb,
  'https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q088.png',
  '["A) café expresso.", "B) chá preto.", "C) chocolate quente.", "D) café filtrado.", "E) refrigerante de cola."]'::jsonb,
  1, null, 'medium', 'published', 88),

-- Q90 (2012.2) — Química inorgânica — correção de acidez
('ENEM-Q090',
  (select id from public.subjects where slug='quimica'),
  (select id from public.exams where slug='enem'),
  2012, 'Química inorgânica', 'multiple_choice',
  '',
  '["https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q090.png"]'::jsonb,
  '[]'::jsonb,
  'https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q090.png',
  '["A) CaCO₃.", "B) NH₄Cl.", "C) KCl.", "D) Na₂SO₄.", "E) Ba(NO₃)₂."]'::jsonb,
  0, null, 'medium', 'published', 90),

-- Q91 (2012.2) — Termoquímica — aquecedor solar
('ENEM-Q091',
  (select id from public.subjects where slug='quimica'),
  (select id from public.exams where slug='enem'),
  2012, 'Termoquímica', 'multiple_choice',
  '',
  '["https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q091.png"]'::jsonb,
  '[]'::jsonb,
  'https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/enem-quimica/q091.png',
  '["A) cobre e material seletivo quente A.", "B) zinco e material seletivo quente B.", "C) aço e material seletivo quente B.", "D) aço e material seletivo quente A.", "E) cobre e material seletivo quente C."]'::jsonb,
  0, null, 'medium', 'published', 91)

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
