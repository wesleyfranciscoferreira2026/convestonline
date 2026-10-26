-- ============================================================================
-- Convest+ — Trilha "Iniciantes no mundo dos estudos"
-- ============================================================================
alter table public.lessons
  add column if not exists track text not null default 'regular'
    check (track in ('regular', 'intro'));

alter table public.questions
  add column if not exists track text not null default 'regular'
    check (track in ('regular', 'intro')),
  add column if not exists intro_level integer check (intro_level between 1 and 3);

create index if not exists lessons_track_idx on public.lessons (track);
create index if not exists questions_track_idx on public.questions (track);

-- ============================================================================
-- AULAS INTRODUTÓRIAS
-- ============================================================================

-- Matemática
insert into public.lessons (subject_id, title, description, content, estimated_minutes, sort_order, status, track)
select s.id, 'Matemática do zero: números e operações',
  'Comece do início: números, adição, subtração e multiplicação.',
  $md$# Matemática do zero

Se você está começando, não se preocupe. Matemática é como um idioma: com prática, tudo fica mais fácil.

## 1. Números naturais

São os números que usamos para contar: 0, 1, 2, 3, 4, 5... Eles não têm sinal e não têm vírgula.

## 2. Adição (soma)

Juntar quantidades. Exemplo: 3 + 4 = 7. Você tem 3 maçãs e ganha mais 4 — agora tem 7.

## 3. Subtração

Tirar uma quantidade de outra. Exemplo: 10 - 3 = 7. Se você tem 10 e dá 3, sobram 7.

## 4. Multiplicação

É uma soma repetida. 3 × 4 = 3 + 3 + 3 + 3 = 12. Três grupos de quatro.

## 5. Divisão

É repartir em partes iguais. 12 ÷ 3 = 4. Doze dividido em 3 partes iguais dá 4 em cada.

## Dica de estudo

Pratique um pouco todo dia. 10 minutos por dia valem mais do que 2 horas uma vez por semana. Comece pelos exercícios de nível 1 e suba de nível conforme se sentir confortável.$md$,
  15, 1, 'published', 'intro'
from public.subjects s where s.slug = 'matematica';

insert into public.lessons (subject_id, title, description, content, estimated_minutes, sort_order, status, track)
select s.id, 'Matemática: frações e porcentagem',
  'Entenda frações e porcentagem de forma simples.',
  $md$# Frações e porcentagem

## Frações

Uma fração representa uma parte de um todo. O número de cima é a parte (numerador) e o de baixo é o todo (denominador).

- 1/2 = metade
- 1/4 = um quarto
- 3/4 = três quartos

## Porcentagem

Porcentagem é uma fração com denominador 100. 50% = 50/100 = 1/2.

- 10% de 200 = 20
- 25% de 80 = 20
- 50% de 100 = 50

## Dica

Para calcular porcentagem, multiplique pelo valor e divida por 100. Exemplo: 15% de 300 = (300 × 15) / 100 = 45.$md$,
  15, 2, 'published', 'intro'
from public.subjects s where s.slug = 'matematica';

-- Português
insert into public.lessons (subject_id, title, description, content, estimated_minutes, sort_order, status, track)
select s.id, 'Português do zero: leitura e escrita',
  'Primeiros passos em leitura e escrita.',
  $md$# Português do zero

## 1. Leitura

Ler é decodificar símbolos (letras) em sons e significados. Comece com textos curtos e aumente aos poucos.

## 2. Ortografia

Escrever corretamente. Algumas regras básicas:
- "Ç" (cedilha) antes de A, O, U.
- "S" e "Z" têm sons parecidos — pratique.
- "M" e "N" no final de sílaba: M antes de B e P, N nas outras.

## 3. Pontuação

- Ponto final (.) encerra a frase.
- Vírgula (,) separa itens ou faz pausa.
- Interrogação (?) para perguntas.
- Exclamação (!) para emoção.

## 4. Acentuação

Acentos indicam a sílaba tônica. Regras básicas:
- Oxítonas terminadas em A, E, O, EM, ENS: levam acento (café, avô, também).
- Paroxítonas terminadas em L, R, X, I, U, N, PS, ÃO, ÃOS, UM, UNS: levam acento (fácil, útil, órgão).

## Dica de estudo

Leia um pouco todos os dias. Mesmo 10 minutos de leitura diária fazem diferença. Anote palavras novas e revise-as.$md$,
  15, 1, 'published', 'intro'
from public.subjects s where s.slug = 'portugues';

-- História
insert into public.lessons (subject_id, title, description, content, estimated_minutes, sort_order, status, track)
select s.id, 'História: do Brasil à sua comunidade',
  'Entenda a história do Brasil de forma simples.',
  $md$# História: do Brasil à sua comunidade

## 1. Descobrimento do Brasil (1500)

Pedro Álvares Cabral chegou ao Brasil em 22 de abril de 1500. Os portugueses vieram em busca de pau-brasil.

## 2. Período Colonial (1500-1822)

- **Açúcar**: principal produto, produzido por escravos.
- **Ouro**: descoberto no século XVIII, em Minas Gerais.
- **Escravidão**: africanos trazidos à força para trabalhar.

## 3. Independência (1822)

D. Pedro I proclamou a independência em 7 de setembro de 1822, às margens do Rio Ipiranga.

## 4. República (1889)

Proclamada em 15 de novembro de 1889, pondo fim à Monarquia.

## 5. Sua comunidade

A história não é só de reis e guerras. É também a história da sua cidade, da sua família e das pessoas ao seu redor. Converse com seus avós e vizinhos — eles têm histórias importantes.

## Dica de estudo

Faça uma linha do tempo com os eventos principais. Visualizar a ordem dos acontecimentos ajuda muito a memorizar.$md$,
  15, 1, 'published', 'intro'
from public.subjects s where s.slug = 'historia';

-- Geografia
insert into public.lessons (subject_id, title, description, content, estimated_minutes, sort_order, status, track)
select s.id, 'Geografia: o mundo e o Brasil',
  'Conheça o planeta, os continentes e o Brasil.',
  $md$# Geografia: o mundo e o Brasil

## 1. O planeta Terra

A Terra é dividida em 7 continentes: África, Antártida, Ásia, Europa, América do Norte, América do Sul e Oceania.

## 2. Oceanos

São 5 oceanos: Pacífico, Atlântico, Índico, Antártico e Ártico.

## 3. O Brasil

- **Capital:** Brasília
- **Estados:** 26 + Distrito Federal
- **Regiões:** Norte, Nordeste, Centro-Oeste, Sudeste, Sul
- **Rios principais:** Amazonas, São Francisco, Paraná

## 4. Clima

O Brasil tem climas variados: equatorial (Amazonas), tropical (Centro-Oeste), semiárido (Nordeste), subtropical (Sul).

## 5. Mapas

Mapas mostram a localização de lugares. Aprendeu a ler coordenadas (latitude e longitude) é essencial para se orientar.

## Dica de estudo

Use mapas físicos e digitais. Aponte para onde fica cada estado, rio e capital. Repetir visualmente ajuda muito.$md$,
  15, 1, 'published', 'intro'
from public.subjects s where s.slug = 'geografia';

-- Ciências
insert into public.lessons (subject_id, title, description, content, estimated_minutes, sort_order, status, track)
select s.id, 'Ciências: o corpo humano e a natureza',
  'Conheça o corpo humano e a natureza ao redor.',
  $md$# Ciências: o corpo humano e a natureza

## 1. O corpo humano

- **Sistema digestório:** boca, esôfago, estômago, intestinos — digerem os alimentos.
- **Sistema respiratório:** nariz, traqueia, pulmões — trocam gases (oxigênio e CO₂).
- **Sistema circulatório:** coração e vasos sanguíneos — transportam sangue.
- **Sistema nervoso:** cérebro, medula, nervos — controlam o corpo.

## 2. Plantas

- **Raiz:** absorve água e nutrientes.
- **Caule:** sustenta e transporta seiva.
- **Folha:** faz fotossíntese (produz alimento com luz solar).
- **Flor:** reprodução.
- **Fruto:** protege a semente.

## 3. Animais

Vertebrados (com coluna vertebral): peixes, anfíbios, répteis, aves, mamíferos.
Invertebrados (sem coluna): insetos, aranhas, moluscos, etc.

## 4. Água

A água é essencial para a vida. Ciclo da água: evaporação → condensação → precipitação.

## Dica de estudo

Observe a natureza ao seu redor. Olhe para as plantas, os animais, o céu. A ciência está em tudo.$md$,
  15, 1, 'published', 'intro'
from public.subjects s where s.slug = 'ciencias';

-- ============================================================================
-- QUESTÕES INTRODUTÓRIAS — Nível 1 (bem fácil), Nível 2, Nível 3
-- ============================================================================

-- Matemática Nível 1
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, track, intro_level, status, sort_order)
select s.id, 'Quanto é 2 + 3?', '["4", "5", "6", "7"]'::jsonb, 1, '2 + 3 = 5.', 'easy', 'Adição', 'intro', 1, 'published', 1 from public.subjects s where s.slug = 'matematica';
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, track, intro_level, status, sort_order)
select s.id, 'Quanto é 10 - 4?', '["4", "5", "6", "7"]'::jsonb, 2, '10 - 4 = 6.', 'easy', 'Subtração', 'intro', 1, 'published', 2 from public.subjects s where s.slug = 'matematica';
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, track, intro_level, status, sort_order)
select s.id, 'Quanto é 3 × 2?', '["5", "6", "7", "8"]'::jsonb, 1, '3 × 2 = 6.', 'easy', 'Multiplicação', 'intro', 1, 'published', 3 from public.subjects s where s.slug = 'matematica';

-- Matemática Nível 2
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, track, intro_level, status, sort_order)
select s.id, 'Quanto é 12 + 28?', '["38", "39", "40", "41"]'::jsonb, 2, '12 + 28 = 40.', 'easy', 'Adição', 'intro', 2, 'published', 4 from public.subjects s where s.slug = 'matematica';
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, track, intro_level, status, sort_order)
select s.id, 'Quanto é 50 - 17?', '["32", "33", "34", "35"]'::jsonb, 1, '50 - 17 = 33.', 'easy', 'Subtração', 'intro', 2, 'published', 5 from public.subjects s where s.slug = 'matematica';
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, track, intro_level, status, sort_order)
select s.id, 'Quanto é 7 × 8?', '["54", "56", "58", "60"]'::jsonb, 1, '7 × 8 = 56.', 'medium', 'Multiplicação', 'intro', 2, 'published', 6 from public.subjects s where s.slug = 'matematica';

-- Matemática Nível 3
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, track, intro_level, status, sort_order)
select s.id, 'Quanto é 125 + 378?', '["493", "503", "513", "483"]'::jsonb, 1, '125 + 378 = 503.', 'medium', 'Adição', 'intro', 3, 'published', 7 from public.subjects s where s.slug = 'matematica';
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, track, intro_level, status, sort_order)
select s.id, 'Quanto é 1000 - 347?', '["643", "653", "663", "673"]'::jsonb, 1, '1000 - 347 = 653.', 'medium', 'Subtração', 'intro', 3, 'published', 8 from public.subjects s where s.slug = 'matematica';
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, track, intro_level, status, sort_order)
select s.id, 'Quanto é 12 × 15?', '["150", "160", "170", "180"]'::jsonb, 3, '12 × 15 = 180.', 'medium', 'Multiplicação', 'intro', 3, 'published', 9 from public.subjects s where s.slug = 'matematica';

-- Português Nível 1
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, track, intro_level, status, sort_order)
select s.id, 'Qual é a primeira letra do alfabeto?', '["B", "A", "C", "Z"]'::jsonb, 1, 'A primeira letra do alfabeto é A.', 'easy', 'Alfabeto', 'intro', 1, 'published', 1 from public.subjects s where s.slug = 'portugues';
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, track, intro_level, status, sort_order)
select s.id, 'Quantas vogais existem?', '["3", "4", "5", "6"]'::jsonb, 2, 'As vogais são A, E, I, O, U — são 5.', 'easy', 'Vogais', 'intro', 1, 'published', 2 from public.subjects s where s.slug = 'portugues';

-- Português Nível 2
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, track, intro_level, status, sort_order)
select s.id, 'Qual palavra está escrita corretamente?', '["Caza", "Casa", "Kasa", "Kaza"]'::jsonb, 1, 'A forma correta é "Casa", com C e S.', 'easy', 'Ortografia', 'intro', 2, 'published', 3 from public.subjects s where s.slug = 'portugues';
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, track, intro_level, status, sort_order)
select s.id, 'Qual é o plural de "gato"?', '["gatos", "gatoes", "gatoz", "gatozinhos"]'::jsonb, 0, 'O plural de gato é gatos.', 'easy', 'Plural', 'intro', 2, 'published', 4 from public.subjects s where s.slug = 'portugues';

-- Português Nível 3
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, track, intro_level, status, sort_order)
select s.id, 'Qual é o sujeito da frase: "O menino correu no parque."?', '["menino", "correu", "parque", "no"]'::jsonb, 0, 'O sujeito é "o menino" — quem pratica a ação.', 'easy', 'Sintaxe', 'intro', 3, 'published', 5 from public.subjects s where s.slug = 'portugues';
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, track, intro_level, status, sort_order)
select s.id, 'Qual palavra é um verbo?', '["bonito", "correr", "casa", "feliz"]'::jsonb, 1, '"Correr" é um verbo — indica ação.', 'easy', 'Classes de Palavras', 'intro', 3, 'published', 6 from public.subjects s where s.slug = 'portugues';

-- Ciências Nível 1
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, track, intro_level, status, sort_order)
select s.id, 'Qual animal produz mel?', '["Abelha", "Formiga", "Borboleta", "Mosca"]'::jsonb, 0, 'A abelha produz mel a partir do néctar das flores.', 'easy', 'Animais', 'intro', 1, 'published', 1 from public.subjects s where s.slug = 'ciencias';
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, track, intro_level, status, sort_order)
select s.id, 'Quantos planetas tem o Sistema Solar?', '["7", "8", "9", "10"]'::jsonb, 1, 'O Sistema Solar tem 8 planetas.', 'easy', 'Sistema Solar', 'intro', 1, 'published', 2 from public.subjects s where s.slug = 'ciencias';

-- Ciências Nível 2
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, track, intro_level, status, sort_order)
select s.id, 'Qual parte da planta absorve água do solo?', '["Folha", "Flor", "Raiz", "Caule"]'::jsonb, 2, 'A raiz absorve água e nutrientes do solo.', 'easy', 'Plantas', 'intro', 2, 'published', 3 from public.subjects s where s.slug = 'ciencias';

-- Ciências Nível 3
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, track, intro_level, status, sort_order)
select s.id, 'O que é fotossíntese?', '["Processo de respiração das plantas", "Processo pelo qual plantas produzem seu próprio alimento usando luz solar", "Processo de decomposição de matéria orgânica", "Processo de evaporação da água"]'::jsonb, 1, 'A fotossíntese é o processo pelo qual as plantas produzem seu próprio alimento (glicose) usando luz solar, água e CO₂.', 'medium', 'Biologia', 'intro', 3, 'published', 4 from public.subjects s where s.slug = 'ciencias';

-- História Nível 1
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, track, intro_level, status, sort_order)
select s.id, 'Quem descobriu o Brasil?', '["Cristóvão Colombo", "Pedro Álvares Cabral", "Vasco da Gama", "Fernão de Magalhães"]'::jsonb, 1, 'Pedro Álvares Cabral chegou ao Brasil em 1500.', 'easy', 'Brasil', 'intro', 1, 'published', 1 from public.subjects s where s.slug = 'historia';

-- História Nível 2
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, track, intro_level, status, sort_order)
select s.id, 'Em que ano o Brasil foi descoberto?', '["1492", "1500", "1822", "1889"]'::jsonb, 1, 'O Brasil foi descoberto em 1500 por Pedro Álvares Cabral.', 'easy', 'Brasil Colônia', 'intro', 2, 'published', 2 from public.subjects s where s.slug = 'historia';

-- Geografia Nível 1
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, track, intro_level, status, sort_order)
select s.id, 'Qual é o maior rio do Brasil?', '["Rio Amazonas", "Rio São Francisco", "Rio Paraná", "Rio Tietê"]'::jsonb, 0, 'O Rio Amazonas é o maior rio do Brasil.', 'easy', 'Geografia do Brasil', 'intro', 1, 'published', 1 from public.subjects s where s.slug = 'geografia';

-- Geografia Nível 2
insert into public.questions (subject_id, prompt, options, correct_index, explanation, difficulty, topic, track, intro_level, status, sort_order)
select s.id, 'Qual é o maior continente do mundo?', '["África", "Américas", "Ásia", "Europa"]'::jsonb, 2, 'A Ásia é o maior continente em área e população.', 'easy', 'Continentes', 'intro', 2, 'published', 2 from public.subjects s where s.slug = 'geografia';
