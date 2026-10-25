-- ============================================================================
-- Convest — Fase 2: Aprendizagem
-- Tabela de questões + conteúdo de demonstração (aulas e exercícios).
-- Todo o conteúdo é publicado como "published" para demonstração.
-- Aplique este arquivo no SQL Editor (idempotente via on conflict).
-- ============================================================================

-- ----------------------------------------------------------------------------
-- Questões de múltipla escolha
-- ----------------------------------------------------------------------------
create table if not exists public.questions (
  id uuid primary key default gen_random_uuid(),
  subject_id uuid not null references public.subjects (id) on delete cascade,
  lesson_id uuid references public.lessons (id) on delete set null,
  prompt text not null,
  options jsonb not null,
  correct_index integer not null check (correct_index >= 0),
  explanation text,
  difficulty text not null default 'medium' check (difficulty in ('easy', 'medium', 'hard')),
  status text not null default 'draft' check (status in ('draft', 'published')),
  sort_order integer not null default 0,
  created_at timestamptz not null default now()
);

alter table public.questions enable row level security;
drop policy if exists "questions_select_published" on public.questions;
create policy "questions_select_published" on public.questions
  for select using (status = 'published');

-- ============================================================================
-- AULAS — Matemática
-- ============================================================================
insert into public.lessons (subject_id, title, description, content, estimated_minutes, sort_order, status)
select s.id, 'Equações do 1º grau', 'Resolvendo equações lineares com uma incógnita.',
$$# Equações do 1º grau

Uma **equação do 1º grau** é uma igualdade que contém uma incógnita (geralmente x) elevada à potência 1.

## Forma geral

$$ax + b = 0$$, com $a \neq 0$.

## Como resolver

1. Isole a incógnita em um dos lados da igualdade.
2. Faça operações inversas (soma vira subtração, multiplicação vira divisão).
3. Simplifique.

## Exemplo resolvido

Resolva $3x + 7 = 22$.

- Subtraia 7 dos dois lados: $3x = 15$.
- Divida por 3: $x = 5$.

**Resposta: x = 5.**

## Dica

Sempre confira substituindo o valor encontrado na equação original. Se ambos os lados forem iguais, está correto.
$$,
15, 1, 'published'
from public.subjects s where s.slug = 'matematica'
on conflict do nothing;

insert into public.lessons (subject_id, title, description, content, estimated_minutes, sort_order, status)
select s.id, 'Funções: conceito e gráfico', 'O que é uma função e como representá-la.',
$$# Funções

Uma **função** é uma relação entre dois conjuntos onde cada elemento do primeiro (domínio) se associa a **exatamente um** elemento do segundo (contradomínio).

## Notação

$f: A \to B$, onde $f(x)$ é o valor da função para a entrada $x$.

## Exemplo

$f(x) = 2x + 3$.

- $f(0) = 3$
- $f(2) = 7$
- $f(-1) = 1$

## Gráfico

O gráfico de uma função é o conjunto de pontos $(x, f(x))$. Para funções do 1º grau, o gráfico é uma **reta**.

## Tipos comuns

- **Constante:** $f(x) = k$ (reta horizontal).
- **Linear:** $f(x) = ax$ (passa pela origem).
- **Afim:** $f(x) = ax + b$ (reta com intercepto).

## Propriedades

- **Domínio:** valores de $x$ permitidos.
- **Imagem:** valores que $f(x)$ pode assumir.
- **Zeros:** valores de $x$ onde $f(x) = 0$.
$$,
20, 2, 'published'
from public.subjects s where s.slug = 'matematica'
on conflict do nothing;

insert into public.lessons (subject_id, title, description, content, estimated_minutes, sort_order, status)
select s.id, 'Geometria básica: áreas e perímetros', 'Áreas e perímetros de figuras planas.',
$$# Geometria básica

## Quadrado

- Perímetro: $P = 4l$
- Área: $A = l^2$

## Retângulo

- Perímetro: $P = 2(b + h)$
- Área: $A = b \cdot h$

## Triângulo

- Área: $A = \frac{b \cdot h}{2}$

## Círculo

- Circunferência: $C = 2\pi r$
- Área: $A = \pi r^2$

## Exemplo

Um retângulo de base 8 cm e altura 5 cm tem área $8 \cdot 5 = 40$ cm² e perímetro $2(8+5)=26$ cm.

## Dica

Sempre verifique as unidades: se as medidas estão em cm, a área estará em cm² e o perímetro em cm.
$$,
15, 3, 'published'
from public.subjects s where s.slug = 'matematica'
on conflict do nothing;

-- ============================================================================
-- AULAS — História
-- ============================================================================
insert into public.lessons (subject_id, title, description, content, estimated_minutes, sort_order, status)
select s.id, 'Revolução Francesa', 'Causas, fases e consequências da Revolução Francesa.',
$$# Revolução Francesa (1789–1799)

A Revolução Francesa foi um dos eventos mais importantes da história moderna, marcando o fim do Antigo Regime e o início da era contemporânea.

## Causas

- **Crise econômica:** dívida pública enorme, fome, carestia.
- **Desigualdade social:** sociedade dividida em três estados (clero, nobreza, povo).
- **Ideias iluministas:** liberdade, igualdade, fraternidade.

## Fases

1. **Assembleia Nacional (1789):** juramento da Sala do Jogo da Péla.
2. **Monarquia Constitucional (1791):** Luís XVI aceita a Constituição.
3. **República e Terror (1792–1794):** execução do rei, Robespierre.
4. **Diretório (1795–1799):** instabilidade, golpe de Napoleão.

## Consequências

- Fim do feudalismo na França.
- Declaração dos Direitos do Homem e do Cidadão.
- Expansão das ideias revolucionárias pela Europa.
- Ascensão de Napoleão Bonaparte.

## Lema

**Liberdade, Igualdade, Fraternidade** — lema da Revolução, ainda presente na bandeira francesa.
$$,
25, 1, 'published'
from public.subjects s where s.slug = 'historia'
on conflict do nothing;

insert into public.lessons (subject_id, title, description, content, estimated_minutes, sort_order, status)
select s.id, 'Brasil Colônia', 'Período colonial brasileiro: economia, sociedade e cultura.',
$$# Brasil Colônia (1500–1822)

## Chegada dos portugueses (1500)

Pedro Álvares Cabral chegou ao Brasil em 22 de abril de 1500. Inicialmente, o interesse era o **pau-brasil**.

## Ciclos econômicos

1. **Pau-brasil (século XVI):** exploração extrativista.
2. **Açúcar (séculos XVI–XVII):** engenhos no Nordeste, mão de obra escrava.
3. **Ouro (século XVIII):** Minas Gerais, Goiás, Mato Grosso.
4. **Café (final do período):** Vale do Paraíba.

## Sociedade

- **Senhores de engenho:** elite rural.
- **Escravos:** africanos e indígenas.
- **Jesuítas:** catequização e educação.

## Cultura

- **Barroco:** Aleijadinho, Gregório de Matos.
- **Quilombos:** Palmares (Zumbi).

## Independência (1822)

D. Pedro I proclamou a independência em 7 de setembro de 1822, às margens do Ipiranga.
$$,
20, 2, 'published'
from public.subjects s where s.slug = 'historia'
on conflict do nothing;

-- ============================================================================
-- AULAS — Física
-- ============================================================================
insert into public.lessons (subject_id, title, description, content, estimated_minutes, sort_order, status)
select s.id, 'Lei de Ohm', 'Relação entre tensão, corrente e resistência.',
$$# Lei de Ohm

A Lei de Ohm descreve a relação entre **tensão (U)**, **corrente (I)** e **resistência (R)** em um circuito elétrico.

## Fórmula

$$U = R \cdot I$$

Onde:
- $U$ = tensão, em Volts (V)
- $R$ = resistência, em Ohms (Ω)
- $I$ = corrente, em Ampères (A)

## Exemplo

Um resistor de 10 Ω percorrido por uma corrente de 2 A tem tensão $U = 10 \cdot 2 = 20$ V.

## Formas derivadas

- $R = \frac{U}{I}$
- $I = \frac{U}{R}$

## Potência elétrica

$$P = U \cdot I$$ (em Watts)

## Dica

A Lei de Ohm vale para condutores ôhmicos (resistência constante). Lâmpadas e diodos não são ôhmicos.
$$,
15, 1, 'published'
from public.subjects s where s.slug = 'fisica'
on conflict do nothing;

-- ============================================================================
-- QUESTÕES — Matemática
-- ============================================================================
insert into public.questions (subject_id, lesson_id, prompt, options, correct_index, explanation, difficulty, status, sort_order)
select s.id, l.id,
'Qual é a solução da equação 3x + 7 = 22?',
'["x = 3", "x = 5", "x = 7", "x = 15"]'::jsonb,
1,
'Subtraia 7: 3x = 15. Divida por 3: x = 5.',
'easy', 'published', 1
from public.subjects s join public.lessons l on l.subject_id = s.id and l.title = 'Equações do 1º grau'
where s.slug = 'matematica';

insert into public.questions (subject_id, lesson_id, prompt, options, correct_index, explanation, difficulty, status, sort_order)
select s.id, l.id,
'Se f(x) = 2x + 3, quanto vale f(4)?',
'["8", "10", "11", "14"]'::jsonb,
2,
'f(4) = 2·4 + 3 = 8 + 3 = 11.',
'easy', 'published', 2
from public.subjects s join public.lessons l on l.subject_id = s.id and l.title = 'Funções: conceito e gráfico'
where s.slug = 'matematica';

insert into public.questions (subject_id, lesson_id, prompt, options, correct_index, explanation, difficulty, status, sort_order)
select s.id, l.id,
'Um retângulo tem base 6 cm e altura 4 cm. Qual é sua área?',
'["10 cm²", "20 cm²", "24 cm²", "48 cm²"]'::jsonb,
2,
'Área = base × altura = 6 × 4 = 24 cm².',
'easy', 'published', 3
from public.subjects s join public.lessons l on l.subject_id = s.id and l.title = 'Geometria básica: áreas e perímetros'
where s.slug = 'matematica';

-- ============================================================================
-- QUESTÕES — História
-- ============================================================================
insert into public.questions (subject_id, lesson_id, prompt, options, correct_index, explanation, difficulty, status, sort_order)
select s.id, l.id,
'Qual foi o lema da Revolução Francesa?',
'["Liberdade, Igualdade, Fraternidade", "Ordem e Progresso", "Paz, Terra e Pão", "Vida, Liberdade e Propriedade"]'::jsonb,
0,
'O lema da Revolução Francesa foi "Liberdade, Igualdade, Fraternidade".',
'easy', 'published', 1
from public.subjects s join public.lessons l on l.subject_id = s.id and l.title = 'Revolução Francesa'
where s.slug = 'historia';

insert into public.questions (subject_id, lesson_id, prompt, options, correct_index, explanation, difficulty, status, sort_order)
select s.id, l.id,
'Em que ano o Brasil proclamou sua independência?',
'["1500", "1808", "1822", "1889"]'::jsonb,
2,
'A independência foi proclamada em 7 de setembro de 1822 por D. Pedro I.',
'medium', 'published', 2
from public.subjects s join public.lessons l on l.subject_id = s.id and l.title = 'Brasil Colônia'
where s.slug = 'historia';

-- ============================================================================
-- QUESTÕES — Física
-- ============================================================================
insert into public.questions (subject_id, lesson_id, prompt, options, correct_index, explanation, difficulty, status, sort_order)
select s.id, l.id,
'Um resistor de 10 Ω é percorrido por 2 A. Qual a tensão?',
'["5 V", "12 V", "20 V", "100 V"]'::jsonb,
2,
'U = R · I = 10 · 2 = 20 V.',
'easy', 'published', 1
from public.subjects s join public.lessons l on l.subject_id = s.id and l.title = 'Lei de Ohm'
where s.slug = 'fisica';

insert into public.questions (subject_id, lesson_id, prompt, options, correct_index, explanation, difficulty, status, sort_order)
select s.id, l.id,
'Qual unidade mede a resistência elétrica?',
'["Volt (V)", "Ampère (A)", "Ohm (Ω)", "Watt (W)"]'::jsonb,
2,
'A resistência é medida em Ohms (Ω).',
'easy', 'published', 2
from public.subjects s join public.lessons l on l.subject_id = s.id and l.title = 'Lei de Ohm'
where s.slug = 'fisica';
