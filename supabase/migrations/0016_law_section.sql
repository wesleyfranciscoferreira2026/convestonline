-- ============================================================================
-- Convest+ — Seção de Direito (estudantes de Direito)
-- ============================================================================
-- Matérias de Direito
insert into public.subjects (slug, name, description, icon, sort_order) values
  ('direito-constitucional', 'Direito Constitucional', 'Constituição, direitos fundamentais, organização do Estado.', 'Scale', 14),
  ('direito-penal', 'Direito Penal', 'Crime, tipicidade, culpabilidade e penas.', 'Gavel', 15)
on conflict (slug) do nothing;

-- ============================================================================
-- QUESTÕES — Direito Constitucional (tópicos e níveis)
-- ============================================================================

-- Princípios Fundamentais — Fácil
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, level, status, sort_order)
select s.id,
  'Qual é o fundamento da República Federativa do Brasil segundo o art. 1º da Constituição Federal?',
  '["Soberania, cidadania, dignidade da pessoa humana, valores sociais do trabalho e da livre iniciativa", "Soberania, cidadania, dignidade da pessoa humana, valores sociais do trabalho e livre concorrência", "Soberania, cidadania, dignidade da pessoa humana, valores sociais do trabalho e da livre iniciativa, pluralismo político", "Soberania, cidadania, dignidade da pessoa humana, valores sociais do trabalho e da livre iniciativa e pluralismo político"]'::jsonb,
  3,
  'O art. 1º, IV da CF/88 estabelece como fundamentos: soberania, cidadania, dignidade da pessoa humana, valores sociais do trabalho e da livre iniciativa e o pluralismo político.',
  'easy', 'Princípios Fundamentais', 'regular', 'published', 1
from public.subjects s where s.slug = 'direito-constitucional';

-- Direitos Fundamentais — Fácil
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, level, status, sort_order)
select s.id,
  'Qual artigo da Constituição Federal trata dos direitos e garantias fundamentais?',
  '["Art. 1º", "Art. 3º", "Art. 5º", "Art. 7º"]'::jsonb,
  2,
  'O art. 5º da CF/88 é o artigo dos direitos e garantias fundamentais, contendo mais de 70 incisos.',
  'easy', 'Direitos Fundamentais', 'regular', 'published', 2
from public.subjects s where s.slug = 'direito-constitucional';

-- Controle de Constitucionalidade — Médio
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, level, status, sort_order)
select s.id,
  'Qual é a diferença entre controle de constitucionalidade concentrado e difuso?',
  '["O concentrado é feito por qualquer juiz; o difuso é feito apenas pelo STF", "O concentrado é feito pelo STF e tribunais superiores; o difuso é feito por qualquer juiz ou tribunal", "Ambos são feitos exclusivamente pelo STF", "O concentrado é preventivo; o difuso é repressivo"]'::jsonb,
  1,
  'No controle concentrado (abstrato), a análise é feita pelo STF (ou tribunais, conforme o caso) em ações específicas (ADI, ADC, ADPF). No controle difuso (concreto), qualquer juiz ou tribunal pode declarar a inconstitucionalidade de uma lei em um caso concreto.',
  'medium', 'Controle de Constitucionalidade', 'regular', 'published', 3
from public.subjects s where s.slug = 'direito-constitucional';

-- Organização do Estado — Médio
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, level, status, sort_order)
select s.id,
  'Qual é a forma de Estado adotada pela Constituição Federal de 1988?',
  '["Estado Unitário", "Estado Federativo", "Estado Confederado", "Estado Regional"]'::jsonb,
  1,
  'O Brasil adota a forma de Estado Federativo (art. 1º da CF/88), com União, Estados, Distrito Federal e Municípios.',
  'medium', 'Organização do Estado', 'regular', 'published', 4
from public.subjects s where s.slug = 'direito-constitucional';

-- Direitos Fundamentais — Difícil
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, level, status, sort_order)
select s.id,
  'Sobre a cláusula de reserva do possível (reserva do possível) no direito constitucional brasileiro, é correto afirmar que:',
  '["É uma doutrina que permite ao Estado limitar direitos fundamentais sem justificativa", "É uma limitação aos direitos fundamentais que exige que o Estado demonstre impossibilidade de cumprimento por falta de recursos", "Permite a suspensão de direitos fundamentais em caso de emergência", "É aplicável apenas aos direitos sociais, nunca aos direitos civis e políticos"]'::jsonb,
  1,
  'A reserva do possível exige que, ao limitar direitos (especialmente sociais), o Estado demonstre que não tem recursos para cumpri-los. Não é uma justificativa automática — exige prova de impossibilidade.',
  'hard', 'Direitos Fundamentais', 'regular', 'published', 5
from public.subjects s where s.slug = 'direito-constitucional';

-- Poderes — Difícil
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, level, status, sort_order)
select s.id,
  'Quais são os três poderes da República Federativa do Brasil segundo a Constituição de 1988?',
  '["Executivo, Legislativo e Judiciário", "Executivo, Legislativo e Moderador", "Executivo, Judiciário e Constituinte", "Legislativo, Judiciário e Eleitoral"]'::jsonb,
  0,
  'O art. 2º da CF/88 estabelece a separação dos poderes em Executivo, Legislativo e Judiciário, independentes e harmônicos entre si.',
  'hard', 'Organização dos Poderes', 'regular', 'published', 6
from public.subjects s where s.slug = 'direito-constitucional';

-- ============================================================================
-- QUESTÕES — Direito Penal
-- ============================================================================

-- Teoria do Crime — Fácil
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, level, status, sort_order)
select s.id,
  'Quais são os elementos do crime segundo o direito penal brasileiro?',
  '["Tipicidade e culpabilidade", "Conduta, resultado e nexo causal", "Tipicidade, ilicitude e culpabilidade", "Dolo e culpa"]'::jsonb,
  2,
  'O crime é composto por três elementos: tipicidade (conduta típica), ilicitude (antijuridicidade) e culpabilidade (imputabilidade, potencial consciência da ilicitude e exigibilidade de conduta diversa).',
  'easy', 'Teoria do Crime', 'regular', 'published', 1
from public.subjects s where s.slug = 'direito-penal';

-- Tipicidade — Fácil
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, level, status, sort_order)
select s.id,
  'O que é tipicidade no direito penal?',
  '["Adequação da conduta ao tipo penal", "A possibilidade de punição", "A vontade de cometer o crime", "A antijuridicidade da conduta"]'::jsonb,
  0,
  'Tipicidade é a adequação da conduta ao tipo penal previsto em lei. Sem tipicidade, não há crime.',
  'easy', 'Tipicidade', 'regular', 'published', 2
from public.subjects s where s.slug = 'direito-penal';

-- Dolo e Culpa — Médio
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, level, status, sort_order)
select s.id,
  'Qual a diferença entre dolo e culpa no direito penal?',
  '["Dolo é a vontade de praticar o crime; culpa é a previsibilidade do resultado", "Dolo e culpa são sinônimos", "Dolo é a imprudência; culpa é a negligência", "Dolo é o erro de tipo; culpa é o erro de proibição"]'::jsonb,
  0,
  'Dolo é a vontade consciente de praticar a conduta típica (intenção). Culpa é a previsibilidade do resultado não desejado (imprudência, negligência ou imperícia).',
  'medium', 'Dolo e Culpa', 'regular', 'published', 3
from public.subjects s where s.slug = 'direito-penal';

-- Penas — Médio
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, level, status, sort_order)
select s.id,
  'Quais são as espécies de penas privativas de liberdade no direito penal brasileiro?',
  '["Reclusão e detenção", "Reclusão, detenção e prisão simples", "Reclusão e prisão", "Detenção e prisão civil"]'::jsonb,
  0,
  'O Código Penal brasileiro prevê duas espécies de penas privativas de liberdade: reclusão (para crimes mais graves) e detenção (para crimes menos graves).',
  'medium', 'Penas', 'regular', 'published', 4
from public.subjects s where s.slug = 'direito-penal';

-- Excludentes de Ilicitude — Difícil
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, level, status, sort_order)
select s.id,
  'Quais são as excludentes de ilicitude no direito penal brasileiro?',
  '["Legítima defesa, estado de necessidade e estrito cumprimento do dever legal", "Legítima defesa, estado de necessidade, estrito cumprimento do dever legal e exercício regular de direito", "Legítima defesa e estado de necessidade apenas", "Legítima defesa, estado de necessidade, estrito cumprimento do dever legal, exercício regular de direito e consentimento do ofendido"]'::jsonb,
  3,
  'O art. 23 do CP prevê: legítima defesa, estado de necessidade, estrito cumprimento do dever legal e exercício regular de direito. O consentimento do ofendido é excludente de ilicitude em alguns crimes específicos, mas não está no art. 23.',
  'hard', 'Excludentes de Ilicitude', 'regular', 'published', 5
from public.subjects s where s.slug = 'direito-penal';

-- Tentativa — Difícil
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, level, status, sort_order)
select s.id,
  'No direito penal brasileiro, a tentativa é punível quando:',
  '["A conduta não ultrapassa a fase de preparação", "A conduta ultrapassa a fase de preparação mas não se consuma", "O crime é consumado", "O agente desiste voluntariamente"]'::jsonb,
  1,
  'A tentativa é punível quando o agente inicia a execução do crime (ultrapassa a fase de preparação) mas não o consuma, por circunstâncias alheias à sua vontade (art. 14, II do CP).',
  'hard', 'Teoria do Crime', 'regular', 'published', 6
from public.subjects s where s.slug = 'direito-penal';
