-- Convest+ — import do caderno de Química ENEM 2009-2018
-- Dificuldade e tópico são classificações estimadas; revise no painel admin.
-- Rode 0008_question_images.sql antes desta migration.

alter table public.questions add column if not exists source_ref text;
create unique index if not exists questions_source_ref_unique on public.questions(source_ref);

insert into public.questions (source_ref,subject_id,exam_id,year,topic,question_type,prompt,source_images,option_images,stem_image_url,options,correct_index,explanation,difficulty,status,sort_order)
values
('ENEM-2009.1-Q1', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2009, 'QuÃ­mica ambiental', 'multiple_choice', 'ENEM 2009.1 â€” QuÃ­mica â€” QuestÃ£o 1

O ciclo da água é fundamental para a preserva-
ção da vida no planeta. As condições climáticas
da Terra permitem que a água sofra mudanças
de fase e a compreensão dessas transforma-
ções é fundamental para se entender o ciclo
hidrológico. Numa dessas mudanças, a água ou
a umidade da terra absorve o calor do sol e dos
arredores. Quando já foi absorvido calor sufici-
ente, algumas das moléculas do líquido podem
ter energia necessária para começar a subir
para a atmosfera.
(Disponível em: http//wWww.keroagua.blogspot.com
Acesso em: 30 mar. 2009 - adaptado)
A transformação " mencionada . no texto é , a:
A) fusão.
"
B) liquefação.
a
C) evaporação.
D) solidificação.
E) condensação.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'medium', 'published', 1),
('ENEM-2009.1-Q2', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2009, 'QuÃ­mica ambiental', 'multiple_choice', 'ENEM 2009.1 â€” QuÃ­mica â€” QuestÃ£o 2

O lixo radioativo ou nuclear é resultado da ma-
nipulação de materiais radioativos, utilizados
hoje na agricultura, na indústria, na medicina,
em pesquisas - científicas, indie na produção " de ener-
gia etc. Embora a radioatividade se reduza com
o tempo, o processo de decaimento radioativo
de alguns materiais pode levar milhões de anos.
Por isso, existe a necessidade de se fazer um
descarte adequado e controlado de resíduos
dessa natureza. A taxa de decaimento radioati-
vo é medida em termos de um tempo caracterís-
tico, chamado meia-vida, que é o tempo neces-
sário para que uma amostra perca metade de
sua radioatividade original.
O gráfico seguinte representa a taxa de decai-
mento radioativo do rádio-226, elemento quími-
co pertencente à família dos metais alcalinos
terrosos e que foi utilizado durante muito tempo
na medicina.
1h |
papo
HW
''
Agp pero 7
O DA A.
kko
'' pH ''
1620 3240 4860 — Anos
As informações fornecidas mostram que:
Ajude esse projeto:', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'hard', 'published', 2),
('ENEM-2009.1-Q3', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2009, 'Estequiometria', 'multiple_choice', 'ENEM 2009.1 â€” QuÃ­mica â€” QuestÃ£o 3

Vários combustíveis alternativos estão sendo
procurados para reduzir a demanda por com-
bustíveis fósseis, cuja queima prejudica o meio
ambiente devido à produção de dióxido de car-
bono (massa molar igual a 44 g mor”).
Três dos mais promissores combustíveis alter-
nativos são o hidrogênio, o etanol e o metano. À
queima de 1 mol de cada um desses combustí-
veis libera uma determinada quantidade de ca-
lor, que estão apresentadas na tabela a seguir.
(g mol”) (kJ mol?)
EN NT
[Lero ag “““sg
Considere que foram queimadas massas, inde-
pendentemente, desses três combustíveis, de
forma tal que em cada queima foram liberados
5400 kJ.
O combustível mais econômico, ou seja, o que
teve a menor massa consumida, e o combustí-
vel mais poluente, que é aquele que produziu a
maior massa de dióxido de carbono (massa
molar igual a 44 g mol”), foram, respectivamen-
te,
A) o etanol, que teve apenas 46 g de massa
consumida, e o metano, que produziu 900 g de
CO,.
B) o hidrogênio, que teve apenas 40 g de massa
consumida, e o etanol, que produziu 352 g de
CO,.
C) o hidrogênio, que teve apenas 20 g de mas-
sa consumida, e o metano, que produziu 264 g
de CO».
D) o etanol, que teve apenas 96 g de massa
consumida, e o metano, que produziu 176 g de
CO,.
E) o hidrogênio, que teve apenas 2 g de massa
consumida, e o etanol, que produziu 1350 g de
CO,.
1
moduloenem2017Ogmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'hard', 'published', 3),
('ENEM-2009.1-Q4', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2009, 'QuÃ­mica ambiental', 'multiple_choice', 'ENEM 2009.1 â€” QuÃ­mica â€” QuestÃ£o 4

ESTAÇÕES DARMSP |
São Caetano do Sul
[osasco — = |
MP, — partículas inaláveis: aquelas
é menor que 10 um.
CO — monóxido de carbono:
da queima incompleta
orgânica (combustíveis
principalmente por veículos
NO, dióxido de nitrogênio:
processos de combustão
Dependendo das
prejuízos à saúde
SO; — dióxido de enxofre: resulta
combustíveis que contêm
reagir com outras substâncias
partículas à base de sulfato
visibilidade na atmosfera.
[| oso | s1100 | 10146
A Companhia de Tecnologia de Saneamento Ambiental
tinuamente dados referentes à qualidade do ar na
tada corresponde a dados hipotéticos que poderiam
Se esses dados fossem verídicos, então, seria mais
A) no Parque Dom Pedro |l. B) em São
D) em Osasco. E) em Pinheiros.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'medium', 'published', 4),
('ENEM-2009.1-Q5', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2009, 'BioquÃ­mica', 'multiple_choice', 'ENEM 2009.1 â€” QuÃ­mica â€” QuestÃ£o 5

O controle de qualidade é uma exigência da
sociedade moderna na qual os bens de consu-
mo são produzidos em escala industrial. Nesse
controle de qualidade são determinados parâ-
metros que permitem checar a qualidade de
cada produto. O álcool combustível é um produ-
to de amplo consumo muito adulterado, pois
recebe adição de outros materiais para aumen-
tar a margem de lucro de quem o comercializa.
De acordo com a Agência Nacional de Petróleo
(ANP), o álcool combustível deve ter densidade
entre 0,805 glem? e 0,811 glem?. Em algumas
bombas de combustível a densidade do álcool
pode ser verificada por meio de um densímetro
similar ao desenhado abaixo, que consiste em
duas bolas com valores de densidade diferentes
e verifica quando o álcool está fora da faixa
permitida. Na imagem, são apresentadas situa-
ções distintas para três amostras de álcool
combustível.
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'hard', 'published', 5),
('ENEM-2009.1-Q6', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2009, 'QuÃ­mica orgÃ¢nica', 'multiple_choice', 'ENEM 2009.1 â€” QuÃ­mica â€” QuestÃ£o 6

Duas matérias-primas encontradas em grande
límero preparado a partir da carapaça do camarão,
principais componentes de um novo material para
dos no preparo de vários produtos. Este material
zadas atualmente em vários produtos famacêuticos
petroquímicos, com a vantagem de ser biocompatível
A fórmula estrutural da quitosana está apresentada
: H
NS
ANSA) H H N
O
ias
no
H
Com relação às características do material descrito,
A) o uso da quitosana é vantajoso devido a suas
reza e peso molecular, características dos polímeros,
B) a quitosana tem em sua constituição grupos
químicas, com as vantagens ambientais comparadas
C) o polímero natural quitosana é de uso vantajoso,
tem vantagem ambiental comparado com os polímeros
D) a quitosana é constituída por grupos hidroxila em
mente produzidos, e traz vantagens ambientais
cos.
E) a quitosana é um polímero de baixa massa
amida é vantajoso para aplicações ambientais em', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'hard', 'published', 6),
('ENEM-2009.1-Q7', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2009, 'EletroquÃ­mica', 'multiple_choice', 'ENEM 2009.1 â€” QuÃ­mica â€” QuestÃ£o 7

Pilhas e baterias são dispositivos tão comuns
em nossa sociedade que, sem percebermos,
carregamos vários deles junto ao nosso corpo;
elas estão presentes em aparelhos de MP3,
relógios, rádios, celulares etc. As semirreações
descritas a seguir ilustram o que ocorre em uma
pilha de óxido de prata.
Zn(s)+ OH (aq) > ZnO (s) + O (1) + e”
PA ONS)rEEON es ” Ag) a OMS)
=
Pode-se afirmar que esta pilha:
A) é uma pilha ácida.
B) apresenta o óxido de prata como o ânodo.
C) apresenta o zinco como o agente oxidante.
D) tem como reação da célula a seguinte reação
Zn (s) + Ag,O (s) — ZnO (s) + 2Ag (s).
E) apresenta fluxo de elétrons na pilha do ele-
trodo de Ag5O para o Zn.
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'hard', 'published', 7),
('ENEM-2009.1-Q8', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2009, 'QuÃ­mica ambiental', 'multiple_choice', 'ENEM 2009.1 â€” QuÃ­mica â€” QuestÃ£o 8

O pó de café jogado no lixo caseiro e, princi-
palmente, as grandes quantidades descartadas
em bares e restaurantes poderão se transformar
em uma nova opção de matéria-prima para a
produção de biodiesel, segundo estudo da Uni-
versidade de Nevada (EUA). No mundo, são
cerca de 8 bilhões de quilogramas de pó de café
jogados no lixo por ano. O estudo
mostra que o café descartado tem 15% de óleo,
o qual pode ser convertido em biodiesel pelo
processo tradicional. Além de reduzir significa-
mente emissões prejudiciais, após a extração
do óleo, o pó de café é ideal como produto ferti-
lizante para jardim.
(Revista Ciência e Tecnologia no Brasil, nº 155, 1.09)
Considere o processo descrito e a densidade do
biodiesel igual a 900 kg/mº. A partir da quanti-
dade de pó de café jogada no lixo por ano, a
produção de biodiesel seria equivalente a:
3', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'hard', 'published', 8),
('ENEM-2009.1-Q9', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2009, 'EquilÃ­brio quÃ­mico', 'multiple_choice', 'ENEM 2009.1 â€” QuÃ­mica â€” QuestÃ£o 9

Os exageros do final de semana podem levar o
indivíduo a um quadro de azia.
A azia pode ser descrita como uma sensação
de queimação no estômago, provocada pelo
desbalanceamento do pH estomacal (excesso
de ácido clorídrico).
Um dos antiácidos comumente empregados no
combate à azia é o leite de magnésia.
O leite de magnésia possui 64,8 g de hidróxido
de magnésio (Mg(OH)) por litto da solução.
Qual a quantidade de ácido neutralizado ao se
ingerir 9 mL de leite de magnésia?
Dados: Massas molares (em g mor”): Mg= 24,3;
Cl=35,4; 0=16; H=1.
A) 20 mol
B) 0,58 mol
C) 0,2 mol
D) 0,02 mol
E) 0,01 mol', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'medium', 'published', 9),
('ENEM-2009.1-Q10', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2009, 'QuÃ­mica ambiental', 'multiple_choice', 'ENEM 2009.1 â€” QuÃ­mica â€” QuestÃ£o 10

Potencializado pela necessidade de reduzir as
emissões de gases causadores do efeito estufa,
o desenvolvimento de fontes de energia renová-
veis e limpas dificimente resultará em um mo-
delo hegemônico. A tendência é que cada pais
crie uma combinação própria de matrizes, esco-
lhida entre várias categorias de biocombustí-
veis, a energia solar ou a eólica e, mais tarde,
provavelmente o hidrogênio, capaz de lhe ga-
rantir eficiência energética e ajudar o mundo a
atenuar os efeitos das mudanças climáticas. O
hidrogênio, em um primeiro momento, poderia
ser obtido a partir de hidrocarbonetos ou de
carboidratos.
Considerando as fontes de hidrogênio citadas, a
de menor impacto ambiental seria:
A) aquela obtida de hidrocarbonetos, pois pos-
suem maior proporção de hidrogênio por molé-
cula.
B) aquela de carboidratos, por serem estes ter-
modinamicamente mais estáveis que os hidro-
carbonetos.
C) aquela de hidrocarbonetos, pois o carvão
resultante pode ser utilizado também como fon-
te de energia.
D) aquela de carboidratos, uma vez que o car-
bono resultante pode ser fixado pelos vegetais
na próxima safra.
E) aquela de hidrocarbonetos, por estarem liga-
dos a carbonos tetraédricos, ou seja, que apre-
sentam apenas ligações simples.
tratada desempenha um papel fundamental para a
mais carente é a que mais sofre com a falta de água
capazes de fornecer o volume de água necessá-
dessa água.
o ]
EM
1
[Ta men) gistibuição
des
VP
mo
Cascalho SI
Reservatório dos
Reservatório de |
q
Água Tratada
e
Amônia |
[Fios
4', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'hard', 'published', 10),
('ENEM-2009.1-Q11', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2009, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2009.1 â€” QuÃ­mica â€” QuestÃ£o 11

Na atual estrutura social, o abastecimento de água
prevenção de doenças. Entretanto, a população
tratada, em geral, pela falta de estações de tratamento
rio para o abastecimento ou pela falta de distribuição
Sombeamenta( 1)
Carvão ativado O)
Coagulante ã
tes
Cal Hidratada
EE meia
E
EA Se banalene EAZsrÃA
Floculação — Decantação il
(os
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'medium', 'published', 11),
('ENEM-2009.2-Q12', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2009, 'EquilÃ­brio quÃ­mico', 'multiple_choice', 'ENEM 2009.2 â€” QuÃ­mica â€” QuestÃ£o 12

Sabões são sais de ácidos carboxílicos de cadeia
processos de lavagem, a remoção de substâncias
gorduras. A figura a seguir representa a estrutura de
FOOD DOORS
Em solução, os ânions do sabão podem hidrolisar a
respondente. Por exemplo, para o estearato de sódio,
CHa(CH2).sCOO + HO==
Uma vez que o ácido carboxílico formado é pouco
gorduras, o pH do meio deve ser controlado de
para a direita.
Com base nas informações do texto, é correto concluir
A) mais eficiente em pH básico.
B) mais eficiente em pH ácido.
C) mais eficiente em pH neutro.
D) eficiente em qualquer faixa de pH.
E) mais eficiente em pH ácido ou neutro.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'medium', 'published', 12),
('ENEM-2009.2-Q13', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2009, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2009.2 â€” QuÃ­mica â€” QuestÃ£o 13

Para que apresente condutividade elétrica ade-
quada a muitas aplicações, o cobre bruto obtido
por métodos térmicos é purificado eletrolitica-
mente.
Nesse processo, o cobre bruto impuro constitui
o ânodo da célula, que está imerso em uma
solução de CuSO,. À medida que o cobre impu-
ro é oxidado no ânodo, íons Cu* da solução
são depositados na forma pura no cátodo.
Quanto às impurezas metálicas, algumas são
oxidadas, passando à solução, enquanto outras
simplesmente se desprendem do ânodo e se
sedimentam abaixo dele. As impurezas sedi-
mentadas são posteriormente processadas, e
sua comercialização gera receita que ajuda a
cobrir os custos do processo.
A série eletroquímica a seguir lista o cobre e
alguns metais presentes como impurezas no
cobre bruto de acordo com suas forças reduto-
ras relativas.
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'hard', 'published', 13),
('ENEM-2009.2-Q14', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2009, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2009.2 â€” QuÃ­mica â€” QuestÃ£o 14

Os núcleos dos átomos são constituídos de prótons
pela sua massa. Nota-se que, na maioria dos núcleos,
proporção. O gráfico mostra a quantidade de nêutrons
os núcleos estáveis conhecidos.
160
150
e nlene ne
[E EeNóeios estáveis
140 TRA)
ES
o
SIS SS
110
—
é
7
100
29
SS
FNANAAIENNANANN
ego
NANAVAIENNNAANNN
:
o 70
SNAERNIAVANNAAS
s
ES
50
ANENESA
40
TRES
26 CRI SSIS
10 ''
E
o
O 10 20 30 40
Número
O antimônio é um elemento químico que possui 50
diferem pelo número de nêutrons. De acordo com o
A) entre 12 e 24 nêutrons a menos que o número de
B) exatamente o mesmo número de prótons e nêutrons.
C) entre O e 12 nêutrons a mais que o número de
D) entre 12 e 24 nêutrons a mais que o número de
E) entre O e 12 nêutrons a menos que o número de', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'hard', 'published', 14),
('ENEM-2009.2-Q15', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2009, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2009.2 â€” QuÃ­mica â€” QuestÃ£o 15

O processo de industrialização tem gerado sé-
rios problemas de ordem ambiental, econômica
e social, entre os quais se pode citar a chuva
ácida. Os ácidos usualmente presentes em
maiores proporções na água da chuva são o
H2CO;3, formado pela reação do CO, atmosféri-
co com a água, o HNO;3, o HNO>,, o HSO, e o
H2SO;. Esses quatro últimos são formados prin-
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'medium', 'published', 15),
('ENEM-2008.2-Q16', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2008, 'QuÃ­mica ambiental', 'multiple_choice', 'ENEM 2008.2 â€” QuÃ­mica â€” QuestÃ£o 16

|||
Cerca de 1% do lixo urbano é constituído por
resíduos sólidos contendo elementos tóxicos.
Entre esses elementos estão metais pesados
como o cádmio, o chumbo e o mercúrio, com-
ponentes de pilhas e baterias, que são perigo-
sos à saúde humana e ao meio ambiente.
Quando descartadas em lixos comuns, pilhas e
baterias vão para aterros sanitários ou lixões a
céu aberto, e o vazamento de seus componen-
tes contamina o solo, os rios e o lençol freático,
atingindo a flora e a fauna.
Por serem bioacumulativos e não biodegradá-
veis, esses metais chegam de forma acumulada
aos seres humanos, por meio da cadeia alimen-
tar. A legislação vigente (Resolução CONAMA
no 257/1999) regulamenta o destino de pilhas e
baterias após seu esgotamento energético e
determina aos fabricantes e/ou importadores a
quantidade máxima permitida desses metais em
cada tipo de pilha/bateria, porém o problema
ainda persiste.
(Disponível em: http://wWww.mma.gov.br.
Acesso em: 11 jul. 2009 - adaptado)
Uma medida que poderia contribuir para acabar
definitivamente com o problema da poluição
ambiental por metais pesados relatado no texto
seria:
A) deixar de consumir aparelhos elétricos que
utilizem pilha ou bateria como fonte de energia.
B) usar apenas pilhas ou baterias recarregáveis
e de vida útil longa e evitar ingerir alimentos
contaminados, especialmente peixes.
C) devolver pilhas e baterias, após o esgota-
mento da energia armazenada, à rede de assis-
tência técnica especializada para repasse a
fabricantes e/ou importadores.
D) criar nas cidades, especialmente naquelas
com mais de 100 mil habitantes, pontos estraté-
gicos de coleta de baterias e pilhas, para poste-
rior repasse a fabricantes e/ou importadores.
E) exigir que fabricantes invistam em pesquisa
para a substituição desses metais tóxicos por
substâncias menos nocivas ao homem e ao
ambiente, e que não sejam bioacumulativas.
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'hard', 'published', 16),
('ENEM-2009.2-Q17', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2009, 'BioquÃ­mica', 'multiple_choice', 'ENEM 2009.2 â€” QuÃ­mica â€” QuestÃ£o 17

Considere um equipamento capaz de emitir
radiação eletromagnética com comprimento de
onda bem menor que a da radiação ultravioleta.
Suponha que a radiação emitida por esse equi-
pamento foi apontada para um tipo específico
de filme fotográfico e entre o equipamento e o
filme foi posicionado o pescoço de um indivíduo.
Quanto mais exposto à radiação, mais escuro
se torna o filme após a revelação.
Apó ; o : t e revelar ! o fil time,
pós acionar equipamento
evidenciou-se a imagem mostrada na figura
abaixo.
-”
t
VW
PE. |
H a
— Fado
U
.
4
&
“à.
"*
x
''
Dentre os fenômenos decorrentes da interação
entre a radiação e os átomos do indivíduo que
permitem a obtenção desta imagem inclui-se a:
A) absorção da radiação eletromagnética e a
consequente ionização dos átomos de cálcio,
que se transformam em átomos de fósforo.
B) maior absorção da radiação eletromagnética
pelos átomos de cálcio que por outros tipos de
átomos.
C) maior absorção da radiação eletromagnética
pelos átomos de carbono que por átomos de
cálcio.
D) maior refração ao atravessar os átomos de
carbono que os átomos de cálcio.
E) maior ionização de moléculas de água que
de átomos de carbono.
7', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'hard', 'published', 17),
('ENEM-2009.2-Q18', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2009, 'SoluÃ§Ãµes e concentraÃ§Ã£o', 'multiple_choice', 'ENEM 2009.2 â€” QuÃ­mica â€” QuestÃ£o 18

O uso de protetores solares em situações de grande
nas praias, é de grande importância para a saúde.
almente, anéis aromáticos conjugados com grupos
sorver a radiação ultravioleta mais nociva aos seres
cia de alternância entre ligações simples e duplas
em questão é apresentar, em uma de suas
solubilidade do composto em água, o que impede sua
De acordo com as considerações do texto, qual das
para funcionar como molécula ativa de protetores
j
A)
CH;O
o
OO
|
B)
o LAÇOS
CH;30', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'medium', 'published', 18),
('ENEM-2009.2-Q19', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2009, 'QuÃ­mica ambiental', 'multiple_choice', 'ENEM 2009.2 â€” QuÃ­mica â€” QuestÃ£o 19

Nas últimas décadas, o efeito estufa tem-se
muitas vezes atribuído à intensa liberação de CO,
ção de energia. O quadro traz as entalpias-padrão
do octano.
fórmula ;
composto
molecular
[metano | CH |
[Butano — | CHo |
À medida que aumenta a consciência sobre os
cresce a importância de se criar políticas de incentivo
sentido, considerando-se que o metano, o butano e
gás liquefeito de petróleo (GLP) e da gasolina,
possível concluir que, do ponto de vista da quantidade
crescente desses três combustíveis é:
A) gasolina, GLP e gás natural.
B) gás natural, gasolina e GLP.
C) gasolina, gás natural e GLP.
D) gás natural, GLP e gasolina.
E) GLP, gás natural e gasolina.
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'medium', 'published', 19),
('ENEM-2009.2-Q20', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2009, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2009.2 â€” QuÃ­mica â€” QuestÃ£o 20

Na manipulação em escala nanométrica, os
átomos revelam características peculiares, po-
dendo apresentar tolerância à temperatura,
reatividade química, condutividade elétrica, ou
mesmo exibir força de intensidade extraordiná-
ria. Essas características explicam o interesse
industrial pelos nanomateriais que estão sendo
muito pesquisados em diversas áreas, desde o
desenvolvimento de cosméticos, tintas e teci-
dos, até o de terapias contra o câncer.
(LACAVA, Z. G. M; MORAIS, P. ” Nanobiotecnologia
'' ''
e Saúde. Disponível em: http:/MWwww.comciencia.br)
A utilização de nanopartículas na indústria e na
medicina requer estudos mais detalhados, pois:
A) as partículas, quanto menores, mais potentes
e radiativas se tornam.
B) as partículas podem ser manipuladas, mas
não caracterizadas com a atual tecnologia.
C) as propriedades biológicas das partículas
somente podem ser testadas em microrganis-
mos.
D) as partículas podem atravessar poros e ca-
nais celulares, o que poderia causar impactos
desconhecidos aos seres vivos e, até mesmo,
aos ecossistemas.
E) o organismo humano apresenta imunidade
contra partículas tão pequenas, já que apresen-
tam a mesma dimensão das bactérias (um bilio-
nésimo de metro).', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'hard', 'published', 20),
('ENEM-2009.2-Q21', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2009, 'QuÃ­mica orgÃ¢nica', 'multiple_choice', 'ENEM 2009.2 â€” QuÃ­mica â€” QuestÃ£o 21

O álcool hidratado utilizado como combustível
veicular é obtido por meio da destilação fracio-
nada de soluções aquosas geradas a partir da
fermentação de biomassa. Durante a destilação,
o teor de etanol da mistura é aumentado, até o
limite de 968% em massa.
Considere que, em uma usina de produção de
etanol, 800 kg de uma mistura etanol/água com
concentração 20% em massa de etanol foram
destilados, sendo obtidos 100 kg de álcool hi-
dratado 96% em massa de etanol. A partir des-
ses dados, é correto concluir que a destilação
em questão gerou um resíduo com uma concen-
tração de etanol em massa:
A) de 0%.
B) de 8,0%.
C) entre 8,4% e 8,6%.
D) entre 9,0% e 9,2%.
E) entre 13% e 14%.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'hard', 'published', 21),
('ENEM-2009.3-Q22', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2009, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2009.3 â€” QuÃ­mica â€” QuestÃ£o 22

Os cientistas conseguem determinar a idade de
um fóssil com menos de 40.000 anos de idade
utilizando o método do carbono-14 (TC) ou car-
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'easy', 'published', 22),
('ENEM-2009.3-Q23', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2009, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2009.3 â€” QuÃ­mica â€” QuestÃ£o 23

O ácido acetilsalicílico (AMAS) é uma substância
utilizada como fármaco analgésico no alívio das
dores de cabeça. A figura abaixo é a represen-
tação estrutural da molécula do AAS.
CO, H
O
”P
O CH,
Considerando-se essa representação, é correto
afirmar que a fórmula molecular do AAS é:
A) C;O2H;COOH.
B) C;O2H; COOH.
C) CsOH;COOH.
D) CgOH;COOH.
E) CsO2H,sCOOH.
9', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'medium', 'published', 23),
('ENEM-2009.3-Q24', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2009, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2009.3 â€” QuÃ­mica â€” QuestÃ£o 24

A ciência propõe formas de explicar a natureza
e seus fenômenos que, muitas vezes, confron-
tam o conhecimento popular ou o senso co-
mum. Um bom exemplo desse descompasso é
a explicação microscópica da flutuação do gelo
na água. Do ponto de vista atômico, podem-se
representar os três estados físicos dessa subs-
tância como nas figuras a seguir, nas quais as
bolas representam as moléculas de água.
OOOO00o0 oo QRO lx q
o
OOOOOO||[ [0 O ooo 828
9090000| | 9. O O /650900
OO00000 o o1/O else.
000000] |O o OOo [8/0]
A B Cc
Considerando-se as representações das molé-
culas de água nos três estados físicos e seu
comportamento anômalo, é correto afirmar que:
A) sólidos afundam na água.
B) a interação entre as moléculas está restrita
ao estado sólido.
C) a figura B é a que melhor representa a água
no estado líquido.
D) a figura A é a que melhor representa o gelo,
ou seja, água no estado sólido.
E) aumenta a distância entre as moléculas da
substância à medida que a temperatura aumen-
ta.
IA A o a,
ão de energia elétrica
tempo tem ldenciado
ao longo do decisiva-
mente o progresso da humanidade, mas tam-
bém tem criado uma séria preocupação: o preju-
" zo ao meio : ambiente. :
Nos próximos anos, uma nova tecnologia de
" de NASA elétrica A
geração energia deverá ganhar es
paço: as células a combustível hidrogê-
nio/oxigênio.
===
—
[SA ”
2e |
== 52 &o,
2H*
o
Hs, ES SEO um> 2
*
H,O
ânodo | eletrólito | cátodo
(VILLULLAS, H. M; TICIANELLI, E. A; GONZÁLES,
E. R. Química Nova na Escola. Nº 15, mai 2002)
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'hard', 'published', 24),
('ENEM-2009.3-Q25', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2009, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2009.3 â€” QuÃ­mica â€” QuestÃ£o 25. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'medium', 'published', 25),
('ENEM-2010.1-Q26', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2010, 'QuÃ­mica inorgÃ¢nica', 'multiple_choice', 'ENEM 2010.1 â€” QuÃ­mica â€” QuestÃ£o 26

As misturas efervescentes, em pó ou comprimi-
dos, são comuns para a administração de vita-
mina C ou de medicamentos para azia. Essa
forma farmacêutica sólida foi desenvolvida para
facilitar o transporte, aumentar a estabilidade de
substâncias e, quando em solução, acelerar a
absorção do fármaco pelo organismo.
As matérias primas que atuam na efervescência
são, em geral, o ácido tartárico ou ácido cítrico
que reagem como um sal de caráter básico,
como o bicarbonato de sódio (NaHCO;), quando
em contato com a água. A partir do contato da
mistura efervescente com a água, ocorre uma
série de reações químicas simultâneas: libera-
ção de íons, formação de ácido e liberação de
gás carbônico - gerando a efervescência.
As equações a seguir representam as etapas da
reação da mistura efervescente na água, em
que foram omitidos os estados de agregação
dos reagentes, e H;A representa o ácido cítrico.
|- — NaHCO,— Na* + HCO,
It H,CO,=HO+CO,
I-/ HCO; + H'' = H,CO,
IV. HA=B3H''+A"
A ionização, a dissociação iônica, a formação
do ácido e a liberação do gás ocorrem, respecti-
vamente, nas seguintes etapas:
AJIV, Lie
B) LIV, Well
10', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'hard', 'published', 26),
('ENEM-2010.1-Q27', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2010, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2010.1 â€” QuÃ­mica â€” QuestÃ£o 27. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'medium', 'published', 27),
('ENEM-2010.1-Q28', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2010, 'TermoquÃ­mica', 'multiple_choice', 'ENEM 2010.1 â€” QuÃ­mica â€” QuestÃ£o 28

O abastecimento de nossas necessidades
energéticas futuras dependerá certamente do
desenvolvimento de tecnologias para aproveitar
a energia solar com maior eficiência. A energia
solar é a maior fonte de energia mundial. Num
dia ensolarado, por exemplo, aproximadamente
1 kJ de energia solar atinge cada metro quadra-
do de superfície terrestre por segundo. No en-
tanto, o aproveitamento dessa energia é difícil
porque ela é diluída (distribuída por uma área
muito extensa) e oscila com o horário e as con-
dições climáticas. O uso efetivo da energia solar
depende de formas de estocar a energia coleta-
da para o uso posterior.
(BROWN, T. Química e Ciência Central.
São Paulo: Pearson Prentice Hall, 2005)
Atualmente, uma das formas de se utilizar a
energia solar tem sido armazená-la por meio de
processos químicos endotérmicos que mais
tarde podem ser revertidos para liberar calor.
Considerando a reação:
CH) ” HO, + calor = CO, + Ho
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'hard', 'published', 28),
('ENEM-2010.1-Q29', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2010, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2010.1 â€” QuÃ­mica â€” QuestÃ£o 29. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'medium', 'published', 29),
('ENEM-2010.1-Q30', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2010, 'Estequiometria', 'multiple_choice', 'ENEM 2010.1 â€” QuÃ­mica â€” QuestÃ£o 30

Todos os organismos necessitam de água e
grande parte deles vive em rios, lagos e ocea-
nos. Os processos biológicos, como respiração
e fotossíntese, exercem profunda influência na
química das águas naturais em todo o planeta.
O oxigênio é ator dominante na química e na
bioquímica da hidrosfera. Devido a sua baixa
solubilidade em água (9,0 mg/l a 20 ºC) a dis-
ponibilidade de oxigênio nos ecossistemas aqu-
áticos estabelece o limite entre a vida aeróbica
e anaeróbica. Nesse contexto, um parâmetro
chamado Demanda Bioquímica de Oxigênio
(DBO) foi definido para medir a quantidade de
matéria orgânica presente em um sistema hídri-
co. A DBO corresponde à massa de O, em mili-
gramas necessárias para realizar a oxidação
total do carbono orgânico em um litro de água.
(BAIRD, C. Química Ambiental.
Ed. Bookmam, 2005 - adaptado)
Dados: Massas molares em g/mol: C = 12;
H=1;0=16.
Suponha que 10 mg de açúcar (fórmula mínima
CH,rO A e massa molar a 30 g/mol) g/mol) são são dissolvi di io
dos em um litro de gua; água; em q quanto a DBO será
aumentada?
A) 0,4 mg de Oy/litro
B) 1,7 mg de Ox/litro
C) 2,7 mg de Oy/litro
D) 9,4 mg de Oyz/litro
E) 10,7 mg de Oyz/litro', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'hard', 'published', 30),
('ENEM-2010.1-Q31', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2010, 'EletroquÃ­mica', 'multiple_choice', 'ENEM 2010.1 â€” QuÃ­mica â€” QuestÃ£o 31

A composição média de uma bateria automotiva
esgotada é de aproximadamente 32% Pb, 3%
PbO; e 36% PbSO,. A média de massa da pas-
ta residual de uma bateria usada é de 6 kg,
onde 19% é PbO,, 60% PbSO, e 21% Pb. Entre
todos os compostos de chumbo presentes na
pasta, o que mais preocupa é o sulfato de
chumbo (II), pois nos processos pirometalúrgi-
cos, em que os compostos de chumbo (placas
das baterias) são fundidos, há a conversão de
sulfato em dióxido de enxofre, gás muito poluen-
te.
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'medium', 'published', 31),
('ENEM-2010.1-Q32', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2010, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2010.1 â€” QuÃ­mica â€” QuestÃ£o 32. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'medium', 'published', 32),
('ENEM-2010.1-Q33', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2010, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2010.1 â€” QuÃ­mica â€” QuestÃ£o 33

No ano de 2004, diversas mortes de animais por
envenenamento no zoológico de São Paulo
foram evidenciadas. Estudos técnicos apontam
suspeitas de intoxicação por monofluoracetato
de sódio, conhecido como composto 1080 e
ilegalmente comercializado como raticida. O
monofluoracetato de sódio é um derivado do
ácido monofluoracético e age no organismo dos
mamíferos bloqueando o ciclo de Krebs, que
pode levar à parada da respiração celular oxida-
tiva e ao acúmulo de amônia na circulação.
O
FRA
O Na*
monofluoracetato de sódio. à.
O monofluoracetato de sódio pode ser obtido
pela:
A) desidratação do ácido monofluoracético, com
liberação de água.
8) hidrólise do ácido monofluoracético, sem
formação de agua.
o) perda de íons hidroxila do ácido monofluora-
, 2
cético, com liberação de hidróxido de sódio.
D) neutralização do ácido monofluoracético,
usando hidróxido de sódio, com liberação de
água.
E) substituição dos íons hidrogênio por sódio na
estrutura do ácido monofluoracético, sem for-
mação de água.
PS', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'hard', 'published', 33),
('ENEM-2010.1-Q34', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2010, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2010.1 â€” QuÃ­mica â€” QuestÃ£o 34

As mobilizações para promover um planeta
melhor para as futuras gerações são cada vez
mais frequentes. A maior parte dos meios de
transportes de massa é, atualmente, movida
pela queima de um combustível fóssil. A título
de exemplificação do ônus causado por essa
prática, basta saber que um carro produz, em
média, cerca de 200 g de dióxido de carbono
por km percorrido.
(Revista Aquecimento Global. Ano 2, nº 08. Publica-
ção do Instituto Brasileiro de Cultura Ltda)
Um dos principais constituintes da gasolina é o
octano (CsH;is). Por meio da combustão do oc-
tano é possível a liberação de energia, permitin-
do que o carro entre em movimento. A equação
que representa a reação química desse proces-
so demonstra que:
A) no processo há liberação de oxigênio, sob a
forma de O,.
B) o coeficiente estequiométrico para a água é
de 8 para 1 do octano.
C) no processo há consumo de água, para que
haja liberação de energia.
novocadernoenem(DQgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'hard', 'published', 34),
('ENEM-2010.1-Q35', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2010, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2010.1 â€” QuÃ­mica â€” QuestÃ£o 35

Os pesticidas modernos são divididos em várias
classes, entre as quais se destacam os organo-
fosforados, materiais que apresentam efeito
tóxico agudo para os seres humanos. Esses
pesticidas contêm um átomo central de fósforo
ao qual estão ligados outros átomos ou grupo
de átomos como oxigênio, enxofre, grupos me-
toxi ou etoxi ou um radical orgânico de cadeia
longa. Os organofosforados são divididos em
três subclasses: Tipo A, na qual o enxofre não
se incorpora na molécula; Tipo B, na qual o
oxigênio, que faz dupla ligação com fósforo, é
substituído pelo enxofre; e Tipo C, no qual dois
oxigênios são substituídos por enxofre.
(BAIRD, O C. Química Ambiental. '' Bookmam. '' 2005)
Um exemplo de pesticida organofosforado Tipo
B, que apresenta grupo etoxi em sua fórmula
estrutural, está representado em:
Oo
''
A) R-O-r P-O-CH,
|
O-CH,
Ss
1
BR O-P-O-CH,
|
O-CH,
Ss
''
o R- S—P-O—CH,
OCH
3
Ss
HN !
D) po O CH
=
/, 3
CH.O”
3
O=COCH(CH;),
Ss
U
E) oNÃO- o-P— OCH,CH,
|
OCH,CH,
13', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'hard', 'published', 35),
('ENEM-2010.1-Q36', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2010, 'QuÃ­mica ambiental', 'multiple_choice', 'ENEM 2010.1 â€” QuÃ­mica â€” QuestÃ£o 36

As baterias de Ni-Cd muito utilizadas no nosso
uma vez que uma considerável quantidade de
quando as baterias gastas são incineradas como
são de cádmio para a atmosfera durante a combustão
ais dessas baterias.
Uma maneira de separar o cádmio dos demais
lixiviação ácida. Nela, tanto os metais (Cd, Ni e,
cos Cd(OH)>(s), NiI(OH)(s), Co(OH)>(s) presentes
lubilizados. Em função da baixa seletividade (todos
ácida, é realizada uma etapa de extração dos metais
M ES 2 HR o e
(aq) 00)
Onde,
M2* = Cd?*, Nº ou Co?”
HR = C,,H,, -PO,H : identificado no gráfico por X
HR = C,H,, -PO,H : identificado no gráfico por Y
O gráfico mostra resultado da extração utilizando os
100
O
| |-O- Cd
so
- rr Co y
so
| A-N
1)
É s
F
à +
2 O $7
fe
ad
20
A
E) -
[Tu " o
.
o
o 1 Fá 3
pH
Figura 1: Extração de níquel, cádimo «e
solventes orgânicos X e Y.
A reação descrita no texto mostra o processo de
orgânicas, X e Y. Considerando-se as estruturas de
afirmar que:
A) as moléculas X e Y atuam como extratores catiônicos
íon H* pelo cátion do metal.
B) as moléculas X e Y atuam como extratores aniônicos
íon H* pelo cátion do metal.
C) as moléculas X e Y atuam como extratores catiônicos
íon POz? pelo cátion do metal.
D) as moléculas X e Y atuam como extratores aniônicos
íon POz? pelo cátion do metal.
E) as moléculas X e Y fazem ligações com os íons
lar o que justifica a eficácia da extração.
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'hard', 'published', 36),
('ENEM-2010.1-Q37', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2010, 'Estequiometria', 'multiple_choice', 'ENEM 2010.1 â€” QuÃ­mica â€” QuestÃ£o 37

Ao colocar um pouco de açúcar Na água e me-
xer até a obtenção de uma só fase, prepara-se
uma solução. O mesmo acontece ao se adicio-
nar um pouquinho de sal à água e misturar bem.
Uma substância capaz de dissolver o soluto é
denominada solvente; por exemplo, a água é
um solvente para o açúcar, para o sal e para
várias outras substâncias. A figura a seguir ilus-
tra essa citação.
E
Soluto
"
1 Es Er
. ae o |
Suponha que uma pessoa, para adoçar seu
cafezinho, tenha utilizado 3,42 g de sacarose
(massa molar igual a 342 g/mol) para uma xíca-
ra de 50 ml do líquido. Qual é a concentração
final em mol/l de sacarose nesse cafezinho?
A) 0,02.
8) 0,2.
o) 2.
D) 200.
E) 2.000.
ERR TORA AO
uestão “ Ce nto
da rodovia MG-010,
'' "” rt ue
acompanha da introdução de espécies exóticas,
e a prática E de psp incêndios criminosos, io ameaçam o
sofisticado ecossistema do campo rupestre da
reserva da Serra do Espinhaço.
As plantas nativas desta região, altamente
adaptadas a uma alta concentração de alumí-
nio, que inibe o crescimento das raízes e dificul-
tam a absorção de nutrientes e água, estão
sendo substituídas por espécies invasoras que
não teriam naturalmente adaptação para este
ambiente, no entanto elas estão dominando as
margens da rodovia, equivocadamente chama-
da de "estrada ecológica". Possivelmente a
entrada de espécies de plantas exóticas neste
ambiente foi provocada pelo uso, neste empre-
endimento, de um tipo de asfalto (cimento-solo),
que possui uma mistura rica em cálcio, que
causou modificações químicas aos solos adja-
centes à R rodovia : MG-010.
(Scientific American. Brasil. Ano 7, nº 79. 08 - adp)
Essa afimação baseia-se no uso de cimento-
solo, mistura rica em cálcio que:
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'hard', 'published', 37),
('ENEM-2010.1-Q38', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2010, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2010.1 â€” QuÃ­mica â€” QuestÃ£o 38. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'medium', 'published', 38),
('ENEM-2010.2-Q39', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2010, 'CinÃ©tica quÃ­mica', 'multiple_choice', 'ENEM 2010.2 â€” QuÃ­mica â€” QuestÃ£o 39

Alguns fatores podem alterar a rapidez das rea-
ções químicas. A seguir destacam-se três
exemplos no contexto da preparação e da con-
servação de alimentos:
1. À maioria dos produtos alimentícios se
conserva por muito mais tempo quando
submetidos à refrigeração. Esse procedi-
mento diminui a rapidez das reações que
contribuem para a degradação de certos
alimentos.
2. Um procedimento '' muito '' comum utilizado "
em práticas de culinária é o corte dos ali-
mentos para acelerar o seu cozimento, ca-
so não se tenha uma panela de pressão.
3. Na preparação de iogurtes, adicionam-se
ao leite bactérias produtoras de enzimas
que aceleram as reações envolvendo açú-
cares e proteínas lácteas.
Com base no texto, quais são os fatores que
influenciam a rapidez das transformações quíi-
micas relacionadas aos exemplos 1, 2 e 3, res-
pectivamente? W
A) Temperatura, superfície de contato e concen-
tração.
B) Concentração, superfície de contato e catali-
sadores.
C) Temperatura, superfície o de contado e catali- .
sadores.
D) Superfície de contato, temperatura e concen-
tração.
E) Temperatura, concentração . e catalisadores. .', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'hard', 'published', 39),
('ENEM-2010.2-Q40', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2010, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2010.2 â€” QuÃ­mica â€” QuestÃ£o 40

Às vezes, ao abrir um refrigerante, percebe-se
que uma parte do produto vaza rapidamente
pela extremidade do recipiente.
A explicação inn para esse fato está , relacionada ; à R
perturbação H do equilíbrio ih química Po existente ; en-
tre alguns dos ingredientes do produto, de acor-
do com a equação:
CO29) + HO — H2CO3(a9)
15', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'medium', 'published', 40),
('ENEM-2010.2-Q41', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2010, 'QuÃ­mica ambiental', 'multiple_choice', 'ENEM 2010.2 â€” QuÃ­mica â€” QuestÃ£o 41

O Brasil é um dos países que obtêm melhores
quema a seguir representa as várias etapas desse
LIXO
No lixo, várias Aé lies DeSsamM por um proceso
o ã
impurezas podem de catação manual e por um jato de
aire rea ar que arremessa as!atas para O
ato, possibiltando a idensficação
das que estão cheias de detrtos
(mass pesadas).
O aluminio é resfriado
em fôrmas que
moldam os lingotes.
| —
Os lingotes darão
origem a novas
latas.
A temperatura do forno em que o alumínio é fundido
A) sublima outros metais presentes na lata.
B) evapora substâncias radioativas remanescentes.
C) impede que o alumínio seja eliminado em altas
D) desmagnetiza as latas que passaram pelo processo
E) queima os resíduos de tinta e outras substâncias', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'hard', 'published', 41),
('ENEM-2010.2-Q42', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2010, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2010.2 â€” QuÃ­mica â€” QuestÃ£o 42

Fator de emissão (carbon footprint) é um temo
utilizado para expressar a quantidade de gases
que contribuem para o aquecimento global,
emitidos por uma fonte ou processo industrial
específico. Pode-se pensar na quantidade de
gases emitidos por uma indústria, uma cidade
ou mesmo por uma pessoa. Para o gás CO,, a
relação pode ser escrita:
Fator de emissão de CO; = Massade coz CO2 emitida. emitida
de iti
Quantidade de material
O termo “quantidade de material" pode ser, por
exemplo, a massa de material produzido em
uma indústria ou a quantidade de gasolina con-
sumida por um carro em um determinado perío-
do.
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'medium', 'published', 42),
('ENEM-2010.2-Q43', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2010, 'EquilÃ­brio quÃ­mico', 'multiple_choice', 'ENEM 2010.2 â€” QuÃ­mica â€” QuestÃ£o 43

O pH do solo pode variar em uma faixa signifi-
cativa devido a várias causas.
Por exemplo, o solo de áreas com chuvas es-
cassas, mas com concentrações elevadas do
sal solúvel carbonato de sódio (NazCO;), torna-
se básico devido à reação de hidrólise do íon
carbonato, segundo o equilíbrio:
COfxa +H On = HCOx4, + OH,
Esses tipos de solos são alcalinos demais para
fins agrícolas e devem ser remediados pela
utilização de aditivos químicos.
(BAIRD, C. Química ambiental.
São Paulo: Artmed, 1995 - adaptado)
Suponha que, para remediar uma amostra des-
se tipo de solo, um técnico tenha utilizado como
aditivo a cal virgem (CaO).
Nesse caso, a remediação: o
A) foi realizada, pois o caráter básico da cal
virgem promove o deslocamento do equilíbrio
descrito para a direita, em decorrência da ele-
vação de pH do meio.
B) foi realizada, pois o caráter ácido da cal vir-
gem promove o deslocamento do equilíbrio des-
crito para a esquerda, em decorrência da redu-
ção de pH do meio.
C) não " foi . realizada, . pois , o caráter z ácido da da cal
virgem promove o deslocamento do equilíbrio
descrito para a direita, em decorrência da redu-
ção de pH do meio.
D) não foi realizada, pois o caráter básico da cal
virgem promove o deslocamento do equilíbrio
descrito para a esquerda, em decorrência da
elevação de pH do meio.
E) não foi realizada, pois o caráter neutro da cal
virgem promove o deslocamento do equilíbrio
descrito para a esquerda, em decorrência da
manutenção de pH do meio.
novocadernoenem(DQgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'hard', 'published', 43),
('ENEM-2010.2-Q44', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2010, 'Radioatividade', 'multiple_choice', 'ENEM 2010.2 â€” QuÃ­mica â€” QuestÃ£o 44

O rótulo de uma garrafa de água mineral natural
contém as seguintes informações:
Características Composição
EL
físico-químicas
go
pHaz5sºo | 754 15,13
| sódio [1424
| 3,62
condutividade dutividade 151
Edi
elétrica a 25ºC |(uS/cm)
— 1,24
resíduo da
evaporação a SO) 0,20
[ tuoretos | =
180 “ºC
As , informações " químicas mo presentes no rótulo . de
vários produtos permitem classificar de acordo
com seu gosto, seu cheiro, sua aparência, sua
função, entre outras. As informações da tabela
p ermitem concluir 9 que essa água 9 é:
A) gasosa.
B) insípida.
C) levemente azeda.
D) um pouco alcalina.
E) radioativa na fonte.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'medium', 'published', 44),
('ENEM-2010.2-Q45', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2010, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2010.2 â€” QuÃ­mica â€” QuestÃ£o 45

águia cão aquando queimados, podem
EVar a Ionmaçeo de GoaS. um composto do
grupo dos organoclorados. Mesmo quando a
queima ocorre em incineradores, há liberação
de substâncias derivadas da dioxina no meio
ambiente. Tais compostos são produzidos em
baixas concentrações, como resíduos da quei-
ma de matéria orgânica em presença de produ-
tos que contenham cloro. Como consequência
de seu amplo espalhamento no meio ambiente,
bem como de suas propriedades estruturais, as
dioxinas sofrem magnificação trófica na cadeia
alimentar. Mais de 90% da exposição humana
às dioxinas é atribuída aos alimentos contami-
nados ingeridos. A estrutura típica de uma
dioxina está apresentada a seguir:
Cl. O. cl
O O
18) o Cl
2,3,7,8-tetraclorodibenzo-p-dioxina
(2,3,7,8-TCDD)
A molécula do 2,3,7,8-TCDD é popularmente
conhecida pelo nome ,dioxina”, sendo a mais
tóxica dos 75 isômeros de compostos clorados
de dibenzo-p-dioxina existentes.
17', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'hard', 'published', 45),
('ENEM-2010.2-Q46', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2010, 'EletroquÃ­mica', 'multiple_choice', 'ENEM 2010.2 â€” QuÃ­mica â€” QuestÃ£o 46

O Cádmio, presente nas baterias, pode chegar ao
neira irregular no meio ambiente ou quando são
Cd** são extremamente perigosos para o organismo,
uma doença degenerativa nos ossos, tornando-os
lações. Podem ainda inibir enzimas ativadas pelo
funcionamento dos rins. A figura mostra a variação
197 pm 191pm
100pm 102pm 103pm
Raios atômicos e
Com base no texto, a toxicidade do cádmio em sua
A) Apresentar baixa energia de ionização, o que
tros compostos.
B) Possuir tendência de atuar em processos biológicos
variam de +1 a +3.
C) Possuir raio e carga relativamente próximos aos
cos, causando interferência nesses processos.
D) Apresentar raio iônico grande, permitindo que
que, normalmente, íons menores participam.
E) Apresentar carga +2, o que permite que ele
normalmente, íons com cargas menores participam.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'hard', 'published', 46),
('ENEM-2010.2-Q47', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2010, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2010.2 â€” QuÃ­mica â€” QuestÃ£o 47

A curcumina, substância encontrada no pó
da-índia (Curcuma longa), aparentemente, pode ajudar
kinson e o de Alzheimer e até mesmo retardar o
culturas orientais, apenas nos últimos anos passou a
o
H;CO E
HO
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'easy', 'published', 47),
('ENEM-2010.2-Q48', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2010, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2010.2 â€” QuÃ­mica â€” QuestÃ£o 48

O flúor é usado de forma ampla na prevenção
[Cai(POs)s(OH),] presente nos esmaltes dos dentes,
neral mais resistente ao ataque ácido decorrente da
res das placas que aderem aos dentes.
A reação de dissolução da hidroxiapatita é:
[Ca,(PO,)(OH),] o 8H* e
Dados: Massas molares em g/mol [Ca,o(POs)s(OH2)]
Supondo-se que o esmalte dentário seja constituído
que dissolve completamente 1 mg desse material
A) 0,14 mg de íons totais.
B) 0,40 mg de íons totais.
C) 0,58 mg de íons totais.
D) 0,97 mg de íons totais.
E) 1,01 mg de íons totais.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'medium', 'published', 48),
('ENEM-2010.2-Q49', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2010, 'QuÃ­mica ambiental', 'multiple_choice', 'ENEM 2010.2 â€” QuÃ­mica â€” QuestÃ£o 49

Devido ao seu teor de sais, a água do mar é
imprópria para o consumo humano e para a
maioria dos usos da água doce. No entanto,
para a indústria, a água do mar é de grande
interesse, uma vez que os sais presentes po-
dem servir de matérias-primas importantes para
diversos processos. Nesse contexto, devido a
sua simplicidade e ao seu baixo potencial de
impacto ambiental, o método da precipitação
fracionada tem sido utilizado para a obtenção
dos sais presentes na água do mar.
Tabela 1: Solubilidade em água de alguns com-
postos presentes na água do mar a 25ºC
soLUTO SOLUBILIDADE
9/kg de HO
Emometude sódio 1,20 x 10º
Carbonato de cálcio 1,80 x 10?
Cloreto de sódio 3,60 x 10º
Cloreto de magnésio 841 x10
Sulfeto de magnésio ” | Meso. | 360 x 12
Sulfato de cálcio 6,80 x 10º
Suponha que uma indústria objetiva separar
determinados sais de uma amostra de água do
mar a 25ºC, por meio da precipitação fraciona-
da. Se essa amostra contiver somente os sais
destacados na tabela, a seguinte ordem de pre-
cipitação será verificada:
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'hard', 'published', 49),
('ENEM-2010.2-Q50', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2010, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2010.2 â€” QuÃ­mica â€” QuestÃ£o 50

Cientistas da Austrália descobriram um meio de
produzir roupas que se limpam sozinhas. À
equipe de pesquisadores usou nanocristais de
dióxido de titânio (TiO,) que, sob ação da luz
solar, são capazes de decompor as partículas
de sujeira na superfície de um tecido. O estudo
apresentou bons resultados com fibras de algo-
dão e seda. Nesses casos, foram removidas
manchas de vinho, bastante resistentes. A na-
nocamada protetora poderá ser útil na preven-
ção de infecções em hospitais, uma vez que o
dióxido de titânio também mostrou ser eficaz na
destruição das paredes celulares de microrga-
nismos que provocam infecções. O termo nano
vem da unidade de medida nanômetro, que é a
bilionésima parte de 1 metro.
19', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'medium', 'published', 50),
('ENEM-2010.2-Q51', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2010, 'Propriedades da matÃ©ria', 'multiple_choice', 'ENEM 2010.2 â€” QuÃ­mica â€” QuestÃ£o 51

Com a frequente adulteração de combustíveis,
além de fiscalização, há necessidade de prover
meios para que o consumidor verifique a quali-
dade do combustível.
Para isso, nas bombas de combustíveis existe
um densímetro, semelhante ao ilustrado na
tour,
Um tubo de vidro fechado fica imerso no com-
bustível, devido ao peso das bolinhas de chum-
bo colocadas no seu interior.
Uma coluna vertical central marca a altura de
referência, que deve ficar abaixo ou no nível do
combustível para indicar que sua densidade
está adequada.
Como o volume do líquido varia com a tempera-
tura mais que o do vidro, a coluna vertical é
preenchida com mercúrio para compensar vari-
ações de temperatura.
|
Mercúrio PP
[|
Bolinhas de Chumbo
Combustível
De acordo com o texto, a coluna vertical de
mercúrio, quando aquecida,
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'hard', 'published', 51),
('ENEM-2011.1-Q52', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2011, 'TermoquÃ­mica', 'multiple_choice', 'ENEM 2011.1 â€” QuÃ­mica â€” QuestÃ£o 52

Um dos problemas dos combustíveis que con-
têm carbono é que sua queima produz dióxido
de carbono. Portanto, uma característica impor-
tante, ao se escolher um combustível, é analisar
seu calor de combustão (AH), definido como a
energia liberada na queima completa de um mol
de combustível no estado padrão. O quadro
seguinte relaciona algumas substâncias que
contêm carbono e seu AH?.
[substância | Fórmula | ameúumon |
=
| eso | cHoHMO | 1368 |
| metano | CH) | 80 |
| etano | cHnO0 | -sam |
Neste contexto, qual dos combustíveis, quando
queimado completamente, libera mais dióxido
de carbono no ambiente pela mesma quantida-
de de energia produzida?
A) Benzeno.
B) Metano.
C) Glicose.
D) Octano.
E) Etanol.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'hard', 'published', 52),
('ENEM-2011.1-Q53', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2011, 'QuÃ­mica ambiental', 'multiple_choice', 'ENEM 2011.1 â€” QuÃ­mica â€” QuestÃ£o 53

Belém é cercada por 39 ilhas, e suas popula-
ções convivem com ameaças de doenças. O
motivo, apontado por especialistas, é a poluição
da água do rio, principal fonte de sobrevivência
dos ribeirinhos. A diarreia é frequente nas crian-
ças e ocorre como consequência da falta de
saneamento básico, já que a população não tem
acesso à água de boa qualidade. Como não há
água potável, a alternativa é consumir a do rio.
(O Liberal. 8 jul. 2008.
Disponível em: http://wmww.oliberal.com.br)
O procedimento adequado para tratar a água
dos rios, a fim de atenuar os problemas de saú-
de causados por microrganismos a essas popu-
lações ribeirinhas é a:
20', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'medium', 'published', 53),
('ENEM-2011.1-Q54', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2011, 'EquilÃ­brio quÃ­mico', 'multiple_choice', 'ENEM 2011.1 â€” QuÃ­mica â€” QuestÃ£o 54

Certas ligas estanho-chumbo com composição
específica fomam um estético simples, o que
significa que uma liga com essas características
se comporta como uma substância pura, com
um ponto de fusão definido, no caso 183 ºC.
Essa é uma temperatura inferior mesmo ao
ponto de fusão dos metais que compõem esta
liga (o estanho puro funde a 232 ºC e o chumbo
puro a 320 ºC), o que justifica sua ampla utiliza-
ção na soldagem de componentes eletrônicos,
em que o excesso de aquecimento deve sempre
ser evitado. De acordo com as normas interna-
cionais, os valores mínimo e máximo das densi-
dades para essas ligas são de 8,74 g/mL e 8,82
g/mL, respectivamente. As densidades do esta-
nho e do chumbo são 7,3 g/mL e 11,3 g/mL,
respectivamente.
Um lote contendo 5 amostras de solda estanho-
chumbo foi analisado por um técnico, por meio
da determinação de sua composição percentual
em massa, cujos resultados estão mostrados no
quadro a seguir.
Porcentagem | Porcentagem
| de Sn (%) de Pb (%)
A mostra
1 |] 6 | as |
[Fm [6 [35
Com base no texto e na análise realizada pelo
técnico, as amostras que atendem às normas
internacionais são:
A)lell.
B)lell.
C)llelv.
D)WlevV.
E) VeV.
Questão 55(20TT.1)
No processo de industrialização da mamona,
além do óleo que contém vários ácidos graxos,
é obtida uma massa orgânica, conhecida como
torta de mamona. Esta massa tem potencial
para ser utilizada como fertilizante para o solo e
como complemento em rações animais devido a
seu elevado valor proteico. No entanto, a torta
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'hard', 'published', 54),
('ENEM-2011.1-Q55', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2011, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2011.1 â€” QuÃ­mica â€” QuestÃ£o 55. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'medium', 'published', 55),
('ENEM-2011.1-Q56', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2011, 'EquilÃ­brio quÃ­mico', 'multiple_choice', 'ENEM 2011.1 â€” QuÃ­mica â€” QuestÃ£o 56

A pele humana, quando está bem hidratada,
adquire boa elasticidade e aspecto macio e
suave. Em contrapartida, quando está resseca-
da, perde sua elasticidade e se apresenta opaca
e áspera. Para evitar o ressecamento da pele é
necessário, sempre que possível, utilizar hidra-
tantes umectantes, feitos geralmente à base de
glicerina e polietilenoglicol:
HO OH OH
| |
HC CH-CH,
glicerina
Ho — CH, CH5 fo — CH, CH, ]--0-cH,- CH OH
polietilenoglico!
A retenção de água na superfície da pele pro-
movida pelos hidratantes é consequência da
interação dos grupos hidroxila dos agentes
umectantes com a umidade contida no ambiente
por meio de:
A) ligações iônicas.
B) forças de London.
C) ligações covalentes.
D) forças dipolo-dipolo.
E) ligações de hidrogênio.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'hard', 'published', 56),
('ENEM-2011.1-Q57', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2011, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2011.1 â€” QuÃ­mica â€” QuestÃ£o 57

A cal (óxido de cálcio, CaO), cuja suspensão em
água é muito usada como uma tinta de baixo
custo, dá uma tonalidade branca aos troncos de
árvores. Essa é uma prática muito comum em
praças públicas e locais privados, geralmente
usada para combater a proliferação de parasi-
tas. Essa aplicação, também chamada de caia-
ção, gera um problema: elimina microrganismos
benéficos para a árvore.
(Disponível em: http://super.abril.com.br.
Acesso em: 1 abr. 2010 - adaptado)
21', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'medium', 'published', 57),
('ENEM-2011.1-Q58', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2011, 'QuÃ­mica ambiental', 'multiple_choice', 'ENEM 2011.1 â€” QuÃ­mica â€” QuestÃ£o 58

A eutrofização é um processo em que rios, lagos e
mente fosfatos e nitratos, provocando posterior
trientes são assimilados pelos produtores primários
limítrofe, que é o elemento menos disponível em
organismos vivos. O ciclo representado na figura
(solo; detergentes; esgoto)
P
(geralmente limitados)
N
(02 suficiente)
CO,
NOz
POr Algas e
nitrogênio
bacteriana C, N, P
Decomposição
de resíduos vegetais e animais
(O, suficiente)
A análise da água de um lago que recebe a descarga
badas revelou as concentrações dos elementos
(0,2 mol/L). Nessas condições, o nutriente limítrofe é
AJC.
B)N.
C)P.
D) CO,.
E) POoz?
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'medium', 'published', 58),
('ENEM-2011.1-Q59', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2011, 'EquilÃ­brio quÃ­mico', 'multiple_choice', 'ENEM 2011.1 â€” QuÃ­mica â€” QuestÃ£o 59

Os refrigerantes têm-se tornado cada vez mais o
sentam ácido-fosfórico, substância prejudicial à fixação
da matriz dos dentes. A cárie é um processo dinâmico
dentária, perda de minerais em razão da acidez.
dente é um sal denominado hidroxiapatita. O
pH do biofilme (placa bacteriana), provocando a
de defesa salivar levam de 20 a 30 minutos para
equação química seguinte representa esse processo:
desmineralização
Cas(PO,,;OH (s) <=]
Hidroxiapatita mineralização
Considerando que uma pessoa consuma refrigerantes
desmineralização dentária, devido ao aumento da
A) OH”, que reage com os íons Ca?*, deslocando o
B) H*, que reage com as hidroxilas OH”, deslocando
C) OH”, que reage com os íons Ca*, deslocando o
D) H”, que reage com as hidroxilas OH, deslocando
E) ca”, que reage com as hidroxilas OH, deslocando', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'hard', 'published', 59),
('ENEM-2011.1-Q60', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2011, 'QuÃ­mica orgÃ¢nica', 'multiple_choice', 'ENEM 2011.1 â€” QuÃ­mica â€” QuestÃ£o 60

A bile é produzida pelo fígado, armazenada na
vesícula biliar e tem papel fundamental na di-
gestão de lipídeos. Os sais biliares são esteroi-
des sintetizados no fígado a partir do colesterol,
e sua rota de síntese envolve várias etapas.
Partindo do ácido cólico representado na figura,
ocorre a formação dos ácidos glicocólico e tau-
rocólico; o prefixo glico- significa a presença de
um resíduo do aminoácido glicina e o prefixo
tauro-, do aminoácido taurina.
Ú
ES
cHa ERA
N/
oH cH
cH, |
CH | Os
ne e FA et,
CH, ] | |
Ha
AC Cx C———cH,
nO Nf SAE
| | |
CH e CHOH
no” NAHNSÇA
Ha Hz
ácido cólico
A combinação entre o ácido cólico e a glicina ou
taurina origina a função amida, formada pela
reação entre o grupo amina desses aminoáci-
dos e o grupo:
A) carboxila do ácido cólico.
B) aldeído do ácido cólico.
C) hidroxila do ácido cólico.
D) cetona do ácido cólico.
E) éster do ácido cólico.
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'hard', 'published', 60),
('ENEM-2011.1-Q61', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2011, 'Estequiometria', 'multiple_choice', 'ENEM 2011.1 â€” QuÃ­mica â€” QuestÃ£o 61

O peróxido de hidrogênio é comumente utilizado
como antisséptico e alvejante. Também pode
ser empregado em trabalhos de restauração de
quadros enegrecidos e no clareamento de den-
tes. Na presença de soluções ácidas de oxidan-
tes, como o permanganato de potássio, este
óxido decompõe-se, conforme a equação a
seguir:
5 H,O, (aq) + 2 KMnO, (aq) + 3 H,SO,(aq) —
5 O,(g) + 2 MNSO, (aq) + K,SO, (aq) + 8 H,O (1)
De acordo com a estequiometria da reação " des-
: ,
crita, a quantidade de permanganato de potás-
sio necessária para reagir completamente com
pri de uma solução 0,1 mol/L de peróxido
e hidrogênio é igual a:
A) 2,0x100 mol.
B) 2,0x10 mol.
C) 8.0x10 mol.
D) 8,0x10* mol.
E) 5,0x1 0º mol.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'hard', 'published', 61),
('ENEM-2011.1-Q62', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2011, 'QuÃ­mica orgÃ¢nica', 'multiple_choice', 'ENEM 2011.1 â€” QuÃ­mica â€” QuestÃ£o 62

O etanol é considerado um biocombustível pro-
missor, pois, sob o ponto de vista do balanço de
carbono, possui uma taxa de emissão pratica-
mente igual a zero. Entretanto, esse não é o
único ciclo biogeoquímico associado à produção
de etanol. O plantio da cana-de-açúcar, matéria-
prima para a produção de etanol, envolve a
23', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'medium', 'published', 62),
('ENEM-2011.1-Q63', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2011, 'QuÃ­mica orgÃ¢nica', 'multiple_choice', 'ENEM 2011.1 â€” QuÃ­mica â€” QuestÃ£o 63

Calocaram a elpado
iment o
sbre E o que faremos?
S
AS: 1 (Po A
14 bd bo
E EEB EN bz o TT
Culparemos as galinhas
ss
(Pis Era (Pd ua
o E ms E tm
- | A DART ABI SN E bd | -
na
[une EXPLOSH DA POReanAA OGSPOT COM)
De acordo com o relatório “A grande sombra da
pecuária” (Livestock''s Long Shadow), feito pela
Organização das Nações Unidas para a Agricul-
tura e a Alimentação, o gado é responsável por
cerca de 18% do aquecimento global, uma con-
tribuição maior que a do setor de transportes. À
criação de gado em larga escala contribui para
o aquecimento global por meio da emissão de:
A) metano durante o processo de digestão.
B) óxido nitroso durante o processo de rumina-
ção
C) clorofluorcarbono durante o transporte de
carne.
D) óxido nitroso durante o processo respiratório.
E) dióxido de enxofre durante o consumo de
pastagens.
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'hard', 'published', 63),
('ENEM-2011.2-Q64', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2011, 'Estequiometria', 'multiple_choice', 'ENEM 2011.2 â€” QuÃ­mica â€” QuestÃ£o 64

Considera-se combustível aquele material que,
quando em combustão, consegue gerar energia.
No caso dos biocombustíveis, Suas principais
vantagens de uso são a de serem oriundos de
fontes derivad. & eb: veis poluem
Das a
Po que Bras " No S ulado Santo
os e
or 18So, no 3rasis, em-se estimulado o p''antio
e a industrialização de sementes oleaginosas
para produção de biocombustíveis.
No quadro, estão os valores referentes à ener-
gia produzida pela combustão de alguns bio-
combustíveis:
BIOCOMBUSTÍVEL keallkg
Biodiesel (mamona) 8913
Biodiesel (babaçu) 9 049
Biodiesel (dendê) 8 946
Biodiesel (soja) 9421
Etanol (cana-de-açúcar) - 5 596
Entre os diversos tipos de biocombustíveis
apresentados no quadro, aquele que apresenta
melhor rendimento energético em massa é pro-
veniente:
A) do babaçu.
B) da cana-de-açúcar. ú
C) do dendê.
D) da soja.
E) da mamona.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'hard', 'published', 64),
('ENEM-2011.2-Q65', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2011, 'EletroquÃ­mica', 'multiple_choice', 'ENEM 2011.2 â€” QuÃ­mica â€” QuestÃ£o 65

Iniciativas do poder público para prevenir o uso
de bebidas alcoólicas por motoristas, causa de
muitos acidentes nas estradas do país, trouxe-
ram à ordem do dia, não sem suscitar polêmica,
o instrumento popularmente conhecido como
bafômetro. "
Do ponto de vista n de detecção = e medição, 1 os
instrumentos normalmente usados pelas polí-
cias rodoviárias do Brasil e de outros países
utilizam o ar que os “suspeitos” sopram para
dentro do aparelho, através de um tubo descar-
tável, para promover a oxidação do etanol! a
etanal. O método baseia-se no princípio da pilha
de combustível: o etanol é oxidado em meio
ácido sobre um disco plástico poroso coberto
com pó de platina (catalisador) e umedecido
com ácido sulfúrico, sendo um eletrodo conec-
tado a cada lado desse disco poroso.
A corrente elétrica produzida, proporcional à
concentração de álcool no ar expirado dos pul-
mões da pessoa testada, é lida numa escala
que é proporcional ao teor de álcool no sangue.
O esquema de funcionamento desse detector
de etanol pode ser visto na figura.
24', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'hard', 'published', 65),
('ENEM-2011.2-Q66', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2011, 'QuÃ­mica ambiental', 'multiple_choice', 'ENEM 2011.2 â€” QuÃ­mica â€” QuestÃ£o 66

A reciclagem exerce impacto considerável sobre
a eficiência energética. Embora restaurar mate-
riais que foram descartados também consuma
energia, é possível que essa energia seja subs-
tancialmente menor. O gráfico seguinte indica a
quantidade de energia necessária para a produ-
ção de materiais primários e reciclados. A maio-
ria dos metais ocorre na crosta terrestre como
óxidos que devem ser reduzidos para recuperar
o metal elementar, o que consome grande
quantidade de energia.
250
200
"
ã
2 150
EH
2
“e 100
É
so
so ape! amino
r e Alumíni
DO material primário Material reciclado
novocadernoenem(DQgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'medium', 'published', 66),
('ENEM-2011.2-Q67', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2011, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2011.2 â€” QuÃ­mica â€” QuestÃ£o 67. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'medium', 'published', 67),
('ENEM-2011.2-Q68', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2011, 'QuÃ­mica orgÃ¢nica', 'multiple_choice', 'ENEM 2011.2 â€” QuÃ­mica â€” QuestÃ£o 68

O biodiesel é um biocombustível que pode ser
obtido a partir do processo químico em que
óleos ou gorduras são transformados em éste-
res metílicos ou etílicos de ácidos graxos.
25', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'easy', 'published', 68),
('ENEM-2011.2-Q69', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2011, 'QuÃ­mica inorgÃ¢nica', 'multiple_choice', 'ENEM 2011.2 â€” QuÃ­mica â€” QuestÃ£o 69

A matéria-prima básica para a fabricação de calçados
tado o fluxograma de fabricação do PVC e sua fórmula
Siglas: PVC - policloreto de vinila; EDC - dicloro etano;
Água Soda Cáustica
+Sal e Hidrogênio
SS) —
-
À
,
[|
é
Salmoura
h
Cloro = EDC = =
——
=
Petróleo Eteno
Para a produção do PVC, a obtenção do cloro é
A) filtração a vácuo.
B) fusão ígnea.
C) eletrólise.
D) precipitação fracionada.
E) destilação.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'medium', 'published', 69),
('ENEM-2011.2-Q70', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2011, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2011.2 â€” QuÃ­mica â€” QuestÃ£o 70

Três amostras de minérios de ferro de regiões
aproximados, estão na tabela:
Tipo de óxido Massa
Regiã egião
encontrado
Considerando que as impurezas são inertes aos
rio de ferro com carvão, de formas simplificadas, são:
2
2FeO +
FezO, + 2C—
Dados: Massas molares (g/mol) C = 12; O = 16; Fe =
Os minérios que apresentam, respectivamente, a
lada de ferro produzido são os das regiões:
A) A com 90% e B com 200 kg.
B) B com 80% e A com 161 kg.
C) C com 85% e B com 107 kg.
D) A com 75% e C com 143 kg.
E) B com 95% e A com 161 kg.
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'medium', 'published', 70),
('ENEM-2011.2-Q71', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2011, 'QuÃ­mica orgÃ¢nica', 'multiple_choice', 'ENEM 2011.2 â€” QuÃ­mica â€” QuestÃ£o 71

A produção mundial de alimentos poderia se
: .
reduzir a 40% da atual sem a aplicação de con-
trole sobre as pragas agrícolas. Por outro lado,
o uso frequente dos agrotóxicos pode causar
contaminação em solos, águas superficiais e
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'easy', 'published', 71),
('ENEM-2011.2-Q72', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2011, 'QuÃ­mica ambiental', 'multiple_choice', 'ENEM 2011.2 â€” QuÃ­mica â€” QuestÃ£o 72

As chamadas estruturas metal-orgânicas são
cristais metálicos porosos e estáveis, capazes
de absorver e comprimir gases em espaços
ínfimos. Um grama deste material, se espalha-
do, ocuparia uma área de pelo menos 5 000 m?.
Os cientistas esperam que o uso de tais materi-
ais contribua para a produção de energias mais
limpas e de métodos para a captura de gases
do efeito estufa.
(Disponível em: http:/Mww1 .folha.uol.com.br.
Acesso em: 20 jul. 2010 - adaptado)
A maior eficiência destes materiais em absorver
. SS o
gás carbônico é consequência:
A) da grande superfície de contato entre os
cristais porosos e o gás carbônico.
B) da alta densidade apresentada pelos materi-
ais.
C) do uso de grande quantidade de materiais
para absorver grande quantidade de gás.
D) da alta estabilidade dos cristais metálicos.
E) da capacidade ; de comprimir io os gases ocu-
pando grandes áreas.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'hard', 'published', 72),
('ENEM-2011.2-Q73', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2011, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2011.2 â€” QuÃ­mica â€” QuestÃ£o 73. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'medium', 'published', 73),
('ENEM-2012.1-Q74', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2012, 'EquilÃ­brio quÃ­mico', 'multiple_choice', 'ENEM 2012.1 â€” QuÃ­mica â€” QuestÃ£o 74

O rótulo de um desodorante aerossol , informa ao
consumidor que o produto possui em sua com-
posição os gases isobutano, butano e propano,
dentre outras substâncias. Além dessa informa-
ção, o rótulo traz, ainda, a inscrição “Não con-
tém CFC”. As reações a seguir, que ocorrem na
estratosfera, justificam a não utilização de CFC
(glorofiuorcarbono
ou Freon) nesse desodoran-
''
D) CF,CL, UV, CF,Ct + CL
1) CL+O O, + CLO-
3 ?
A preocupação " com as possíveis na ameaças à R
camada de ozônio (O) baseia-se na sua princi-
an : .
pal função: proteger a matéria viva na Terra dos
efeitos prejudiciais dos raios solares ultravioleta.
A absorção da radiação ultravioleta pelo ozônio
estratosférico é intensa o suficiente para elimi-
nar boa parte da fração de ultravioleta que é
prejudicial à vida.
A finalidade da utilização dos gases isobutano,
butano e propano neste aerosso]l é:
28', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'hard', 'published', 74),
('ENEM-2012.1-Q75', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2012, 'QuÃ­mica orgÃ¢nica', 'multiple_choice', 'ENEM 2012.1 â€” QuÃ­mica â€” QuestÃ£o 75

A própolis é um produto natural conhecido por
suas propriedades anti-inflamatórias e cicatri-
antes. Esse material contém aaa AAA
postos identificados até o momento. Dentre
eles, alguns são de estrutura simples, como é o
caso do C;H;CO;CH;CH3, cuja estrutura está
mostrada a seguir.
O
NT
Cc
O
SO-CH,CH,
O ácido carboxílico e o álcool capazes de pro-
duzir o éster em apreço por meio da reação de
esterificação são, respectivamente,
A) ácido benzoico e etanol.
B) ácido propanoico e hexanol.
OC) ácido fenilacético e metanol.
D) ácido propiônico e cicloexanol.
E) ácido acético e álcool benzílico.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'medium', 'published', 75),
('ENEM-2012.1-Q76', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2012, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2012.1 â€” QuÃ­mica â€” QuestÃ£o 76

No Japão, um movimento nacional para a pro-
moção da luta contra o aquecimento global leva
o slogan: 1 pessoa, 1 dia, 1 kg de CO, a me-
nos! A ideia é cada pessoa reduzir em 1 kg a
quantidade de CO, emitida todo dia, por meio
de pequenos gestos ecológicos, como diminuir
a queima de gás de cozinha.
(Um hamburguer ecológico? É pra já!
Disponível em: http://Iges.iqm.unicamp.br.
Acesso em: 24 fev . 2012 - adaptado)
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'medium', 'published', 76),
('ENEM-2012.1-Q77', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2012, 'QuÃ­mica orgÃ¢nica', 'multiple_choice', 'ENEM 2012.1 â€” QuÃ­mica â€” QuestÃ£o 77

O benzeno é um hidrocarboneto aromático pre-
sente no petróleo, no carvão e em condensados
de gás natural.
Seus metabólitos são altamente tóxicos e se
depositam na medula óssea e nos tecidos gor-
durosos.
O limite de exposição pode causar anemia, cân-
cer (leucemia) e distúrbios do comportamento.
Em termos de reatividade química, quando um
eletrófilo se liga ao benzeno, ocorre a formação
de um intermediário, o carbocátion.
Por fim, ocorre a adição ou substituição eletrofí-
lica.
e
=
-
|
-
fe]
carbocátion (1) produto (11)
produto (1)
O + Br, + catalisador
Progresso da Reação
Com base no texto e no gráfico ae do progresso da
reação apresentada, as estruturas químicas
encontradas em |, Il e Ill são, respectivamente:
" "
H
A) DI
Br Br
Br
; ;
29', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'hard', 'published', 77),
('ENEM-2012.1-Q78', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2012, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2012.1 â€” QuÃ­mica â€” QuestÃ£o 78. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'medium', 'published', 78),
('ENEM-2012.1-Q79', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2012, 'QuÃ­mica orgÃ¢nica', 'multiple_choice', 'ENEM 2012.1 â€” QuÃ­mica â€” QuestÃ£o 79

Em uma planície, ocorreu um acidente ambien-
tal em decorrência do derramamento de grande
quantidade de um hidrocarboneto que se apre-
senta na forma pastosa à temperatura ambien-
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'easy', 'published', 79),
('ENEM-2012.1-Q80', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2012, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2012.1 â€” QuÃ­mica â€” QuestÃ£o 80. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'medium', 'published', 80),
('ENEM-2012.1-Q81', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2012, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2012.1 â€” QuÃ­mica â€” QuestÃ£o 81. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'medium', 'published', 81),
('ENEM-2012.1-Q82', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2012, 'QuÃ­mica ambiental', 'multiple_choice', 'ENEM 2012.1 â€” QuÃ­mica â€” QuestÃ£o 82

O boato de que os lacres das latas de alumínio
teriam um alto valor comercial levou muitas
pessoas a juntarem esse material na expectati-
va de ganhar dinheiro com sua venda. As em-
presas fabricantes de alumínio esclarecem que
isso não passa de uma “lenda urbana”, pois ao
retirar o anel da lata, dificulta-se a reciclagem do
alumínio. Como a liga do qual é feito o anel
contém alto teor de magnésio, se ele não estiver
junto com a lata, fica mais fácil ocorrer a oxida-
ção do alumínio no forno.
A tabela apresenta . " e os valo-
as semirreações
es de potencial padrão de redução de alguns
metais:
Potencial Padrão " de
Semirreação
Redução (V)
Litre-—Li - 3,05
K''+e—sK —-2,93
Mg” 24 +2e " Mg 2,36
AB +3eE SA —1,66 :
Zn +2e Zn —0,76
Cut +26 = Cu 0,34
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'hard', 'published', 82),
('ENEM-2012.1-Q83', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2012, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2012.1 â€” QuÃ­mica â€” QuestÃ£o 83. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'medium', 'published', 83),
('ENEM-2012.1-Q84', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2012, 'EquilÃ­brio quÃ­mico', 'multiple_choice', 'ENEM 2012.1 â€” QuÃ­mica â€” QuestÃ£o 84

Quando colocados em água, os fosfolipídeos
tendem a formar lipossomos, estruturas forma-
das por uma bicamada lipídica, conforme mos-
trado na figura. Quando rompida, essa estrutura
tende a se reorganizar em um novo lipossomo.
aARRPOO,
O
FX Po
Q ffI-—r Fosfolipídios
OQ 2
O Nes OO O
O . CL O
O O Meio E,
Oo o Aquoso Pa
" e SS
O TS
Ç D
Cs DO
O D Meio
POCBCOOS Aqueso
Esse arranjo característico se deve ao fato de
os fosfolipídios apresentarem uma natureza:
A) polar, ou seja, serem inteiramente solúveis
em água.
B) apolar, ou seja, não serem solúveis em solu-
- A terca
ou seja, ja, P podem comportar-se
como ácidos é bases. Pp
D) insaturada, N ou seja, '' possuírem duplas liga-
. trutura
É) anfífílica ou seja ossuírem uma parte hidro-
outra idrotóbica Pp
fílica e ''
Cp', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'hard', 'published', 84),
('ENEM-2012.1-Q85', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2012, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2012.1 â€” QuÃ­mica â€” QuestÃ£o 85

Osmose é um processo R que ocorre
espontâneo
em todos os organismos vivos e é essencial à
manutenção da vida. Uma solução 0,15 mol/L
de NaCf (cloreto de sódio) possui a mesma
pressão osmótica das soluções presentes nas
células humanas.
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'easy', 'published', 85),
('ENEM-2012.1-Q86', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2012, 'Estequiometria', 'multiple_choice', 'ENEM 2012.1 â€” QuÃ­mica â€” QuestÃ£o 86

Aspartame é um edulcorante artificial (adoçante
dietético) que apresenta potencial adoçante 200
vezes maior que o açúcar comum, permitindo
seu uso em pequenas quantidades. Muito usado
pela indústria alimentícia, principalmente nos
refrigerantes diet, tem valor energético que cor-
responde a 4 calorias/grama. É contraindicado a
portadores de fenilcetonúria, uma doença gené-
tica rara que provoca o acúmulo da fenilalanina
no organismo, causando retardo mental. O IDA
(índice diário aceitável) desse adoçante é 40
mg/kg de massa corpórea.
Com base nas Í informações . do texto, a quanti- ;
dade máxima recomendada de aspartame, em
mol, que uma pessoa de 70 kg de massa corpo-
ral pode ingerir por dia é mais próxima de:
(Dado: massa molar do aspartame = 294 g/mol)
A) 1,3 x 10º
B) 9,5 x 10?
c)4x 10?
D) 2,6
E) 823
Questão ST (20122) |Ú|]|]|||||]||||
O senso comum nos diz que os polímeros orgâ-
nicos (plásticos) em geral são isolantes elétri-
cos. Entretanto, os polímeros condutores —
materiais orgânicos que conduzem eletricidade.
O que faz estes polímeros diferentes é a pre-
sença das ligações covalentes duplas conjuga-
das com ligações simples, ao longo de toda a
cadeia principal, incluindo grupos aromáticos.
Isso permite que um átomo de carbono desfaça
a ligação dupla com um vizinho e refaça-a com
outro. Assim, a carga elétrica desloca-se dentro
do material.
(FRANCISCO, R. H. P. Polímeros condutores. Revis-
ta Eletrônica de Ciências, n. 4, fev. 2002. Disponível
em: www.cdec.usp.br. Acesso em: 29 fev. 2012)
32', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'hard', 'published', 86),
('ENEM-2012.1-Q87', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2012, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2012.1 â€” QuÃ­mica â€” QuestÃ£o 87. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'medium', 'published', 87),
('ENEM-2012.2-Q88', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2012, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2012.2 â€” QuÃ­mica â€” QuestÃ£o 88

O quadro apresenta o teor de cafeina em dife-
rentes bebidas comumente consumidas pela
população.
EsEmcade
cafeina (mg)
"
| Chocolate quente [600 [| > |
Da análise do quadro conclui-se que o menor
teor de cafeina por unidade de volume está
presente no:
A) café expresso.
B) chá preto.
C) chocolate quente.
D) café filtrado.
E) refrigerante de cola.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'medium', 'published', 88),
('ENEM-2012.2-Q89', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2012, 'QuÃ­mica ambiental', 'multiple_choice', 'ENEM 2012.2 â€” QuÃ­mica â€” QuestÃ£o 89

O polímero PET (tereftalato de polietileno), ma-
terial presente em diversas embalagens descar-
táveis, pode levar centenas de anos para ser
degradado e seu processo de reciclagem requer
um grande aporte energético. Nesse contexto,
uma técnica que visa baratear o processo foi
implementada recentemente. Trata-se do aque-
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'medium', 'published', 89),
('ENEM-2012.2-Q90', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2012, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2012.2 â€” QuÃ­mica â€” QuestÃ£o 90. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'medium', 'published', 90),
('ENEM-2012.2-Q91', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2012, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2012.2 â€” QuÃ­mica â€” QuestÃ£o 91

Um aquecedor solar consiste essencialmente em
meio da qual flui água a ser aquecida. A parte inferior
que é o coletor solar. A forma da serpentina tem a
tor e com a própria radiação solar sem aumentar
condutor, transmite a energia da radiação solar
para a água. A superfície deve ser recoberta com
para que absorva o máximo de radiação solar e emita
relacionam propriedades de alguns metais/ligas
res:
Razão entre a
absorbância de
Material A seleti SUvO
o radiação solar e a
K emitância de radiação
infravermelha
A. —Óxidoe sulfeto
de níquel e zinco 8,45
aplicados sobre zinco
B. Óxido e sulfeto de
níquel e zinco sobre 7,42
ferro galvanizado
C. Óxido de cobre em
alumínio " anodizado : 7,12
Os aquecedores solares mais eficientes e, portanto,
ser construídos utilizando como material metálico e
A) cobre e material seletivo quente A.
B) zinco e material seletivo quente B.
C) aço e material seletivo quente B.
D) aço e material seletivo quente A.
E) cobre e material seletivo quente C.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'hard', 'published', 91),
('ENEM-2012.2-Q92', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2012, 'EquilÃ­brio quÃ­mico', 'multiple_choice', 'ENEM 2012.2 â€” QuÃ­mica â€” QuestÃ£o 92

A fosfatidilserina é um fosfolipídio aniônico cuja
ção celular e vem sendo estudada no desenvolvimento
senta a estrutura da fosfatidilserina:
OAFDÔADDADAARAASAS
HC
Estrutura da
Com base nas informações do texto, a natureza da
tipo:
Dado: número atômico do elemento cálcio: 20
A) iônica somente com o grupo aniônico fosfato, já
B) iônica com os grupos aniônicos fosfato e carboxila,
divalente.
C) iônica com o cátion amônio, porque o cálcio livre
D) covalente com qualquer dos grupos não carregados
doar elétrons ao cálcio livre para formar a ligação.
E) covalente com qualquer grupo catiônico da
rá compartilhar seus elétrons com tais grupos.
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'medium', 'published', 92),
('ENEM-2012.2-Q93', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2012, 'QuÃ­mica orgÃ¢nica', 'multiple_choice', 'ENEM 2012.2 â€” QuÃ­mica â€” QuestÃ£o 93

Um dos métodos de produção de biodiesel envolve
nol em meio básico (NaOH ou KOH), que precisa
esquema reacional da produção de biodiesel, em
cas dos ésteres de ácidos graxos.
À x
o
go: R$
RO OR * baso Vl
+ 3HCOH—ÇÇO
A ausência de água no meio reacional se faz necessária
A) evitar a diminuição da temperatura da mistura
B) manter o meio reacional no estado sólido.
C) manter a elevada concentração do meio reacional.
D) manter constante o volume de óleo no meio reacional.
E) evitar a hidrólise dos ésteres no meio reacional e', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'medium', 'published', 93),
('ENEM-2012.2-Q94', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2012, 'QuÃ­mica ambiental', 'multiple_choice', 'ENEM 2012.2 â€” QuÃ­mica â€” QuestÃ£o 94

Pesquisadores conseguiram produzir grafita
magnética por um processo inédito em forno
com atmosfera controlada e em temperaturas
elevadas. No forno são colocados grafita co-
mercial em pó e óxido metálico, tal como CuO.
Nessas condições, o óxido é reduzido e ocorre
a oxidação da grafita, com a introdução de pe-
quenos defeitos, dando origem à propriedade
magnética do material.
Considerando o processo descrito com um ren-
dimento de 100%, 8 g de CuO produzirão uma
massa de CO, igual a:
Dados: Massa molar em gímol: C = 12; O = 16;
Cu = 64
A) 3,79.
B)4,49.
C)5,59.
D) 2,29.
E) 2,89.
Questão 95(20122)
A grafita é uma variedade alotrópica do carbo-
no. Trata-se de um sólido preto, macio e escor-
regadio, que apresenta brilho característico e
boa condutibilidade elétrica. Considerando es-
sas propriedades, a grafita tem potencial de
aplicabilidade em:
A) Ferramentas para riscar ou cortar materiais,
nanoestruturas capazes de transportar drogas
com efeito radioterápico e cátodos de baterias
alcalinas.
B) Ferramentas para amolar ou polir materiais,
brocas odontológicas e condutores de eletrici-
dade.
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'hard', 'published', 94),
('ENEM-2012.2-Q95', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2012, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2012.2 â€” QuÃ­mica â€” QuestÃ£o 95. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'medium', 'published', 95),
('ENEM-2012.2-Q96', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2012, 'QuÃ­mica inorgÃ¢nica', 'multiple_choice', 'ENEM 2012.2 â€” QuÃ­mica â€” QuestÃ£o 96

Para preparar uma massa básica de pão, deve-
se misturar apenas farinha, água, sal e fermen-
to. Parte do trabalho deixa-se para o fungo pre-
sente no fermento: ele utiliza amido e açúcares
da farinha em reações químicas que resultam
na produção de alguns outros compostos impor-
tantes no processo de crescimento da massa.
Antes de assar, é importante que a massa seja
deixada num recipiente por algumas horas para
que o processo de fermentação ocorra.
Esse período de espera é importante para que a
Massa cresça, pois é quando ocorre a:
A) liberação de energia pelos fungos.
B) formação de dióxido de carbono.
C) evaporação do álcool formado na decompo-
sição dos açúcares.
D) reprodução do fungo na massa.
E) transformação da água líquida em vapor
d''água.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'hard', 'published', 96),
('ENEM-2012.2-Q97', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2012, 'Estequiometria', 'multiple_choice', 'ENEM 2012.2 â€” QuÃ­mica â€” QuestÃ£o 97

Motores a combustão interna apresentam me-
lhor rendimento quando podem ser adotadas
taxas de compressão mais altas nas suas câ-
maras de combustão, sem que o combustível
sofra ignição espontânea. Combustíveis com
maiores índices de resistência à compressão,
35', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'easy', 'published', 97),
('ENEM-2012.2-Q98', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2012, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2012.2 â€” QuÃ­mica â€” QuestÃ£o 98. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'medium', 'published', 98),
('ENEM-2013.1-Q99', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2013, 'Estequiometria', 'multiple_choice', 'ENEM 2013.1 â€” QuÃ­mica â€” QuestÃ£o 99

(o) brasileiro consome em média 500 miligramas
1. "
de cálcio por dia, quando a quantidade reco-
mendada é o dobro. Uma alimentação balance-
ada é a melhor decisão para evitar problemas
no futuro, como a osteoporose, uma doença que
atinge os ossos. Ela se caracteriza pela diminui-
ção substancial de massa óssea, tornando os
ossos frágeis e mais suscetíveis a fraturas.
Considerando-se o valor de 6 x 10º mol”* para
a constante de Avogadro e a massa molar do
cálcio igual a 40 g/mol, qual a quantidade míni-
ma diária de átomos de cálcio a ser ingerida
para que uma pessoa supra suas necessida-
des?
A) 7,5x 10º
B) 1,5x 10%
C)7,5x 10º
D) 1,5x 10%
E) 4,8 x 10º”
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'hard', 'published', 99),
('ENEM-2013.1-Q100', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2013, 'Radioatividade', 'multiple_choice', 'ENEM 2013.1 â€” QuÃ­mica â€” QuestÃ£o 100

Glicose marcada com nuclídeos de carbono-11
é utilizada na medicina para se obter imagens
tridimensionais do cérebro, por meio de tomo-
grafia de emissão de pósitrons. A desintegração
do carbono-11 gera um pósitron, com tempo de
meia-vida de 20,4 min, de acordo com a equa-
ção da reação nuclear:
n n o
C> B+€
6 5 1
(pósitron)
A partir da injeção de glicose marcada com esse
nuclídeo, o tempo de aquisição de uma imagem
de tomografia é de cinco meias-vidas.
Considerando que o medicamento contém 1,00
9 do carbono-11, a massa, em miligramas, do
nuclídeo restante, apos a aquisição da imagem,
é mais próxima de:
A) 0,200.
B) 0,969.
C) 9,80.
D) 313.
E) 200.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'medium', 'published', 100),
('ENEM-2013.1-Q101', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2013, 'EquilÃ­brio quÃ­mico', 'multiple_choice', 'ENEM 2013.1 â€” QuÃ­mica â€” QuestÃ£o 101

O uso de embalagens plásticas descartáveis Í
vem crescendo em todo o mundo, juntamente
com o problema ambiental gerado por seu des-
carte inapropriado.
O politereftalato de etileno (PET), cuja estrutura
é mostrada tem sido muito utilizado na indústria
de refrigerantes e pode ser reciclado e reutiliza-
do.
Uma das opções possíveis envolve a produção
de matérias-primas, como o etilenoglico! (1,2-
etanodiol), a partir de objetos compostos de
PET pós-consumo.
fe) fo]
NT NT
HO AO C-O-CH;CH-O H
n
Com base nas informações do texto, uma alter-
nativa para a obtenção de etilenoglicol a partir
doPETéa:
A) solubilização dos objetos.
B) combustão dos objetos.
C) trituração dos objetos.
D) hidrólise dos objetos.
E) fusão dos objetos.
36', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'medium', 'published', 101),
('ENEM-2013.1-Q102', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2013, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2013.1 â€” QuÃ­mica â€” QuestÃ£o 102

O citral, substância de odor fortemente cítrico, é obtido
cujo óleo essencial possui aproximadamente 80%,
Uma de suas aplicações é na fabricação de produtos
Apis, pois seu cheiro é semelhante a um dos
C1oH15O, com uma cadeia alifática de oito carbonos,
pos substituintes metila, nos carbonos 3 e 7. O citral
que mais contribui para o forte odor.
Para que se consiga atrair um maior número de
deve estar presente em alta concentração no produto
fe]
nm D ia xá
o
FD FF >oÚU
B)
FF
Ú Ú
o', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'medium', 'published', 102),
('ENEM-2013.1-Q103', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2013, 'EquilÃ­brio quÃ­mico', 'multiple_choice', 'ENEM 2013.1 â€” QuÃ­mica â€” QuestÃ£o 103

Uma das etapas do tratamento da água é a desinfecção,
Esse método consiste na dissolução do gás cloro
ser desinfectada. As equações das reações químicas
Cl, (g) + 2 H,O (1) = Hclo
HCIO (aq) + H,O () = H,O* (aq)
A ação desinfetante é controlada pelo ácido hipocloroso,
de 80 vezes superior ao ânion hipoclorito. O pH do
com que o ácido hipocloroso se ioniza. Para que a
tratada deve estar mais próximo de:
AO.
B)5.
o) 7.
D) 89.
E) 14.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'medium', 'published', 103),
('ENEM-2013.1-Q104', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2013, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2013.1 â€” QuÃ­mica â€” QuestÃ£o 104

Plantas terrestres que ainda estão em fase de
do-o para formar novas moléculas orgânicas, e liberam
tas maduras, cujas árvores já atingiram o equilíbrio,
produção pela fotossíntese. A morte natural de
centração de O, e de CO, próximo à superfície do
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'easy', 'published', 104),
('ENEM-2013.1-Q105', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2013, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2013.1 â€” QuÃ­mica â€” QuestÃ£o 105. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'medium', 'published', 105),
('ENEM-2013.1-Q106', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2013, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2013.1 â€” QuÃ­mica â€” QuestÃ£o 106. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'medium', 'published', 106),
('ENEM-2013.1-Q107', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2013, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2013.1 â€” QuÃ­mica â€” QuestÃ£o 107

A varfarina é um fármaco que diminui a agrega-
ção plaquetária, e por isso é utilizada como
anticoagulante, desde que esteja presente no
plasma, com uma concentração superior a 1,0
mg/L.
Entretanto, concentrações plasmáticas superio-
res a 4,0 mg/L podem desencadear hemorragi-
as. As moléculas desse fármaco ficam retidas
no espaço intravascular e dissolvidas exclusi-
vamente no plasma, que representa aproxima-
damente 60% do sangue em volume.
Em um medicamento, a varfarina é administrada
por via intravenosa na forma de solução aquo-
sa, com concentração de 3,0 mg/mL. Um indiví-
duo adulto, com volume sanguíneo total de 5,0
L, será submetido a um tratamento com solução
injetável desse medicamento.
38', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'medium', 'published', 107),
('ENEM-2013.1-Q108', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2013, 'EletroquÃ­mica', 'multiple_choice', 'ENEM 2013.1 â€” QuÃ­mica â€” QuestÃ£o 108

Eu também podia decompor a água, se fosse
salgada ou acidulada, usando a pilha de Daniell
como fonte de força. Lembro o prazer extraordi-
nário que sentia ao decompor um pouco de
água em uma taça para ovos quentes, vendo-a
separar-se em seus elementos, o oxigênio em
um eletrodo, o hidrogênio no outro.
A eletricidade de uma pilha de 1 volt parecia tão
fraca, e no entanto podia ser suficiente para
desfazer um composto químico, a água.
(SACKS, O. Tio Tungstênio: memórias de uma infân-
cia química. São Paulo: Cia das Letras, 2002)
O fragmento do romance de Oliver Sacks relata
a separação dos elementos que compõem a
agua. o principio do lisas apresentado é
utilizado industrialmente na:
A) obtenção de ouro à partir de pepitas.
= ; "
B) obtenção de calcário a partir de rochas.
C) obtenção de alumínio a partir de bauxita.
D) obtenção de ferro a partir de seus óxidos.
E) obtenção de amônia a partir de hidrogênio e
nitrogênio.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'hard', 'published', 108),
('ENEM-2013.1-Q109', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2013, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2013.1 â€” QuÃ­mica â€” QuestÃ£o 109

A produção de aço envolve o aquecimento do
minério de ferro, junto com carvão (carbono) e
ar atmosférico em uma série de reações de
oxidorredução.
O produto é chamado de ferro-gusa e contém
cerca de 3,3% de carbono. Uma forma de elimi-
nar o excesso de carbono é a oxidação a partir
do aquecimento do ferro-gusa com gás oxigênio
puro.
Os dois principais produtos formados são aço
doce (liga de ferro com teor de 0,3% de carbono
restante) e gás carbônico. As massas molares
aproximadas dos elementos carbono e oxigênio
são, respectivamente, 12 g/mol e 16 g/mol.
(LEE, J. D. Química inorgânica não tão concisa.
São Paulo: Edgard Blucher, 1999)
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'medium', 'published', 109),
('ENEM-2013.1-Q110', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2013, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2013.1 â€” QuÃ­mica â€” QuestÃ£o 110

Entre as substâncias usadas para o tratamento
de água está o sulfato de alumínio que, em
meio alcalino, forma partículas em suspensão
na água, às quais as impurezas presentes no
meio se aderem.
O método de separação comumente usado para
retirar o sulfato de alumínio com as impurezas
aderidas é a:
A) flotação.
B) levigação.
C) ventilação.
D) peneiração.
E) centrifugação.
Questão IIIÇ2OTBAJ |||
As fraldas descartáveis que contêm o polímero
poliacrilato de sódio (1) são mais eficientes na
Vencionais, constituídas de fibras de celulose
retenção de água que as fraldas de pano con-
2) ]
Ho OH
o
O SO | Na + J
OH
(1) (2)
A maior . eficiência NS dessas fraldas descartáveis, .
em relação às de pano, deve-se às:
A) interações dipolo-dipolo mais fortes entre o
poliacrilato e a água, em relação as ligações de
hidrogênio entre a celulose e as moléculas de
água.
B) interações íon-íon mais fortes entre o polia-
crilato e as moléculas de água, em relação às
ligações de hidrogênio entre a celulose e as
moléculas de água.
C) ligações de hidrogênio mais fortes entre o
poliacrilato e a água, em relação às interações
ion-dipolo entre a celulose e as moléculas de
água.
39', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'hard', 'published', 110),
('ENEM-2013.1-Q111', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2013, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2013.1 â€” QuÃ­mica â€” QuestÃ£o 111. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'medium', 'published', 111),
('ENEM-2013.2-Q112', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2013, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2013.2 â€” QuÃ­mica â€” QuestÃ£o 112. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'medium', 'published', 112),
('ENEM-2013.2-Q113', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2013, 'EletroquÃ­mica', 'multiple_choice', 'ENEM 2013.2 â€” QuÃ­mica â€” QuestÃ£o 113

Após o desmonte da bateria automotiva, é obti-
da uma pasta residual de 6 kg, em que 19%, em
massa, é dióxido de chumbo(IV), 60%, sulfato
de chumbo(ll) e 21%, chumbo metálico. O pro-
cesso pirometalúrgico é o mais comum na ob-
tenção do chumbo metálico, porém, devido à
alta concentração de sulfato de chumbo(ll),
ocorre grande produção de dióxido de enxofre
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'medium', 'published', 113),
('ENEM-2013.2-Q114', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2013, 'EletroquÃ­mica', 'multiple_choice', 'ENEM 2013.2 â€” QuÃ­mica â€” QuestÃ£o 114

Se dermos uma mordida em um pedaço de
papel alumínio colocado em cima de uma obtu-
ração de amálgama (combinação do mercúrio
metálico com metais e/ou ligas metálicas), senti-
remos uma dor causada por uma corrente que
pode chegar até 30 yA.
(SILVA, R. R. et al. Química Nova na Escola, São
Paulo, n. 13, maio 2001 - adaptado)
O contato dos materiais metálicos citados pro-
duz:
A) uma solução eletrolítica, cujo fluxo de elé-
trons é espontâneo.
B) um sistema galvânico, cujo fluxo de elétrons
não é espontâneo.
C) um sistema eletrolítico, cujo fluxo de elétrons
não é espontâneo.
D) uma eletrólise, cujo fluxo de elétrons não é
espontâneo.
E) uma pilha, cujo fluxo de elétrons é espontãâ-
neo.
40', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'hard', 'published', 114),
('ENEM-2013.2-Q115', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2013, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2013.2 â€” QuÃ­mica â€” QuestÃ£o 115

Balão de festa com
bicarbonato de sódio
preso a uma garrafa
com vinagre.
STO
-
—
—
A transformação química em questão é representada
A) CH;COOH (aq) + NaHCO; (s) — NaCO?* (aq) +
B) CH;COOH (aq) + NaHCO; (s) — Na* (aq) + CH;COO”
C) CH;COOH (aq) + NaHCO; (s) — Na” (aq) +
D) CH;COOH (aq) + NaHCO; (s) — Na* (aq) +
E) CH;COOH (aq) + NaHCO; (s) — Na” (aq) +', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'medium', 'published', 115),
('ENEM-2013.2-Q116', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2013, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2013.2 â€” QuÃ­mica â€” QuestÃ£o 116

A qualidade de óleos de cozinha, compostos
medida pelo índice de iodo. Quanto maior o grau
determinado e melhor a qualidade do óleo. Na figura,
estar presentes em diferentes óleos de cozinha:
PENSADOS 4
oH
Ácido palmítico
AA À
Já
oH
:
Ácido oleico
AAA A
Ácido PEA linolênico
Dentre os compostos apresentados, os dois que
nha são os ácidos:
A) palmítico e linolênico.
B) esteárico e oleico.
C) palmítico e esteárico.
D) linolênico e esteárico.
E) linolênico e linoleico.
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'medium', 'published', 116),
('ENEM-2013.2-Q117', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2013, 'EquilÃ­brio quÃ­mico', 'multiple_choice', 'ENEM 2013.2 â€” QuÃ­mica â€” QuestÃ£o 117

À medida que se expira sobre uma solução de
azul de bromotimol e hidróxido de sódio (Na-
OH), sua coloração azul característica vai se
alterando. O azul de bromotimol é um indicador
ácido-base que adquire cor azul em pH básico,
verde em pH neutro e amarela em pH ácido. O
gás carbônico (CO>) expirado reage com a água
presente na solução (HO), produzindo ácido
carbônico (HXCOs). Este pode reagir com o Na-
OH da solução inicial, produzindo bicarbonato
de sódio (NaHCO;):
CO, + HO — HCO;
H2CO;3 + NaOH — NaHCO; + HO
O que a pessoa irá observar à medida que expi-
ra no recipiente contendo essa solução?
A) A solução mudará de azul para verde e, em
seguida, de verde para azul. Isso ocorrerá em
função da neutralização de um meio inicialmen-
te básico acompanhado de um aumento de pH
na solução, à medida que ácido carbônico é
adicionado ao meio.
B) A solução mudará de cor, de azul para verde,
e, em seguida, de verde para amarelo. Com o
acréscimo de ácido carbônico, o pH da solução
irá reduzir até tornar-se neutro. Em seguida, um
excesso de ácido carbônico tornará o pH da
solução ácido.
C) A cor da solução não será alterada com o
acréscimo de ácido carbônico. Isso porque o
meio é inicialmente neutro e a presença de áci-
do carbônico não produzirá nenhuma mudança
no pH da solução.
D) A cor da solução alterará de azul para ama-
relo e, em seguida, de amarelo para verde. Es-
se comportamento é justificado pelo fato de o
ácido carbônico reduzir bruscamente o pH da
solução e depois ser neutralizado pelo restante
de NaOH presente no meio.
E) A solução somente terá sua cor alterada de
azul para amarelo, po sem formado um Ss.
cesso de ácido carbônico no recipiente, o que
reduzirá bruscamente o pH da solução.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'hard', 'published', 117),
('ENEM-2013.2-Q118', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2013, 'CinÃ©tica quÃ­mica', 'multiple_choice', 'ENEM 2013.2 â€” QuÃ­mica â€” QuestÃ£o 118

Há processos industriais que envolvem reações
químicas na obtenção de diversos produtos ou
bens consumidos pelo homem. Determinadas
etapas de obtenção desses produtos empregam
catalisadores químicos tradicionais, que têm
sido, na medida do possível, substituídos por
enzimas.
Em processos industriais, uma das vantagens
de se substituírem os catalisadores químicos
tradicionais por enzimas decorre do fato de es-
tas serem:
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'medium', 'published', 118),
('ENEM-2013.2-Q119', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2013, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2013.2 â€” QuÃ­mica â€” QuestÃ£o 119

O mármore é um material empregado para re-
vestimento de pisos e um de seus principais
constituintes é o carbonato de cálcio. Na limpe-
za desses pisos com solução ácida, ocorre efer-
vescência. Nessa efervescência o gás liberado
éo:
A) hidrogênio.
= monóxido
de carbono.
) oxigênio.
D) cloro.
E) dióxido de carbono.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'medium', 'published', 119),
('ENEM-2013.2-Q120', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2013, 'TermoquÃ­mica', 'multiple_choice', 'ENEM 2013.2 â€” QuÃ­mica â€” QuestÃ£o 120

A hematita (a-Fe2Os), além de ser utilizada para
| "
obtenção do aço, também é utilizada como um
catalisador de processos químicos, como na
síntese da amônia, importante matéria-prima da
indústria agroquímica.
(MEDEIROS, M. A. F. Química Nova na Escola, São
Paulo, v. 32, n. 3, ago. 2010 - adaptado)
O uso da hematita viabiliza economicamente a
produção da amônia, porque:
A) aumenta o tempo do processamento da rea-
ção.
B) diminui a energia de ativação da reação.
C) aumenta a variação da entalpia da reação.
D) aumenta a quantidade de produtos formados.
E) diminui a rapidez da reação.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'medium', 'published', 120),
('ENEM-2013.2-Q121', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2013, 'EletroquÃ­mica', 'multiple_choice', 'ENEM 2013.2 â€” QuÃ­mica â€” QuestÃ£o 121

||
O Instituto Luiz Coimbra (UFRJ) lançou o pri-
meiro ônibus urbano movido a hidrogênio do
Hemisfério Sul, com tecnologia inteiramente
nacional. Sua tração provém de três fontes de
energia, sendo uma delas a pilha de combustí-
vel, na qual o hidrogênio, gerado por um pro-
cesso eletroquímico, reage com o oxigênio do
ar, formando água.
A transformação de energia que ocorre na pilha
de combustível responsável pelo movimento do
ônibus decorre da energia cinética oriunda
do(a):
A) eletricidade gerada pela reação de oxirredu-
ção do hidrogênio com o oxigênio.
B) contração gasosa causada pela reação entre
o hidrogênio e o oxigênio.
42', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'medium', 'published', 121),
('ENEM-2013.2-Q122', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2013, 'TermoquÃ­mica', 'multiple_choice', 'ENEM 2013.2 â€” QuÃ­mica â€” QuestÃ£o 122

Industrialmente é possível separar os compo-
nentes do ar, utilizando-se uma coluna de fraci-
onamento. Com este processo, obtêm-se gases
como: oxigênio (O>), nitrogênio (N») e argônio
(Ar). Nesse processo o ar é comprimido e se
liquefaz; em seguida ele é expandido, volta ao
estado gasoso e seus componentes se separam
NA
A ordem de separação dos gases na coluna de
fracionamento está baseada em qual proprieda-
de da matéria?
A) Na pressão parcial dos gases, ou seja, o gás
com menor pressão parcial separa-se primeiro.
B) Na densidade dos gases, ou seja, o menos
denso separa-se primeiro.
C) Na temperatura de ebulição dos gases, ou
seja, o gás com menor temperatura de ebulição
separa-se primeiro.
D) Na capacidade térmica dos gases, ou seja, o
gás que mais absorve calor separa-se primeiro.
E) Na condutividade térmica dos gases, ou seja,
o gás que mais rápido absorve calor separa-se
primeiro.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'hard', 'published', 122),
('ENEM-2014.1-Q123', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2014, 'QuÃ­mica ambiental', 'multiple_choice', 'ENEM 2014.1 â€” QuÃ­mica â€” QuestÃ£o 123

A liberação dos gases clorofluorcarbonos
(CFCs) na atmosfera pode provocar depleção
de ozônio (Os) na estratosfera. O ocôno cetro,
tosférico ê responsável por absorver parte da
radiação ultravioleta emitida pelo Sol, a qual é
nociva aos seres VIVOS. Esse processo, na ca-
mada de ozônio, é ilustrado simplificadamente
na figura.
Logonda
e:
& >
s% oa
0/0 &
eo
hv Pá Ay
A A |
7 N J
o”
O
s% o %&
RA Li
Quimicamente, a destruição do ozônio na at
mosfera por gases CFCs é decorrência da:
A) clivagem da molécula de ozônio pelos CFCs
para produzir espécies radicalares.
B) produção de oxigênio molecular a partir de
ozônio, catalisada por átomos de cloro.
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'medium', 'published', 123),
('ENEM-2014.1-Q124', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2014, 'QuÃ­mica orgÃ¢nica', 'multiple_choice', 'ENEM 2014.1 â€” QuÃ­mica â€” QuestÃ£o 124

Para impedir a contaminação microbiana do
o . .
suprimento de água, deve-se eliminar as emis-
sões de efluentes es quando necessário, tratá-lo
com desinfetante. O ácido hipocloroso (HCIO),
produzido pela reação entre cloro e água, é um
dos compostos mais empregados como desinfe-
tante. Contudo, ele não atua somente como
oxidante, mas também como um ativo agente
de cloração. A presença de matéria orgânica
dissolvida no suprimento de água clorada pode
levar à formação de clorofórmio (CHCI3) e ou-
tras espécies orgânicas cloradas tóxicas.
Visando eliminar da água o clorofórmio e outras
moléculas orgânicas, o tratamento adequado é
a:
A) filtração, com o uso de filtros de carvão ativo.
B) fluoretação, pela adição de fluoreto de sódio.
C) coagulação, pela adição de sulfato de alumí-
nto.
D) correção do pH, pela adição de carbonato de
sódio.
E) floculação, em tanques de concreto com a
água em movimento.
Questão I25(20T41) |||
Diesel é uma mistura de hidrocarbonetos que
também apresenta enxofre em sua composição.
Esse enxofre é um componente indesejável,
pois o trióxido de enxofre gerado é um dos
grandes causadores da chuva ácida. Nos anos
1980, não havia regulamentação e era utilizado
HR ; com 13 000 ppm de enxofre. Em
óleo diesel
2009, o diesel passou a ter 1 800 ppm de enxo-
fre (S1800) e, em seguida, foi inserido no mer-
cado o diesel S500 (500 ppm). Em 2012, foi
difundido o diesel S50, com 50 ppm de enxofre
em sua composição. Atualmente, é produzido
um diesel com teores de enxofre ainda meno-
res.
A substituição do diesel usado nos anos 1980
por aquele difundido em 2012 permitiu uma
redução percentual de emissão de SO; de:
A) 86,2%.
B) 96,2%.
Cc) 97,2%.
D) 99,6%.
E) 99,9%.
43', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'hard', 'published', 124),
('ENEM-2014.1-Q125', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2014, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2014.1 â€” QuÃ­mica â€” QuestÃ£o 125. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'medium', 'published', 125),
('ENEM-2014.1-Q126', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2014, 'QuÃ­mica ambiental', 'multiple_choice', 'ENEM 2014.1 â€” QuÃ­mica â€” QuestÃ£o 126

O biodiesel não é classificado como uma substância
dos ácidos graxos presentes em sua matéria-prima.
sição do óleo vegetal ou gordura animal que lhe deu
responsável pela maior estabilidade do biodiesel frente
do biocombustível. O quadro ilustra o teor médio de
—. Teor médio
oleaginosa Mirístico Palmítico Esteárico
(C14:0) (C16:0)
Mio
ET A A E
| canola | so2 (a
[OaGão | or q 24 |
| Amendoim | =<o6 | na |
Qual das fontes oleaginosas apresentadas produziria
A) Milho.
B) Palma.
C) Canola.
D) Algodão.
E) Amendoim.
Questão 127 (2014-1)
Parte do gás carbônico da atmosfera é absorvida pela
ocorrem naturalmente, em equilíbrio, no sistema
atmosfera pode afetar os recifes de corais.
(1
Dióxido F de carbono
atmosférico
A
9 [DA
Dióxido de carbono — [| Acido
dissolvido lu) ||) | carbônico
+ CA EE
2 2 PT ke
É
:
fo) 6 '' CG)
5
&
sa
(a) fa) 2 &)
e
o
e,
O resultado desse processo nos corais é o(a):
A) seu branqueamento, levando à sua morte e extinção.
B) excesso de fixação de cálcio, provocando calcificação
C) menor incorporação de carbono, afetando seu
D) estímulo da atividade enzimática, evitando a
E) dano à estrutura dos esqueletos calcários, diminuindo
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'hard', 'published', 126),
('ENEM-2014.1-Q127', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2014, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2014.1 â€” QuÃ­mica â€” QuestÃ£o 127. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'medium', 'published', 127),
('ENEM-2014.1-Q128', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2014, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2014.1 â€” QuÃ­mica â€” QuestÃ£o 128

A revelação das chapas de raios X gera uma
solução que contém íons prata na forma de
Ag(S;O3),”. Para evitar a descarga desse metal
no ambiente, a recuperação de prata metálica
pode ser feita tratando eletroquimicamente essa
solução com uma espécie adequada. O quadro
apresenta semirreações de redução de alguns
íons metálicos.
[enesao oe
ZM (aq) +26 — 2Z2n(s) :
Das espécies a; a adequada para
apresentadas,
essa recuperação é:
A) Cu (s).
B) Pt (s).
C) Al (aq).
D) Sn (s).
E) Zn (aq).', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'medium', 'published', 128),
('ENEM-2014.1-Q129', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2014, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2014.1 â€” QuÃ­mica â€” QuestÃ£o 129

A aplicação excessiva de fertilizantes nitrogena-
dos na agricultura pode acarretar alterações no
solo e na água pelo acúmulo de compostos
nitrogenados, principalmente a forma mais oxi-
dada, favorecendo a proliferação de algas e
plantas aquáticas e alterando o ciclo do nitrogê-
nio, representado no esquema. A espécie nitro-
genada mais oxidada tem sua quantidade con-
trolada por ação de microrganismos que promo-
vem a reação de redução dessa espécie, no
processo denominado desnitrificação.
| ?
v
NH,
"
WV
mm
O processo citado está representado na etapa:
AL.
B).
ec).
D) IV.
E)V.
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'medium', 'published', 129),
('ENEM-2014.1-Q130', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2014, 'EquilÃ­brio quÃ­mico', 'multiple_choice', 'ENEM 2014.1 â€” QuÃ­mica â€” QuestÃ£o 130

O estudo de compostos orgânicos permite aos
analistas definir propriedades físicas e químicas
responsáveis pelas características de cada
substância descoberta. Um laboratório investiga
moléculas quirais cuja cadeia carbônica seja
insaturada, heterogênea e ramificada.
A fórmula que se enquadra nas características
da molécula investigada é:
A) CH; —(CH), —CH(OH)— CO—NH—CH;.
B) CH; (CH), —CH(CHy)-—CO-—NH—CH,,
O) er CD AHrd ço a,
D) CH; —CH2. —CH(CH3)-CO—NH— CH.
E) Colo —CHa CO NH—CHo,
Visando minimizar impactos ambientais, a legis-
lação Abrasileira determina que resíduos quími-
cos lançados diretamente no corpo receptor
tenham pH entre 5,0 e 9,0. Um resíduo líquido
aquoso gerado em um processo . industrial ; tem
concentração de íons hidroxila igual a 1,0x107º
mol/L. Para atender a legislação, um químico
separou as seguintes substâncias, disponibili-
zadas no almoxarifado da empresa: CH;COOH,
Na>SO,, CH;OH, K.CO; e NH,CI.
Para que o resíduo possa ser lançado direta-
mente no corpo receptor, qual substância pode-
ria ser empregada no ajuste do pH?
A) CH;COOH
B) Na;SO,
C) CH;OoH
D) K5CO;
E) NH,CI
Questão I32(20T4T) ||
A capacidade de limpeza e a eficiência de um
sabão dependem de sua propriedade de formar
micelas estáveis, que arrastam com facilidade
as moléculas impregnadas no material a ser
limpo. Tais micelas têm em sua estrutura partes
capazes de interagir com substâncias polares,
como a água, e partes que podem interagir com
substâncias apolares, como as gorduras e os
óleos.
(SANTOS, W.L P.; MÓL, G.Ss. (Coords.). Quimica
e sociedade. São Paulo: Nova Geração, 2005)
A substância capaz de formar as estruturas
mencionadas é:
A) CieHoe.
B) CirH33COONa.
C) CH;CH;COONa.
D) CH;CH.CH,COOH.
E) CH;CH.CH;CHOCH.CH.CH2CHsz.
45', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'hard', 'published', 130),
('ENEM-2014.1-Q131', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2014, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2014.1 â€” QuÃ­mica â€” QuestÃ£o 131. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'medium', 'published', 131),
('ENEM-2014.1-Q132', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2014, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2014.1 â€” QuÃ­mica â€” QuestÃ£o 132. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'medium', 'published', 132),
('ENEM-2014.1-Q133', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2014, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2014.1 â€” QuÃ­mica â€” QuestÃ£o 133

A forma das moléculas, como representadas no
maco, a molécula contendo um grupo não planar é
substituintes planares são inativas.
O grupo responsável pela bioatividade desse fármaco
OB |
Í Ú
D) E)', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'easy', 'published', 133),
('ENEM-2014.1-Q134', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2014, 'QuÃ­mica orgÃ¢nica', 'multiple_choice', 'ENEM 2014.1 â€” QuÃ­mica â€” QuestÃ£o 134

O principal processo industrial utilizado na produção
no). A equação mostra que esse processo envolve
guida é decomposto em fenol e acetona, ambos
culas mais complexas. Após o processo de síntese,
mercialização individual.
Catalisador
+ O, <——
Cumeno Hidroperóxido
de cumila
Considerando as características físico-químicas dos
separação da mistura, em escala industrial, é a:
A) filtração.
B) ventilação.
C) decantação.
D) evaporação.
E) destilação fracionada.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'medium', 'published', 134),
('ENEM-2014.1-Q135', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2014, 'QuÃ­mica ambiental', 'multiple_choice', 'ENEM 2014.1 â€” QuÃ­mica â€” QuestÃ£o 135

A utilização de processos de biorremediação de
resíduos gerados pela combustão incompleta de
compostos orgânicos tem se tomado crescente,
visando minimizar a poluição ambiental. Para a
ocorrência de resíduos de naftaleno, algumas
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'easy', 'published', 135),
('ENEM-2014.1-Q136', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2014, 'SoluÃ§Ãµes e concentraÃ§Ã£o', 'multiple_choice', 'ENEM 2014.1 â€” QuÃ­mica â€” QuestÃ£o 136

Grande quantidade dos maus odores do nosso
dia a dia está relacionada a compostos alcali-
nos. Assim, em vários desses casos, pode-se
utilizar o vinagre, que contém entre 3,5% e 5%
de ácido acético, para diminuir ou eliminar o
mau cheiro. Por exemplo, lavar as mãos com
vinagre e depois enxaguá-las com água elimina
o odor de peixe, já que a molécula de piridina
(CSH5N) é uma das substâncias responsáveis
pelo odor característico de peixe podre.
SEVA V. ope ina, vs C.; SOARES. “ H.F.
à NIgo aqui não cheira bem... À quimica do mau
cheiro. Quimica Nova na Escola. v. 33. n. 1. fev. 11)
A eficiência do uso do vinagre nesse caso se
explica pica P'' pela:
A) sobreposição de odor, propiciada pelo cheiro
característico do vinagre.
B) solubilidade da piridina, de caráter ácido, na
solução ácida empregada.
o) inibição da proliferação das bactérias presen
tes, devido à ação do ácido acético.
D) degradação enzimática da molécula de piri- "
dina, acelerada pela presença de ácido acético.
E) reação de neutralização entre o ácido acético
e a piridina, que resulta em compostos sem mau
odor.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'hard', 'published', 136),
('ENEM-2014.1-Q137', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2014, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2014.1 â€” QuÃ­mica â€” QuestÃ£o 137

Grandes fontes de emissão do gás o dióxido de
enxofre são as indústrias de extração de cobre
e níquel, em decorrência da oxidação dos miné-
rios sulfurados.
Para evitar a liberação desses óxidos na atmos-
fera e a consequente formação da chuva ácida,
o gás pode ser lavado, em um processo conhe-
cido como dessulfurização, conforme mostrado
na equação (1).
CaCO; (s) + SO, (g) — CaSO; (s) + CO, (g) (1)
novocadernoenem(DQgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'medium', 'published', 137),
('ENEM-2014.2-Q138', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2014, 'QuÃ­mica orgÃ¢nica', 'multiple_choice', 'ENEM 2014.2 â€” QuÃ­mica â€” QuestÃ£o 138

Partículas beta, ao atravessarem a matéria viva,
colidem com uma pequena porcentagem de
moléculas e deixam atrás de si um rastro aleato-
omicanente. Sivos CS tssãs cepécies podem
W
romper ainda outras ligações moleculares, cau-
sando danos celulares."
A capacidade : de os efeitos , descritos > dá- s
gerar
se porque tal partícula é um:
A) elétron e, por possuir massa relativa despre-
zível, tem elevada energia cinética
translacional
B) nêutron e. por não possuir carga elétrica, tem
alta capacidade de produzir reações nucleares.
C) núcleo do átomo de hélio (He) e, por possuir
massa elevada, tem grande poder de penetra-
ção.
D) fóton e, por não possuir massa, tem grande
facilidade de induzir a formação de radicais
livres.
E) núcleo do átomo de hidrogênio (H) e, por
possuir carga positiva, tem alta reatividade qui-
mica.
Questão 139 (2074
uestão ão o Ú
Os bafômetros (etilômetros) indicam a quanti-
dade de álcool, C)HsO (etanol), presente no
organismo de uma pessoa através do ar expira-
do por ela.
47', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'hard', 'published', 138),
('ENEM-2014.2-Q139', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2014, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2014.2 â€” QuÃ­mica â€” QuestÃ£o 139. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'medium', 'published', 139),
('ENEM-2014.2-Q140', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2014, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2014.2 â€” QuÃ­mica â€” QuestÃ£o 140

A água potável precisa ser límpida, ou seja, não
deve conter partículas em suspensão, tais como
terra ou restos de plantas, comuns nas águas
de rios e lagoas. A remoção das partículas é
feita em estações de tratamento, onde Ca(OH),
em excesso e AIl(SO,);3 são adicionados em um
tanque para formar sulfato de cálcio e hidróxido
de alumínio. Esse último se forma como flocos
gelatinosos insolúveis em água, que são capa-
zes de agregar partículas em suspensão.
Em uma estação de tratamento, cada 10 gra-
mas de hidróxido de alumínio é capaz de carre-
gar 2 gramas de partículas. Após decantação e
filtração, a água límpida é tratada com cloro e
distribuída para as residências. As massas
molares dos elementos H, O, Al, S e Ca são,
respectivamente, 1g/mol, 16g/mol, 27g/mol,
32g/ mol e 40g/mol.
Considerando que 1000 litros da água de um rio
possuem 45 gramas de partículas em suspen-
são, a quantidade mínima de AIl(SO,); que
deve ser utilizada na estação de tratamento
de água, capaz de tratar 3000 litros de água
de uma só vez, para garantir que todas as
partículas em suspensão sejam precipitadas, é
mais próxima de:
A) 599.
B) 4939.
Cc) 9879.
D) 14809.
E) 29609.
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'hard', 'published', 140),
('ENEM-2014.2-Q141', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2014, 'Estequiometria', 'multiple_choice', 'ENEM 2014.2 â€” QuÃ­mica â€” QuestÃ£o 141

Em um caso de anemia, a quantidade de sulfato
de ferro (ll) (FeESO,, massa molar igual a
152g/mol) recomendada como suplemento de
ferro foi de 300mg dia. Acima desse valor, a
mucosa intestinal atua como barreira, impedindo
a absorção de ferro. Foram analisados cinco
frascos de suplemento, contendo solução aquo-
sa de FeSO,, cujos resultados encontram-se no
quadro.
Concentração de sulfato
de ferro(Il) (mol/L)
Rr oa
2
[5 |
Se for ingerida uma colher (10mL) por dia do
medicamento para anemia, a amostra que con-
terá a concentração de sulfato de ferro (Il) mais
próxima da recomendada é a do frasco de nú-
mero:
A) 1.
B)2.
c)3.
D) 4.
E) 5.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'medium', 'published', 141),
('ENEM-2014.2-Q142', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2014, 'QuÃ­mica orgÃ¢nica', 'multiple_choice', 'ENEM 2014.2 â€” QuÃ­mica â€” QuestÃ£o 142

O álcool comercial (solução de etanol) é , vendi- .
"
do na concentração de 96 %. bl volume. Entre-
tanto, para que possa ser utilizado como desin-
fetante, deve-se usar uma solução alcoólica na
concentração. de 70%, em volume. Suponha
que um hospital recebeu ebioa! doação um lote
de 1000 litros de álcool comercial a 296%, em
volume, e pretende trocá-lo por um lote de álco-
ie edil UA
Para que a quantidade total de etanol seja a
mesma nos dois lotes, o volume de álcool a
7O%fornecido na troca deve ser mais próximo
de:
A) 1042L.
B) 1371L.
C) 1428L.
D) 1632L.
E) 1700L', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'medium', 'published', 142),
('ENEM-2014.2-Q143', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2014, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2014.2 â€” QuÃ­mica â€” QuestÃ£o 143

Água dura é aquela que contém concentrações
relativamente altas de íons Ca” e Mg” dissolvi-
dos. Apesar de esses íons não representarem
risco para a saúde, eles podem tornar a água
48', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'easy', 'published', 143),
('ENEM-2014.2-Q144', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2014, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2014.2 â€” QuÃ­mica â€” QuestÃ£o 144. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'medium', 'published', 144),
('ENEM-2014.2-Q145', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2014, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2014.2 â€” QuÃ­mica â€” QuestÃ£o 145

No Brasil e no mundo têm surgido movimentos
e leis para banir o uso de sacolas plásticas, em
supermercados, feitas de polietileno.
Obtida a partir do petróleo, a matéria-prima do
polietileno é o gás etileno, que depois de poli-
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'easy', 'published', 145),
('ENEM-2014.2-Q146', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2014, 'Estequiometria', 'multiple_choice', 'ENEM 2014.2 â€” QuÃ­mica â€” QuestÃ£o 146

O cobre, muito utilizado em fios da rede elétrica
e com considerável valor de mercado, pode ser
encontrado na natureza na forma de calcocita,
Cu>S(s), de massa molar 159g/mol.
Por meio da reação CuzS(s) + Ox(g) — 2Cu(s)
SO>(g), é possível obtê-lo na forma metálica.
A quantidade de matéria de cobre metálico pro-
duzida a partir de uma tonelada de calcocita
com 7,95% (m/m) de pureza é:
3
A) 10x 10) mol
B) 5,0 x 10 mol
o) 10x 10" mol
D) 50x 10, mol
E) 4,0 x 10" mol', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'medium', 'published', 146),
('ENEM-2014.2-Q147', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2014, 'Estequiometria', 'multiple_choice', 'ENEM 2014.2 â€” QuÃ­mica â€” QuestÃ£o 147

O bisfenol-A é um composto que serve de maté-
ria-prima para a fabricação de polímeros utiliza-
dos em embalagens plásticas de alimentos, em
mamadeiras e no revestimento interno de latas.
Esse composto está sendo banido em diversos
países, incluindo o Brasil, principalmente por ser
um mimetizador de estrógenos (hormônios) que,
atuando como tal no organismo, pode causar
infertilidade na vida adulta.
O bisfenol-A (massa molar igual a 228g/mol) é
preparado pela condensação da propanona
(massa molar igual a 58g/mol) com fenol (mas-
sa molar igual a 94g/mol), em meio ácido, con-
forme apresentado na equação química.
49', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'medium', 'published', 147),
('ENEM-2014.2-Q148', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2014, 'EquilÃ­brio quÃ­mico', 'multiple_choice', 'ENEM 2014.2 â€” QuÃ­mica â€” QuestÃ£o 148

A tabela lista os valores de pH de algumas bebidas
Refrigerante
Café
Vinho
Suco de limão
cá
O esmalte dos dentes é constituído de hidroxiapatita
zação em meio ácido, de acordo com a equação
Ca,(PO,),OH (s) — 5 Ca?*
Das bebidas listadas na tabela, aquela com menor
A) chá.
B) café.
C) vinho.
D) refrigerante.
E) suco de limão.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'medium', 'published', 148),
('ENEM-2014.2-Q149', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2014, 'BioquÃ­mica', 'multiple_choice', 'ENEM 2014.2 â€” QuÃ­mica â€” QuestÃ£o 149

A formação de estalactites depende da reversibilidade
(CaCO;) é encontrado em depósitos subterrâneos
água rica em CO, dissolvido infiltra-se no calcário,
Numa segunda etapa, a solução aquosa desses íons
promovendo a liberação de CO, e a deposição de
Ca? 2 (aq) + 2 HCO; - (aq) — CaCO,(s) +
=
Considerando o equilíbrio que ocorre na segunda
lo(a):
A) diminuição da concentração de Íons OH” no meio.
B) aumento da pressão do ar no interior da caverna.
C) diminuição da concentração de HCO; no meio.
D) aumento da temperatura no interior da caverna.
E) aumento da concentração de CO, dissolvido.
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'medium', 'published', 149),
('ENEM-2014.2-Q150', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2014, 'Propriedades da matÃ©ria', 'multiple_choice', 'ENEM 2014.2 â€” QuÃ­mica â€” QuestÃ£o 150

Em um experimento, foram separados três reci-
pientes A, B e C, contendo 200mL de líquidos
distintos: o recipiente A continha água, com
densidade de 1,00g/mL; o recipiente B, álcool
etílico, com densidade de 0,79g/mL; e o recipi-
ente C, clorofórmio, com densidade de
1,48g9/mL.
Em cada um desses recipientes foi adicionada
uma pedra de gelo, com densidade próxima a
0,90g/mL.
No experimento apresentado, observou-se que
a pedra de gelo:
A) flutuou em A, flutuou em B e flutuou em C.
B) flutuou em A, afundou em B e flutuou em C.
C) afundou em A, afundou em B e flutuou em C.
D) afundou em A, flutuou em B e afundou em C.
E) flutuou em A, afundou em B e afundou em C.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'hard', 'published', 150),
('ENEM-2014.2-Q151', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2014, 'QuÃ­mica ambiental', 'multiple_choice', 'ENEM 2014.2 â€” QuÃ­mica â€” QuestÃ£o 151

A escolha de uma determinada substância para
ser utilizada como combustível passa pela aná-
lise da poluição que ela causa ao ambiente e
pela quantidade de energia liberada em sua
combustão completa.
O quadro apresenta a entalpia de combustão de
algumas substâncias. As massas molares dos
elementos H, C e O são, respectivamente,
iguais a 1g/mol,12g/mol e 16g/mol.
Entalpia de
combustão
(kJ/mol)
Levando-se em conta somente o aspecto ener-
gético, a substância mais eficiente para a ob-
tenção de energia, na combustão de 1kg de
combustível, é o:
A) etano.
B) etanol.
C) metanol.
D) acetileno.
E) hidrogênio.
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'medium', 'published', 151),
('ENEM-2014.2-Q152', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2014, 'QuÃ­mica orgÃ¢nica', 'multiple_choice', 'ENEM 2014.2 â€” QuÃ­mica â€” QuestÃ£o 152

Fertilizantes químicos mistos, denominados
NPK, são utilizados para aumentar a produtivi-
dade agrícola, por fornecerem os nutrientes
nitrogênio, fósforo e potássio, necessários para
o desenvolvimento das plantas. A quantidade
de cada nutriente varia de acordo com a finali-
dade do adubo. Um determinado adubo NPK
possui, em sua composição, as seguintes subs-
tâncias: nitrato de amônio (NHANO;3), ureia
(CO(NH;>2)2), nitrato de potássio (KNO;), fosfato
de sódio (Na;PO;,) e cloreto de potássio (KCl).
A adição do adubo descrito provocou diminuição
no pH de um solo. Considerando o caráter áci-
do/básico das substâncias constituintes desse
adubo, a diminuição do pH do solo deve ser
atribuída à presença, no adubo, de uma quanti-
dade significativa de:
A) ureia.
B) fosfato de sódio.
C) nitrato de amônio.
- ia & tro
''
DES TARg E
Questão 153 (2014-3)
Alguns materiais poliméricos não podem ser
sr "
utilizados para a produção de certos tipos de
artefatos, seja por limitações das propriedades
Mecanicas, sem pela facilidade com que sofrem
degradação, gerando subprodutos indesejáveis
para aquela aplicação. Torna-se importante,
então, a fiscalização, para determinar a nature-
za do polímero utilizado na fabricação do artefa-
to. Um dos métodos possíveis baseia-se na
decomposição do polímero para a geração dos
monômeros que lhe deram origem.
A decomposição controlada de um artefato ge-
rou a diamina HAN(CH>);NH>, e o diácido
HO2C(CH2)ACO2H. Logo, o artefato era feito de:
B) poliamida.
D) poliacrilato.
Questão 1I54(20143)
A elevada acidez dos solos é um dos fatores
responsáveis por reduzir sua capacidade de
troca de cátions, intensificando a perda de sais
minerais por arraste. Como consequência, os
solos ficam deficientes em nutrientes e com
baixo potencial produtivo. Uma estratégia usada
no controle dessa acidez a aplicar óxidos capa-
zes de formar bases pouco solúveis em meio
aquoso.
51', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'hard', 'published', 152),
('ENEM-2014.2-Q153', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2014, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2014.2 â€” QuÃ­mica â€” QuestÃ£o 153. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'medium', 'published', 153),
('ENEM-2014.3-Q154', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2014, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2014.3 â€” QuÃ­mica â€” QuestÃ£o 154. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'medium', 'published', 154),
('ENEM-2014.3-Q155', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2014, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2014.3 â€” QuÃ­mica â€” QuestÃ£o 155

O entendimento de como as ligações químicas
se formam a um dos assuntos fundamentais da
ciência. A partir desses fundamentos, pode-se
entender como são desenvolvidos novos maté-
rias.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'easy', 'published', 155),
('ENEM-2014.3-Q156', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2014, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2014.3 â€” QuÃ­mica â€” QuestÃ£o 156

Temperatura de Temperatura
fusão (ºC) ebulição
A E ETTA
As propriedades físicas e químicas de uma certa
unidades que a constituem, isto é, as ligações químicas
res que a compõem. No quadro, estão relacionadas
Qual substância apresenta propriedades que caracterizam
A
B)II
fes
D)V
E)V', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'medium', 'published', 156),
('ENEM-2014.3-Q157', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2014, 'QuÃ­mica ambiental', 'multiple_choice', 'ENEM 2014.3 â€” QuÃ­mica â€” QuestÃ£o 157

Nos tempos atuais, grandes esforços são reali-
zados para minimizar a dependência dos com-
bustíveis derivados de fontes fosseis, buscando
alternativas como compostos provenientes de
fontes renováveis, biodegradáveis e que cau-
sem menos impacto na atmosfera terrestre.
Um combustível renovável (X) de grande impor-
tância econômica a obtido a partir da equação
genérica:
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'medium', 'published', 157),
('ENEM-2014.3-Q158', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2014, 'QuÃ­mica orgÃ¢nica', 'multiple_choice', 'ENEM 2014.3 â€” QuÃ­mica â€” QuestÃ£o 158

A baunilha a uma espécie de orquídea. A partir
de sua flor, a produzida a vanilina (conforme
representação química), que dá origem ao aro-
ma de baunilha.
OH
OCH,
COH
Na vanilina ” estão " presentes as funções a orgâni- An:
o
A) aldeído, éter e fenol.
B) álcool, aldeído e éter.
C) álcool, cetona e fenol.
D) aldeído, cetona e fenol.
E) acido carboxílico, aldeído e éter.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'medium', 'published', 158),
('ENEM-2014.3-Q159', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2014, 'QuÃ­mica ambiental', 'multiple_choice', 'ENEM 2014.3 â€” QuÃ­mica â€” QuestÃ£o 159

O cianeto de sódio, NaCN, e um poderoso
agente complexante, usado em laboratórios
químicos e em indústria de extração de ouro.
Quando uma indústria lança NaCN sólido nas
águas de um rio, ocorre o seguinte equilíbrio
químico:
CN” ” (aq) + H,O (1) = HCN (aq) + OH” e (aq)
anão des
ilíbri o químico imi é é decorrente de uma
A) síntese.
B) hidrolise.
C) oxirredução.
D) precipitação.
E) decomposição.
Questão 160 (20143)
Uma forma de poluição natural da água aconte-
ce em regiões ricas em dolomita (Ca
COsMgCO;).
Na presença de dióxido de carbono (dissolvido
na água) a dolomita a convertida em Ca(HCO;),
e MgCO;, elevando a concentração de íons
Ca?” e Mg? na água.
Uma forma de purificação dessa água, denomi-
nada água dura, é adicionar Ca(OH), e Na,CO;
a ela. Dessa forma, ocorre uma serie de rea-
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'hard', 'published', 159),
('ENEM-2014.3-Q160', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2014, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2014.3 â€” QuÃ­mica â€” QuestÃ£o 160. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'medium', 'published', 160),
('ENEM-2014.3-Q161', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2014, 'EquilÃ­brio quÃ­mico', 'multiple_choice', 'ENEM 2014.3 â€” QuÃ­mica â€” QuestÃ£o 161

As antocianinas (componente natural de frutas
roxas, como uva e açaí) são moléculas interes-
santes para a produção de embalagens inteli-
gentes, pois tem capacidade de mudar de cor,
conforme muda o pH.
Em soluções com pH abaixo de 3,0, essas mo-
léculas apresentam uma coloração do laranja ao
vermelho mais intenso. Com o aumento do pH
para a faixa de 4,0 a 5,0, a coloração vermelha
tende a desaparecer. E aumentos adicionais de
pH levam as antocianinas a apresentarem uma
coloração entre o verde e o azul.
(Disponível em: www.biotecnologia.com.br.
Acesso em: 25 nov. 2011 - adaptado)
Estas embalagens são " capazes de '' identificar ”
quando o alimento esta em decomposição, pois
se tornam:
A) vermelho claro, pela formação de uma solu-
ção neutra.
B) verde e azul, devido a presença de substan-
cias básicas.
C) laranja e vermelho, pela liberação de hidroxi-
las no alimento.
D) laranja e vermelho intenso, pela produção de
ácidos orgânicos.
E) verde e azul, devido ao aumento de íons de
hidrogênio no alimento.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'hard', 'published', 161),
('ENEM-2014.3-Q162', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2014, 'QuÃ­mica orgÃ¢nica', 'multiple_choice', 'ENEM 2014.3 â€” QuÃ­mica â€” QuestÃ£o 162

Você já ouviu essa frase: rolou uma química
entre nós!
(o) amoré frequentemente associado a um fenô-
, : RN
meno mágico ou espiritual, porém existe a atua-
ção de alguns compostos em nosso corpo, que
provocam sensações quando estamos perto da
pessoa amada, como coração acelerado e au-
mento da frequência respiratória.
Essas sensações são transmitidas por neuro-
transmissores, tais como adrenalina, noradrena-
lina, feniletilamina, dopamina e as serotoninas.
53', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'medium', 'published', 162),
('ENEM-2014.3-Q164', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2014, 'QuÃ­mica orgÃ¢nica', 'multiple_choice', 'ENEM 2014.3 â€” QuÃ­mica â€” QuestÃ£o 164

O Brasil e o segundo maior produtor de etanol
combustível do mundo, tendo fabricado 26,2
bilhões de litros em 2010. Em uma etapa de seu
processo de produção, o etanol foma uma mis-
tura líquido homogênea com a água e outras
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'easy', 'published', 164),
('ENEM-2015.1-Q165', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2015, 'QuÃ­mica orgÃ¢nica', 'multiple_choice', 'ENEM 2015.1 â€” QuÃ­mica â€” QuestÃ£o 165

“Questão 165 (2015.1)
Um grupo de pesquisadores desenvolveu um
método simples, barato e eficaz de remoção de
petróleo contaminante na água, que utiliza um
plástico produzido a partir do líquido da casta-
nha-de-caju (LCC).
A composição química do LCC é muito parecida
com a do petróleo e suas moléculas, por suas
características, interagem formando agregados
com o petróleo. Para retirar os agregados da
água, os pesquisadores misturam ao LCC na-
nopartículas magnéticas.
(KIFFER, D. Novo método par remoção de petróleo
usa óleo de mamona e castanha-de-caju. Disponível
em: www.faperi.br. Acesso em: 31 jul. 2012)
Essa técnica considera '' dois . processos de sepa-
.
ração de misturas, sendo eles, respectivamente,
A) flotação " e decantação "
B) decomposição e centrifugação.
C) floculação e separação magnética.
D) destilação fracionada e peneiração.
E) dissolução fracionada e magnetização.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'hard', 'published', 165),
('ENEM-2015.1-Q166', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2015, 'TermoquÃ­mica', 'multiple_choice', 'ENEM 2015.1 â€” QuÃ­mica â€” QuestÃ£o 166

A soda cáustica pode ser usada no desentupi-
mento de encanamentos domésticos e tem, em
sua composição, o hidróxido de sódio como
principal componente, além de algumas impure-
oo
A soda normalmente é comercializada na forma
sólida, mas que apresenta aspecto "derretido"
quando exposta ao ar por certo período.
O fenômeno de “derretimento" decorre da:
A) absorção da umidade presente no ar atmos-
férico.
B) fusão do hidróxido pela troca de calor com o
ambiente.
C) reação das impurezas do produto com o
oxigênio do ar.
D) adsorção de gases atmosféricos na superfí-
cie do sólido.
E) reação do hidróxido de sódio com o gás ni-
trogênio presente no ar.
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'medium', 'published', 166),
('ENEM-2015.1-Q167', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2015, 'QuÃ­mica orgÃ¢nica', 'multiple_choice', 'ENEM 2015.1 â€” QuÃ­mica â€” QuestÃ£o 167

A hidroponia pode ser definida como uma técni-
ca de produção de vegetais sem necessaria-
mente a presença de solo. Uma das formas de
implementação é manter as plantas com suas
raízes suspensas em meio líquido, de onde
retiram os nutrientes essenciais. Suponha que
um produtor de rúcula hidropônica precise ajus-
tar a concentração do íon nitrato (NO3) para
0,009 mol/L em um tanque de 5000 litros e, para
tanto, tem em mãos uma solução comercial
nutritiva de nitrato de cálcio 90 g/L. As massas
molares dos elementos N, O e Ca são iguais a
14 glmol, 16 g/mol e 40 g/mol, respectivamente.
Qual o valor mais próximo do volume da solu-
ção nutritiva, em litros, que o produtor deve
adicionar ao tanque?
A) 26
B) 41
Cc) 45
D) 51
E) 82
Questão I68B(2015.1) ||
Alimentos em conserva são frequentemente
armazenados em latas metálicas seladas, fabri-
cadas com um material chamado folha de flan-
dres que consiste de uma chapa de aço revesti-
da com uma fina camada de estanho, metal
brilhante e de difícil oxidação.
É comum que a superfície interna seja ainda
revestida por uma camada de vemiz à base de
epóxi, embora também existam latas sem esse
revestimento, apresentando uma camada de
estanho mais espessa.
(SANTANA, V. M. S. A leitura e a química das subs-
tâncias. Cadernos PDE. Ivaiporã: Secretaria de Esta-
do da Educação do Paraná (SEED); Universidade
Estadual de Londrina, 2010 - adaptado)
Comprar uma lata de conserva amassada no
supermercado é desaconselhável porque o
amassado pode:
A) alterar a pressão no interior da lata, promo-
vendo a degradação acelerada do alimento.
B) romper a camada de estanho, permitindo a
corrosão do ferro e alterações do alimento.
C) prejudicar o apelo visual da embalagem,
apesar de não afetar as propriedades do ali-
mento.
D) romper a camada de verniz, fazendo com
que o metal tóxico estanho contamine o alimen-
to.
E) desprender camadas de verniz, que se dis-
solverão no meio aquoso, contaminando o ali-
mento.
55', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'hard', 'published', 167),
('ENEM-2015.1-Q168', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2015, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2015.1 â€” QuÃ­mica â€” QuestÃ£o 168. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'medium', 'published', 168),
('ENEM-2015.1-Q169', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2015, 'QuÃ­mica orgÃ¢nica', 'multiple_choice', 'ENEM 2015.1 â€” QuÃ­mica â€” QuestÃ£o 169

Uma forma de organização de um sistema bio-
lógico é a presença de sinais diversos utilizados
pelos indivíduos para se comunicarem. No caso
das abelhas da espécie Apis mellifera, os sinais
utilizados podem ser feromônios. Para saírem e
voltarem de suas colmeias, usam um feromônio
que indica a trilha percorrida por elas (Compos-
to A). Quando pressentem o perigo, expelem
um feromônio de alarme (Composto B), que
serve de sinal para um combate coletivo. O que
diferencia cada um desses sinais utilizados pe-
las abelhas são as estruturas e funções orgâni-
cas dos feromônios.
CH,OH
e
Composto À
—- CH,
CH,COO(CH,)CH
cy
3
Composto B
As funções orgânicas que caracterizam os fe-
romônios de trilha e de alavmme são, respectiva-
mente,
A) álcool e éster.
B) aldeído e cetona.
C) éter e hidrocarboneto.
D) enol e ácido carboxílico.
E) ácido carboxílico e amida.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'hard', 'published', 169),
('ENEM-2015.1-Q170', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2015, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2015.1 â€” QuÃ­mica â€” QuestÃ£o 170

O permanganato de potássio (KMnO,) é um
agente oxidante forte muito empregado tanto
em nível laboratorial quanto industrial. Na oxi-
dação de alcenos de cadeia normal, como o 1-
fenil-1-propeno, ilustrado na figura, o KMnO, é
utilizado para a produção de ácidos carboxíli-
..
DN
1-fenil-1-propeno
.
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'medium', 'published', 170),
('ENEM-2015.1-Q171', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2015, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2015.1 â€” QuÃ­mica â€” QuestÃ£o 171. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'medium', 'published', 171),
('ENEM-2015.1-Q172', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2015, 'Radioatividade', 'multiple_choice', 'ENEM 2015.1 â€” QuÃ­mica â€” QuestÃ£o 172

A bomba reduz neutros e neutrinos, e abana-se
com o leque da reação em cadeia.
(ANDRADE, C. D. Poesia completa e prosa. Rio de
Janeiro: Aguilar, 1973 - fragmento)
Nesse fragmento de poema, o autor refere-se à
bomba atômica de urânio. Essa reação é dita
"em cadeia" porque na:
A) fissão o do PU ocorre , " de grande
liberação
quantidade de calor, que dá continuidade à rea-
ção.
B) fissão " de **U ocorre liberação s " de energia, .
que vai desintegrando o isótopo ““U, enrique-
cendo-o em mais É“U.
C) fissão do ?*5YU ocorre uma liberação de nêu-
trons, que bombardearão outros núcleos.
D) fusão do YU com PU ocorre formação de
neutrino, que bombardeará outros núcleos radi-
oativos.
E) fusão do ?*U com **U ocorre formação de
outros elementos radioativos mais pesados, que
desencadeiam novos processos de fusão.
56', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'hard', 'published', 172),
('ENEM-2015.1-Q173', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2015, 'EquilÃ­brio quÃ­mico', 'multiple_choice', 'ENEM 2015.1 â€” QuÃ­mica â€” QuestÃ£o 173

Vários ácidos são utilizados em indústrias que
lagos, podendo afetar o equilíbrio ambiental. Para
ser adicionado ao efluente, em quantidades apropriadas,
As equações envolvidas no processo são apresentadas:
(1) CaCO, (s) + CO, (g) + H,O ()
(1) HCO, (aq) = H* (aq) +
(III) CaCO, (s) — Ca? (aq)
(1) CO, (dg) + HO () == Hr" (aq)
Com base nos valores das constantes de equilíbrio
co da constante de equilíbrio da reação |?
A) 4,5x10?6
B) 5,0x10º
C) 0,8x10º
D) 0,2x10º
E) 2,2x10%', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'medium', 'published', 173),
('ENEM-2015.1-Q174', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2015, 'QuÃ­mica orgÃ¢nica', 'multiple_choice', 'ENEM 2015.1 â€” QuÃ­mica â€” QuestÃ£o 174

Hidrocarbonetos podem ser obtidos em laboratório
nhecido como eletrossíntese de Kolbe. Essa reação
partir de óleos vegetais, os quais podem ser empregados
tuição aos hidrocarbonetos fósseis. O esquema ilustra
OH eletrólise
É mr
2
ST
o metano!
Com base nesse processo, o hidrocarboneto produzido
A) 2,2,7,7-tetrametil-octano.
B) 3,3,4 4-tetrametil-nexano.
C) 2,2,5,5-tetrametil-hexano.
D) 3,3,6,6-tetrametil-octano.
E) 2,2,4 4-tetrametil-hexano.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'medium', 'published', 174),
('ENEM-2015.1-Q175', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2015, 'Estequiometria', 'multiple_choice', 'ENEM 2015.1 â€” QuÃ­mica â€” QuestÃ£o 175

Para proteger estruturas de aço da corrosão, a
indústria utiliza uma técnica chamada galvani-
zação. Um metal bastante utilizado nesse pro-
é So de que pode Ss biido parir de
cesso a
um enominado esfalerita (ZnS), de
minéro
pureza 75%.
Considere que a conversão do minério em zinco
metálico tem rendimento de 80% nesta sequên-
cia de equações químicas:
2ZNS + 3 O, 2ZnO + 2 SO,
ZnO + CO — Zn + CO,
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'medium', 'published', 175),
('ENEM-2015.1-Q176', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2015, 'LigaÃ§Ãµes quÃ­micas e estrutura', 'multiple_choice', 'ENEM 2015.1 â€” QuÃ­mica â€” QuestÃ£o 176

Pesticidas são substâncias utilizadas para pro-
mover o controle de pragas. No entanto, após
sua aplicação em ambientes abertos, alguns
pesticidas organoclorados são arrastados pela
água até lagos e rios e, ao passar pelas guelras
dos peixes, podem difundir-se para seus tecidos
lipídicos e lá se acumularem.
A característica desses compostos, responsável
pelo processo descrito no texto, é o(a):
A) baixa polaridade.
B) baixa massa molecular.
C) ocorrência de halogênios.
D) tamanho pequeno das moléculas.
E) presença de hidroxilas nas cadeias.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'medium', 'published', 176),
('ENEM-2015.1-Q177', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2015, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2015.1 â€” QuÃ­mica â€” QuestÃ£o 177

A calda bordalesa é uma alternativa empregada
no combate a doenças que afetam folhas de
plantas. Sua produção consiste na mistura de
uma solução aquosa de sulfato de cobre(ll),
CuSO,, com óxido de cálcio, CaO, e sua aplica-
ção só deve ser realizada se estiver levemente
básica. A avaliação rudimentar da basicidade
dessa solução é realizada pela adição de três
gotas sobre uma faca de ferro limpa. Após três
minutos, caso surja uma mancha avermelhada
no local da aplicação, afirma-se que a calda
bordalesa ainda não está com a basicidade
necessária. O quadro apresenta os valores de
potenciais padrão de redução (EP) para algu-
mas semirreações de redução.
Semirreação de redução
Em - =
Fe” +3e- —rFe
entr A +2e" ” Cu ” os
A equação o química que representa a reação . de
formação da mancha avermelhada é:
A) Ca?'' (aq) + 2 Cu'' (aq) — Ca (s) + 2 Cu?* (aq).
B) Ca? (aq) + 2 Fe? (aq) = Ca (s) + 2 Fe” (aq).
C) ) Cu? ue (a 2 Fe? (aq) (a = Cu o (s) + 2 Fe” (aq). (ag).
D) 3 Ca?” (aq) + 2 Fe (s) — 3 Ca (s) + 2 Fe* (aq).
E) 3 Cu? é (aq) + 2 Fe (s) — 3 Cu (s) + . 2 Fe” " (aq).
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'hard', 'published', 177),
('ENEM-2015.1-Q178', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2015, 'Estequiometria', 'multiple_choice', 'ENEM 2015.1 â€” QuÃ­mica â€” QuestÃ£o 178

O aproveitamento de resíduos florestais vem se
tornando cada dia mais atrativo, pois eles são
uma fonte renovável de energia. A figura repre-
senta a queima de um bio-óleo extraído do resí-
duo de madeira, sendo AH; a variação de ental-
pia devido à queima de 1g desse bio-óleo, resul-
tando em gás carbônico e água líquida, e AH7 a
variação de entalpia envolvida na conversão de
1 g de água no estado gasoso para o estado
líquido.
Energia
A
—Bioóleo+O(g) >
a
AH, = -18,8 kJ/g
CO. HO
CO (g):HO(g)
1or = -2,4 kJ/g
CO (9); HOM =
A variação de entalpia, em kJ, para a queima de
5g desse bio-óleo resultando em CO, (gasoso)
e H,O (gasoso) é:
A) -106.
- o
D) 212.
E) -16,4.
o
Questão 179 (20152)
O urânio é um elemento cujos átomos contêm
92 prótons, 92 elétrons e entre 135 e 148 nêu-
trons. O isótopo de urânio ?**U é utilizado como
combustível em usinas nucleares, onde, ao ser
bombardeado por nêutrons, sofre fissão de seu
núcleo e libera uma grande quantidade de ener-
gia (235x10** KJ/mol). O isótopo **U ocorre
naturalmente em minérios de urânio, com con-
centração de apenas 0,7%. Para ser utilizado na
geração de energia nuclear, o minério é subme-
tido a um processo de enriquecimento, visando
aumentar a concentração do isótopo YU para,
aproximadamente, H 3% o nas pastilhas.
Em décadas anteriores, houve um movimento
mundial para aumentar a geração de energia
nuclear buscando substituir, parcialmente, a
geração de energia elétrica a partir da queima
do carvão, o que diminui a emissão atmosférica
de CO, (gás com massa molar igual a 44 g/mol).
A queima do carvão é representada pela equa-
ção química:
58', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'hard', 'published', 178),
('ENEM-2015.1-Q179', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2015, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2015.1 â€” QuÃ­mica â€” QuestÃ£o 179. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'medium', 'published', 179),
('ENEM-2015.1-Q180', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2015, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2015.1 â€” QuÃ­mica â€” QuestÃ£o 180

A química verde permite o desenvolvimento tecnológico
contrar rotas limpas tem sido um grande desafio.
tenção de ácido adípico, um insumo muito importante
Rota tradicional (marrom)
OOoH
Co
—
180ºC lavagem
S
Rota verde
Na, WO,, 4 H,O. (o)
ATA
75-90 ºC
OH
Que fator contribui positivamente para que a segunda
meira:
A) Etapa única na síntese.
B) Obtenção do produto puro.
C) Ausência de reagentes oxidantes.
D) Ausência de elementos metálicos no processo.
E) Gasto de energia nulo na separação do produto.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'medium', 'published', 180),
('ENEM-2015.2-Q181', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2015, 'SoluÃ§Ãµes e concentraÃ§Ã£o', 'multiple_choice', 'ENEM 2015.2 â€” QuÃ­mica â€” QuestÃ£o 181

Sais de amônio são sólidos iônicos com alto ponto de
originais e ligeiramente solúveis em solventes orgânicos
serem usados em xaropes e medicamentos injetáveis.
um odor desagradável e oxida na presença do ar
drato de efedrina funde a 217ºC, não se oxida e é
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'medium', 'published', 181),
('ENEM-2015.2-Q182', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2015, 'Estequiometria', 'multiple_choice', 'ENEM 2015.2 â€” QuÃ­mica â€” QuestÃ£o 182

O cobre presente nos fios elétricos e instrumen-
tos musicais é obtido a partir da ustulação do
minério calcosita (Cu7zS). Durante esse proces-
So, ocorre o aquecimento desse sulfeto na pre-
sença de oxigênio, de forma que o cobre fique
“livre” e o enxofre se combine com o O, produ-
zindo SO», conforme a equação química:
A
Cu,S (s) + O, (g) 2 Cu (1) + SO, (q)
? ? ?
As massas molares dos elementos Cu e S são, ''
respectivamente, á ND iguais a 63,5 g/mol e 32 g/mol.
(CANTO, E. L. Minerais, minérios, metais: de onde
vêm?, para onde vão? São Paulo: Moderna, 1996)
Considerando que se queira obter 16 mois do
metal em uma reação - cujo : rendimento : é : de
80%, a massa, em gramas, do minério necessá-
ria para obtenção do cobre é igual a:
A) 955.
B) 1018.
C) 1590.
D) 2035.
E) 3180.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'hard', 'published', 182),
('ENEM-2015.2-Q183', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2015, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2015.2 â€” QuÃ­mica â€” QuestÃ£o 183

Além de ser uma prática ilegal, a adulteração de
combustíveis é prejudicial ao meio ambiente, ao
governo e, especialmente, ao consumidor final.
Em geral, essa adulteração é feita utilizando
compostos com propriedades físicas semelhan-
tes às do combustível, mas de menor valor
agregado.
Considerando um combustível com 20% de
adulterante, a mistura em que a adulteração
seria identificada visualmente é:
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'medium', 'published', 183),
('ENEM-2015.2-Q184', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2015, 'TermoquÃ­mica', 'multiple_choice', 'ENEM 2015.2 â€” QuÃ­mica â€” QuestÃ£o 184

A obtenção de sistemas coloidais estáveis de-
pende das interações entre as partículas disper-
sas e o meio onde se encontram. Em um siste-
ma coloidal aquoso, cujas partículas são hidrofí-
licas, a adição de um solvente orgânico miscível
em água, como etanol, desestabiliza o coloide,
podendo ocomer a agregação das partículas
preliminarmente dispersas.
A desestabilização provocada pelo etanol ocorre
porque:
A) a polaridade da água no sistema coloidal é
reduzida.
B) as cargas superficiais das partículas coloidais
são diminuídas.
C) as camadas de solvatação de água nas par-
tículas são diminuídas.
D) o processo de miscibilidade da água e do
solvente libera calor para o meio.
E) a intensidade dos movimentos brownianos
das partículas coloidais é reduzida.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'medium', 'published', 184),
('ENEM-2015.2-Q185', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2015, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2015.2 â€” QuÃ­mica â€” QuestÃ£o 185

O papel tem na celulose sua matéria-prima, e
uma das etapas de sua produção é o branque-
amento, que visa remover a lignina da celulose.
Diferentes processos de branqueamento usam,
por exemplo, cloro (Cl), hipoclorito de sódio
(NaClIO), oxigênio (O>), ozônio (O;5) ou peróxido
de hidrogênio (HrO>). Alguns processos de
branqueamento levam à formação de compos-
tos organoclorados.
60', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'medium', 'published', 185),
('ENEM-2015.2-Q186', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2015, 'QuÃ­mica orgÃ¢nica', 'multiple_choice', 'ENEM 2015.2 â€” QuÃ­mica â€” QuestÃ£o 186

O poli(ácido lático) ou PLA é um material de interesse
bioabsorvível. O ácido lático, um metabólito comum
dução do PLA, de acordo com a equação química
CH,
OH
polimerização
HO —.. 1O
o
Ácido dil-lático
Que tipo de polímero de condensação é formado
A) Poliéster.
B) Polivinila.
C) Poliamida.
D) Poliuretana.
E) Policarbonato.
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'medium', 'published', 186),
('ENEM-2015.2-Q187', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2015, 'EquilÃ­brio quÃ­mico', 'multiple_choice', 'ENEM 2015.2 â€” QuÃ­mica â€” QuestÃ£o 187

Cinco indústrias de ramos diferentes foram ins-
taladas ao longo do curso de um rio. O descarte
dos efluentes dessas indústrias acarreta impac-
to na qualidade de suas águas. O pH foi deter-
minado em diferentes pontos desse rio, a 25ºC,
e os resultados são apresentados no quadro.
Pontos de coleta Valor do pH
Entre a primeira e a segunda indústria —==s5 |
Entre a segunda e a terceira indústria
Entre a terceira e a quarta indústria
Entre a quarta e a quinta indústria
Após a quinta indústria 6,5
A indústria que descarta um efluente com carac-
terísticas básicas é a:
A) primeira. o
B) segunda.
C) terceira.
D) quarta.
E) quinta.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'medium', 'published', 187),
('ENEM-2015.2-Q188', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2015, 'QuÃ­mica inorgÃ¢nica', 'multiple_choice', 'ENEM 2015.2 â€” QuÃ­mica â€” QuestÃ£o 188

Os calcários são materiais compostos por car-
bonato de cálcio, que podem atuar como sor-
ventes do dióxido de enxofre (SO>), um impor-
tante poluente atmosférico. As reações envolvi-
das no processo são a ativação do calcário, por
meio da calcinação, e a fixação de SO, com a
formação de um sal de cálcio, como ilustrado
pelas equações químicas simplificadas.
Caco, A, — cao + CO,
CaO + SO, + > O,— Sal de cálcio
Considerando-se . as " .
reações envolvidas nesse
processo de dessulfurização, a fórmula química
do sal de cálcio corresponde a:
A) CaSO;
B) CaSO,
5 Casos
2
E) CaS,O;', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'medium', 'published', 188),
('ENEM-2015.2-Q189', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2015, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2015.2 â€” QuÃ­mica â€” QuestÃ£o 189

O alumínio é um metal bastante versátil, pois, a
partir dele, podem-se confeccionar materiais
amplamente utilizados pela sociedade. A obten-
ção do alumínio ocorre a partir da bauxita, que é
purificada e dissolvida em criolita fundida
novocadernoenem(DQgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'easy', 'published', 189),
('ENEM-2015.2-Q190', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2015, 'Estequiometria', 'multiple_choice', 'ENEM 2015.2 â€” QuÃ­mica â€” QuestÃ£o 190

O vinagre vem sendo usado desde a Antiguida-
de como conservante de alimentos, bem como
agente de limpeza e condimento. Um dos prin-
cipais componentes do vinagre é o ácido acético
(massa molar 60 g/mol), cuja faixa de concen-
tração deve se situar entre 4% a 6% (m/v). Em
um teste de controle de qualidade foram anali-
sadas d cinco i marcas de de dif diferentes vinagres, i e as
concentrações de ácido acético, em mol/L, se
encontram no q quadro.
Concentração de ácido acético (mol/L)
1 | 0,007
2 0,070
3 0,150
0,700 >
62', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'medium', 'published', 190),
('ENEM-2015.2-Q191', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2015, 'QuÃ­mica orgÃ¢nica', 'multiple_choice', 'ENEM 2015.2 â€” QuÃ­mica â€” QuestÃ£o 191

O Nylon é um polímero (uma poliamida) obtido pela
na, como indicado no esquema reacional.
o o
ido,
+ INÔNMÔNOY
ácido hexanodiolco 1,6-diamino-hexano
(ácido adípico) (hexametilenodiamina)
Na época da invenção desse composto, foi proposta
de átomos de carbono do diácido carboxílico, seguido
De acordo com as informações do texto, o nome
ácido butanodioico com o 1,2-diamino-etano é:
A) Nylon 4,3.
B) Nylon 6,2.
C) Nylon 3,4.
D) Nylon 4,2.
E) Nylon 2,6.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'medium', 'published', 191),
('ENEM-2015.2-Q192', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2015, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2015.2 â€” QuÃ­mica â€” QuestÃ£o 192

O quadro apresenta a composição do petróleo.
z Faixa de tamanho Faixa de
180
Lubrificantes maior
Para a separação dos constituintes com o objetivo de
A) filtração.
B) destilação.
C) decantação.
D) precipitação.
E) centrifugação.
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'easy', 'published', 192),
('ENEM-2015.2-Q193', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2015, 'QuÃ­mica orgÃ¢nica', 'multiple_choice', 'ENEM 2015.2 â€” QuÃ­mica â€” QuestÃ£o 193

O álcool utilizado como combustível automotivo
(etanol hidratado) deve apresentar uma taxa
máxima de água em sua composição para não
prejudicar o funcionamento do motor. Uma ma-
neira simples e rápida de estimar a quantidade
de etanol em misturas com água é medir a den-
sidade da mistura. O gráfico mostra a variação
da densidade da mistura (água e etanol) com a
fração percentual da massa de etanol (f.), dada
pela expressão:
= me
fer 100
Tm.
Em que m. e m, são as massas de etanol e de
"
agua na mistura, respectivamente, a uma tem-
peratura de 20ºC.
E o = ms o MS MS E SO MS SO MO E GO GO E Gu Gu
ca Ea Se CN EacaEs CEESCA do SEIA CA DS Cabacde |
[io ma ua iu a o o lu a o o a uu e ua
o LEA Ina oe com e ee E: se BE com am a Co e a sea e a |
(1 Em nm Da ea ESSES ES Biba SE SS DS 2 BSS Ea SS EE
CSS a aula ton eles cs laelcleo es Ffus ra fes eniesjesl ao ea
Ecccsscss ss SE ssE SS
Ss ES ee Ee |
(SEM EE DE BE DER FS DIES ER BE E EO (29 RSS O DES Mo os e pe E
a SS SS Ds es S ES S eee
Mime
ÇA Em E E E o coa Es ia oa Ea Ea Ba ea Ea esa cc ia Sa Ea |
VE aPm EmA [Par sa oa Er ER Era Pr (2 ia fer Dra rem pe pr Ps ge
A Em EM [EM] DA EM om mA BD Er Eva Ex] Eca Bea BoA BH Barca Ber Br Ba Da: S f
sssss===============
TE —— —— e s—
RE AA A AR Am Praca Rm ça a as o ice e 3
to
Suponha que, em , inspeção " de rotina " realizada .
em determinado posto, tenha-se verificado que
50,0 cm? de álcool combustível tenham massa
igual a 45,0 g Qual é a fração percentual de
etanol nessa mistura?
8) Toe
o
C) 55%
D) 90%
E) 93%', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'hard', 'published', 193),
('ENEM-2015.2-Q194', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2015, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2015.2 â€” QuÃ­mica â€” QuestÃ£o 194

A cafeina é um alcaloide, identificado como
1,3,7trimetilxantina (massa bee Fgual a 194
g/mol), cuja estrutura química contém uma uni-
dade de purina, conforme representado. Esse
alcaloide é encontrado em grande quantidade
nas sementes de café e nas folhas de chá-
verde. Uma xícara de café contém, em média,
80 mg de cafeína.
(o)
CH,
Hex, N
| ?
A N
o N
|
CH,
3
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'medium', 'published', 194),
('ENEM-2015.2-Q195', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2015, 'SoluÃ§Ãµes e concentraÃ§Ã£o', 'multiple_choice', 'ENEM 2015.2 â€” QuÃ­mica â€” QuestÃ£o 195

O acúmulo de plásticos na natureza pode levar
a impactos ambientais negativos, tanto em am-
bientes terrestres quanto aquáticos. Uma das
formas de minimizar esse problema é a recicla-
gem, para a qual é necessária a separação dos
diferentes tipos de plásticos.
Em um processo de separação foi proposto o
seguinte procedimento:
a mistura istura de plásticos 5
1. Coloque de plásticos picados
em um tanque e acrescente água até a me-
tade da sua capacidade.
Il. Mantenha essa mistura i em repouso por
cerca de 10 minutos.
ã
Il. Retire os pedaços que flutuam e transfi- :
ra para outro tanque com uma solução de
álcool.
IV. Coloque os pedaços sedimentados em
outro tanque com solução de sal e agite
bem ''
Qual propriedade da matéria possibilita a utiliza-
ção do procedimento descrito?
A) Massa.
B) Volume.
C) Densidade.
D) Porosidade.
E) Maleabilidade.
Questão IOG(20T6.1) |ÀÚÀ|À|||lllS
O benzeno, um importante solvente para a in-
dústria química, é obtido industrialmente pela
destilação do petróleo.
Contudo, também pode ser sintetizado pela
trimerização do acetileno catalisada por ferro
metálico sob altas temperaturas, conforme a
equação química:
3 CaHo (9) — CsHs (1)
A energia envolvida nesse processo pode ser
calculada indiretamente pela variação de ental-
pia das reações de combustão das substâncias
participantes, nas mesmas condições experi-
mentais:
64', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'hard', 'published', 195),
('ENEM-2015.2-Q196', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2015, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2015.2 â€” QuÃ­mica â€” QuestÃ£o 196. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'medium', 'published', 196),
('ENEM-2016.1-Q197', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'Estequiometria', 'multiple_choice', 'ENEM 2016.1 â€” QuÃ­mica â€” QuestÃ£o 197

A minimização do tempo e custo de uma reação
química, bem como o aumento na sua taxa de
conversão, caracterizam a eficiência de um
processo químico. Como consequência, produ-
tos podem chegar ao consumidor mais baratos.
Um dos parâmetros que mede a eficiência de
uma reação química é o seu rendimento molar
(R, em %), definido como:
n
R = = ——————— produto x 100
n. 2
reagente limitante
Em que n corresponde ao número de mois. O
metanol pode ser obtido pela reação entre bro-
meto de metila e hidróxido de sódio, conforme a
equação quimica:
CH;3Br + NaOH — CH;OH + NaBr
As massas molares (em g/mol) desses elemen-
tos são: H = 1; C = 12; O = 16; Na = 23; Br = 80.
O rendimento molar da reação, em que 32 g de
metanol foram obtidos a partir de 142,5 g de
brometo de metila e 80 g de hidróxido de sódio,
é mais próximo de:
A) 22%.
B) 40%.
Cc) 50%.
D) 67%.
E) 75%.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'hard', 'published', 197),
('ENEM-2016.1-Q198', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'QuÃ­mica orgÃ¢nica', 'multiple_choice', 'ENEM 2016.1 â€” QuÃ­mica â€” QuestÃ£o 198

Em sua formulação, o spray de pimenta contém
porcentagens variadas de oleorresina de Capsi-
cum, cujo principio ativo é a capsaicina, e um
solvente (um álcool como etanol ou isopropa-
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'easy', 'published', 198),
('ENEM-2016.1-Q199', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2016.1 â€” QuÃ­mica â€” QuestÃ£o 199

A usina de Itaipu é uma das maiores hidrelétri-
cas do mundo em geração de energia. Com 20
unidades geradoras e 14 000 MW de potência
total instalada, apresenta uma queda de 118,4m
e vazão nominal de 690 m”/s por unidade gera-
dora. O cálculo A da potência anais teórica dar leva em
conta a altura da massa de água represada pela
barragem, a gravidade local (ao mis ) e a densi-
dade da agua (1000 kam LA diferença entre a
e a instalada é a potência não
Doroveitada
(Disponível em: www.itaipu.gov.br.
Acesso em: 11 maio 2013 - adaptado)
Qual e a potência, em MW, não aproveitada em
cada unidade geradora de Itaipu?
AJO
B) 1,18
C) 116,96
D) 816,96
E) 13 183,04', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'hard', 'published', 199),
('ENEM-2016.1-Q200', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2016.1 â€” QuÃ­mica â€” QuestÃ£o 200

O carvão ativado é um material que possui ele-
vado teor de carbono, sendo muito utilizado
para a remoção de compostos orgânicos volá-
teis do meio, como o benzeno. Para a remoção
desses compostos, utiliza-se a adsorção. Esse
fenômeno ocorre por meio de interações do tipo
intermoleculares entre a superfície do carvão
(adsorvente) e o benzeno (adsorvato, substân-
cia adsorvida).
65', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'medium', 'published', 200),
('ENEM-2016.1-Q201', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'QuÃ­mica orgÃ¢nica', 'multiple_choice', 'ENEM 2016.1 â€” QuÃ­mica â€” QuestÃ£o 201

O aquecimento de um material por irradiação
com microondas ocorre por causa da interação
da onda eletro magnética com o dipolo elétrico
da molécula. Um importante atributo do aqueci-
mento por micro-ondas e a absorção direta da
energia pelo material a ser aquecido. Assim,
esse aquecimento é seletivo e dependerá, prin-
cipalmente, da constante dielétrica e da fre-
quência de relaxação do material. O gráfico
mostra a taxa de aquecimento de cinco solven-
tes sob irradiação de micro-ondas.
O Água
| —o- Metanol v
1097
Dio "
—- Propanol y
& 804 | —— Hexano & A
Ss . &
8 o
- x º ? -.
5 60 Y o
Ê fo,
: x
p
i
x o
40 DD o
EE: Sa aaa eus ANNA ANNA SUNS SUNS
O 10 20 30 40 50 60 70 8
Tempo (s)
No gráfico, qual solvente apresenta taxa média
de aquecimento mais próxima de zero, no inter-
valo de 0 8 a 40 s?
A) HO
B) CH;OH
C) CH;CH,OH
D) CH;CH;CH,OH
E) CH;CHZCHZCH2CHACHs', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'hard', 'published', 201),
('ENEM-2016.1-Q202', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2016.1 â€” QuÃ­mica â€” QuestÃ£o 202

Em meados de 2003, mais de 20 pessoas mor-
reram no Brasil após terem ingerido uma sus-
pensão de sulfato de bário utilizada como con-
traste em exames radiológicos. O sulfato de
bário é um sólido pouquíssimo solúvel em água,
que não se dissolve mesmo na presença de
ácidos. As mortes ocorreram porque um labora-
tório farmacêutico forneceu o produto contami-
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'medium', 'published', 202),
('ENEM-2016.1-Q203', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'QuÃ­mica ambiental', 'multiple_choice', 'ENEM 2016.1 â€” QuÃ­mica â€” QuestÃ£o 203

Após seu desgaste completo, os pneus podem
ser queimados para a geração de energia. Den-
tre os gases gerados na combustão completa
da borracha vulcanizada, alguns são poluentes
e provocam a chuva ácida. Para evitar que es-
capem para a atmosfera, esses gases podem
ser borbulhados em uma soluçã ção aquosa con -
tendo uma substância em adequada. Considere as
informações das substâncias listadas no qua-
dro.
Eae
Valor da
juilíbrio em
equilíbrio
Fenoi — | COR TEOR | ,3, 19-10
Piridina | | 1116
CENTOS "
= CHNH* + OH
PR CHNH, + H,0 2
Metilamina + 44x 10%
= CHNHt OH
Hidrogenofos- | HPOZ + H,0 = >
elo:
[fato de potássio) => H PO; + OH
LL:
Hidrogenos- - =
todo | AE | auasade
potássio =SO07 +H,O*
Dentre as substâncias listadas no quadro, aque-
la capaz de remover com maior eficiência os
gases poluentes é o(a):
A) fenol.
B) piridina.
C) metilamina.
D) hidrogenofosfato de potássio.
E) hidrogenosulfato de potássio.
66', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'hard', 'published', 203),
('ENEM-2016.1-Q204', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2016.1 â€” QuÃ­mica â€” QuestÃ£o 204

Os feromônios são substâncias utilizadas na
feromônio isolado de um inseto foi o bombicol,
MMA FAN
Bombicol
O uso de feromônios em ações de controle de insetos
para a agricultura do futuro. São agentes altamente
empregados em determinados cultivos, conforme
ANA
OH O
UU
[
(o)
AMA,
So
AADÔADADAOAOS,
EA
Considerando essas estruturas químicas, o tipo de
bém apresentada pelo feromônio utilizado no controle
A) Sitophilus spp. B) Migdolus
D) Grapholita molesta. E)', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'medium', 'published', 204),
('ENEM-2016.1-Q205', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2016.1 â€” QuÃ­mica â€” QuestÃ£o 205

A lipofilia é um dos fatores fundamentais para o
planejamento de um fármaco. Ela mede o grau
de afinidade que a substância tem com ambien-
tes apolares, podendo ser avaliada por seu coe-
ficiente de partição.
CH; x
>
CH
]
E
A
fe)
X=OH (testosterona)
x=H (Composto 1)
* = CH; (Composto 2)
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'medium', 'published', 205),
('ENEM-2016.1-Q206', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'EletroquÃ­mica', 'multiple_choice', 'ENEM 2016.1 â€” QuÃ­mica â€” QuestÃ£o 206

TEXTO |
Biocélulas combustíveis são uma alternativa
tecnológica para substituição das baterias con-
vencionais. Em uma biocélula microbiológica,
bactérias catalisam reações de oxidação de
substratos orgânicos. Liberam elétrons produzi-
dos na respiração celular para um eletrodo,
67', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'easy', 'published', 206),
('ENEM-2016.1-Q207', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2016.1 â€” QuÃ­mica â€” QuestÃ£o 207. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'medium', 'published', 207),
('ENEM-2016.1-Q208', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2016.1 â€” QuÃ­mica â€” QuestÃ£o 208. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'medium', 'published', 208),
('ENEM-2016.1-Q209', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'QuÃ­mica orgÃ¢nica', 'multiple_choice', 'ENEM 2016.1 â€” QuÃ­mica â€” QuestÃ£o 209

Para cada litro de etanol produzido em uma
indústria de cana-de-açúcar são gerados cerca
de 18 L de vinhaça que é utilizada na irrigação
das plantações de cana-de-açúcar, já que con-
tém teores médios de nutrientes N, P e K iguais
MH .
a sc
mel, 60 mg/L e 2 034 mg/L, respectiva-
(SILVA. M. A. S.; GRIEBELER. N. P.; BORGES, L. C.
Uso de vinhaça e impactos nas propriedades do solo
e lenço! freático. Revista Brasileira de Engenharia
Agrícola e Ambiental. n. 1, 2007 - adaptado)
68', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'medium', 'published', 209),
('ENEM-2016.1-Q210', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2016.1 â€” QuÃ­mica â€” QuestÃ£o 210. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'medium', 'published', 210),
('ENEM-2016.1-Q211', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'QuÃ­mica orgÃ¢nica', 'multiple_choice', 'ENEM 2016.1 â€” QuÃ­mica â€” QuestÃ£o 211

Nucleófilos (Nu) são bases de Lewis que rea-
gem com haletos de alquila, por meio de uma
reação substituição nucleofílica (Sy),
chamada
como mostrado no esquema:
E a Bea Na,
( R= grupo a''quila Iquila e e X = halogêni: alogênio)
A reação de S,, entre metóxido de sódio (Nu =
CH3;O) e brometo de metila fornece um com-
posto orgânico pertencente à função:
A) éter.
B) éster.
C) álcool.
D) haleto.
E) hidrocarboneto.
com substâncias polares e apolares. A parte iônica
a parte lipofílica interage com as apolares. A estru-
por:
;
CH, CH, CH, fo O Fórmula
NÓ NÓ NÓ estrutural
CH, CH, CH, O do tensoativo
Representação
esquemática
moléculas formam um arranjo ordenado. Esse arranjo é
« Nível & < Nível
da da
água água
« Nível
da
água
69', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'hard', 'published', 211),
('ENEM-2016.1-Q212', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2016.1 â€” QuÃ­mica â€” QuestÃ£o 212

Os tensoativos são compostos capazes de interagir
dos tensoativos interage com substâncias polares, e
tura orgânica de um tensoativo pede ser representada
CH, CH, CH, CH, CH,
A NV NÔO NO NO NÓ
HC CH, CH, CH, CH, CH,
Ao adicionar um tensoativo sobre a água, suas
representado esquematicamente por:
A) « Nível B)
da
água
D) « Nível (2)
da
água
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'medium', 'published', 212),
('ENEM-2016.2-Q213', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2016.2 â€” QuÃ­mica â€” QuestÃ£o 213

Nos anos 1990, verificou-se que o rio Potomac
situado no estado norte-americano de Maryland,
tinha em parte de seu curso, águas extrema-
mente ácidas por receber um efluente de uma
mina de carvão desativada, o qual continha
ácido sulfúrico (H/SO,). Essa água, embora
límpida, era desprovida de vida. Alguns quilô-
metros adiante, instalou-se uma fábrica de pa-
pel e celulose que emprega hidróxido de sódio
(NaOH) e carbonato de sódio (Na;CO;) em seus
processos. Em pouco tempo observou-se que, a
partir do ponto em que a fábrica lança seus
rejeitos no rio, a vida aquática voltou a florescer.
(HARRIS D.C. Análise química quantitativa, Rio de
Janeiro. Livros Técnicos e Científicos. 2012)
A explicação para o retorno da vida aquática
nesserioéa:
A) diluição das águas do rio pelo novo efluente
lançado nele.
B) precipitação do íon sulfato na presença do
efluente da nova fábrica. .
C) biodegradação do ácido sulfúrico em contato
com o novo efluente descartado.
D) diminuição rintiad da acidez ; das águas " do rio : pelo
efluente dá fábrica de papel e''celulose:
E) volatilização do ácido sulfúrico após contato
com o novo efluente introduzido no rio.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'hard', 'published', 213),
('ENEM-2016.2-Q214', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'QuÃ­mica ambiental', 'multiple_choice', 'ENEM 2016.2 â€” QuÃ­mica â€” QuestÃ£o 214

A energia nuclear é uma alternativa aos com-
bustíveis fósseis que, se não gerenciada de
forma correta, pode causar impactos ambientais
graves. O principio da geração dessa energia
pode se basear na reação de fissão controlada
do urânio por bombardeio de nêutrons. como
ilustrado:
235 U+n—>”Sr+ 95 139 "“Xe+2n+ i
energia
Um grande risco 3 decorre da geração " do chama-
do lixo atômico, NO que exige ; condições A muito PA rígi-
das de tratamento e armazenamento para evitar
vazamentos para o meio ambiente.
Esse lixo é prejudicial, pois:
A) favorece a proliferação de microrganismos
W " . .
termófilos.
B) produz nêutrons livres . que o ionizam o ar, tor-
nando-o condutor.
C) libera gases que alteram a composição 1 da
atmosfera terrestre.
D) acentua o efeito estufa decorrente do calor
produzido na fissão.
E) emite radiação capaz de provocar danos à
saúde dos seres vivos.
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'hard', 'published', 214),
('ENEM-2016.2-Q215', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'SoluÃ§Ãµes e concentraÃ§Ã£o', 'multiple_choice', 'ENEM 2016.2 â€” QuÃ­mica â€” QuestÃ£o 215

Para lavar e refrescar o ambiente, que estava a
40ºC, uma pessoa resolveu jogar água sobre
um piso de granito. Ela observou que o líquido
se concentrou em algumas regiões, molhando
parcialmente a superfície. Ao adicionar deter
gente sobre essa água. a pessoa verificou que o
líquido se espalhou e deixou o piso totalmente
molhado.
A molhabilidade da superfície foi melhorada em
função da:
A) solubilidade do detergente em água ser alta.
B) tensão superficial da água ter sido reduzida.
C) pressão de vapor da água ter sido diminuída.
D) densidade da solução ser maior que a da
água.
E) viscosidade da solução ser menor que a da
água.
TIE AR ORAR Oy DD', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'medium', 'published', 215),
('ENEM-2016.2-Q216', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'Estequiometria', 'multiple_choice', 'ENEM 2016.2 â€” QuÃ­mica â€” QuestÃ£o 216

Até 1824 acreditava-se que as máquinas PP. témi- .
cas, cujos exemplos são as máquinas a vapor e
os as motores = : ter
atuais a combustão. Poderiam
um funcionamento ideal. Sadi Camot demons-
funcionando em ciclos entre duas fontes térmi-
trou a impossibilidade de uma máquina térmica,
Na (uma quente e outra fria), obter 100% o, de
À
rendimento.
Tal limitação ocorre porque essas máquinas:
A) realizam trabalho mecânico.
B) produzem aumento da entropia.
C) utilizam transformações adiabáticas.
D) contrariam a lei da conservação de energia.
E) funcionam com temperatura igual à da fonte
quente.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'medium', 'published', 216),
('ENEM-2016.2-Q217', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'QuÃ­mica orgÃ¢nica', 'multiple_choice', 'ENEM 2016.2 â€” QuÃ­mica â€” QuestÃ£o 217

Em Bangladesh, mais da metade dos poços
artesianos " cuja SA água serve à R população = local
está contaminada com arsênio proveniente de
" Aa
minerais naturais e de pesticidas. O arsênio
apresenta efeitos tóxicos cumulativos.
A ONU desenvolveu um Kit para tratamento
dessa água a fim de torná-la segura para o con-
sumo humano. O princípio desse Kit é a remo-
ção do arsênio por meio de uma reação de pre-
cipitação com sais de ferro (III) que origina um
sólido volumoso de textura gelatinosa.
(Disponível em: http://tc.iaea.org.
Acesso em: 11 dez. 2012 - adaptado)
Com o uso desse Kit, a população local pode
remover o elemento tóxico por meio de:
70', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'medium', 'published', 217),
('ENEM-2016.2-Q218', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2016.2 â€” QuÃ­mica â€” QuestÃ£o 218. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'medium', 'published', 218),
('ENEM-2016.2-Q219', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'QuÃ­mica ambiental', 'multiple_choice', 'ENEM 2016.2 â€” QuÃ­mica â€” QuestÃ£o 219

O principal componente do sal de cozinha é o
cloreto de sódio, mas o produto pode ter alumi-
nossilicato de sódio em pequenas concentra-
ções. Esse sal, que é insolúvel em água, age
como antiumectante, evitando que o sal de co-
zinha tenha um aspecto empedrado.
O procedimento de laboratório adequado para
verificar a presença do antiumectante em uma
amostra de sal de cozinha é o(a):
A) realização do teste de chama.
B) medida do pH de uma solução aquosa.
C) medida da turbidez de uma solução aquosa.
D) ensaio da presença de substâncias orgâni-
cas.
E) verificação da presença de cátions monova-
lentes.
Questão 220(20162) |||
Algumas práticas agrícolas fazem uso de quei-
madas, apesar de produzirem grandes efeitos
negativos.
Por exemplo, quando ocorre a queima da palha
de cana-de-açúcar, utilizada na produção de
etanol, há emissão de poluentes como CO,,
SOx, NOx e materiais particulados (MP) para a
atmosfera. Assim, a produção de biocombustí-
veis pode, muitas vezes, ser acompanhada da
emissão de vários poluentes.
(CARDOSO, A. A.; Biocombustível: o mito do com-
bustível limpo. Química Nova Escola. n. 28, maio 08)
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'hard', 'published', 219),
('ENEM-2016.2-Q220', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2016.2 â€” QuÃ­mica â€” QuestÃ£o 220. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'medium', 'published', 220),
('ENEM-2016.2-Q221', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'TermoquÃ­mica', 'multiple_choice', 'ENEM 2016.2 â€” QuÃ­mica â€” QuestÃ£o 221

Utensílios de uso cotidiano e ferramentas que
contêm ferro em sua liga metálica tendem a
sofrer processo corrosivo e enferrujar. A corro-
são é um processo eletroquímico e, no caso do
ferro, ocorre a precipitação do óxido de ferro (Il)
hidratado, substância marrom pouco solúvel,
conhecida como ferrugem. Esse processo cor-
rosivo é, de maneira geral, representado pela
equação quimica:
4Fe(s)+30,(g): 2H,0(1) > 2 Fe,O0;:H,O (s)
—
Ferrugem
Uma forma de impedir o processo corrosivo
nesses utensílios é:
A) renovar sua superfície, polindo-a semanal-
mente.
B) evitar o contato do utensílio com o calor,
isolando-o termicamente.
C) impermeabilizar a superfície, isolando-a de
seu contato com o ar úmido.
D) esterilizar frequentemente os utensílios, im-
pedindo a proliferação de bactérias.
E) guardar os utensílios em embalagens, iso-
lando-os do contato com outros objetos.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'hard', 'published', 221),
('ENEM-2016.2-Q222', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2016.2 â€” QuÃ­mica â€” QuestÃ£o 222

A bauxita é o minério utilizado na fabricação do
alumínio, a qual apresenta A/2O; (alumina) em
sua composição. Após o trituramento e lavagem
para reduzir o teor de impurezas, o minério é
misturado a uma solução aquosa de NaOH
(etapa A). A parte sólida dessa mistura é rejei-
tada e a solução resultante recebe pequenos
cristais de alumina, de onde sedimenta um sóli-
do (etapa B). Esse sólido e aquecido até a ob-
tenção de um pó branco, isento de água e cons-
tituído unicamente por alumina. Finalmente,
esse pó é aquecido até sua fusão e submetido a
uma eletrólise, cujos produtos são o metal puro
fundido (A/) e o gás carbônico (CO,).
71', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'medium', 'published', 222),
('ENEM-2016.2-Q223', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2016.2 â€” QuÃ­mica â€” QuestÃ£o 223. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'medium', 'published', 223),
('ENEM-2016.2-Q224', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'QuÃ­mica ambiental', 'multiple_choice', 'ENEM 2016.2 â€” QuÃ­mica â€” QuestÃ£o 224

Os métodos empregados nas análises químicas
são ferramentas importantes para se conhecer a
com posição dos diversos materiais presentes
no meio ambiente. É comum, na análise de
metais presentes em amostras ambientais, co-
mo água de rio ou de mar, a adição de um ácido
mineral forte, normalmente o ácido nítrico
(HNO;), com a finalidade de impedir a precipita-
ção de compostos pouco solúveis desses me-
tais ao longo do tempo.
Na ocorrência de precipitação, o resultado da
análise pode ser subestimado, porque:
A) ocorreu passagem de parte dos metais para
uma fase sólida.
B) houve volatilização de compostos dos metais
para a atmosfera.
C) os metais passaram a apresentar comporta-
mento de não metais.
D) formou-se uma nova fase líquida, imiscível
com a solução original.
E) os metais reagiram com as paredes do reci-
piente que contém a amostra.
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'hard', 'published', 224),
('ENEM-2016.2-Q225', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2016.2 â€” QuÃ­mica â€” QuestÃ£o 225

O paclitaxel é um triterpeno poli-hidroxilado que
foi originalmente isolado da casca de Taxus
brevifolia, árvore de crescimento lento e em
risco de extinção, mas agora é obtido por rota
química semissintética. Esse fármaco é utilizado
como agente quimioterápico no tratamento de
tumores de ovário, mama e pulmão. Seu meca-
nismo de ação antitumoral envolve sua ligação
à tubulina interferindo com a função dos mi-
crotúbulos.
(KRETZER, |. F. Terapia antitumoral combinada dea
derivados do paclitaxel e etoposídeo associados à
nanoemulsão lipídica rica em colesterol — LDE. Dis-
ponível em: wwwtesesusptar. Acesso em 29.02.2012)
Do acordo 6 dieta antiuimeral descia, Sã
" s ,
celular é diretamente afetada pelo pacii-
bo
taxel?
A) Divisão sã celular.
8) Transporte passivo.
s
C) Equilíbrio osmótico.
D) Geração de energia.
E) Síntese de proteínas.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'hard', 'published', 225),
('ENEM-2016.2-Q226', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'QuÃ­mica ambiental', 'multiple_choice', 'ENEM 2016.2 â€” QuÃ­mica â€” QuestÃ£o 226

Os gráficos representam a concentração " na
atmosfera, em partes por bl (ppm), bilhão
(ppb) ou trilhão (ppt), dos cinco gases respon-
sáveis por 97% do efeito estufa durante o perío-
do de 1978 a 2010.
390 '' 7 7 "
Dióxido de carbono | 2
30 Lo -
z é
ê | | PA |
- mo à
STA
| : |
"x.
E
ANO |
350 NA
PSA | | |
”
340 "
ao
| | |
ão
1978 1982 1986 1990 1994 1998 2002 2006 2010
325 Óxido T T
nitroso| |
|
o
ê Pe |
|
Z
| |
210
|
|
205
| |
oo
| |
1295
1978 1982 1986 1990 1994 1998 2002 2006 2010
72', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'hard', 'published', 226),
('ENEM-2016.3-Q227', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2016.3 â€” QuÃ­mica â€” QuestÃ£o 227

Benjamin Franklin (1706-1790), por volta de
1757, percebeu que dois barcos que
compunham a frota com a qual viajava para
Londres permaneciam estáveis, enquanto os
outros eram jogados pelo vento. Ao questiona o
porquê daquele fenômeno, foi informado pelo
capitão que provavelmente os cozinheiros
haviam arremessado óleo pelos lados dos
barcos. Inquirindo mais a respeito, soube que
habitantes das ilhas do Pacífico jogavam óleo
na água para impedir que o vento a agitasse e
atrapalhasse a pesca.
Em 1774, Franklin resolveu testar o fenômeno
jogando uma colher de chá (4mL) de óleo de
oliva em um lago onde pequenas ondas eram
formadas. Mais curioso que o efeito de acalmar
as ondas foi o fato de que o óleo havia de
espalhado completamente pelo lago, numa área
de aproximadamente 2000 m?, formando um
filme fino.
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'hard', 'published', 227),
('ENEM-2016.3-Q228', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'QuÃ­mica inorgÃ¢nica', 'multiple_choice', 'ENEM 2016.3 â€” QuÃ­mica â€” QuestÃ£o 228

Adicionar quantidades de álcool à gasolina,
diferentes daquelas determinadas pela legisla-
ção, é uma das formas de adulterá-la. Um teste
simples para aferir a quantidade de álcool pre-
sente na mistura consiste em adicionar uma
solução salina aquosa à amostra de gasolina
sob análise.
Essa metodologia de análise pode ser usada
porque o(a):
A) água da solução salina interage com a gaso-
lina da mistura, formando duas fases, uma delas
de álcool puro.
B) álcool contido na gasolina interage com a
solução salina, formando duas fases, uma delas
de gasolina pura.
C) gasolina da mistura sob análise interage com
a solução salina, formando duas fases, uma
delas de álcool puro.
D) água da solução salina interage com o álcool
da mistura, formando duas fases, uma delas de
gasolina com sal.
E) álcool contido na gasolina interage com o sal
da solução salina, formando duas fases, uma
delas de gasolina mais água.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'hard', 'published', 228),
('ENEM-2016.3-Q229', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'QuÃ­mica ambiental', 'multiple_choice', 'ENEM 2016.3 â€” QuÃ­mica â€” QuestÃ£o 229

A crescente produção industrial lança ao ar
diversas substâncias tóxicas que podem ser
removidas pela passagem do ar contaminado
em tanques para filtração por materiais porosos,
ou para dissolução em agua ou solventes orgã-
nicos de baixa polaridade, ou para neutralização
em soluções ácidas ou básicas. Um dos poluen-
tes mais tóxicos liberados na atmosfera pela
atividade industrial é a 2,3,7,8-tetraclorodioxina.
73', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'medium', 'published', 229),
('ENEM-2016.3-Q230', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'QuÃ­mica orgÃ¢nica', 'multiple_choice', 'ENEM 2016.3 â€” QuÃ­mica â€” QuestÃ£o 230

O quadro apresenta alguns exemplos de combustíveis
de transporte.
Combustível | Temperatura de fusão
[Mean [8
Loetano o
São combustíveis líquidos à temperatura ambiente
A) Butano, etanol e metano. B) Etano,
D) Metanol e metano. E) Octano e', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'easy', 'published', 230),
('ENEM-2016.3-Q231', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2016.3 â€” QuÃ­mica â€” QuestÃ£o 231

Um bafômetro simples consiste em um tubo contendo
sílica umedecida com ácido sulfúrico. Nesse teste,
dá visualmente, pois a reação que ocorre é a
(alaranjado) a cromo (Ill) (verde) ou cromo (II) (azul).
Sopro —,
ZIN
A equação balanceada da reação química que
A) Cr,0,2 (aq) + 2 H* (aq) + 3 CH,X-CH,-OH (g) > 2
B) Cr,0,7 (aq) + 8 H* (aq) + 3 CH, CH,-OH (g) — 2
C) Cro? (aq) + 2 H'' (aq) + 3 CH,-CH,-OH (g) > Cr*''
D) Cr,0,> (aq) + 8 H* (aq) + 3 CH,-CHO (g) = 2 Cri*
E) Cro,2 (aq) + 2 H* (aq) + 3 CH,-CHO (g) > Cr?"
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'medium', 'published', 231),
('ENEM-2016.3-Q232', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2016.3 â€” QuÃ­mica â€” QuestÃ£o 232

Climatério é o nome de um estágio no processo de
zado pelo aumento do nível da respiração celular
escurecimento do fruto, o que representa a perda de
É possível prolongar a vida de um fruto climatérico
utiliza-se o permanganato de potássio (KMnO;,)
sendo o processo representado de forma simplificada
O processo de amadurecimento começa quando a
mg de CH, por kg de ar.
As massas molares dos elementos H, C, O, K e Mn
gimol, 39 g/mol e 55 g/mol.
A fim de diminuir essas perdas, sem desperdício de
é mais próxima de:
A) 0,7 mg.
B) 1,0 mg.
Cc) 3,8 mg.
D) 5,6mg.
E) 8,5 mg.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'medium', 'published', 232),
('ENEM-2016.3-Q233', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'QuÃ­mica orgÃ¢nica', 'multiple_choice', 'ENEM 2016.3 â€” QuÃ­mica â€” QuestÃ£o 233

A busca por substâncias capazes de minimizar a ação
Brasil levou à síntese e ao emprego de um feromônio
Uma indústria agroquímica necessita sintetizar um
substituto deverá preservar as seguintes propriedades
cadeia normal e a isomeria geométrica original.
A fórmula estrutural do substituto adequado ao
A) NANA ARA 7
Ie cocoo,
B)
O) DAFNAFNADNAZN 000
D) MAFRA 7
ANA FENAEFESNA ARA
E)
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'medium', 'published', 233),
('ENEM-2016.3-Q234', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'EquilÃ­brio quÃ­mico', 'multiple_choice', 'ENEM 2016.3 â€” QuÃ­mica â€” QuestÃ£o 234

Na preparação da massa do pão, presente na
mesa do café da maioria dos brasileiros, utiliza-
se o fungo Saccharomyces cerevisiae vivo, con-
tido no fermento. Sua finalidade é fazer com que
a massa cresça por meio da produção de gás
carbônico.
Esse processo químico de liberação de gás é
causado d pela la:
A) glicogênese lática.
B) fermentação alcoólica.
C) produção de ácido lático.
D) produção de lactobacilos.
E) formação do ácido pirúvico.
Questão 235 (20163) (20163) | AAA
As águas dos oceanos apresentam uma alta
concentração de íons e pH entre 8,0 e 8,3. Den-
tre esses íons estão em equilíbrio as espécies
carbonato (COz”) e bicarbonato (HCO;z)), repre-
sentado pela equação química:
HCO. (aq) (a = CO*(a Ear H'' (aq) (a
3 3
As águas dos rios, . ao contrário, . apresentam
concentrações muito baixas de íons e substân-
cias básicas, com um pH em torno de 6. A alte-
ração significativa do pH das águas dos rios e
oceanos pode mudar suas composições quími-
cas, por precipitação de espécies dissolvidas ou
redissolução de espécie presente nos sólidos
suspensos ou nos sedimentos.
A composição dos oceanos é menos afetada
pelo lançamento de efluentes ácidos, pois os
ema leria
A) contêm . grande quantidade . de cloreto de
sódio.
B) contêm um volume de água pura menor que
o dos rios.
C) possuem pH ácido, não sendo afetados pela
adição de outros ácidos.
D) têm a formação dos íons carbonato favoreci-
da pela adição de ácido.
E) apresentam um equilíbrio entre os íons car-
bonato e bicarbonato, que atuam como sistema-
tampão.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'hard', 'published', 234),
('ENEM-2016.3-Q235', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2016.3 â€” QuÃ­mica â€” QuestÃ£o 235. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'medium', 'published', 235),
('ENEM-2016.3-Q236', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2016.3 â€” QuÃ­mica â€” QuestÃ£o 236

A água consumida na maioria das cidades bra-
sileiras ES obtida pelo tratamento da água de
mananciais. parte inicial do tratamento consis-
A
te no peneiramento e sedimentação de partícu-
las maiores. Na etapa seguinte, dissolvem-se na
água carbonato de sódio e, em seguida, sulfato
de alumínio.
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'medium', 'published', 236),
('ENEM-2016.3-Q237', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2016.3 â€” QuÃ­mica â€” QuestÃ£o 237. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'medium', 'published', 237),
('ENEM-2016.3-Q238', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2016.3 â€” QuÃ­mica â€” QuestÃ£o 238. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'medium', 'published', 238),
('ENEM-2016.3-Q239', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2016.3 â€” QuÃ­mica â€” QuestÃ£o 239

Atualmente, soldados em campo, seja em treinamento
prontas e embaladas em bolsas plásticas, utilizando
Dentro dessas bolsas existe magnésio metálico em
coloca água dentro da bolsa promovendo a reação
Mg (s) + 2 H,O (1) —
O aquecimento dentro da bolsa ocorre por causa da:
A) redução sofrida pelo oxigênio, que é uma reação
B) oxidação sofrida pelo magnésio, que é uma reação
C) redução sofrida pelo magnésio, que é uma reação
D) oxidação sofrida pelo hidrogênio, que é uma reação
E) redução sofrida pelo hidrogênio, que é uma reação', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'medium', 'published', 239),
('ENEM-2016.3-Q240', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'QuÃ­mica ambiental', 'multiple_choice', 'ENEM 2016.3 â€” QuÃ­mica â€” QuestÃ£o 240

O processo de dessulfurização é uma das etapas
siste na oxidação do enxofre presente na forma de
do) que é posteriormente removido. Um método para
então, esse gás é usado para oxidar o restante do
demais moléculas presentes no diesel sofrerão
(MARQUES
utilizando
O benefício do processo Claus é que, na combustão
A) formadores de hidrocarbonetos.
B) produtores de óxidos de nitrogênio.
C) emissores de monóxido de carbono.
D) promotores de acidificação da chuva.
E) determinantes para o aumento do efeito estufa.
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'medium', 'published', 240),
('ENEM-2016.3-Q241', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2016.3 â€” QuÃ­mica â€” QuestÃ£o 241

As emissões de dióxido de carbono (CO>) por veículos
combustível.
Sabe-se que é possível determinar a quantidade
no e do oxigênio, iguais a 12 g/mol e 16 g/mol,
percorreu 600km em um veículo que consome um
Considerando que o conteúdo de carbono em um
emitida pelo veículo no ambiente, durante a viagem
A) 24kg
B) 33kg
C) 40kg
D) 88kg
E) 147Kkg', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'medium', 'published', 241),
('ENEM-2016.3-Q242', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'TermoquÃ­mica', 'multiple_choice', 'ENEM 2016.3 â€” QuÃ­mica â€” QuestÃ£o 242

A obtenção de energia por meio da fissão nuclear
bustão da gasolina.
O calor liberado na fissão do *U é 8 x 10º J/g e na
A massa de gasolina necessária para obter a mesma
A) IC g.
B) 10º g.
Cc) 10º g.
D) 10º g.
E) 10º g.
Questão 243 (20171)
A ozonólise, reação utilizada na indústria madeireira
escala de laboratório na síntese de aldeídos e cetonas.
oxidação com o Ozônio (O;), em presença de água
cetonas, dependendo do grau de substituição da
cetonas, enquanto as ligações duplas terminais ou
mostra o esquema.
O, , H,O
OZ ZOO
Zn
But-1-eno
Considere a ozonólise do composto 1-fenil-2-metilprop-1-eno:
(MARTINO, A, Química,
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'medium', 'published', 242),
('ENEM-2016.3-Q243', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2016, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2016.3 â€” QuÃ­mica â€” QuestÃ£o 243. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'medium', 'published', 243),
('ENEM-2017.1-Q244', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2017, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2017.1 â€” QuÃ­mica â€” QuestÃ£o 244. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'medium', 'published', 244),
('ENEM-2017.1-Q245', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2017, 'SoluÃ§Ãµes e concentraÃ§Ã£o', 'multiple_choice', 'ENEM 2017.1 â€” QuÃ­mica â€” QuestÃ£o 245

Uma das estratégias para conservação de ali-
mentos é o salgamento, adição de cloreto de
sódio (NaCl), historicamente utilizado por tropei-
ros, vaqueiros e sertanejos para conservar car-
nes de boi, porco e peixe.
O que ocorre com as células presentes nos
alimentos preservados com essa técnica?
A) O sal adicionado diminui a concentração de
solutos em Seu interior.
B) O sal adicionado desorganiza e destrói suas
membranas plasmáticas.
C) A adição de sal altera as propriedades de
suas membranas plasmáticas.
D) Os íons Na” e Cl provenientes da dissocia-
ção do sal entram livremente nelas.
E) A grande concentração de sal no meio extra-
celular provoca a saída de água de dentro de-
las.
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'medium', 'published', 245),
('ENEM-2017.1-Q246', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2017, 'EquilÃ­brio quÃ­mico', 'multiple_choice', 'ENEM 2017.1 â€” QuÃ­mica â€” QuestÃ£o 246

Diversos produtos naturais podem ser obtidos
de plantas por processo de extração. O lapachol
é da classe das naftoquinonas. Sua estrutura
apresenta uma hidroxila enólica (pK, = 6,0) que
permite que este composto seja isolado da ser-
ragem dos ipês por extração com solução ade-
quada, seguida de filtração simples. Considere
que pK,., = -log Ka, em que K, é a constante
ácida da reação do lapachol.
delonização
OH
AD
o
Lapachol
(COSTA, P. R. R. et al. Ácidos e bases em química
orgânica Porto Alegre: Bookman, 2005 - adaptado)
Qual solução deve ser usada para extração do
lapacho da serragem do ipê com maior eficiên-
cia?
A) Solução de NasCO;, para formar um sal de
lapachol.
B) Solução-tampão ácido acético/acetato de
sódio (pH = 4,5).
C) Solução de NaCl a fim de aumentar a força
iônica do meio.
D) Solução de Na-SO, para formar um par iôni-
co com lapachol.
E) Solução de HCl a fim de extraí-lo por meio de
reação ácido-base.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'hard', 'published', 246),
('ENEM-2017.1-Q247', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2017, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2017.1 â€” QuÃ­mica â€” QuestÃ£o 247

A técnica do carbono-14 permite a datação de
fósseis pela medição dos valores de emissão
beta desse isótopo presente no fóssil. Para um
ser em vida, o máximo são 15 emissões be-
ta/(min g). Após a morte, a quantidade de "Cc se
reduz a metade a cada 5730 anos.
Considere que um fragmento fóssil de massa
igual a 30 g foi encontrado em um sítio arqueo-
lógico, e a medição de radiação apresentou
6750 emissões beta por hora. A idade desse
fóssil, em anos, é:
A) 450
B) 1433
C) 11460
D) 17190
E) 27000
79', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'medium', 'published', 247),
('ENEM-2017.1-Q248', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2017, 'Estequiometria', 'multiple_choice', 'ENEM 2017.1 â€” QuÃ­mica â€” QuestÃ£o 248

A cromatografia em papel é um método de separação
nentes de uma mistura entre duas fases imiscíveis.
fase estacionária e a fase móvel em movimento no
camente pura, que pode absorver até 22% de água.
onária líquida e que interage com a fase móvel,
tes capazes de formar interações intermoleculares
lentamente.
Uma mistura de hexano com 5% (v/v) de acetona foi
ponentes de um extrato vegetal obtido a partir de
substâncias representadas.
AAA IA
Licopeno
* * * AROS
a-caroteno
CORRA RASA DAS
WWF
7y-caroteno
(RIBEIRO, N.M.; NUNES, C. R. Análise
A substância presente na mistura que migra mais
A) licopeno.
B) a-caroteno.
C) y-caroteno.
D) Capsorubina.
E) a-Criptoxantina.
Questão 249 (20171)
O ácido acetilsalicílico, AAS (massa molar igual a
salicílico (massa molar igual a 138 g/mol) com anidrido
dor, conforme a equação química:
(o) oH
o o
OH PN PN
+ HC Do “eg,
Ácido salicílico Anidrido acético
Após a síntese, o AAS é purificado e o rendimento
dades farmacológicas (antitérmico, analgésico e
como medicamento nas formas de comprimidos,
500mg dessa substância.
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'hard', 'published', 248),
('ENEM-2017.1-Q249', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2017, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2017.1 â€” QuÃ­mica â€” QuestÃ£o 249. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'medium', 'published', 249),
('ENEM-2017.1-Q250', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2017, 'QuÃ­mica orgÃ¢nica', 'multiple_choice', 'ENEM 2017.1 â€” QuÃ­mica â€” QuestÃ£o 250

O ferro é encontrado na natureza na forma de seus
ta (Fe;O,) e a wustita (FeO). Na siderurgia, o
altos fornos em condições adequadas. Uma das
carbono. O CO (gasoso) é utilizado para reduzir o
FeO (s) + CO (g)
Considere as seguintes equações termoquímicas:
Fe,O, (s) + 3 CO (g) — 2 Fe (s) + 3 CO,
3 FeO (s) + CO, (g) — Fe,O, (s) + CO (g)
2 Fe,O, (s) + CO, (g) — 3 Fe,O, (s) + CO
O valor mais próximo de AH, em kJ/mol de FeO,
(gasoso) é:
A)-14.
B)- 17
C) -50
D) -64.
E) -100
Questão 251 (20171)
O biodiesel é um biocombustível obtido a partir de
do diesel de petróleo para motores de combustão
rídeos, presentes em óleos vegetais e gorduras
como o metanol ou etanol, na presença de um
"
CH, O-C-R,
| o
1 j:
CH -O-C-R, + SANA,
3CH,OH
| -
1
CH,-O-C-R,
A função química presente no produto que representa
A) éter.
B) éster.
C) álcool.
D) cetona.
E) ácido carboxílico.
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'hard', 'published', 250),
('ENEM-2017.1-Q251', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2017, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2017.1 â€” QuÃ­mica â€” QuestÃ£o 251. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'medium', 'published', 251),
('ENEM-2017.1-Q252', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2017, 'EletroquÃ­mica', 'multiple_choice', 'ENEM 2017.1 â€” QuÃ­mica â€” QuestÃ£o 252

A eletrólise é um processo não espontâneo de
suas aplicações é a obtenção do gás cloro e do
cloreto de sódio. Nesse procedimento, utiliza-se uma
=
e
COOCOdOÇa. Dx
Ex)
À
Bateria
Cl, (g)
Solução aquosa [6]
de NaCl u
| =
Ánodo de carbono 3
|
=
Diafragma de amianto =
mm
Célula
(Ilustração de SHREVE,
No processo eletrolítico Ilustrado anteriormente, o
A) vapor de água.
B) oxigênio molecular.
C) hipoclorito de sódio.
D) hidrogênio molecular.
E) cloreto de hidrogênio.
Questão 253 (20171)
A invenção do LED azul, que permite a geração de
construção de lânpadas energeticamente mais
fluorescentes. Em um experimento de laboratório,
der um LED azul que requer 3,6 volts para o seu
e seus respectivos potenciais mostrados no quadro.
Semirreação de
Ce (ag) + o — Ce (eq)
Cr,O0, (aq) + 14 H'' (aq) +6 eº — 2
Nº (aq) +20 O Ni(s)
Z6º (aq +20 Zn)
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'hard', 'published', 252),
('ENEM-2017.1-Q253', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2017, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2017.1 â€” QuÃ­mica â€” QuestÃ£o 253. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'medium', 'published', 253),
('ENEM-2017.1-Q254', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2017, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2017.1 â€” QuÃ­mica â€” QuestÃ£o 254. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'medium', 'published', 254),
('ENEM-2017.1-Q255', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2017, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2017.1 â€” QuÃ­mica â€” QuestÃ£o 255. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'medium', 'published', 255),
('ENEM-2017.1-Q256', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2017, 'Propriedades da matÃ©ria', 'multiple_choice', 'ENEM 2017.1 â€” QuÃ­mica â€” QuestÃ£o 256

No ar que respiramos existem os chamados gases
cam “O Novo”, “o Oculto”, “o Inativo”. E de fato são
que não interferem em nenhuma reação química,
tamente por esse motivo ficaram sem ser observados
de longos e engenhosos esforços, conseguiu forçar
mente com o flúor ávido e vivaz, e a façanha pareceu
Nobel.
(LEVI, P. A tabela
Qual propriedade do flúor justifica sua escolha como
A) Densidade.
B) Condutância.
C) Eletronegatividade
D) Estabilidade nuclear
E) Temperatura de ebulição.
novocadernoenem(DQgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'medium', 'published', 256),
('ENEM-2017.1-Q257', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2017, 'QuÃ­mica orgÃ¢nica', 'multiple_choice', 'ENEM 2017.1 â€” QuÃ­mica â€” QuestÃ£o 257

A toxicidade de algumas substâncias é normalmente
letal mediana). Ele representa a dosagem aplicada
ses indivíduos e é normalmente medido utilizando
para os seres humanos, pois, ao se extrapolar os
nar o nível tolerável de contaminação de alimentos,
pelas pessoas. O quadro apresenta três pesticidas
da substância ingerida pela cobaia.
Pesticidas
Malation
Atrazina
Sessenta ratos. Com massa de 200 g cada, foram
ração, contaminadas, cada uma delas com um dos
3 mg por grama de ração, foram administradas para
de ração.
Qual(ais) grupo(s) terá(ão) uma mortalidade mínima
A) O grupo que se contaminou somente com atrazina.
B) O grupo que se contaminou somente com diazinon.
C) Os grupos que se contaminaram com atrazina e
D) Os grupos que se contaminaram com diazinon e
E) Nenhum dos grupos contaminados com atrazina,', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'hard', 'published', 257),
('ENEM-2017.1-Q258', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2017, 'QuÃ­mica inorgÃ¢nica', 'multiple_choice', 'ENEM 2017.1 â€” QuÃ­mica â€” QuestÃ£o 258

Um fato corriqueiro ao se cozinhar arroz é o
ma azul do fogo, mudando-a para uma chama
ções diversas, relacionadas às substâncias presentes
(NaCl), nela se encontram carboidratos, proteínas e
Cientificamente, sabe-se que essa mudança de cor
A) reação do gás de cozinha com o sal, volatilizando
B) emissão de fótons pelo sódio, excitado por causa
C) produção de derivado amarelo, pela reação com
D) reação do gás de cozinha com a água, formando
E) excitação das moléculas de proteínas, com formação', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'medium', 'published', 258),
('ENEM-2017.2-Q259', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2017, 'Radioatividade', 'multiple_choice', 'ENEM 2017.2 â€” QuÃ­mica â€” QuestÃ£o 259

O avanço científico e tecnológico da física nuclear
mento radioativo dos núcleos atômicos instáveis,
de grande penetração no corpo humano, utilizada,
A aplicação citada no texto se refere a qual tipo de
A) Beta.
B) Alfa.
C) Gama.
D) Raios X.
E) Ultravioleta.
novocadernoenem(DQgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'easy', 'published', 259),
('ENEM-2017.2-Q260', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2017, 'QuÃ­mica ambiental', 'multiple_choice', 'ENEM 2017.2 â€” QuÃ­mica â€” QuestÃ£o 260

Muitas indústrias e fábricas lançam para o ar,
através de suas chaminés, poluentes prejudici-
ais às plantas e aos animais. Um desses polu-
entes reage quando em contato com o gás oxi-
gênio no e a água x da atmosfera, confome as
equações químicas:
Equação 1: 2 SO; + O, — 2SO;
" 2: SO; + HO — H/SO,
Equação
De acordo com as equações, a alteração ambi-
ental decorrente da presença desse poluente
intensifica o(a):
A) formação de chuva ácida.
B surgimento de ilha de calor.
o) redução da camada de ozônio.
D) ocorrência de inversão térmica.
E) emissão de gases de efeito estufa.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'medium', 'published', 260),
('ENEM-2017.2-Q261', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2017, 'QuÃ­mica ambiental', 'multiple_choice', 'ENEM 2017.2 â€” QuÃ­mica â€” QuestÃ£o 261

O Conselho Nacional do Meio Ambiente (Co-
nama) estabelece os limites máximos de chum-
bo, cádmio e mercúrio para as familiares pilhas
e baterias portáteis comercializadas no território
nacional e os critérios e padrões para o seu
gerenciamento ambientalmente adequado. Os
estabelecimentos que comercializam esses
produtos, bem como a rede de assistência téc-
nica autorizada, devem receber dos usuários as
pilhas e baterias usadas para repasse aos res-
pectivos fabricantes ou importadores.
(Resolução Conama n. 401, de 4 de novembro de
2008. Disponível em: www.mma.gov.br.
Acesso em: 14 maio 2013 - adaptado)
Do ponto de vista ambiental, a destinação final
apropriada para esses produtos é:
A) direcionar as pilhas e baterias para compos-
tagem.
B) colocar as pilhas e baterias em um coletor de
lixo seletivo.
C) enviar as pilhas e baterias usadas para fir-
mas de recarga.
D) acumular as pilhas e baterias em amazéns
de estocagem.
E) destinar as pilhas e baterias à reutilização de
seus componentes.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'hard', 'published', 261),
('ENEM-2017.2-Q262', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2017, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2017.2 â€” QuÃ­mica â€” QuestÃ£o 262

A bauxita, composta por cerca de 50% de AlzO;,
é o mais importante minério de alumínio. As
seguintes etapas são necessárias para a obten-
ção de alumínio metálico:
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'easy', 'published', 262),
('ENEM-2017.2-Q263', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2017, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2017.2 â€” QuÃ­mica â€” QuestÃ£o 263

O ferro metálico é obtido em altos-fornos pela
mistura do minério hematita (a-Fe,O;3) contendo
impurezas, coque (C) e calcário (CaCO;z), sendo
estes mantidos sob um fluxo de ar quente que
leva à queima do coque, com a temperatura no
alto-forno chegando próximo a 2000ºC. As eta-
pas caracterizam o processo em função da
temperatura.
Entre 200ºC e 700ºC:
3 FezO; + CO — 2 Fe3O, + CO,
CaCO; — CaO + CO,
FezO, + CO — 3 FeO + CO,
Entre 700ºC e 1200ºC:
C + CO, —2CO0
FeO + CO — Fe + CO,
Entre 1200ºC e 2000ºC:
Ferro impuro se funde
Formação de escória fundida (CaSiO;)
2C+0,> CO
(BROWN, T. L.; LEMAY, H. E.; BURSTEN, B. E.
Química: a ciência central. São Paulo:
Pearson Education, 2005 - adaptado)
No processo de redução desse metal, o agente
redutor é o:
AJC.
B) CO.
C) CO;
D) CaO.
E) CaCO;.
86', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'hard', 'published', 263),
('ENEM-2017.2-Q264', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2017, 'QuÃ­mica ambiental', 'multiple_choice', 'ENEM 2017.2 â€” QuÃ­mica â€” QuestÃ£o 264

As lâmpadas fluorescentes apresentam vanta-
gens como maior eficiência luminosa, vida útil
mais longa e redução do consumo de energia.
Contudo, um dos constituintes dessas lâmpadas
é o mercúrio, que apresenta sérias restrições
ambientais em função de sua toxicidade.
Dessa forma, as lâmpadas fluorescentes devem
passar por um processo prévio de descontami-
nação antes do descarte ou reciclagem do ma-
terial.
O ideal é que nesse processo se tenha o menor
impacto ambiental e, se possível, o mercúrio
recuperado e empregado em novos produ:
seja
(DURÃO JR., W.A.; WINDMOLLER, C. C. A questão
do mercúrio em lâmpadas fluorescentes. Química
Nova na Escola, n. 28, 2008 - adaptado)
Considerando os impactos ambientais negati-
vos, o processo menos indicado de desconta-
minação desse metal presente nas lâmpadas
seria o(a):
A) encapsulamento, no qual as lâmpadas são
trituradas por via seca ou úmida, o material re-
sultante é encapsulado em concreto e a dispo-
sição final do resíduo é armazenada em aterros.
B) lixiviação ácida, com a dissolução dos resí-
duos sólidos das lânpadas em ácido (HNO;),
seguida de filtração e neutralização da solução
para recuperar os compostos de mercúrio.
C) incineração, com a oxidação das lâmpadas
junto com o lixo urbano em altas temperaturas,
com redução do material sólido e lançamento
dos gases e vapores para a atmosfera.
D) processo térmico, no qual o resíduo é aque-
cido em sistema fechado para vaporizar o mer-
cúrio e em seguida ocorre o resfriamento para
condensar o vapor e obter o mercúrio elemen-
tar.
E) separação por via química, na qual as lâm-
padas são trituradas em sistema fechado, em
seguida aditivos químicos são adicionados para
precipitação e separação do mércurio.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'hard', 'published', 264),
('ENEM-2017.2-Q265', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2017, 'QuÃ­mica orgÃ¢nica', 'multiple_choice', 'ENEM 2017.2 â€” QuÃ­mica â€” QuestÃ£o 265

Em algumas regiões brasileiras, é comum se
encontrar um animal com odor característico, o
zorrilho. Esse odor serve para a proteção desse
animal, afastando seus predadores.
Um dos feromônios responsáveis por esse odor
é uma substância que apresenta isomeria trans
e um grupo tiol ligado à sua cadeia.
A estrutura desse feromônio, que ajuda na pro-
teção do zorrilho, é:
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'medium', 'published', 265),
('ENEM-2017.2-Q266', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2017, 'QuÃ­mica ambiental', 'multiple_choice', 'ENEM 2017.2 â€” QuÃ­mica â€” QuestÃ£o 266

No Brasil, os postos de combustíveis comercia-
lizavram uma gasolina com cerca de 22% de
álcool anidro.
Na queima de 1 litro desse combustível são
liberados cerca de 2 kg de CO, na atmosfera. o
plantio de árvores pode atenuar os efeitos des-
sa emissão de CO,.
A quantidade de carbono fixada por uma árvore
corresponde a aproximadamente 50% de sua
biomassa seca, e para cada 12 g de carbono
fixados, 44 g de CO, são retirados da atmosfera.
No Brasil, o plantio de eucalipto (Eucalyptus
grandis) é bem difundido, sendo que após 11
anos essa árvore pode ter a massa de 106 kg,
dos quais 29 kg são água.
Uma única árvore de Eucalyptus grandis, com
as características descritas, é capaz de fixar a
quantidade de CO, liberada na queima de um
volume dessa gasolina mais próximo de:
A) 19L.
B) 39 L.
C)7IL
D) 97 L.
E) 141 L.
87', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'hard', 'published', 266),
('ENEM-2017.2-Q267', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2017, 'SoluÃ§Ãµes e concentraÃ§Ã£o', 'multiple_choice', 'ENEM 2017.2 â€” QuÃ­mica â€” QuestÃ£o 267

A horticultura tem sido recomendada para a agricultura
escassez de processos compatíveis para conservar
tação osmótica, tem se mostrado uma alternativa
boas condições de armazenamento e qualidade
(GOMES, A. T.; CEREDA, M. P.; VILPOUX, O. Desidratação
volvimento da agricultura familiar. Revista Brasileira de
Esse processo para conservar os alimentos remove
A) aumento do ponto de ebulição do solvente.
B) passagem do soluto através de uma membrana
C) utilização de solutos voláteis, que facilitam a
D) aumento da volatilidade do solvente pela adição
E) pressão gerada pela diferença de concentração', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'medium', 'published', 267),
('ENEM-2017.2-Q268', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2017, 'QuÃ­mica orgÃ¢nica', 'multiple_choice', 'ENEM 2017.2 â€” QuÃ­mica â€” QuestÃ£o 268

A absorção e o transporte de substâncias tóxicas
estas se difundem através das membranas das células.
testes laboratoriais empregam o octan-1-0l como
ser testada é adicionada a uma mistura bifásica do
dido o coeficiente de partição octan-1-ol:água (K.a):
Ko oa = =
Em que Co: É a concentração da substância na fase
na fase aquosa. Foram avaliados cinco poluentes de
fluorobutano e metanol.
O poluente que apresentou K,.. tendendo a zero é o:
A) éter dietílico.
B) fluorobutano.
C) benzeno.
D) metanol.
E) butano.
Questão 269 (20172)
Os polímeros são materiais amplamente utilizados
embalagens e filmes plásticos, por exemplo. Na
nômeros usados na produção de polímeros de adição
HC =
o ns
HC Cc!
H,N
Acrilamida Cloreto de vinila Estireno
(cloropropeno)
Dentre os homopolímeros formados a partir dos
em água é:
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'hard', 'published', 268),
('ENEM-2017.2-Q269', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2017, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2017.2 â€” QuÃ­mica â€” QuestÃ£o 269. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'medium', 'published', 269),
('ENEM-2017.2-Q270', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2017, 'Estequiometria', 'multiple_choice', 'ENEM 2017.2 â€” QuÃ­mica â€” QuestÃ£o 270

Os combustíveis de origem fóssil, como o petróleo
devido à liberação de dióxido de carbono durante
Massas molares e as reações de combustão não
| combustivel | Massa molar (g/mol)
een o
ETNNEBBTTTIEITIA
Considerando a combustão completa de 58 g de
tância que emite mais CO, é o:
A) etano.
B) butano.
C) metano.
D) propano.
E) acetileno.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'medium', 'published', 270),
('ENEM-2017.2-Q271', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2017, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2017.2 â€” QuÃ­mica â€” QuestÃ£o 271

Pesquisadores avaliaram a qualidade da água potável
substâncias encontradas, destacam-se as apresentadas
pode ser verificada por análises químicas, como uma
de sódio.
N fe) [9
Mn .”
N
A
+ AO
À
/ Z
NAO
Cafeína Atrazina
COOL
Benzo[a]pireno
(Disponível
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'easy', 'published', 271),
('ENEM-2017.2-Q272', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2017, 'EquilÃ­brio quÃ­mico', 'multiple_choice', 'ENEM 2017.2 â€” QuÃ­mica â€” QuestÃ£o 272

Sabendo-se que as enzimas podem ter sua atividade
e pH, foi realizado um experimento para testar as
enzima.
Os resultados estão apresentados no gráfico.
o
E
Ns
>
o
[)
ie)
o
ke]
[)
*
É
ê
10ºC, pH<7 20 ºC, pH<7 30 ºC, pH<7
Em relação ao funcionamento da enzima, os resultados
A) aumento do pH leva a um a atividade maior da
B) temperatura baixa (10 ºC) é o principal inibidor da
C) ambiente básico reduz a quantidade de enzima
D) ambiente básico reduz a quantidade de substrato
E) temperatura ótima de funcionamento da enzima é', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'medium', 'published', 272),
('ENEM-2017.2-Q273', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2017, 'EquilÃ­brio quÃ­mico', 'multiple_choice', 'ENEM 2017.2 â€” QuÃ­mica â€” QuestÃ£o 273

Alguns profissionais burlam a fiscalização quando
sa de hidróxido de sódio a tambores de leite de validade
de ácido lático, encontra-se na faixa permitida pela
zado. A reação entre o hidróxido de sódio e o ácido
CH;CH(OH)COOH (aq) + NaOH (aq)
A consequência dessa adulteração é o(a):
A) aumento do pH do leite.
B) diluição significativa do leite.
C) precipitação do lactato de sódio.
D) diminuição da concentração de sais.
E) aumento da concentração dos íons H*.
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'medium', 'published', 273),
('ENEM-2017.2-Q274', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2017, 'QuÃ­mica orgÃ¢nica', 'multiple_choice', 'ENEM 2017.2 â€” QuÃ­mica â€” QuestÃ£o 274

O hidrocarboneto representado pela estrutura química
das flores de determinadas plantas. Além disso, sua
perfil de insaturações.
Considerando esse perfil específico, quantas ligações
AJ
B) 2
c)4
D)6
E)7', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'easy', 'published', 274),
('ENEM-2018.1-Q275', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2018, 'QuÃ­mica orgÃ¢nica', 'multiple_choice', 'ENEM 2018.1 â€” QuÃ­mica â€” QuestÃ£o 275

Pesquisas demonstram que nanodisposiítivos baseados
dos por luz, poderão ter aplicações em tecnologias
de de componentes mecânicos. Exemplo de movimento
pela flexão de uma lâmina delgada de silício, ligado
porte, em dois comprimentos de onda, conforme
reações reversíveis da cadeia do polímero, que
+
e 365 nm
o ——
Ao x
x Y ;
ARE. Ar
í Fe
e: |
AP ho ã
420 nm
>:
(TOMA, H. E. A nanotecnologia das moléculas.
O fenômeno de movimento molecular, promovido pela
A) movimento vibracional dos átomos, que leva ao
B) isomerização das ligações N=N, sendo a forma cis
C) tautomerização das unidades monoméricas do
D) ressonância entre os elétrons tt do grupo azo e os
E) variação conformacional das ligações N=N, que
fície.
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'hard', 'published', 275),
('ENEM-2018.1-Q276', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2018, 'TermoquÃ­mica', 'multiple_choice', 'ENEM 2018.1 â€” QuÃ­mica â€” QuestÃ£o 276

O carro flex é uma realidade no Brasil. Estes
veículos estão equipados com motor que tem a
capacidade de funcionar com mais de um tipo
de combustível. No entanto, as pessoas que
têm esse tipo de veículo, na hora do abasteci-
mento, têm sempre a dúvida: álcool ou gasoli-
na? Para avaliar o consumo desses combustí-
veis, realizou-se um percurso com um veículo
flex, consumindo 40 litros de gasolina e no per-
curso de volta utilizou-se etanol. Foi considera-
do o mesmo consumo de energia tanto no per-
curso de ida quanto no de volta.
O quadro resume alguns dados aproximados
sobre esses combustíveis.
Densidade Calor de
| Etano | og | 8 |
O volume de etanol combustível, em litro, con-
sumido no percurso de volta é mais próximo de:
A) 27.
B) 32.
c) 37.
D) 58.
E) 67.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'hard', 'published', 276),
('ENEM-2018.1-Q277', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2018, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2018.1 â€” QuÃ­mica â€” QuestÃ£o 277

A identificação de riscos de produtos Perigosos
Í
para o transporte rodoviário é obrigatória e rea-
lizada por meio da sinalização composta por um
painel de segurança, de cor alaranjada, e um
rótulo de risco. As informações inseridas no
painel de segurança e no rótulo de risco, con-
forme determina a legislação, permitem que se
identifique o produto transportado e os perigos a
ele associados.
A sinalização mostrada identifica uma substân-
cia que está sendo transportada em um cami-
nhão.
-
268
GÁS
1 005
TÓXICO
2
Os três algarismos da parte superior do painel
indicam o “Número de risco”. O número 268
indica tratar-se de um gás (2), tóxico (6) e cor-
rosivo (8). Os quatro dígitos da parte inferior
correspondem ao “Número ONU”, que identifica
o produto transportado.
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'hard', 'published', 277),
('ENEM-2018.1-Q278', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2018, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2018.1 â€” QuÃ­mica â€” QuestÃ£o 278. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'medium', 'published', 278),
('ENEM-2018.1-Q279', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2018, 'Propriedades da matÃ©ria', 'multiple_choice', 'ENEM 2018.1 â€” QuÃ­mica â€” QuestÃ£o 279

Usando um densímetro cuja menor divisão da
escala, isto é, a diferença entre duas marcações
consecutivas, é de 5,0 x 10? em?, um estudante
realizou um teste de densidade: colocou este
instrumento na água pura e observou que ele
atingiu o repouso na posição mostrada.
Legenda:
Densímetro
Água
Em dois outros recipientes A e B contendo 2
litros de água pura, em cada um, ele adicionou
100g e 200g de NaCl, respectivamente.
Quando o cloreto de sódio é adicionado à água
pura seia dissociação formando os íons
Naã''e er. Considere que esses íons ocupam 05
espaços intermoleculares na solução.
Nestes recipientes, a posição de equilíbrio do
"o 1 ne
densímetro está representada em: D)
A B
À
A B
B)
A B
e
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'hard', 'published', 279),
('ENEM-2018.1-Q280', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2018, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2018.1 â€” QuÃ­mica â€” QuestÃ£o 280

||| Questão 280 (2018.1) (20T8.1)
Mento vermelho para Clntaras de quadros é
murais. Esse pigmento, conhecido como vermi-
lion, escurece com o passar dos anos, fenôme-
no cuja origem é alvo de pesquisas. Aventou-se
a hipótese de que o vermilion seja decomposto
sob a ação da luz, produzindo uma fina camada
de mercúrio metálico na superfície. Essa reação
seria catalisada por íon cloreto presente na
umidade do ar.
(WOGAN, T. Mercury''s Dark Influence on Art.
Disponível em: www.chemistryworld.com.
Acesso em: 26 abr. 2018 - adaptado)
Segundo a hipótese proposta, o íon cloreto atua
na decomposição fotoquímica do vermilion:
A) reagindo como agente oxidante.
B) deslocando o equilíbrio químico.
C) diminuindo a energia de ativação.
D) precipitando cloreto de mercúrio.
E) absorvendo a energia da luz visível.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'hard', 'published', 280),
('ENEM-2018.1-Q281', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2018, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2018.1 â€” QuÃ­mica â€” QuestÃ£o 281

Na mitologia grega, Nióbia era a filha de Tânta-
lo, dois personagens conhecidos pelo sofrimen-
to. O elemento químico de número atômico (Z)
igual a 41 tem propriedades químicas e físicas
tão parecidas com as do elemento de número
atômico 73 que chegaram a ser confundidos.
Por isso, em homenagem a esses dois perso-
nagens da mitologia grega, foi conferido a esses
elementos os nomes de nióbio (Z = 41) e tântalo
(Z = 73). Esses dois elementos químicos adqui-
riram grande importância econômica na meta-
lurgia, na produção de supercondutores e em
outras aplicações na indústria de ponta, exata-
mente pelas propriedades químicas e físicas
comuns aos dois.
93', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'medium', 'published', 281),
('ENEM-2018.1-Q282', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2018, 'BioquÃ­mica', 'multiple_choice', 'ENEM 2018.1 â€” QuÃ­mica â€” QuestÃ£o 282

Companhias que fabricam jeans usam cloro
para o clareamento, seguido de lavagem. Algu-
mas estão substituindo o cloro por substâncias
ambientalmente mais seguras como peróxidos,
que podem = degradados por enzimas cha-
madas peroxidases. Pensando nisso, pesquisa-
dores inseriram genes codificadores de peroxi-
dases em leveduras cultivadas nas condições
de clareamento e lavagem dos jeans e selecio-
naram as sobreviventes para produção dessas
roRTORA
,G.J; G. J.; FUNKE, ,B.R; B. R.; CASE, , C. C. L. L. Mi Micro-
biologia. Rio de Janeiro: Artmed, 2016 - adaptado)
Nesse caso, o uso dessas leveduras modifica-
das objetiva:
A) reduzir a quantidade de resíduos tóxicos nos
efluentes da lavagem.
B) eliminar a necessidade de tratamento da
água consumida.
" elevar a capacidade de clareamento dos
jeans.
D) aumentar a resistência do jeans a peróxidos.
E) associar ação bactericida ao clareamento.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'hard', 'published', 282),
('ENEM-2018.1-Q283', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2018, 'QuÃ­mica orgÃ¢nica', 'multiple_choice', 'ENEM 2018.1 â€” QuÃ­mica â€” QuestÃ£o 283

A hidroxilamina (NHOH) é extremamente reati-
va em reações de substituição nucleofílica, justi-
ficando sua utilização em diversos processos. À
reação de substituição nucleofílica entre o ani-
drido acético e a hidroxilamina está representa-
da.
À À NH,
ow * o ?
a Us Produto À
o” epa
Anidrido o o
acético A + A DAL
”
Y
H
Produto B
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'medium', 'published', 283),
('ENEM-2018.1-Q284', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2018, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2018.1 â€” QuÃ­mica â€” QuestÃ£o 284. O enunciado e as alternativas estÃ£o na imagem original abaixo.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'medium', 'published', 284),
('ENEM-2018.1-Q285', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2018, 'EquilÃ­brio quÃ­mico', 'multiple_choice', 'ENEM 2018.1 â€” QuÃ­mica â€” QuestÃ£o 285

Células solares à base de TiO, sensibilizadas
por corantes (S) são promissoras e poderão vir
a substituir as células de silício. Nessas células,
o corante adsorvido sobre o TiO, é responsável
por absorver a energia luminosa (hv), e o coran-
te excitado (S*) é capaz de transferir elétrons
para o TiO,. Um esquema dessa célula e os
processos envolvidos estão ilustrados na figura.
A conversão de energia solar em elétrica ocorre
por meio da sequência de reações apresenta-
das na sequência.
94', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'medium', 'published', 285),
('ENEM-2018.1-Q286', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2018, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2018.1 â€” QuÃ­mica â€” QuestÃ£o 286

Alguns materiais sólidos são compostos por átomos
dem ser covalentes, iônicas ou metálicas. A figura
da distância interatômica em um sólido cristalino.
ra de zero kelvin, a distância de equilíbrio da ligação
de energia potencial. Acima dessa temperatura, a
energia cinética e faz com que eles oscilem em torno
os), que é diferente para cada temperatura. A distância
linhas horizontais, identificadas com o valor da
o
Ev]
FA
=D
R o
80
7
E) i
fe)
é [| AO
| (OZ
&
WA
TZ T
T=0K
O deslocamento observado na distância média revela
A)ionização.
B) dilatação.
C) dissociação.
D) quebra de ligações covalentes.
E) formação de ligações metálicas.
novocadernoenem(DQgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'medium', 'published', 286),
('ENEM-2018.1-Q287', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2018, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2018.1 â€” QuÃ­mica â€” QuestÃ£o 287

Tensoativos são compostos orgânicos que possuem
regiões, uma hidrofóbica e outra hidrofílica. O principal
1940 e teve grande aceitação no mercado de
ao do sabão. No entanto, o uso desse produto
resistência à degradação biológica, por causa dos
porção hidrofóbica desse tensoativo aniônico. As
levando à persistência no melo ambiente por longos
dos países por tensoativos biodegradáveis, ou seja,
(PENTEADO,
uma abordagem
Qual a fórmula estrutural do tensoativo persistente no
n MED on
15 20
SO, Na*
To
|
SO, Na*
? SPTTTTTSS
NOIS DOCDÔEAN
E)', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'medium', 'published', 287),
('ENEM-2018.1-Q288', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2018, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2018.1 â€” QuÃ­mica â€” QuestÃ£o 288

As abelhas utilizam a sinalização química para
zes de reconhecer diferenças entre moléculas. A
ácido 9-hidroxidec-2-enoico, enquanto as
Nós podemos distinguir as abelhas-operárias e rainhas
sinalização química para perceber a diferença. Pode-se
(LE COUTEUR, R;
que mudaram
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'easy', 'published', 288),
('ENEM-2018.1-Q289', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2018, 'EquilÃ­brio quÃ­mico', 'multiple_choice', 'ENEM 2018.1 â€” QuÃ­mica â€” QuestÃ£o 289

O manejo adequado do solo possibilita a manu-
tenção de sua fertilidade à medida que as trocas
de nutrientes entre matéria orgânica, água, solo
e o ar são mantidas para garantir a produção.
Algumas espécies iônicas de alumínio são tóxi-
cas, não só para a planta, mas para muitos or-
ganismos como as bactérias responsáveis pelas
transformações no ciclo do nitrogênio. O alumíi-
nio danifica as membranas das células das raí-
zes e restringe a expansão de suas paredes,
com isso, a planta não cresce adequadamente.
Para promover benefícios para a produção agrí-
cola, é recomendada a remediação do solo utili-
zando calcário (CaCO;).
(BRADY, N. C.; WEIL, R. R. Elementos da natureza
e propriedades dos solos. Porto Alegre:
Bookman, 2013 - adaptado)
Essa remediação promove no solo o(a):
AA) diminuição do pH, deixando-o fértil.
B) solubilização do alumínio, ocorrendo sua
lixiviação pela chuva.
C) interação do íon cálcio com o íon alumínio,
produzindo uma liga metálica.
D) reação do carbonato de cálcio com os íons
alumínio, formando alumínio metálico.
E) aumento da sua alcalinidade, tomando os
íons alumínio menos disponíveis.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'hard', 'published', 289),
('ENEM-2018.1-Q290', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2018, 'QuÃ­mica orgÃ¢nica', 'multiple_choice', 'ENEM 2018.1 â€” QuÃ­mica â€” QuestÃ£o 290

O petróleo é uma fonte de energia de baixo
custo e de larga utilização como matéria-prima
para uma grande variedade de produtos. É um
óleo formado de várias substâncias de origem
orgânica, em sua maioria hidrocarbonetos de
diferentes massas molares. São utilizadas téc-
nicas de separação para obtenção dos compo-
nentes comercializáveis do petróleo. Além dis-
so, para aumentar a quantidade de frações co-
mercializáveis, otimizando o produto de origem
fóssil, utiliza-se o processo de craqueamento.
O que ocorre nesse processo?
A) Transformação das frações do petróleo em
outras moléculas menores.
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'medium', 'published', 290),
('ENEM-2018.1-Q291', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2018, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2018.1 â€” QuÃ­mica â€” QuestÃ£o 291

O grafeno é uma forma alotrópica do carbono
constituído por uma folha planar (arranjo bidi-
mensional) de átomos de carbono compactados
e com a espessura de apenas um átomo. Sua
estrutura é hexagonal, conforme a figura.
o o o o o o
? ? ? ? ? ? ?
O fe o f. fe o o
o? ? O x. o . Y. o?
es sd p à o ps PS 8
o . Q o o . .
N"
d à d à 2 d
o " " o ” "
Nesse arranjo, os átomos de carbono possuem
" 4
hibridação:
A) sp de geometria Usa
B) sp“ de geometria trigonal planar.
C) sp? alternados com carbonos com hibridação
sp de geometria linear.
D) sp d de geometria planar.
E) sp''d'' com geometria hexagonal planar.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'hard', 'published', 291),
('ENEM-2018.1-Q292', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2018, 'QuÃ­mica ambiental', 'multiple_choice', 'ENEM 2018.1 â€” QuÃ­mica â€” QuestÃ£o 292

O alemão Fritz Haber recebeu o Prêmio o Nobel
de química de 1918 pelo desenvolvimento de
um processo viável para a síntese da amônia
(NH3). Em seu discurso de premiação, Haber
justificou a importância do feito dizendo que:
“Desde a metade do século passado, tornou-se
conhecido que um suprimento de nitrogênio é
uma necessidade básica para o aumento das
safras de alimentos; entretanto, também se
sabia que as plantas não podem absorver o
nitrogênio em sua forma simples, que é o princi-
pal constituinte da atmosfera. Elas precisam que
o nitrogênio seja combinado [...] para poderem
assimilá-lo.
Economias agrícolas basicamente mantêm o
balanço do nitrogênio ligado. No entanto, com o
advento da era industrial, os produtos do solo
são levados de onde cresce a colheita para
lugares distantes, onde são consumidos, fazen-
do com que o nitrogênio ligado não retorne à
terra da qual foi retirado.
97', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'hard', 'published', 292),
('ENEM-2018.2-Q293', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2018, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2018.2 â€” QuÃ­mica â€” QuestÃ£o 293

As soluções de hipoclorito de sódio têm ampla
aplicação como desinfetantes e alvejantes. Em
uma empresa de limpeza, o responsável pela
área de compras deve decidir entre dois fome-
cedores que têm produtos similares, mas com
diferentes teores de cloro.
Um dos fornecedores vende baldes de 10kg de
produto granulado, contendo 65% de cloro ativo,
a um custo de R$ 65,00. Outro fornecedor ofe-
rece, a um custo de R$ 20,00, bombonas de
50kg de produto líquido contendo 10% de cloro
ativo.
Considerando apenas o quesito preço por kg de
cloro ativo e desprezando outras variáveis, para
cada bombona de 5Okg haverá uma economia
de:
A) R$ 4,00.
B) R$ 6,00.
C) R$ 10,00.
D) R$ 30,00.
E) R$ 45,00.
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'hard', 'published', 293),
('ENEM-2018.2-Q294', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2018, 'QuÃ­mica inorgÃ¢nica', 'multiple_choice', 'ENEM 2018.2 â€” QuÃ­mica â€” QuestÃ£o 294

Em derramamentos de óleo no mar, os produtos
conhecidos como “dispersantes" são usados
para reduzir a tensão superficial do petróleo
derramado, permitindo que o vento e as ondas
“quebrem” a mancha em gotículas microscópi-
cas. Estas são dispersadas pela água do mar
antes que a mancha de petróleo atinja a costa.
N. a tentativa ; de fazer uma reprodução " do efeito ;
d esse produto dute em casa, um es tudante prep: prepara
um recipiente contendo agua e gotas de óleo de
soja. Há disponível apenas azeite, vinagre, de-
tergente, água 2 sanitária . e sal de cozinha. ;
Qual dos materiais disponíveis provoca uma
ação semelhante à situação descrita?
A) Azeite.
B) Vinagre.
C) Detergente.
D) Água sanitária.
E) Sal de cozinha.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'hard', 'published', 294),
('ENEM-2018.2-Q295', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2018, 'Radioatividade', 'multiple_choice', 'ENEM 2018.2 â€” QuÃ­mica â€” QuestÃ£o 295

O terremoto e o tsunami ocorridos no Japão em
11 de março de 2011 romperam as paredes de
isolamento de alguns reatores da usina nuclear
de Fukushima, o que ocasionou a liberação de
substâncias radioativas. Entre elas está o
iodo-131, cuja presença na natureza está limita-
da por sua meia-vida de oito dias. O tempo es-
timado para que esse material se desintegre até
atingir 1/16 da sua massa inicial é de:
A) 8 dias.
B) 16 dias.
C) 24 dias.
D) 32 dias.
E) 128 dias.
CR E E', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'medium', 'published', 295),
('ENEM-2018.2-Q296', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2018, 'Radioatividade', 'multiple_choice', 'ENEM 2018.2 â€” QuÃ­mica â€” QuestÃ£o 296

o elemento radioativo tório (Th) pode substituir
1 o
os combustíveis fósseis e baterias. Pequenas
quantidades desse elemento seriam suficientes
para gerar grande quantidade de energia. À
partícula liberada em seu decaimento poderia
ser bloqueada utilizando-se uma caixa de aço
inoxidável. A equação nuclear para o decaimen-
to do 239Th é:
290: 226 + " + :
Th s:Ra partícula energia
Considerando a equação de decaimento nucle-
ar, a partícula que fica bloqueada na caixa de
aço inoxidável é o(a):
A) alfa.
B) beta.
C) próton.
D) nêutron.
E) pósitron.
98', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'medium', 'published', 296),
('ENEM-2018.2-Q297', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2018, 'Estequiometria', 'multiple_choice', 'ENEM 2018.2 â€” QuÃ­mica â€” QuestÃ£o 297

Pesquisadores desenvolveram uma nova e mais
vastatina, empregada para reduzir os níveis de
berta, a síntese da atorvastatina cálcica (CaCesHesgF2N4O10,
a partir do éster 4-metil-3-oxopentanoato de metila
(Unicamp descobre nova rota para produzir medicamento
Considere o rendimento global de 20% na síntese
porção de 1 : 1. Simplificadamente, o processo é
[” " 11 etapas de síntese
ZU T—— >
o Rendimento global
de 20%
Disponível em:
Considerando o processo descrito, a massa, em
do éster é mais próxima de:
A) 20.
B) 29.
C) 160.
D) 202.
E) 231.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'medium', 'published', 297),
('ENEM-2018.2-Q298', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2018, 'EquilÃ­brio quÃ­mico', 'multiple_choice', 'ENEM 2018.2 â€” QuÃ­mica â€” QuestÃ£o 298

O aproveitamento integral e racional das matérias-primas
de segmentos industriais, tais como o de combustíveis,
geração. Este processo requer um tratamento prévio
rais diluídos. No pré-tratamento de material lignocelulósico
ácido sulfúrico, que foi preparada diluindo-se 2000
ção igual a 98 g/L, ocorrendo dissociação total do
res aproximados de logaritmos decimais.
(Disponível
Sabendo-se que as massas molares, em g/mol, dos
1, 16 e 32, qual é o pH da solução diluída de ácido
A) 2,6
B) 3,0
c)3,2
D) 3,3
E) 3,6
novocadernoenem(DQgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'medium', 'published', 298),
('ENEM-2018.2-Q299', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2018, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2018.2 â€” QuÃ­mica â€” QuestÃ£o 299

A figura apresenta um processo alternativo para
as folhas da cana-de-açúcar. Suas principais etapas
LAVAGEM DO
SAÍDA BAGAÇO
&
CANA ENTRADA DOBAGAÇO. (2)
BEN ABS
patas o. 4 Ás =
| | PET
fio * E -
3 ó
VV 3
MOAGEM DA HIDRÓLISE DA
CANA CELULOSE
(Disponível em:
Em qual etapa ocorre a síntese desse combustível?
AJ B)2 oc)3', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'medium', 'published', 299),
('ENEM-2018.2-Q300', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2018, 'Estequiometria', 'multiple_choice', 'ENEM 2018.2 â€” QuÃ­mica â€” QuestÃ£o 300

Objetos de prata sofrem escurecimento devido à
seu brilho característico quando envoltos por papel
água quente e sal de cozinha. A reação não balanceada
Ag,S (s) + Al (s) —
Dados da massa molar dos elementos (g mor”):
(UCKO, D. A.
Utilizando o processo descrito, a massa de prata
to que contém 2,48 g de Ag,S é:
A) O,54 g.
B) 1,08 g.
Cc) 1,919.
D) 2,16 g.
E) 3,82 g.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 3, null, 'medium', 'published', 300),
('ENEM-2018.2-Q301', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2018, 'EquilÃ­brio quÃ­mico', 'multiple_choice', 'ENEM 2018.2 â€” QuÃ­mica â€” QuestÃ£o 301

O suco de repolho-roxo pode ser utilizado como
basta misturar um pouco desse suco à solução
cadora de pH, com valores de 1 a 14, mostrada a
1 2 3 4 5 6 FT
[eme TO Fes — [O
Utilizando-se o indicador ácido-base e a escola para
trico, têm-se, respectivamente, as cores:
A) vermelha e vermelha.
B) vermelha e azul.
C) rosa e roxa.
D) roxa e amarela.
E) roxa e vermelha.
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'medium', 'published', 301),
('ENEM-2018.2-Q302', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2018, 'QuÃ­mica orgÃ¢nica', 'multiple_choice', 'ENEM 2018.2 â€” QuÃ­mica â€” QuestÃ£o 302

O ácido acetilsalicílico é um analgésico que
pode ser obtido pela reação de esterificação do
ácido salicílico. Quando armazenado em condi-
ções de elevadas temperaturas e umidade,
ocorrem mudanças físicas e químicas em sua
estrutura, gerando um odor característico. À
figura representa a fórmula estrutural do ácido
acetilsalicílico.
O O H
O
O
Ácido acetilsalicílico
Esse odor é provocado pela liberação de:
A) etanol.
B) etanal.
C) ácido etanoico.
D) etanoato de etila.
E) benzoato de etila.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 2, null, 'medium', 'published', 302),
('ENEM-2018.2-Q303', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2018, 'QuÃ­mica orgÃ¢nica', 'multiple_choice', 'ENEM 2018.2 â€” QuÃ­mica â€” QuestÃ£o 303

Na hidrogenação parcial de óleos vegetais, efe-
tuada pelas indústrias alimentícias, ocorrem
processos paralelos que conduzem à conversão
das gorduras cis e trans. Diversos estudos têm
sugerido uma relação direta entre os ácidos
graxos trans e o aumento do risco de doenças
vasculares.
(RIBEIRO, A.P.B.et al. interesterificação química:
alternativa para obtenção de gorduras zero e trans.
Química Nova, n. 5, 2007 - adaptado)
Qual tipo de reação quimica a indústria alimen,
; " tm indíetria al
tícia deve evitar minimizar a obtenção des-
para
ses subprodutos?
A) Adição.
e
B) Ácido-base.
C) Substituição.
D) Oxirredução.
E) Isomerização.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'medium', 'published', 303),
('ENEM-2018.2-Q304', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2018, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2018.2 â€” QuÃ­mica â€” QuestÃ£o 304

As indústrias de cerâmica utilizam argila para
produzir artefatos como tijolos e telhas. Uma
amostra de argila contém 45% em massa de
sílica (SiO)) e 10% em massa de água (H;O).
novocadernoenem(DQgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 1, null, 'easy', 'published', 304),
('ENEM-2018.2-Q305', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2018, 'QuÃ­mica orgÃ¢nica', 'multiple_choice', 'ENEM 2018.2 â€” QuÃ­mica â€” QuestÃ£o 305

Várias características e propriedades de molé-
culas orgânicas podem ser inferidas analisando
sua fórmula estrutural. Na natureza, alguns
compostos apresentam a mesma fórmula mole-
cular e diferentes fórmulas estruturais. São os
chamados isômeros, como ilustrado nas estrutu-
ras.
() (o)
Uh
OH OH
v
ê
—
OH OH
Entre as moléculas apresentadas, observa-se a
ocorrência de isomeria:
A) ótica. Ú
B) de função.
C) de cadeia.
D) geométrica.
E) de compensação.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'medium', 'published', 305),
('ENEM-2018.2-Q306', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2018, 'TermoquÃ­mica', 'multiple_choice', 'ENEM 2018.2 â€” QuÃ­mica â€” QuestÃ£o 306

Bebidas podem ser refrigeradas de modo mais
rápido utilizando-se caixas de isopor contendo
gelo e um pouco de sal grosso comercial. Nesse
processo ocorre o derretimento do gelo com
consequente formação de líquido e resfriamento
das bebidas. Uma interpretação equivocada,
baseada no senso comum, relaciona esse efeito
à grande capacidade do sal grosso de remover
calor do gelo.
Do ponto de vista científico, o resfriamento rápi-
do ocorre em razão da:
A) variação da solubilidade do sal.
B) alteração da polaridade da água.
C) elevação da densidade do líquido.
D) modificação da viscosidade do líquido.
E) diminuição da temperatura de fusão do líqui-
do.
101', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'medium', 'published', 306),
('ENEM-2018.2-Q307', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2018, 'QuÃ­mica inorgÃ¢nica', 'multiple_choice', 'ENEM 2018.2 â€” QuÃ­mica â€” QuestÃ£o 307

O sulfato de bário (BaSO,) é mundialmente
utilizado na forma de suspensão como contraste
em radiografias de esôfago, estômago e intesti-
no. Por se tratar de um sal pouco solúvel, quan-
do em meio aquoso estabelece o seguinte equi-
líbrio:
BaSO, (s) — Ba?* (aq) + SO, (aq)
Por causa da toxicidade do bário (Ba”*), é dese-
jado que o contraste não seja absorvido, sendo
totalmente eliminado nas fezes. A eventual ab-
sorção de íons Ba”, porém, pode levar a rea-
ções adversas ainda nas primeiras horas após
sua administração, como vômito, cólicas, diar-
reia, tremores, crises convulsivas e até mesmo
a morte.
(PEREIRA, L, F. Entenda o caso da intoxicação por
Celobar. Disponível em: www.unifesp.br.
Acesso em: 20 nov. 2013 - adaptado)
Para garantir a segurança do paciente que fizer
uso do contraste, deve-se preparar essa sus-
pensão em:
A) água destilada.
B) soro fisiológico.
C) solução de cloreto de bário, BaCl,.
D) solução de sulfato de bário, BaSO,.
E) solução de sulfato de potássio, KSO,.', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'hard', 'published', 307),
('ENEM-2018.2-Q308', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2018, 'QuÃ­mica geral', 'multiple_choice', 'ENEM 2018.2 â€” QuÃ­mica â€” QuestÃ£o 308

A radiação na região do infravermelho interage
com a oscilação do campo elétrico gerada pelo
movimento vibracional de átomos de uma liga-
ção química. Quanto mais fortes forem as liga-
ções e mais leves os átomos envolvidos, maior
será a energia e, portanto, maior a frequência
da radiação no infravermelho associada à vibra-
ção da ligação química. A estrutura química da
molécula 2-animo-6-cianopiridina é mostrada.
NC” NO “NH,
A ligação química dessa molécula, envolvendo
átomos diferentes do hidrogênio, que absorve a
radiação no infravermelho com maior frequência
é:
A) C-C
B) C-N
Cc) C=C
D) C=N
E) C=N
novocadernoenem(Qgmail.com', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 4, null, 'medium', 'published', 308),
('ENEM-2018.2-Q309', (select id from public.subjects where slug='quimica'), (select id from public.exams where slug='enem'), 2018, 'TermoquÃ­mica', 'multiple_choice', 'ENEM 2018.2 â€” QuÃ­mica â€” QuestÃ£o 309

Sobre a diluição do ácido sulfúrico em água, o
químico e escritor Primo Levi afirma que, "está
escrito em todos os tratados, é preciso operar
às avessas, quer dizer, verter o ácido na água e
não o contrario, senão aquele líquido oleoso de
aspecto tão inócuo está sujeito a iras furibun-
das: sabem-no até os meninos do ginásio".
(furibundo: adj. furioso)
(LEVI, P. A tabela periódica. Rio de Janeiro:
Relume-Dumará, 1994 - adaptado)
O alerta dado pro Levi e justifica-se porque a:
à divição do ácido fipera muito calor
Mina Aida |; ,
) mistura de agua é acido é exp''osiva.
C) água provoca a neutralização do ácido.
D) mistura final de água e ácido separa-se em
fases.
E) água inibe a liberação dos vapores proveni-
entes do ácido.
102', '[]'::jsonb, '[]'::jsonb, null, ["A","B","C","D","E"]::jsonb, 0, null, 'hard', 'published', 309)
on conflict (source_ref) do update set
  subject_id=excluded.subject_id, exam_id=excluded.exam_id, year=excluded.year, topic=excluded.topic,
  question_type=excluded.question_type, prompt=excluded.prompt, source_images=excluded.source_images,
  stem_image_url=excluded.stem_image_url, options=excluded.options, correct_index=excluded.correct_index,
  difficulty=excluded.difficulty, status=excluded.status;
