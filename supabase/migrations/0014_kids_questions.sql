-- ============================================================================
-- Convest+ — Questões para a área Kids (reforço escolar)
-- ============================================================================
alter table public.questions
  add column if not exists level text not null default 'regular'
    check (level in ('regular', 'kids1', 'kids2')),
  add column if not exists grade integer check (grade between 1 and 9);

create index if not exists questions_level_idx on public.questions (level);
create index if not exists questions_grade_idx on public.questions (grade);

-- ============================================================================
-- SEED: Questões Kids — Fundamental I (1º ao 5º ano)
-- ============================================================================

-- Matemática — Fundamental I
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, level, grade, status, sort_order)
select s.id,
  'Quanto é 7 + 5?',
  '["10", "11", "12", "13"]'::jsonb, 2,
  '7 + 5 = 12. Conte: 7, 8, 9, 10, 11, 12.',
  'easy', 'Adição', 'kids1', 2, 'published', 1
from public.subjects s where s.slug = 'matematica';

insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, level, grade, status, sort_order)
select s.id,
  'Quanto é 15 - 8?',
  '["5", "6", "7", "8"]'::jsonb, 2,
  '15 - 8 = 7. Conte de 8 até 15: 9, 10, 11, 12, 13, 14, 15 (7 números).',
  'easy', 'Subtração', 'kids1', 2, 'published', 2
from public.subjects s where s.slug = 'matematica';

insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, level, grade, status, sort_order)
select s.id,
  'Quanto é 6 × 3?',
  '["15", "16", "18", "21"]'::jsonb, 2,
  '6 × 3 = 18. É o mesmo que 6 + 6 + 6 = 18.',
  'easy', 'Multiplicação', 'kids1', 3, 'published', 3
from public.subjects s where s.slug = 'matematica';

insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, level, grade, status, sort_order)
select s.id,
  'Qual é o dobro de 9?',
  '["16", "18", "20", "22"]'::jsonb, 1,
  'O dobro de 9 é 9 × 2 = 18.',
  'easy', 'Multiplicação', 'kids1', 3, 'published', 4
from public.subjects s where s.slug = 'matematica';

insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, level, grade, status, sort_order)
select s.id,
  'Quantos lados tem um triângulo?',
  '["2", "3", "4", "5"]'::jsonb, 1,
  'Um triângulo tem 3 lados.',
  'easy', 'Geometria', 'kids1', 3, 'published', 5
from public.subjects s where s.slug = 'matematica';

insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, level, grade, status, sort_order)
select s.id,
  'Qual número vem depois de 49?',
  '["48", "50", "51", "52"]'::jsonb, 1,
  '49 + 1 = 50.',
  'easy', 'Números', 'kids1', 1, 'published', 6
from public.subjects s where s.slug = 'matematica';

-- Português — Fundamental I
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, level, grade, status, sort_order)
select s.id,
  'Qual é a primeira letra do alfabeto?',
  '["B", "A", "C", "Z"]'::jsonb, 1,
  'A primeira letra do alfabeto é A.',
  'easy', 'Alfabeto', 'kids1', 1, 'published', 1
from public.subjects s where s.slug = 'portugues';

insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, level, grade, status, sort_order)
select s.id,
  'Quantas vogais existem no português?',
  '["3", "4", "5", "6"]'::jsonb, 2,
  'As vogais são: A, E, I, O, U — são 5 vogais.',
  'easy', 'Vogais e Consoantes', 'kids1', 1, 'published', 2
from public.subjects s where s.slug = 'portugues';

insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, level, grade, status, sort_order)
select s.id,
  'Qual palavra está escrita corretamente?',
  '["Caza", "Casa", "Kasa", "Kaza"]'::jsonb, 1,
  'A forma correta é "Casa", com C e S.',
  'easy', 'Ortografia', 'kids1', 2, 'published', 3
from public.subjects s where s.slug = 'portugues';

insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, level, grade, status, sort_order)
select s.id,
  'Qual é o plural de "gato"?',
  '["gatos", "gatoes", "gatoz", "gatozinhos"]'::jsonb, 0,
  'O plural de gato é gatos (acrescenta-se S).',
  'easy', 'Plural', 'kids1', 2, 'published', 4
from public.subjects s where s.slug = 'portugues';

-- Ciências — Fundamental I
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, level, grade, status, sort_order)
select s.id,
  'Qual animal produz mel?',
  '["Abelha", "Formiga", "Borboleta", "Mosca"]'::jsonb, 0,
  'A abelha produz mel a partir do néctar das flores.',
  'easy', 'Animais', 'kids1', 2, 'published', 1
from public.subjects s where s.slug = 'ciencias';

insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, level, grade, status, sort_order)
select s.id,
  'Quantos planetas tem o Sistema Solar?',
  '["7", "8", "9", "10"]'::jsonb, 1,
  'O Sistema Solar tem 8 planetas: Mercúrio, Vênus, Terra, Marte, Júpiter, Saturno, Urano e Netuno.',
  'easy', 'Sistema Solar', 'kids1', 4, 'published', 2
from public.subjects s where s.slug = 'ciencias';

insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, level, grade, status, sort_order)
select s.id,
  'Qual parte da planta absorve água do solo?',
  '["Folha", "Flor", "Raiz", "Caule"]'::jsonb, 2,
  'A raiz absorve água e nutrientes do solo.',
  'easy', 'Plantas', 'kids1', 3, 'published', 3
from public.subjects s where s.slug = 'ciencias';

-- História — Fundamental I
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, level, grade, status, sort_order)
select s.id,
  'Quem descobriu o Brasil?',
  '["Cristóvão Colombo", "Pedro Álvares Cabral", "Vasco da Gama", "Fernão de Magalhães"]'::jsonb, 1,
  'Pedro Álvares Cabral chegou ao Brasil em 1500.',
  'easy', 'Brasil', 'kids1', 3, 'published', 1
from public.subjects s where s.slug = 'historia';

-- Geografia — Fundamental I
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, level, grade, status, sort_order)
select s.id,
  'Qual é o maior rio do Brasil?',
  '["Rio Amazonas", "Rio São Francisco", "Rio Paraná", "Rio Tietê"]'::jsonb, 0,
  'O Rio Amazonas é o maior rio do Brasil e um dos maiores do mundo.',
  'easy', 'Geografia do Brasil', 'kids1', 4, 'published', 1
from public.subjects s where s.slug = 'geografia';

-- ============================================================================
-- SEED: Questões Kids — Fundamental II (6º ao 9º ano)
-- ============================================================================

-- Matemática — Fundamental II
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, level, grade, status, sort_order)
select s.id,
  'Resolva: x + 5 = 12',
  '["x = 5", "x = 6", "x = 7", "x = 8"]'::jsonb, 2,
  'x + 5 = 12 → x = 12 - 5 = 7.',
  'easy', 'Equação do 1º grau', 'kids2', 6, 'published', 1
from public.subjects s where s.slug = 'matematica';

insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, level, grade, status, sort_order)
select s.id,
  'Resolva: 2x - 3 = 9',
  '["x = 4", "x = 5", "x = 6", "x = 7"]'::jsonb, 2,
  '2x - 3 = 9 → 2x = 12 → x = 6.',
  'medium', 'Equação do 1º grau', 'kids2', 7, 'published', 2
from public.subjects s where s.slug = 'matematica';

insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, level, grade, status, sort_order)
select s.id,
  'Qual é a raiz da equação x² - 5x + 6 = 0?',
  '["1 e 2", "2 e 3", "1 e 3", "3 e 4"]'::jsonb, 1,
  'x² - 5x + 6 = (x - 2)(x - 3) = 0 → x = 2 ou x = 3.',
  'medium', 'Equação do 2º grau', 'kids2', 8, 'published', 3
from public.subjects s where s.slug = 'matematica';

insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, level, grade, status, sort_order)
select s.id,
  'Se f(x) = 3x + 2, quanto vale f(4)?',
  '["10", "12", "14", "16"]'::jsonb, 2,
  'f(4) = 3 × 4 + 2 = 12 + 2 = 14.',
  'easy', 'Funções', 'kids2', 8, 'published', 4
from public.subjects s where s.slug = 'matematica';

insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, level, grade, status, sort_order)
select s.id,
  'Quanto é 2³?',
  '["6", "8", "9", "16"]'::jsonb, 1,
  '2³ = 2 × 2 × 2 = 8.',
  'easy', 'Potenciação', 'kids2', 6, 'published', 5
from public.subjects s where s.slug = 'matematica';

-- Português — Fundamental II
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, level, grade, status, sort_order)
select s.id,
  'Qual é o sujeito da frase: "O menino correu no parque."?',
  '["menino", "correu", "parque", "no"]'::jsonb, 0,
  'O sujeito é "o menino" — quem pratica a ação de correr.',
  'easy', 'Sintaxe', 'kids2', 6, 'published', 1
from public.subjects s where s.slug = 'portugues';

insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, level, grade, status, sort_order)
select s.id,
  'Qual palavra é um verbo?',
  '["bonito", "correr", "casa", "feliz"]'::jsonb, 1,
  '"Correr" é um verbo — indica ação.',
  'easy', 'Classes de Palavras', 'kids2', 6, 'published', 2
from public.subjects s where s.slug = 'portugues';

-- Ciências — Fundamental II
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, level, grade, status, sort_order)
select s.id,
  'Qual é a fórmula da água?',
  '["CO₂", "H₂O", "O₂", "NaCl"]'::jsonb, 1,
  'A fórmula da água é H₂O (2 átomos de hidrogênio e 1 de oxigênio).',
  'easy', 'Química básica', 'kids2', 7, 'published', 1
from public.subjects s where s.slug = 'ciencias';

insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, level, grade, status, sort_order)
select s.id,
  'O que é fotossíntese?',
  '["Processo de respiração das plantas", "Processo pelo qual plantas produzem seu próprio alimento usando luz solar", "Processo de decomposição de matéria orgânica", "Processo de evaporação da água"]'::jsonb, 1,
  'A fotossíntese é o processo pelo qual as plantas produzem seu próprio alimento (glicose) usando luz solar, água e CO₂.',
  'medium', 'Biologia', 'kids2', 7, 'published', 2
from public.subjects s where s.slug = 'ciencias';

-- História — Fundamental II
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, level, grade, status, sort_order)
select s.id,
  'Em que ano o Brasil foi descoberto?',
  '["1492", "1500", "1822", "1889"]'::jsonb, 1,
  'O Brasil foi descoberto em 1500 por Pedro Álvares Cabral.',
  'easy', 'Brasil Colônia', 'kids2', 6, 'published', 1
from public.subjects s where s.slug = 'historia';

-- Geografia — Fundamental II
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, level, grade, status, sort_order)
select s.id,
  'Qual é o maior continente do mundo?',
  '["África", "Américas", "Ásia", "Europa"]'::jsonb, 2,
  'A Ásia é o maior continente em área e população.',
  'easy', 'Continentes', 'kids2', 6, 'published', 1
from public.subjects s where s.slug = 'geografia';

-- Inglês — Fundamental II
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, level, grade, status, sort_order)
select s.id,
  'How do you say "obrigado" in English?',
  '["Please", "Thank you", "Sorry", "Hello"]'::jsonb, 1,
  '"Obrigado" em inglês é "Thank you".',
  'easy', 'Vocabulário básico', 'kids2', 6, 'published', 1
from public.subjects s where s.slug = 'ingles';
