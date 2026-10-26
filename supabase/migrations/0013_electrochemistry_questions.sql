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
  $md$Pilhas e baterias são dispositivos tão comuns em nossa sociedade que, sem percebermos, carregamos vários deles junto ao nosso corpo; eles estão presentes em aparelhos de MP3, relógios, rádios, celulares etc. As semirreações descritas a seguir ilustram o que ocorre em uma pilha de óxido de prata.

Zn(s) + OH⁻(aq) → ZnO(s) + H₂O(l) + e⁻
Ag₂O(s) + H₂O(l) + e⁻ → Ag(s) + OH⁻(aq)

Pode-se afirmar que esta pilha:$md$,
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
  $md$Para que apresente condutividade elétrica adequada a muitas aplicações, o cobre bruto obtido por métodos térmicos é purificado eletroliticamente.

Nesse processo, o cobre bruto impuro constitui o ânodo da célula, que está imerso em uma solução de CuSO₄. À medida que o cobre impuro é oxidado no ânodo, íons Cu²⁺ da solução são depositados na forma pura no cátodo.

Quanto às impurezas metálicas, algumas são oxidadas, passando à solução, enquanto outras simplesmente se desprendem do ânodo e se sedimentam abaixo dele. As impurezas sedimentadas são posteriormente processadas, e sua comercialização gera receita que ajuda a cobrir os custos do processo.

A série eletroquímica a seguir lista o cobre e alguns metais presentes como impurezas no cobre bruto de acordo com suas forças redutoras relativas.

Entre as impurezas metálicas que constam na série apresentada, as que se sedimentam abaixo do ânodo de cobre são:$md$,
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
  $md$Cerca de 1% do lixo urbano é constituído por resíduos sólidos contendo elementos tóxicos. Entre esses elementos estão metais pesados como o cádmio, o chumbo e o mercúrio, componentes de pilhas e baterias, que são perigosos à saúde humana e ao meio ambiente. Quando descartadas em lixos comuns, pilhas e baterias vão para aterros sanitários ou lixões a céu aberto, e o vazamento de seus componentes contamina o solo, os rios e o lençol freático, atingindo a flora e a fauna. Por serem bioacumulativos e não biodegradáveis, esses metais chegam de forma acumulada aos seres humanos, por meio da cadeia alimentar. A legislação vigente (Resolução CONAMA no 257/1999) regulamenta o destino de pilhas e baterias após seu esgotamento energético e determina aos fabricantes e/ou importadores a quantidade máxima permitida desses metais em cada tipo de pilha/bateria, porém o problema ainda persiste.

(Disponível em: http://www.mma.gov.br. Acesso em: 11 jul. 2009 - adaptado)

Uma medida que poderia contribuir para acabar definitivamente com o problema da poluição ambiental por metais pesados relatado no texto seria:$md$,
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
  $md$A eletrólise é muito empregada na indústria com o objetivo de reaproveitar parte dos metais sucateados. O cobre, por exemplo, é um dos metais com maior rendimento no processo de eletrólise, com uma recuperação de, aproximadamente, 99,9 %. Por ser um metal de alto valor comercial e de múltiplas aplicações, sua recuperação torna-se viável economicamente.

Suponha que, em um processo de recuperação de cobre puro tenha-se eletrolisado uma solução de sulfato de cobre (II) (CuSO₄) durante 3 h, empregando-se uma corrente elétrica de intensidade igual a 10 A. A massa de cobre puro recuperada é de, aproximadamente:

Dados: Constante de Faraday F = 96.500 C/mol; Massa molar em g/mol: Cu = 63,5.$md$,
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
  $md$As baterias de Ni-Cd muito utilizadas no nosso cotidiano não devem ser descartadas em lixos comuns uma vez que uma considerável quantidade de cádmio é volatilizada e emitida para o meio ambiente quando as baterias gastas são incineradas como componente do lixo. Com o objetivo de evitar a emissão de cádmio para a atmosfera durante a combustão é indicada que seja feita a reciclagem dos materiais dessas baterias. Uma maneira de separar o cádmio dos demais compostos presentes na bateria é realizar o processo de lixiviação ácida. Nela, tanto os metais (Cd, Ni e, eventualmente, Co) como os hidróxidos de íons metálicos Cd(OH)₂(s), Ni(OH)₂(s), Co(OH)₂(s) presentes na bateria, reagem com uma mistura ácida e são solubilizados. Em função da baixa seletividade (todos os íons metálicos são solubilizados), após a digestão ácida, é realizada uma etapa de extração dos metais com solventes orgânicos de acordo com a reação:

M²⁺(aq) + 2HR(org) ⇌ MR₂(org) + 2H⁺(aq)

Onde:
M = Cd²⁺, Ni²⁺ ou Co²⁺
HR = C₈H₁₇-PO₃H : identificado no gráfico por X
HR = C₈H₁₇-PO₃H : identificado no gráfico por Y

O gráfico mostra resultado da extração utilizando os solventes orgânicos X e Y em diferentes pH. (Figura 1: Extração de níquel, cádmio e cobalto em função do pH da solução utilizando solventes orgânicos X e Y.)

A reação descrita no texto mostra o processo de extração dos metais por meio da reação com moléculas orgânicas, X e Y. Considerando-se as estruturas de X e Y e o processo de separação descrito, pode-se afirmar que:$md$,
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
  $md$O Cádmio, presente nas baterias, pode chegar ao solo quando esses materiais são descartados de maneira irregular no meio ambiente ou quando são incinerados. Diferentemente da forma metálica, os íons Cd²⁺ são extremamente perigosos para o organismo, pois eles podem substituir íons Ca²⁺, ocasionando uma doença degenerativa nos ossos, tornando-os muito porosos e causando dores intensas nas articulações. Podem ainda inibir enzimas ativadas pelo cátion Zn²⁺, que são extremamente importantes para o funcionamento dos rins. A figura mostra a variação do raio de alguns metais e seus respectivos cátions.

(Disponível em: http://www.mma.gov.br. Acesso em: 11 jul. 2009 - adaptado)

Com base no texto, a toxicidade do cádmio em sua forma iônica é consequência de esse elemento:$md$,
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
