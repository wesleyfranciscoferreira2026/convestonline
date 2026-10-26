-- Convest+ â€” banco ENEM QuÃ­mica 2009â€“2018 a partir das pÃ¡ginas enviadas.
-- Inclui gabarito do caderno; a questÃ£o anulada ENEM-2014.3-Q163 foi excluÃ­da.
-- Dificuldade e tÃ³pico sÃ£o classificaÃ§Ãµes estimadas; imagens originais permanecem disponÃ­veis.
-- Rode 0008_question_images.sql antes desta migration e aguarde o deploy das imagens.

alter table public.questions add column if not exists source_ref text;
create unique index if not exists questions_source_ref_unique on public.questions(source_ref);

insert into public.questions (source_ref,subject_id,exam_id,year,topic,question_type,prompt,source_images,option_images,stem_image_url,options,correct_index,explanation,difficulty,status,sort_order)
values
('ENEM-2009.1-Q1',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2009,'QuÃ­mica ambiental','multiple_choice','ENEM 2009.1 â€” QuÃ­mica â€” QuestÃ£o 1

O ciclo da Ã¡gua Ã© fundamental para a preserva-
Ã§Ã£o da vida no planeta. As condiÃ§Ãµes climÃ¡ticas
da Terra permitem que a Ã¡gua sofra mudanÃ§as
de fase e a compreensÃ£o dessas transforma-
Ã§Ãµes Ã© fundamental para se entender o ciclo
hidrolÃ³gico. Numa dessas mudanÃ§as, a Ã¡gua ou
a umidade da terra absorve o calor do sol e dos
arredores. Quando jÃ¡ foi absorvido calor sufici-
ente, algumas das molÃ©culas do lÃ­quido podem
ter energia necessÃ¡ria para comeÃ§ar a subir
para a atmosfera.
(DisponÃ­vel em: http//wWww.keroagua.blogspot.com
Acesso em: 30 mar. 2009 - adaptado)
A transformaÃ§Ã£o " mencionada . no texto Ã© , a:
A) fusÃ£o.
"
B) liquefaÃ§Ã£o.
a
C) evaporaÃ§Ã£o.
D) solidificaÃ§Ã£o.
E) condensaÃ§Ã£o.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'medium','published',1),
('ENEM-2009.1-Q2',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2009,'QuÃ­mica ambiental','multiple_choice','ENEM 2009.1 â€” QuÃ­mica â€” QuestÃ£o 2

O lixo radioativo ou nuclear Ã© resultado da ma-
nipulaÃ§Ã£o de materiais radioativos, utilizados
hoje na agricultura, na indÃºstria, na medicina,
em pesquisas - cientÃ­ficas, indie na produÃ§Ã£o " de ener-
gia etc. Embora a radioatividade se reduza com
o tempo, o processo de decaimento radioativo
de alguns materiais pode levar milhÃµes de anos.
Por isso, existe a necessidade de se fazer um
descarte adequado e controlado de resÃ­duos
dessa natureza. A taxa de decaimento radioati-
vo Ã© medida em termos de um tempo caracterÃ­s-
tico, chamado meia-vida, que Ã© o tempo neces-
sÃ¡rio para que uma amostra perca metade de
sua radioatividade original.
O grÃ¡fico seguinte representa a taxa de decai-
mento radioativo do rÃ¡dio-226, elemento quÃ­mi-
co pertencente Ã  famÃ­lia dos metais alcalinos
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
1620 3240 4860 â€” Anos
As informaÃ§Ãµes fornecidas mostram que:
Ajude esse projeto:','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'hard','published',2),
('ENEM-2009.1-Q3',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2009,'Estequiometria','multiple_choice','ENEM 2009.1 â€” QuÃ­mica â€” QuestÃ£o 3

VÃ¡rios combustÃ­veis alternativos estÃ£o sendo
procurados para reduzir a demanda por com-
bustÃ­veis fÃ³sseis, cuja queima prejudica o meio
ambiente devido Ã  produÃ§Ã£o de diÃ³xido de car-
bono (massa molar igual a 44 g morâ€).
TrÃªs dos mais promissores combustÃ­veis alter-
nativos sÃ£o o hidrogÃªnio, o etanol e o metano. Ã€
queima de 1 mol de cada um desses combustÃ­-
veis libera uma determinada quantidade de ca-
lor, que estÃ£o apresentadas na tabela a seguir.
(g molâ€) (kJ mol?)
EN NT
[Lero ag â€œâ€œâ€œsg
Considere que foram queimadas massas, inde-
pendentemente, desses trÃªs combustÃ­veis, de
forma tal que em cada queima foram liberados
5400 kJ.
O combustÃ­vel mais econÃ´mico, ou seja, o que
teve a menor massa consumida, e o combustÃ­-
vel mais poluente, que Ã© aquele que produziu a
maior massa de diÃ³xido de carbono (massa
molar igual a 44 g molâ€), foram, respectivamen-
te,
A) o etanol, que teve apenas 46 g de massa
consumida, e o metano, que produziu 900 g de
CO,.
B) o hidrogÃªnio, que teve apenas 40 g de massa
consumida, e o etanol, que produziu 352 g de
CO,.
C) o hidrogÃªnio, que teve apenas 20 g de mas-
sa consumida, e o metano, que produziu 264 g
de COÂ».
D) o etanol, que teve apenas 96 g de massa
consumida, e o metano, que produziu 176 g de
CO,.
E) o hidrogÃªnio, que teve apenas 2 g de massa
consumida, e o etanol, que produziu 1350 g de
CO,.
1
moduloenem2017Ogmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'hard','published',3),
('ENEM-2009.1-Q4',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2009,'QuÃ­mica ambiental','multiple_choice','ENEM 2009.1 â€” QuÃ­mica â€” QuestÃ£o 4

ESTAÃ‡Ã•ES DARMSP |
SÃ£o Caetano do Sul
[osasco â€” = |
MP, â€” partÃ­culas inalÃ¡veis: aquelas
Ã© menor que 10 um.
CO â€” monÃ³xido de carbono:
da queima incompleta
orgÃ¢nica (combustÃ­veis
principalmente por veÃ­culos
NO, diÃ³xido de nitrogÃªnio:
processos de combustÃ£o
Dependendo das
prejuÃ­zos Ã  saÃºde
SO; â€” diÃ³xido de enxofre: resulta
combustÃ­veis que contÃªm
reagir com outras substÃ¢ncias
partÃ­culas Ã  base de sulfato
visibilidade na atmosfera.
[| oso | s1100 | 10146
A Companhia de Tecnologia de Saneamento Ambiental
tinuamente dados referentes Ã  qualidade do ar na
tada corresponde a dados hipotÃ©ticos que poderiam
Se esses dados fossem verÃ­dicos, entÃ£o, seria mais
A) no Parque Dom Pedro |l. B) em SÃ£o
D) em Osasco. E) em Pinheiros.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'medium','published',4),
('ENEM-2009.1-Q5',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2009,'TermoquÃ­mica','multiple_choice','ENEM 2009.1 â€” QuÃ­mica â€” QuestÃ£o 5

O controle de qualidade Ã© uma exigÃªncia da
sociedade moderna na qual os bens de consu-
mo sÃ£o produzidos em escala industrial. Nesse
controle de qualidade sÃ£o determinados parÃ¢-
metros que permitem checar a qualidade de
cada produto. O Ã¡lcool combustÃ­vel Ã© um produ-
to de amplo consumo muito adulterado, pois
recebe adiÃ§Ã£o de outros materiais para aumen-
tar a margem de lucro de quem o comercializa.
De acordo com a AgÃªncia Nacional de PetrÃ³leo
(ANP), o Ã¡lcool combustÃ­vel deve ter densidade
entre 0,805 glem? e 0,811 glem?. Em algumas
bombas de combustÃ­vel a densidade do Ã¡lcool
pode ser verificada por meio de um densÃ­metro
similar ao desenhado abaixo, que consiste em
duas bolas com valores de densidade diferentes
e verifica quando o Ã¡lcool estÃ¡ fora da faixa
permitida. Na imagem, sÃ£o apresentadas situa-
Ã§Ãµes distintas para trÃªs amostras de Ã¡lcool
combustÃ­vel.
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'hard','published',5),
('ENEM-2009.1-Q6',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2009,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2009.1 â€” QuÃ­mica â€” QuestÃ£o 6

Duas matÃ©rias-primas encontradas em grande
lÃ­mero preparado a partir da carapaÃ§a do camarÃ£o,
principais componentes de um novo material para
dos no preparo de vÃ¡rios produtos. Este material
zadas atualmente em vÃ¡rios produtos famacÃªuticos
petroquÃ­micos, com a vantagem de ser biocompatÃ­vel
A fÃ³rmula estrutural da quitosana estÃ¡ apresentada
: H
NS
ANSA) H H N
O
ias
no
H
Com relaÃ§Ã£o Ã s caracterÃ­sticas do material descrito,
A) o uso da quitosana Ã© vantajoso devido a suas
reza e peso molecular, caracterÃ­sticas dos polÃ­meros,
B) a quitosana tem em sua constituiÃ§Ã£o grupos
quÃ­micas, com as vantagens ambientais comparadas
C) o polÃ­mero natural quitosana Ã© de uso vantajoso,
tem vantagem ambiental comparado com os polÃ­meros
D) a quitosana Ã© constituÃ­da por grupos hidroxila em
mente produzidos, e traz vantagens ambientais
cos.
E) a quitosana Ã© um polÃ­mero de baixa massa
amida Ã© vantajoso para aplicaÃ§Ãµes ambientais em','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'hard','published',6),
('ENEM-2009.1-Q7',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2009,'EletroquÃ­mica','multiple_choice','ENEM 2009.1 â€” QuÃ­mica â€” QuestÃ£o 7

Pilhas e baterias sÃ£o dispositivos tÃ£o comuns
em nossa sociedade que, sem percebermos,
carregamos vÃ¡rios deles junto ao nosso corpo;
elas estÃ£o presentes em aparelhos de MP3,
relÃ³gios, rÃ¡dios, celulares etc. As semirreaÃ§Ãµes
descritas a seguir ilustram o que ocorre em uma
pilha de Ã³xido de prata.
Zn(s)+ OH (aq) > ZnO (s) + O (1) + eâ€
PA ONS)rEEON es â€ Ag) a OMS)
=
Pode-se afirmar que esta pilha:
A) Ã© uma pilha Ã¡cida.
B) apresenta o Ã³xido de prata como o Ã¢nodo.
C) apresenta o zinco como o agente oxidante.
D) tem como reaÃ§Ã£o da cÃ©lula a seguinte reaÃ§Ã£o
Zn (s) + Ag,O (s) â€” ZnO (s) + 2Ag (s).
E) apresenta fluxo de elÃ©trons na pilha do ele-
trodo de Ag5O para o Zn.
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'hard','published',7),
('ENEM-2009.1-Q8',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2009,'QuÃ­mica ambiental','multiple_choice','ENEM 2009.1 â€” QuÃ­mica â€” QuestÃ£o 8

O pÃ³ de cafÃ© jogado no lixo caseiro e, princi-
palmente, as grandes quantidades descartadas
em bares e restaurantes poderÃ£o se transformar
em uma nova opÃ§Ã£o de matÃ©ria-prima para a
produÃ§Ã£o de biodiesel, segundo estudo da Uni-
versidade de Nevada (EUA). No mundo, sÃ£o
cerca de 8 bilhÃµes de quilogramas de pÃ³ de cafÃ©
jogados no lixo por ano. O estudo
mostra que o cafÃ© descartado tem 15% de Ã³leo,
o qual pode ser convertido em biodiesel pelo
processo tradicional. AlÃ©m de reduzir significa-
mente emissÃµes prejudiciais, apÃ³s a extraÃ§Ã£o
do Ã³leo, o pÃ³ de cafÃ© Ã© ideal como produto ferti-
lizante para jardim.
(Revista CiÃªncia e Tecnologia no Brasil, nÂº 155, 1.09)
Considere o processo descrito e a densidade do
biodiesel igual a 900 kg/mÂº. A partir da quanti-
dade de pÃ³ de cafÃ© jogada no lixo por ano, a
produÃ§Ã£o de biodiesel seria equivalente a:
3','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'hard','published',8),
('ENEM-2009.1-Q9',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2009,'SoluÃ§Ãµes e concentraÃ§Ã£o','multiple_choice','ENEM 2009.1 â€” QuÃ­mica â€” QuestÃ£o 9

Os exageros do final de semana podem levar o
indivÃ­duo a um quadro de azia.
A azia pode ser descrita como uma sensaÃ§Ã£o
de queimaÃ§Ã£o no estÃ´mago, provocada pelo
desbalanceamento do pH estomacal (excesso
de Ã¡cido clorÃ­drico).
Um dos antiÃ¡cidos comumente empregados no
combate Ã  azia Ã© o leite de magnÃ©sia.
O leite de magnÃ©sia possui 64,8 g de hidrÃ³xido
de magnÃ©sio (Mg(OH)) por litto da soluÃ§Ã£o.
Qual a quantidade de Ã¡cido neutralizado ao se
ingerir 9 mL de leite de magnÃ©sia?
Dados: Massas molares (em g morâ€): Mg= 24,3;
Cl=35,4; 0=16; H=1.
A) 20 mol
B) 0,58 mol
C) 0,2 mol
D) 0,02 mol
E) 0,01 mol','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'medium','published',9),
('ENEM-2009.1-Q10',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2009,'QuÃ­mica ambiental','multiple_choice','ENEM 2009.1 â€” QuÃ­mica â€” QuestÃ£o 10

Potencializado pela necessidade de reduzir as
emissÃµes de gases causadores do efeito estufa,
o desenvolvimento de fontes de energia renovÃ¡-
veis e limpas dificimente resultarÃ¡ em um mo-
delo hegemÃ´nico. A tendÃªncia Ã© que cada pais
crie uma combinaÃ§Ã£o prÃ³pria de matrizes, esco-
lhida entre vÃ¡rias categorias de biocombustÃ­-
veis, a energia solar ou a eÃ³lica e, mais tarde,
provavelmente o hidrogÃªnio, capaz de lhe ga-
rantir eficiÃªncia energÃ©tica e ajudar o mundo a
atenuar os efeitos das mudanÃ§as climÃ¡ticas. O
hidrogÃªnio, em um primeiro momento, poderia
ser obtido a partir de hidrocarbonetos ou de
carboidratos.
Considerando as fontes de hidrogÃªnio citadas, a
de menor impacto ambiental seria:
A) aquela obtida de hidrocarbonetos, pois pos-
suem maior proporÃ§Ã£o de hidrogÃªnio por molÃ©-
cula.
B) aquela de carboidratos, por serem estes ter-
modinamicamente mais estÃ¡veis que os hidro-
carbonetos.
C) aquela de hidrocarbonetos, pois o carvÃ£o
resultante pode ser utilizado tambÃ©m como fon-
te de energia.
D) aquela de carboidratos, uma vez que o car-
bono resultante pode ser fixado pelos vegetais
na prÃ³xima safra.
E) aquela de hidrocarbonetos, por estarem liga-
dos a carbonos tetraÃ©dricos, ou seja, que apre-
sentam apenas ligaÃ§Ãµes simples.
tratada desempenha um papel fundamental para a
mais carente Ã© a que mais sofre com a falta de Ã¡gua
capazes de fornecer o volume de Ã¡gua necessÃ¡-
dessa Ã¡gua.
o ]
EM
1
[Ta men) gistibuiÃ§Ã£o
des
VP
mo
Cascalho SI
ReservatÃ³rio dos
ReservatÃ³rio de |
q
Ãgua Tratada
e
AmÃ´nia |
[Fios
4','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'hard','published',10),
('ENEM-2009.1-Q11',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2009,'SeparaÃ§Ã£o de misturas','multiple_choice','ENEM 2009.1 â€” QuÃ­mica â€” QuestÃ£o 11

Na atual estrutura social, o abastecimento de Ã¡gua
prevenÃ§Ã£o de doenÃ§as. Entretanto, a populaÃ§Ã£o
tratada, em geral, pela falta de estaÃ§Ãµes de tratamento
rio para o abastecimento ou pela falta de distribuiÃ§Ã£o
Sombeamenta( 1)
CarvÃ£o ativado O)
Coagulante Ã£
tes
Cal Hidratada
EE meia
E
EA Se banalene EAZsrÃƒA
FloculaÃ§Ã£o â€” DecantaÃ§Ã£o il
(os
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'medium','published',11),
('ENEM-2009.2-Q12',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2009,'SoluÃ§Ãµes e concentraÃ§Ã£o','multiple_choice','ENEM 2009.2 â€” QuÃ­mica â€” QuestÃ£o 12

SabÃµes sÃ£o sais de Ã¡cidos carboxÃ­licos de cadeia
processos de lavagem, a remoÃ§Ã£o de substÃ¢ncias
gorduras. A figura a seguir representa a estrutura de
FOOD DOORS
Em soluÃ§Ã£o, os Ã¢nions do sabÃ£o podem hidrolisar a
respondente. Por exemplo, para o estearato de sÃ³dio,
CHa(CH2).sCOO + HO==
Uma vez que o Ã¡cido carboxÃ­lico formado Ã© pouco
gorduras, o pH do meio deve ser controlado de
para a direita.
Com base nas informaÃ§Ãµes do texto, Ã© correto concluir
A) mais eficiente em pH bÃ¡sico.
B) mais eficiente em pH Ã¡cido.
C) mais eficiente em pH neutro.
D) eficiente em qualquer faixa de pH.
E) mais eficiente em pH Ã¡cido ou neutro.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'medium','published',12),
('ENEM-2009.2-Q13',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2009,'EletroquÃ­mica','multiple_choice','ENEM 2009.2 â€” QuÃ­mica â€” QuestÃ£o 13

Para que apresente condutividade elÃ©trica ade-
quada a muitas aplicaÃ§Ãµes, o cobre bruto obtido
por mÃ©todos tÃ©rmicos Ã© purificado eletrolitica-
mente.
Nesse processo, o cobre bruto impuro constitui
o Ã¢nodo da cÃ©lula, que estÃ¡ imerso em uma
soluÃ§Ã£o de CuSO,. Ã€ medida que o cobre impu-
ro Ã© oxidado no Ã¢nodo, Ã­ons Cu* da soluÃ§Ã£o
sÃ£o depositados na forma pura no cÃ¡todo.
Quanto Ã s impurezas metÃ¡licas, algumas sÃ£o
oxidadas, passando Ã  soluÃ§Ã£o, enquanto outras
simplesmente se desprendem do Ã¢nodo e se
sedimentam abaixo dele. As impurezas sedi-
mentadas sÃ£o posteriormente processadas, e
sua comercializaÃ§Ã£o gera receita que ajuda a
cobrir os custos do processo.
A sÃ©rie eletroquÃ­mica a seguir lista o cobre e
alguns metais presentes como impurezas no
cobre bruto de acordo com suas forÃ§as reduto-
ras relativas.
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'hard','published',13),
('ENEM-2009.2-Q14',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2009,'AtomÃ­stica e tabela periÃ³dica','multiple_choice','ENEM 2009.2 â€” QuÃ­mica â€” QuestÃ£o 14

Os nÃºcleos dos Ã¡tomos sÃ£o constituÃ­dos de prÃ³tons
pela sua massa. Nota-se que, na maioria dos nÃºcleos,
proporÃ§Ã£o. O grÃ¡fico mostra a quantidade de nÃªutrons
os nÃºcleos estÃ¡veis conhecidos.
160
150
e nlene ne
[E EeNÃ³eios estÃ¡veis
140 TRA)
ES
o
SIS SS
110
â€”
Ã©
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
NÃºmero
O antimÃ´nio Ã© um elemento quÃ­mico que possui 50
diferem pelo nÃºmero de nÃªutrons. De acordo com o
A) entre 12 e 24 nÃªutrons a menos que o nÃºmero de
B) exatamente o mesmo nÃºmero de prÃ³tons e nÃªutrons.
C) entre O e 12 nÃªutrons a mais que o nÃºmero de
D) entre 12 e 24 nÃªutrons a mais que o nÃºmero de
E) entre O e 12 nÃªutrons a menos que o nÃºmero de','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'hard','published',14),
('ENEM-2009.2-Q15',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2009,'EquilÃ­brio quÃ­mico','multiple_choice','ENEM 2009.2 â€” QuÃ­mica â€” QuestÃ£o 15

O processo de industrializaÃ§Ã£o tem gerado sÃ©-
rios problemas de ordem ambiental, econÃ´mica
e social, entre os quais se pode citar a chuva
Ã¡cida. Os Ã¡cidos usualmente presentes em
maiores proporÃ§Ãµes na Ã¡gua da chuva sÃ£o o
H2CO;3, formado pela reaÃ§Ã£o do CO, atmosfÃ©ri-
co com a Ã¡gua, o HNO;3, o HNO>,, o HSO, e o
H2SO;. Esses quatro Ãºltimos sÃ£o formados prin-
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'medium','published',15),
('ENEM-2009.2-Q16',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2009,'QuÃ­mica ambiental','multiple_choice','ENEM 2009.2 â€” QuÃ­mica â€” QuestÃ£o 16

|||
Cerca de 1% do lixo urbano Ã© constituÃ­do por
resÃ­duos sÃ³lidos contendo elementos tÃ³xicos.
Entre esses elementos estÃ£o metais pesados
como o cÃ¡dmio, o chumbo e o mercÃºrio, com-
ponentes de pilhas e baterias, que sÃ£o perigo-
sos Ã  saÃºde humana e ao meio ambiente.
Quando descartadas em lixos comuns, pilhas e
baterias vÃ£o para aterros sanitÃ¡rios ou lixÃµes a
cÃ©u aberto, e o vazamento de seus componen-
tes contamina o solo, os rios e o lenÃ§ol freÃ¡tico,
atingindo a flora e a fauna.
Por serem bioacumulativos e nÃ£o biodegradÃ¡-
veis, esses metais chegam de forma acumulada
aos seres humanos, por meio da cadeia alimen-
tar. A legislaÃ§Ã£o vigente (ResoluÃ§Ã£o CONAMA
no 257/1999) regulamenta o destino de pilhas e
baterias apÃ³s seu esgotamento energÃ©tico e
determina aos fabricantes e/ou importadores a
quantidade mÃ¡xima permitida desses metais em
cada tipo de pilha/bateria, porÃ©m o problema
ainda persiste.
(DisponÃ­vel em: http://wWww.mma.gov.br.
Acesso em: 11 jul. 2009 - adaptado)
Uma medida que poderia contribuir para acabar
definitivamente com o problema da poluiÃ§Ã£o
ambiental por metais pesados relatado no texto
seria:
A) deixar de consumir aparelhos elÃ©tricos que
utilizem pilha ou bateria como fonte de energia.
B) usar apenas pilhas ou baterias recarregÃ¡veis
e de vida Ãºtil longa e evitar ingerir alimentos
contaminados, especialmente peixes.
C) devolver pilhas e baterias, apÃ³s o esgota-
mento da energia armazenada, Ã  rede de assis-
tÃªncia tÃ©cnica especializada para repasse a
fabricantes e/ou importadores.
D) criar nas cidades, especialmente naquelas
com mais de 100 mil habitantes, pontos estratÃ©-
gicos de coleta de baterias e pilhas, para poste-
rior repasse a fabricantes e/ou importadores.
E) exigir que fabricantes invistam em pesquisa
para a substituiÃ§Ã£o desses metais tÃ³xicos por
substÃ¢ncias menos nocivas ao homem e ao
ambiente, e que nÃ£o sejam bioacumulativas.
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'hard','published',16),
('ENEM-2009.2-Q17',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2009,'Radioatividade','multiple_choice','ENEM 2009.2 â€” QuÃ­mica â€” QuestÃ£o 17

Considere um equipamento capaz de emitir
radiaÃ§Ã£o eletromagnÃ©tica com comprimento de
onda bem menor que a da radiaÃ§Ã£o ultravioleta.
Suponha que a radiaÃ§Ã£o emitida por esse equi-
pamento foi apontada para um tipo especÃ­fico
de filme fotogrÃ¡fico e entre o equipamento e o
filme foi posicionado o pescoÃ§o de um indivÃ­duo.
Quanto mais exposto Ã  radiaÃ§Ã£o, mais escuro
se torna o filme apÃ³s a revelaÃ§Ã£o.
ApÃ³ ; o : t e revelar ! o fil time,
pÃ³s acionar equipamento
evidenciou-se a imagem mostrada na figura
abaixo.
-â€
t
VW
PE. |
H a
â€” Fado
U
.
4
&
â€œÃ .
"*
x
''
Dentre os fenÃ´menos decorrentes da interaÃ§Ã£o
entre a radiaÃ§Ã£o e os Ã¡tomos do indivÃ­duo que
permitem a obtenÃ§Ã£o desta imagem inclui-se a:
A) absorÃ§Ã£o da radiaÃ§Ã£o eletromagnÃ©tica e a
consequente ionizaÃ§Ã£o dos Ã¡tomos de cÃ¡lcio,
que se transformam em Ã¡tomos de fÃ³sforo.
B) maior absorÃ§Ã£o da radiaÃ§Ã£o eletromagnÃ©tica
pelos Ã¡tomos de cÃ¡lcio que por outros tipos de
Ã¡tomos.
C) maior absorÃ§Ã£o da radiaÃ§Ã£o eletromagnÃ©tica
pelos Ã¡tomos de carbono que por Ã¡tomos de
cÃ¡lcio.
D) maior refraÃ§Ã£o ao atravessar os Ã¡tomos de
carbono que os Ã¡tomos de cÃ¡lcio.
E) maior ionizaÃ§Ã£o de molÃ©culas de Ã¡gua que
de Ã¡tomos de carbono.
7','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'hard','published',17),
('ENEM-2009.2-Q18',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2009,'Radioatividade','multiple_choice','ENEM 2009.2 â€” QuÃ­mica â€” QuestÃ£o 18

O uso de protetores solares em situaÃ§Ãµes de grande
nas praias, Ã© de grande importÃ¢ncia para a saÃºde.
almente, anÃ©is aromÃ¡ticos conjugados com grupos
sorver a radiaÃ§Ã£o ultravioleta mais nociva aos seres
cia de alternÃ¢ncia entre ligaÃ§Ãµes simples e duplas
em questÃ£o Ã© apresentar, em uma de suas
solubilidade do composto em Ã¡gua, o que impede sua
De acordo com as consideraÃ§Ãµes do texto, qual das
para funcionar como molÃ©cula ativa de protetores
j
A)
CH;O
o
OO
|
B)
o LAÃ‡OS
CH;30','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'medium','published',18),
('ENEM-2009.2-Q19',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2009,'QuÃ­mica ambiental','multiple_choice','ENEM 2009.2 â€” QuÃ­mica â€” QuestÃ£o 19

Nas Ãºltimas dÃ©cadas, o efeito estufa tem-se
muitas vezes atribuÃ­do Ã  intensa liberaÃ§Ã£o de CO,
Ã§Ã£o de energia. O quadro traz as entalpias-padrÃ£o
do octano.
fÃ³rmula ;
composto
molecular
[metano | CH |
[Butano â€” | CHo |
Ã€ medida que aumenta a consciÃªncia sobre os
cresce a importÃ¢ncia de se criar polÃ­ticas de incentivo
sentido, considerando-se que o metano, o butano e
gÃ¡s liquefeito de petrÃ³leo (GLP) e da gasolina,
possÃ­vel concluir que, do ponto de vista da quantidade
crescente desses trÃªs combustÃ­veis Ã©:
A) gasolina, GLP e gÃ¡s natural.
B) gÃ¡s natural, gasolina e GLP.
C) gasolina, gÃ¡s natural e GLP.
D) gÃ¡s natural, GLP e gasolina.
E) GLP, gÃ¡s natural e gasolina.
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'medium','published',19),
('ENEM-2009.2-Q20',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2009,'AtomÃ­stica e tabela periÃ³dica','multiple_choice','ENEM 2009.2 â€” QuÃ­mica â€” QuestÃ£o 20

Na manipulaÃ§Ã£o em escala nanomÃ©trica, os
Ã¡tomos revelam caracterÃ­sticas peculiares, po-
dendo apresentar tolerÃ¢ncia Ã  temperatura,
reatividade quÃ­mica, condutividade elÃ©trica, ou
mesmo exibir forÃ§a de intensidade extraordinÃ¡-
ria. Essas caracterÃ­sticas explicam o interesse
industrial pelos nanomateriais que estÃ£o sendo
muito pesquisados em diversas Ã¡reas, desde o
desenvolvimento de cosmÃ©ticos, tintas e teci-
dos, atÃ© o de terapias contra o cÃ¢ncer.
(LACAVA, Z. G. M; MORAIS, P. â€ Nanobiotecnologia
'' ''
e SaÃºde. DisponÃ­vel em: http:/MWwww.comciencia.br)
A utilizaÃ§Ã£o de nanopartÃ­culas na indÃºstria e na
medicina requer estudos mais detalhados, pois:
A) as partÃ­culas, quanto menores, mais potentes
e radiativas se tornam.
B) as partÃ­culas podem ser manipuladas, mas
nÃ£o caracterizadas com a atual tecnologia.
C) as propriedades biolÃ³gicas das partÃ­culas
somente podem ser testadas em microrganis-
mos.
D) as partÃ­culas podem atravessar poros e ca-
nais celulares, o que poderia causar impactos
desconhecidos aos seres vivos e, atÃ© mesmo,
aos ecossistemas.
E) o organismo humano apresenta imunidade
contra partÃ­culas tÃ£o pequenas, jÃ¡ que apresen-
tam a mesma dimensÃ£o das bactÃ©rias (um bilio-
nÃ©simo de metro).','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'hard','published',20),
('ENEM-2009.2-Q21',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2009,'QuÃ­mica ambiental','multiple_choice','ENEM 2009.2 â€” QuÃ­mica â€” QuestÃ£o 21

O Ã¡lcool hidratado utilizado como combustÃ­vel
veicular Ã© obtido por meio da destilaÃ§Ã£o fracio-
nada de soluÃ§Ãµes aquosas geradas a partir da
fermentaÃ§Ã£o de biomassa. Durante a destilaÃ§Ã£o,
o teor de etanol da mistura Ã© aumentado, atÃ© o
limite de 968% em massa.
Considere que, em uma usina de produÃ§Ã£o de
etanol, 800 kg de uma mistura etanol/Ã¡gua com
concentraÃ§Ã£o 20% em massa de etanol foram
destilados, sendo obtidos 100 kg de Ã¡lcool hi-
dratado 96% em massa de etanol. A partir des-
ses dados, Ã© correto concluir que a destilaÃ§Ã£o
em questÃ£o gerou um resÃ­duo com uma concen-
traÃ§Ã£o de etanol em massa:
A) de 0%.
B) de 8,0%.
C) entre 8,4% e 8,6%.
D) entre 9,0% e 9,2%.
E) entre 13% e 14%.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'hard','published',21),
('ENEM-2009.3-Q22',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2009,'QuÃ­mica geral','multiple_choice','ENEM 2009.3 â€” QuÃ­mica â€” QuestÃ£o 22

Os cientistas conseguem determinar a idade de
um fÃ³ssil com menos de 40.000 anos de idade
utilizando o mÃ©todo do carbono-14 (TC) ou car-
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'easy','published',22),
('ENEM-2009.3-Q23',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2009,'EquilÃ­brio quÃ­mico','multiple_choice','ENEM 2009.3 â€” QuÃ­mica â€” QuestÃ£o 23

O Ã¡cido acetilsalicÃ­lico (AMAS) Ã© uma substÃ¢ncia
utilizada como fÃ¡rmaco analgÃ©sico no alÃ­vio das
dores de cabeÃ§a. A figura abaixo Ã© a represen-
taÃ§Ã£o estrutural da molÃ©cula do AAS.
CO, H
O
â€P
O CH,
Considerando-se essa representaÃ§Ã£o, Ã© correto
afirmar que a fÃ³rmula molecular do AAS Ã©:
A) C;O2H;COOH.
B) C;O2H; COOH.
C) CsOH;COOH.
D) CgOH;COOH.
E) CsO2H,sCOOH.
9','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'medium','published',23),
('ENEM-2009.3-Q24',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2009,'TermoquÃ­mica','multiple_choice','ENEM 2009.3 â€” QuÃ­mica â€” QuestÃ£o 24

A ciÃªncia propÃµe formas de explicar a natureza
e seus fenÃ´menos que, muitas vezes, confron-
tam o conhecimento popular ou o senso co-
mum. Um bom exemplo desse descompasso Ã©
a explicaÃ§Ã£o microscÃ³pica da flutuaÃ§Ã£o do gelo
na Ã¡gua. Do ponto de vista atÃ´mico, podem-se
representar os trÃªs estados fÃ­sicos dessa subs-
tÃ¢ncia como nas figuras a seguir, nas quais as
bolas representam as molÃ©culas de Ã¡gua.
OOOO00o0 oo QRO lx q
o
OOOOOO||[ [0 O ooo 828
9090000| | 9. O O /650900
OO00000 o o1/O else.
000000] |O o OOo [8/0]
A B Cc
Considerando-se as representaÃ§Ãµes das molÃ©-
culas de Ã¡gua nos trÃªs estados fÃ­sicos e seu
comportamento anÃ´malo, Ã© correto afirmar que:
A) sÃ³lidos afundam na Ã¡gua.
B) a interaÃ§Ã£o entre as molÃ©culas estÃ¡ restrita
ao estado sÃ³lido.
C) a figura B Ã© a que melhor representa a Ã¡gua
no estado lÃ­quido.
D) a figura A Ã© a que melhor representa o gelo,
ou seja, Ã¡gua no estado sÃ³lido.
E) aumenta a distÃ¢ncia entre as molÃ©culas da
substÃ¢ncia Ã  medida que a temperatura aumen-
ta.
IA A o a,
Ã£o de energia elÃ©trica
tempo tem ldenciado
ao longo do decisiva-
mente o progresso da humanidade, mas tam-
bÃ©m tem criado uma sÃ©ria preocupaÃ§Ã£o: o preju-
" zo ao meio : ambiente. :
Nos prÃ³ximos anos, uma nova tecnologia de
" de NASA elÃ©trica A
geraÃ§Ã£o energia deverÃ¡ ganhar es
paÃ§o: as cÃ©lulas a combustÃ­vel hidrogÃª-
nio/oxigÃªnio.
===
â€”
[SA â€
2e |
== 52 &o,
2H*
o
Hs, ES SEO um> 2
*
H,O
Ã¢nodo | eletrÃ³lito | cÃ¡todo
(VILLULLAS, H. M; TICIANELLI, E. A; GONZÃLES,
E. R. QuÃ­mica Nova na Escola. NÂº 15, mai 2002)
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'hard','published',24),
('ENEM-2009.3-Q25',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2009,'QuÃ­mica geral','multiple_choice','ENEM 2009.3 â€” QuÃ­mica â€” QuestÃ£o 25. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,0,null,'medium','published',25),
('ENEM-2010.1-Q26',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2010,'SoluÃ§Ãµes e concentraÃ§Ã£o','multiple_choice','ENEM 2010.1 â€” QuÃ­mica â€” QuestÃ£o 26

As misturas efervescentes, em pÃ³ ou comprimi-
dos, sÃ£o comuns para a administraÃ§Ã£o de vita-
mina C ou de medicamentos para azia. Essa
forma farmacÃªutica sÃ³lida foi desenvolvida para
facilitar o transporte, aumentar a estabilidade de
substÃ¢ncias e, quando em soluÃ§Ã£o, acelerar a
absorÃ§Ã£o do fÃ¡rmaco pelo organismo.
As matÃ©rias primas que atuam na efervescÃªncia
sÃ£o, em geral, o Ã¡cido tartÃ¡rico ou Ã¡cido cÃ­trico
que reagem como um sal de carÃ¡ter bÃ¡sico,
como o bicarbonato de sÃ³dio (NaHCO;), quando
em contato com a Ã¡gua. A partir do contato da
mistura efervescente com a Ã¡gua, ocorre uma
sÃ©rie de reaÃ§Ãµes quÃ­micas simultÃ¢neas: libera-
Ã§Ã£o de Ã­ons, formaÃ§Ã£o de Ã¡cido e liberaÃ§Ã£o de
gÃ¡s carbÃ´nico - gerando a efervescÃªncia.
As equaÃ§Ãµes a seguir representam as etapas da
reaÃ§Ã£o da mistura efervescente na Ã¡gua, em
que foram omitidos os estados de agregaÃ§Ã£o
dos reagentes, e H;A representa o Ã¡cido cÃ­trico.
|- â€” NaHCO,â€” Na* + HCO,
It H,CO,=HO+CO,
I-/ HCO; + H'' = H,CO,
IV. HA=B3H''+A"
A ionizaÃ§Ã£o, a dissociaÃ§Ã£o iÃ´nica, a formaÃ§Ã£o
do Ã¡cido e a liberaÃ§Ã£o do gÃ¡s ocorrem, respecti-
vamente, nas seguintes etapas:
AJIV, Lie
B) LIV, Well
10','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'hard','published',26),
('ENEM-2010.1-Q27',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2010,'QuÃ­mica geral','multiple_choice','ENEM 2010.1 â€” QuÃ­mica â€” QuestÃ£o 27. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,1,null,'medium','published',27),
('ENEM-2010.1-Q28',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2010,'TermoquÃ­mica','multiple_choice','ENEM 2010.1 â€” QuÃ­mica â€” QuestÃ£o 28

O abastecimento de nossas necessidades
energÃ©ticas futuras dependerÃ¡ certamente do
desenvolvimento de tecnologias para aproveitar
a energia solar com maior eficiÃªncia. A energia
solar Ã© a maior fonte de energia mundial. Num
dia ensolarado, por exemplo, aproximadamente
1 kJ de energia solar atinge cada metro quadra-
do de superfÃ­cie terrestre por segundo. No en-
tanto, o aproveitamento dessa energia Ã© difÃ­cil
porque ela Ã© diluÃ­da (distribuÃ­da por uma Ã¡rea
muito extensa) e oscila com o horÃ¡rio e as con-
diÃ§Ãµes climÃ¡ticas. O uso efetivo da energia solar
depende de formas de estocar a energia coleta-
da para o uso posterior.
(BROWN, T. QuÃ­mica e CiÃªncia Central.
SÃ£o Paulo: Pearson Prentice Hall, 2005)
Atualmente, uma das formas de se utilizar a
energia solar tem sido armazenÃ¡-la por meio de
processos quÃ­micos endotÃ©rmicos que mais
tarde podem ser revertidos para liberar calor.
Considerando a reaÃ§Ã£o:
CH) â€ HO, + calor = CO, + Ho
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'hard','published',28),
('ENEM-2010.1-Q29',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2010,'QuÃ­mica geral','multiple_choice','ENEM 2010.1 â€” QuÃ­mica â€” QuestÃ£o 29. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,3,null,'medium','published',29),
('ENEM-2010.1-Q30',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2010,'Estequiometria','multiple_choice','ENEM 2010.1 â€” QuÃ­mica â€” QuestÃ£o 30

Todos os organismos necessitam de Ã¡gua e
grande parte deles vive em rios, lagos e ocea-
nos. Os processos biolÃ³gicos, como respiraÃ§Ã£o
e fotossÃ­ntese, exercem profunda influÃªncia na
quÃ­mica das Ã¡guas naturais em todo o planeta.
O oxigÃªnio Ã© ator dominante na quÃ­mica e na
bioquÃ­mica da hidrosfera. Devido a sua baixa
solubilidade em Ã¡gua (9,0 mg/l a 20 ÂºC) a dis-
ponibilidade de oxigÃªnio nos ecossistemas aqu-
Ã¡ticos estabelece o limite entre a vida aerÃ³bica
e anaerÃ³bica. Nesse contexto, um parÃ¢metro
chamado Demanda BioquÃ­mica de OxigÃªnio
(DBO) foi definido para medir a quantidade de
matÃ©ria orgÃ¢nica presente em um sistema hÃ­dri-
co. A DBO corresponde Ã  massa de O, em mili-
gramas necessÃ¡rias para realizar a oxidaÃ§Ã£o
total do carbono orgÃ¢nico em um litro de Ã¡gua.
(BAIRD, C. QuÃ­mica Ambiental.
Ed. Bookmam, 2005 - adaptado)
Dados: Massas molares em g/mol: C = 12;
H=1;0=16.
Suponha que 10 mg de aÃ§Ãºcar (fÃ³rmula mÃ­nima
CH,rO A e massa molar a 30 g/mol) g/mol) sÃ£o sÃ£o dissolvi di io
dos em um litro de gua; Ã¡gua; em q quanto a DBO serÃ¡
aumentada?
A) 0,4 mg de Oy/litro
B) 1,7 mg de Ox/litro
C) 2,7 mg de Oy/litro
D) 9,4 mg de Oyz/litro
E) 10,7 mg de Oyz/litro','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'hard','published',30),
('ENEM-2010.1-Q31',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2010,'EletroquÃ­mica','multiple_choice','ENEM 2010.1 â€” QuÃ­mica â€” QuestÃ£o 31

A composiÃ§Ã£o mÃ©dia de uma bateria automotiva
esgotada Ã© de aproximadamente 32% Pb, 3%
PbO; e 36% PbSO,. A mÃ©dia de massa da pas-
ta residual de uma bateria usada Ã© de 6 kg,
onde 19% Ã© PbO,, 60% PbSO, e 21% Pb. Entre
todos os compostos de chumbo presentes na
pasta, o que mais preocupa Ã© o sulfato de
chumbo (II), pois nos processos pirometalÃºrgi-
cos, em que os compostos de chumbo (placas
das baterias) sÃ£o fundidos, hÃ¡ a conversÃ£o de
sulfato em diÃ³xido de enxofre, gÃ¡s muito poluen-
te.
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'medium','published',31),
('ENEM-2010.1-Q32',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2010,'QuÃ­mica geral','multiple_choice','ENEM 2010.1 â€” QuÃ­mica â€” QuestÃ£o 32. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,3,null,'medium','published',32),
('ENEM-2010.1-Q33',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2010,'EquilÃ­brio quÃ­mico','multiple_choice','ENEM 2010.1 â€” QuÃ­mica â€” QuestÃ£o 33

No ano de 2004, diversas mortes de animais por
envenenamento no zoolÃ³gico de SÃ£o Paulo
foram evidenciadas. Estudos tÃ©cnicos apontam
suspeitas de intoxicaÃ§Ã£o por monofluoracetato
de sÃ³dio, conhecido como composto 1080 e
ilegalmente comercializado como raticida. O
monofluoracetato de sÃ³dio Ã© um derivado do
Ã¡cido monofluoracÃ©tico e age no organismo dos
mamÃ­feros bloqueando o ciclo de Krebs, que
pode levar Ã  parada da respiraÃ§Ã£o celular oxida-
tiva e ao acÃºmulo de amÃ´nia na circulaÃ§Ã£o.
O
FRA
O Na*
monofluoracetato de sÃ³dio. Ã .
O monofluoracetato de sÃ³dio pode ser obtido
pela:
A) desidrataÃ§Ã£o do Ã¡cido monofluoracÃ©tico, com
liberaÃ§Ã£o de Ã¡gua.
8) hidrÃ³lise do Ã¡cido monofluoracÃ©tico, sem
formaÃ§Ã£o de agua.
o) perda de Ã­ons hidroxila do Ã¡cido monofluora-
, 2
cÃ©tico, com liberaÃ§Ã£o de hidrÃ³xido de sÃ³dio.
D) neutralizaÃ§Ã£o do Ã¡cido monofluoracÃ©tico,
usando hidrÃ³xido de sÃ³dio, com liberaÃ§Ã£o de
Ã¡gua.
E) substituiÃ§Ã£o dos Ã­ons hidrogÃªnio por sÃ³dio na
estrutura do Ã¡cido monofluoracÃ©tico, sem for-
maÃ§Ã£o de Ã¡gua.
PS','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'hard','published',33),
('ENEM-2010.1-Q34',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2010,'QuÃ­mica ambiental','multiple_choice','ENEM 2010.1 â€” QuÃ­mica â€” QuestÃ£o 34

As mobilizaÃ§Ãµes para promover um planeta
melhor para as futuras geraÃ§Ãµes sÃ£o cada vez
mais frequentes. A maior parte dos meios de
transportes de massa Ã©, atualmente, movida
pela queima de um combustÃ­vel fÃ³ssil. A tÃ­tulo
de exemplificaÃ§Ã£o do Ã´nus causado por essa
prÃ¡tica, basta saber que um carro produz, em
mÃ©dia, cerca de 200 g de diÃ³xido de carbono
por km percorrido.
(Revista Aquecimento Global. Ano 2, nÂº 08. Publica-
Ã§Ã£o do Instituto Brasileiro de Cultura Ltda)
Um dos principais constituintes da gasolina Ã© o
octano (CsH;is). Por meio da combustÃ£o do oc-
tano Ã© possÃ­vel a liberaÃ§Ã£o de energia, permitin-
do que o carro entre em movimento. A equaÃ§Ã£o
que representa a reaÃ§Ã£o quÃ­mica desse proces-
so demonstra que:
A) no processo hÃ¡ liberaÃ§Ã£o de oxigÃªnio, sob a
forma de O,.
B) o coeficiente estequiomÃ©trico para a Ã¡gua Ã©
de 8 para 1 do octano.
C) no processo hÃ¡ consumo de Ã¡gua, para que
haja liberaÃ§Ã£o de energia.
novocadernoenem(DQgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'hard','published',34),
('ENEM-2010.1-Q35',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2010,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2010.1 â€” QuÃ­mica â€” QuestÃ£o 35

Os pesticidas modernos sÃ£o divididos em vÃ¡rias
classes, entre as quais se destacam os organo-
fosforados, materiais que apresentam efeito
tÃ³xico agudo para os seres humanos. Esses
pesticidas contÃªm um Ã¡tomo central de fÃ³sforo
ao qual estÃ£o ligados outros Ã¡tomos ou grupo
de Ã¡tomos como oxigÃªnio, enxofre, grupos me-
toxi ou etoxi ou um radical orgÃ¢nico de cadeia
longa. Os organofosforados sÃ£o divididos em
trÃªs subclasses: Tipo A, na qual o enxofre nÃ£o
se incorpora na molÃ©cula; Tipo B, na qual o
oxigÃªnio, que faz dupla ligaÃ§Ã£o com fÃ³sforo, Ã©
substituÃ­do pelo enxofre; e Tipo C, no qual dois
oxigÃªnios sÃ£o substituÃ­dos por enxofre.
(BAIRD, O C. QuÃ­mica Ambiental. '' Bookmam. '' 2005)
Um exemplo de pesticida organofosforado Tipo
B, que apresenta grupo etoxi em sua fÃ³rmula
estrutural, estÃ¡ representado em:
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
o R- Sâ€”P-Oâ€”CH,
OCH
3
Ss
HN !
D) po O CH
=
/, 3
CH.Oâ€
3
O=COCH(CH;),
Ss
U
E) oNÃƒO- o-Pâ€” OCH,CH,
|
OCH,CH,
13','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'hard','published',35),
('ENEM-2010.1-Q36',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2010,'QuÃ­mica ambiental','multiple_choice','ENEM 2010.1 â€” QuÃ­mica â€” QuestÃ£o 36

As baterias de Ni-Cd muito utilizadas no nosso
uma vez que uma considerÃ¡vel quantidade de
quando as baterias gastas sÃ£o incineradas como
sÃ£o de cÃ¡dmio para a atmosfera durante a combustÃ£o
ais dessas baterias.
Uma maneira de separar o cÃ¡dmio dos demais
lixiviaÃ§Ã£o Ã¡cida. Nela, tanto os metais (Cd, Ni e,
cos Cd(OH)>(s), NiI(OH)(s), Co(OH)>(s) presentes
lubilizados. Em funÃ§Ã£o da baixa seletividade (todos
Ã¡cida, Ã© realizada uma etapa de extraÃ§Ã£o dos metais
M ES 2 HR o e
(aq) 00)
Onde,
M2* = Cd?*, NÂº ou Co?â€
HR = C,,H,, -PO,H : identificado no grÃ¡fico por X
HR = C,H,, -PO,H : identificado no grÃ¡fico por Y
O grÃ¡fico mostra resultado da extraÃ§Ã£o utilizando os
100
O
| |-O- Cd
so
- rr Co y
so
| A-N
1)
Ã‰ s
F
Ã  +
2 O $7
fe
ad
20
A
E) -
[Tu " o
.
o
o 1 FÃ¡ 3
pH
Figura 1: ExtraÃ§Ã£o de nÃ­quel, cÃ¡dimo Â«e
solventes orgÃ¢nicos X e Y.
A reaÃ§Ã£o descrita no texto mostra o processo de
orgÃ¢nicas, X e Y. Considerando-se as estruturas de
afirmar que:
A) as molÃ©culas X e Y atuam como extratores catiÃ´nicos
Ã­on H* pelo cÃ¡tion do metal.
B) as molÃ©culas X e Y atuam como extratores aniÃ´nicos
Ã­on H* pelo cÃ¡tion do metal.
C) as molÃ©culas X e Y atuam como extratores catiÃ´nicos
Ã­on POz? pelo cÃ¡tion do metal.
D) as molÃ©culas X e Y atuam como extratores aniÃ´nicos
Ã­on POz? pelo cÃ¡tion do metal.
E) as molÃ©culas X e Y fazem ligaÃ§Ãµes com os Ã­ons
lar o que justifica a eficÃ¡cia da extraÃ§Ã£o.
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'hard','published',36),
('ENEM-2010.1-Q37',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2010,'Estequiometria','multiple_choice','ENEM 2010.1 â€” QuÃ­mica â€” QuestÃ£o 37

Ao colocar um pouco de aÃ§Ãºcar Na Ã¡gua e me-
xer atÃ© a obtenÃ§Ã£o de uma sÃ³ fase, prepara-se
uma soluÃ§Ã£o. O mesmo acontece ao se adicio-
nar um pouquinho de sal Ã  Ã¡gua e misturar bem.
Uma substÃ¢ncia capaz de dissolver o soluto Ã©
denominada solvente; por exemplo, a Ã¡gua Ã©
um solvente para o aÃ§Ãºcar, para o sal e para
vÃ¡rias outras substÃ¢ncias. A figura a seguir ilus-
tra essa citaÃ§Ã£o.
E
Soluto
"
1 Es Er
. ae o |
Suponha que uma pessoa, para adoÃ§ar seu
cafezinho, tenha utilizado 3,42 g de sacarose
(massa molar igual a 342 g/mol) para uma xÃ­ca-
ra de 50 ml do lÃ­quido. Qual Ã© a concentraÃ§Ã£o
final em mol/l de sacarose nesse cafezinho?
A) 0,02.
8) 0,2.
o) 2.
D) 200.
E) 2.000.
ERR TORA AO
uestÃ£o â€œ Ce nto
da rodovia MG-010,
'' "â€ rt ue
acompanha da introduÃ§Ã£o de espÃ©cies exÃ³ticas,
e a prÃ¡tica E de psp incÃªndios criminosos, io ameaÃ§am o
sofisticado ecossistema do campo rupestre da
reserva da Serra do EspinhaÃ§o.
As plantas nativas desta regiÃ£o, altamente
adaptadas a uma alta concentraÃ§Ã£o de alumÃ­-
nio, que inibe o crescimento das raÃ­zes e dificul-
tam a absorÃ§Ã£o de nutrientes e Ã¡gua, estÃ£o
sendo substituÃ­das por espÃ©cies invasoras que
nÃ£o teriam naturalmente adaptaÃ§Ã£o para este
ambiente, no entanto elas estÃ£o dominando as
margens da rodovia, equivocadamente chama-
da de "estrada ecolÃ³gica". Possivelmente a
entrada de espÃ©cies de plantas exÃ³ticas neste
ambiente foi provocada pelo uso, neste empre-
endimento, de um tipo de asfalto (cimento-solo),
que possui uma mistura rica em cÃ¡lcio, que
causou modificaÃ§Ãµes quÃ­micas aos solos adja-
centes Ã  R rodovia : MG-010.
(Scientific American. Brasil. Ano 7, nÂº 79. 08 - adp)
Essa afimaÃ§Ã£o baseia-se no uso de cimento-
solo, mistura rica em cÃ¡lcio que:
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'hard','published',37),
('ENEM-2010.1-Q38',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2010,'QuÃ­mica geral','multiple_choice','ENEM 2010.1 â€” QuÃ­mica â€” QuestÃ£o 38. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,0,null,'medium','published',38),
('ENEM-2010.2-Q39',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2010,'SoluÃ§Ãµes e concentraÃ§Ã£o','multiple_choice','ENEM 2010.2 â€” QuÃ­mica â€” QuestÃ£o 39

Alguns fatores podem alterar a rapidez das rea-
Ã§Ãµes quÃ­micas. A seguir destacam-se trÃªs
exemplos no contexto da preparaÃ§Ã£o e da con-
servaÃ§Ã£o de alimentos:
1. Ã€ maioria dos produtos alimentÃ­cios se
conserva por muito mais tempo quando
submetidos Ã  refrigeraÃ§Ã£o. Esse procedi-
mento diminui a rapidez das reaÃ§Ãµes que
contribuem para a degradaÃ§Ã£o de certos
alimentos.
2. Um procedimento '' muito '' comum utilizado "
em prÃ¡ticas de culinÃ¡ria Ã© o corte dos ali-
mentos para acelerar o seu cozimento, ca-
so nÃ£o se tenha uma panela de pressÃ£o.
3. Na preparaÃ§Ã£o de iogurtes, adicionam-se
ao leite bactÃ©rias produtoras de enzimas
que aceleram as reaÃ§Ãµes envolvendo aÃ§Ãº-
cares e proteÃ­nas lÃ¡cteas.
Com base no texto, quais sÃ£o os fatores que
influenciam a rapidez das transformaÃ§Ãµes quÃ­i-
micas relacionadas aos exemplos 1, 2 e 3, res-
pectivamente? W
A) Temperatura, superfÃ­cie de contato e concen-
traÃ§Ã£o.
B) ConcentraÃ§Ã£o, superfÃ­cie de contato e catali-
sadores.
C) Temperatura, superfÃ­cie o de contado e catali- .
sadores.
D) SuperfÃ­cie de contato, temperatura e concen-
traÃ§Ã£o.
E) Temperatura, concentraÃ§Ã£o . e catalisadores. .','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'hard','published',39),
('ENEM-2010.2-Q40',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2010,'QuÃ­mica geral','multiple_choice','ENEM 2010.2 â€” QuÃ­mica â€” QuestÃ£o 40

Ã€s vezes, ao abrir um refrigerante, percebe-se
que uma parte do produto vaza rapidamente
pela extremidade do recipiente.
A explicaÃ§Ã£o inn para esse fato estÃ¡ , relacionada ; Ã  R
perturbaÃ§Ã£o H do equilÃ­brio ih quÃ­mica Po existente ; en-
tre alguns dos ingredientes do produto, de acor-
do com a equaÃ§Ã£o:
CO29) + HO â€” H2CO3(a9)
15','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'medium','published',40),
('ENEM-2010.2-Q41',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2010,'QuÃ­mica ambiental','multiple_choice','ENEM 2010.2 â€” QuÃ­mica â€” QuestÃ£o 41

O Brasil Ã© um dos paÃ­ses que obtÃªm melhores
quema a seguir representa as vÃ¡rias etapas desse
LIXO
No lixo, vÃ¡rias AÃ© lies DeSsamM por um proceso
o Ã£
impurezas podem de cataÃ§Ã£o manual e por um jato de
aire rea ar que arremessa as!atas para O
ato, possibiltando a idensficaÃ§Ã£o
das que estÃ£o cheias de detrtos
(mass pesadas).
O aluminio Ã© resfriado
em fÃ´rmas que
moldam os lingotes.
| â€”
Os lingotes darÃ£o
origem a novas
latas.
A temperatura do forno em que o alumÃ­nio Ã© fundido
A) sublima outros metais presentes na lata.
B) evapora substÃ¢ncias radioativas remanescentes.
C) impede que o alumÃ­nio seja eliminado em altas
D) desmagnetiza as latas que passaram pelo processo
E) queima os resÃ­duos de tinta e outras substÃ¢ncias','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'hard','published',41),
('ENEM-2010.2-Q42',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2010,'QuÃ­mica geral','multiple_choice','ENEM 2010.2 â€” QuÃ­mica â€” QuestÃ£o 42

Fator de emissÃ£o (carbon footprint) Ã© um temo
utilizado para expressar a quantidade de gases
que contribuem para o aquecimento global,
emitidos por uma fonte ou processo industrial
especÃ­fico. Pode-se pensar na quantidade de
gases emitidos por uma indÃºstria, uma cidade
ou mesmo por uma pessoa. Para o gÃ¡s CO,, a
relaÃ§Ã£o pode ser escrita:
Fator de emissÃ£o de CO; = Massade coz CO2 emitida. emitida
de iti
Quantidade de material
O termo â€œquantidade de material" pode ser, por
exemplo, a massa de material produzido em
uma indÃºstria ou a quantidade de gasolina con-
sumida por um carro em um determinado perÃ­o-
do.
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'medium','published',42),
('ENEM-2010.2-Q43',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2010,'EquilÃ­brio quÃ­mico','multiple_choice','ENEM 2010.2 â€” QuÃ­mica â€” QuestÃ£o 43

O pH do solo pode variar em uma faixa signifi-
cativa devido a vÃ¡rias causas.
Por exemplo, o solo de Ã¡reas com chuvas es-
cassas, mas com concentraÃ§Ãµes elevadas do
sal solÃºvel carbonato de sÃ³dio (NazCO;), torna-
se bÃ¡sico devido Ã  reaÃ§Ã£o de hidrÃ³lise do Ã­on
carbonato, segundo o equilÃ­brio:
COfxa +H On = HCOx4, + OH,
Esses tipos de solos sÃ£o alcalinos demais para
fins agrÃ­colas e devem ser remediados pela
utilizaÃ§Ã£o de aditivos quÃ­micos.
(BAIRD, C. QuÃ­mica ambiental.
SÃ£o Paulo: Artmed, 1995 - adaptado)
Suponha que, para remediar uma amostra des-
se tipo de solo, um tÃ©cnico tenha utilizado como
aditivo a cal virgem (CaO).
Nesse caso, a remediaÃ§Ã£o: o
A) foi realizada, pois o carÃ¡ter bÃ¡sico da cal
virgem promove o deslocamento do equilÃ­brio
descrito para a direita, em decorrÃªncia da ele-
vaÃ§Ã£o de pH do meio.
B) foi realizada, pois o carÃ¡ter Ã¡cido da cal vir-
gem promove o deslocamento do equilÃ­brio des-
crito para a esquerda, em decorrÃªncia da redu-
Ã§Ã£o de pH do meio.
C) nÃ£o " foi . realizada, . pois , o carÃ¡ter z Ã¡cido da da cal
virgem promove o deslocamento do equilÃ­brio
descrito para a direita, em decorrÃªncia da redu-
Ã§Ã£o de pH do meio.
D) nÃ£o foi realizada, pois o carÃ¡ter bÃ¡sico da cal
virgem promove o deslocamento do equilÃ­brio
descrito para a esquerda, em decorrÃªncia da
elevaÃ§Ã£o de pH do meio.
E) nÃ£o foi realizada, pois o carÃ¡ter neutro da cal
virgem promove o deslocamento do equilÃ­brio
descrito para a esquerda, em decorrÃªncia da
manutenÃ§Ã£o de pH do meio.
novocadernoenem(DQgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'hard','published',43),
('ENEM-2010.2-Q44',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2010,'QuÃ­mica ambiental','multiple_choice','ENEM 2010.2 â€” QuÃ­mica â€” QuestÃ£o 44

O rÃ³tulo de uma garrafa de Ã¡gua mineral natural
contÃ©m as seguintes informaÃ§Ãµes:
CaracterÃ­sticas ComposiÃ§Ã£o
EL
fÃ­sico-quÃ­micas
go
pHaz5sÂºo | 754 15,13
| sÃ³dio [1424
| 3,62
condutividade dutividade 151
Edi
elÃ©trica a 25ÂºC |(uS/cm)
â€” 1,24
resÃ­duo da
evaporaÃ§Ã£o a SO) 0,20
[ tuoretos | =
180 â€œÂºC
As , informaÃ§Ãµes " quÃ­micas mo presentes no rÃ³tulo . de
vÃ¡rios produtos permitem classificar de acordo
com seu gosto, seu cheiro, sua aparÃªncia, sua
funÃ§Ã£o, entre outras. As informaÃ§Ãµes da tabela
p ermitem concluir 9 que essa Ã¡gua 9 Ã©:
A) gasosa.
B) insÃ­pida.
C) levemente azeda.
D) um pouco alcalina.
E) radioativa na fonte.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'medium','published',44),
('ENEM-2010.2-Q45',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2010,'QuÃ­mica ambiental','multiple_choice','ENEM 2010.2 â€” QuÃ­mica â€” QuestÃ£o 45

Ã¡guia cÃ£o aquando queimados, podem
EVar a IonmaÃ§eo de GoaS. um composto do
grupo dos organoclorados. Mesmo quando a
queima ocorre em incineradores, hÃ¡ liberaÃ§Ã£o
de substÃ¢ncias derivadas da dioxina no meio
ambiente. Tais compostos sÃ£o produzidos em
baixas concentraÃ§Ãµes, como resÃ­duos da quei-
ma de matÃ©ria orgÃ¢nica em presenÃ§a de produ-
tos que contenham cloro. Como consequÃªncia
de seu amplo espalhamento no meio ambiente,
bem como de suas propriedades estruturais, as
dioxinas sofrem magnificaÃ§Ã£o trÃ³fica na cadeia
alimentar. Mais de 90% da exposiÃ§Ã£o humana
Ã s dioxinas Ã© atribuÃ­da aos alimentos contami-
nados ingeridos. A estrutura tÃ­pica de uma
dioxina estÃ¡ apresentada a seguir:
Cl. O. cl
O O
18) o Cl
2,3,7,8-tetraclorodibenzo-p-dioxina
(2,3,7,8-TCDD)
A molÃ©cula do 2,3,7,8-TCDD Ã© popularmente
conhecida pelo nome ,dioxinaâ€, sendo a mais
tÃ³xica dos 75 isÃ´meros de compostos clorados
de dibenzo-p-dioxina existentes.
17','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'hard','published',45),
('ENEM-2010.2-Q46',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2010,'EletroquÃ­mica','multiple_choice','ENEM 2010.2 â€” QuÃ­mica â€” QuestÃ£o 46

O CÃ¡dmio, presente nas baterias, pode chegar ao
neira irregular no meio ambiente ou quando sÃ£o
Cd** sÃ£o extremamente perigosos para o organismo,
uma doenÃ§a degenerativa nos ossos, tornando-os
laÃ§Ãµes. Podem ainda inibir enzimas ativadas pelo
funcionamento dos rins. A figura mostra a variaÃ§Ã£o
197 pm 191pm
100pm 102pm 103pm
Raios atÃ´micos e
Com base no texto, a toxicidade do cÃ¡dmio em sua
A) Apresentar baixa energia de ionizaÃ§Ã£o, o que
tros compostos.
B) Possuir tendÃªncia de atuar em processos biolÃ³gicos
variam de +1 a +3.
C) Possuir raio e carga relativamente prÃ³ximos aos
cos, causando interferÃªncia nesses processos.
D) Apresentar raio iÃ´nico grande, permitindo que
que, normalmente, Ã­ons menores participam.
E) Apresentar carga +2, o que permite que ele
normalmente, Ã­ons com cargas menores participam.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'hard','published',46),
('ENEM-2010.2-Q47',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2010,'QuÃ­mica geral','multiple_choice','ENEM 2010.2 â€” QuÃ­mica â€” QuestÃ£o 47

A curcumina, substÃ¢ncia encontrada no pÃ³
da-Ã­ndia (Curcuma longa), aparentemente, pode ajudar
kinson e o de Alzheimer e atÃ© mesmo retardar o
culturas orientais, apenas nos Ãºltimos anos passou a
o
H;CO E
HO
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'easy','published',47),
('ENEM-2010.2-Q48',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2010,'SoluÃ§Ãµes e concentraÃ§Ã£o','multiple_choice','ENEM 2010.2 â€” QuÃ­mica â€” QuestÃ£o 48

O flÃºor Ã© usado de forma ampla na prevenÃ§Ã£o
[Cai(POs)s(OH),] presente nos esmaltes dos dentes,
neral mais resistente ao ataque Ã¡cido decorrente da
res das placas que aderem aos dentes.
A reaÃ§Ã£o de dissoluÃ§Ã£o da hidroxiapatita Ã©:
[Ca,(PO,)(OH),] o 8H* e
Dados: Massas molares em g/mol [Ca,o(POs)s(OH2)]
Supondo-se que o esmalte dentÃ¡rio seja constituÃ­do
que dissolve completamente 1 mg desse material
A) 0,14 mg de Ã­ons totais.
B) 0,40 mg de Ã­ons totais.
C) 0,58 mg de Ã­ons totais.
D) 0,97 mg de Ã­ons totais.
E) 1,01 mg de Ã­ons totais.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'medium','published',48),
('ENEM-2010.2-Q49',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2010,'QuÃ­mica ambiental','multiple_choice','ENEM 2010.2 â€” QuÃ­mica â€” QuestÃ£o 49

Devido ao seu teor de sais, a Ã¡gua do mar Ã©
imprÃ³pria para o consumo humano e para a
maioria dos usos da Ã¡gua doce. No entanto,
para a indÃºstria, a Ã¡gua do mar Ã© de grande
interesse, uma vez que os sais presentes po-
dem servir de matÃ©rias-primas importantes para
diversos processos. Nesse contexto, devido a
sua simplicidade e ao seu baixo potencial de
impacto ambiental, o mÃ©todo da precipitaÃ§Ã£o
fracionada tem sido utilizado para a obtenÃ§Ã£o
dos sais presentes na Ã¡gua do mar.
Tabela 1: Solubilidade em Ã¡gua de alguns com-
postos presentes na Ã¡gua do mar a 25ÂºC
soLUTO SOLUBILIDADE
9/kg de HO
Emometude sÃ³dio 1,20 x 10Âº
Carbonato de cÃ¡lcio 1,80 x 10?
Cloreto de sÃ³dio 3,60 x 10Âº
Cloreto de magnÃ©sio 841 x10
Sulfeto de magnÃ©sio â€ | Meso. | 360 x 12
Sulfato de cÃ¡lcio 6,80 x 10Âº
Suponha que uma indÃºstria objetiva separar
determinados sais de uma amostra de Ã¡gua do
mar a 25ÂºC, por meio da precipitaÃ§Ã£o fraciona-
da. Se essa amostra contiver somente os sais
destacados na tabela, a seguinte ordem de pre-
cipitaÃ§Ã£o serÃ¡ verificada:
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'hard','published',49),
('ENEM-2010.2-Q50',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2010,'QuÃ­mica inorgÃ¢nica','multiple_choice','ENEM 2010.2 â€” QuÃ­mica â€” QuestÃ£o 50

Cientistas da AustrÃ¡lia descobriram um meio de
produzir roupas que se limpam sozinhas. Ã€
equipe de pesquisadores usou nanocristais de
diÃ³xido de titÃ¢nio (TiO,) que, sob aÃ§Ã£o da luz
solar, sÃ£o capazes de decompor as partÃ­culas
de sujeira na superfÃ­cie de um tecido. O estudo
apresentou bons resultados com fibras de algo-
dÃ£o e seda. Nesses casos, foram removidas
manchas de vinho, bastante resistentes. A na-
nocamada protetora poderÃ¡ ser Ãºtil na preven-
Ã§Ã£o de infecÃ§Ãµes em hospitais, uma vez que o
diÃ³xido de titÃ¢nio tambÃ©m mostrou ser eficaz na
destruiÃ§Ã£o das paredes celulares de microrga-
nismos que provocam infecÃ§Ãµes. O termo nano
vem da unidade de medida nanÃ´metro, que Ã© a
bilionÃ©sima parte de 1 metro.
19','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'medium','published',50),
('ENEM-2010.2-Q51',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2010,'TermoquÃ­mica','multiple_choice','ENEM 2010.2 â€” QuÃ­mica â€” QuestÃ£o 51

Com a frequente adulteraÃ§Ã£o de combustÃ­veis,
alÃ©m de fiscalizaÃ§Ã£o, hÃ¡ necessidade de prover
meios para que o consumidor verifique a quali-
dade do combustÃ­vel.
Para isso, nas bombas de combustÃ­veis existe
um densÃ­metro, semelhante ao ilustrado na
tour,
Um tubo de vidro fechado fica imerso no com-
bustÃ­vel, devido ao peso das bolinhas de chum-
bo colocadas no seu interior.
Uma coluna vertical central marca a altura de
referÃªncia, que deve ficar abaixo ou no nÃ­vel do
combustÃ­vel para indicar que sua densidade
estÃ¡ adequada.
Como o volume do lÃ­quido varia com a tempera-
tura mais que o do vidro, a coluna vertical Ã©
preenchida com mercÃºrio para compensar vari-
aÃ§Ãµes de temperatura.
|
MercÃºrio PP
[|
Bolinhas de Chumbo
CombustÃ­vel
De acordo com o texto, a coluna vertical de
mercÃºrio, quando aquecida,
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'hard','published',51),
('ENEM-2011.1-Q52',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2011,'TermoquÃ­mica','multiple_choice','ENEM 2011.1 â€” QuÃ­mica â€” QuestÃ£o 52

Um dos problemas dos combustÃ­veis que con-
tÃªm carbono Ã© que sua queima produz diÃ³xido
de carbono. Portanto, uma caracterÃ­stica impor-
tante, ao se escolher um combustÃ­vel, Ã© analisar
seu calor de combustÃ£o (AH), definido como a
energia liberada na queima completa de um mol
de combustÃ­vel no estado padrÃ£o. O quadro
seguinte relaciona algumas substÃ¢ncias que
contÃªm carbono e seu AH?.
[substÃ¢ncia | FÃ³rmula | ameÃºumon |
=
| eso | cHoHMO | 1368 |
| metano | CH) | 80 |
| etano | cHnO0 | -sam |
Neste contexto, qual dos combustÃ­veis, quando
queimado completamente, libera mais diÃ³xido
de carbono no ambiente pela mesma quantida-
de de energia produzida?
A) Benzeno.
B) Metano.
C) Glicose.
D) Octano.
E) Etanol.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'hard','published',52),
('ENEM-2011.1-Q53',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2011,'QuÃ­mica ambiental','multiple_choice','ENEM 2011.1 â€” QuÃ­mica â€” QuestÃ£o 53

BelÃ©m Ã© cercada por 39 ilhas, e suas popula-
Ã§Ãµes convivem com ameaÃ§as de doenÃ§as. O
motivo, apontado por especialistas, Ã© a poluiÃ§Ã£o
da Ã¡gua do rio, principal fonte de sobrevivÃªncia
dos ribeirinhos. A diarreia Ã© frequente nas crian-
Ã§as e ocorre como consequÃªncia da falta de
saneamento bÃ¡sico, jÃ¡ que a populaÃ§Ã£o nÃ£o tem
acesso Ã  Ã¡gua de boa qualidade. Como nÃ£o hÃ¡
Ã¡gua potÃ¡vel, a alternativa Ã© consumir a do rio.
(O Liberal. 8 jul. 2008.
DisponÃ­vel em: http://wmww.oliberal.com.br)
O procedimento adequado para tratar a Ã¡gua
dos rios, a fim de atenuar os problemas de saÃº-
de causados por microrganismos a essas popu-
laÃ§Ãµes ribeirinhas Ã© a:
20','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'medium','published',53),
('ENEM-2011.1-Q54',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2011,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2011.1 â€” QuÃ­mica â€” QuestÃ£o 54

Certas ligas estanho-chumbo com composiÃ§Ã£o
especÃ­fica fomam um estÃ©tico simples, o que
significa que uma liga com essas caracterÃ­sticas
se comporta como uma substÃ¢ncia pura, com
um ponto de fusÃ£o definido, no caso 183 ÂºC.
Essa Ã© uma temperatura inferior mesmo ao
ponto de fusÃ£o dos metais que compÃµem esta
liga (o estanho puro funde a 232 ÂºC e o chumbo
puro a 320 ÂºC), o que justifica sua ampla utiliza-
Ã§Ã£o na soldagem de componentes eletrÃ´nicos,
em que o excesso de aquecimento deve sempre
ser evitado. De acordo com as normas interna-
cionais, os valores mÃ­nimo e mÃ¡ximo das densi-
dades para essas ligas sÃ£o de 8,74 g/mL e 8,82
g/mL, respectivamente. As densidades do esta-
nho e do chumbo sÃ£o 7,3 g/mL e 11,3 g/mL,
respectivamente.
Um lote contendo 5 amostras de solda estanho-
chumbo foi analisado por um tÃ©cnico, por meio
da determinaÃ§Ã£o de sua composiÃ§Ã£o percentual
em massa, cujos resultados estÃ£o mostrados no
quadro a seguir.
Porcentagem | Porcentagem
| de Sn (%) de Pb (%)
A mostra
1 |] 6 | as |
[Fm [6 [35
Com base no texto e na anÃ¡lise realizada pelo
tÃ©cnico, as amostras que atendem Ã s normas
internacionais sÃ£o:
A)lell.
B)lell.
C)llelv.
D)WlevV.
E) VeV.
QuestÃ£o 55(20TT.1)
No processo de industrializaÃ§Ã£o da mamona,
alÃ©m do Ã³leo que contÃ©m vÃ¡rios Ã¡cidos graxos,
Ã© obtida uma massa orgÃ¢nica, conhecida como
torta de mamona. Esta massa tem potencial
para ser utilizada como fertilizante para o solo e
como complemento em raÃ§Ãµes animais devido a
seu elevado valor proteico. No entanto, a torta
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'hard','published',54),
('ENEM-2011.1-Q55',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2011,'QuÃ­mica geral','multiple_choice','ENEM 2011.1 â€” QuÃ­mica â€” QuestÃ£o 55. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,1,null,'medium','published',55),
('ENEM-2011.1-Q56',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2011,'EquilÃ­brio quÃ­mico','multiple_choice','ENEM 2011.1 â€” QuÃ­mica â€” QuestÃ£o 56

A pele humana, quando estÃ¡ bem hidratada,
adquire boa elasticidade e aspecto macio e
suave. Em contrapartida, quando estÃ¡ resseca-
da, perde sua elasticidade e se apresenta opaca
e Ã¡spera. Para evitar o ressecamento da pele Ã©
necessÃ¡rio, sempre que possÃ­vel, utilizar hidra-
tantes umectantes, feitos geralmente Ã  base de
glicerina e polietilenoglicol:
HO OH OH
| |
HC CH-CH,
glicerina
Ho â€” CH, CH5 fo â€” CH, CH, ]--0-cH,- CH OH
polietilenoglico!
A retenÃ§Ã£o de Ã¡gua na superfÃ­cie da pele pro-
movida pelos hidratantes Ã© consequÃªncia da
interaÃ§Ã£o dos grupos hidroxila dos agentes
umectantes com a umidade contida no ambiente
por meio de:
A) ligaÃ§Ãµes iÃ´nicas.
B) forÃ§as de London.
C) ligaÃ§Ãµes covalentes.
D) forÃ§as dipolo-dipolo.
E) ligaÃ§Ãµes de hidrogÃªnio.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'hard','published',56),
('ENEM-2011.1-Q57',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2011,'QuÃ­mica inorgÃ¢nica','multiple_choice','ENEM 2011.1 â€” QuÃ­mica â€” QuestÃ£o 57

A cal (Ã³xido de cÃ¡lcio, CaO), cuja suspensÃ£o em
Ã¡gua Ã© muito usada como uma tinta de baixo
custo, dÃ¡ uma tonalidade branca aos troncos de
Ã¡rvores. Essa Ã© uma prÃ¡tica muito comum em
praÃ§as pÃºblicas e locais privados, geralmente
usada para combater a proliferaÃ§Ã£o de parasi-
tas. Essa aplicaÃ§Ã£o, tambÃ©m chamada de caia-
Ã§Ã£o, gera um problema: elimina microrganismos
benÃ©ficos para a Ã¡rvore.
(DisponÃ­vel em: http://super.abril.com.br.
Acesso em: 1 abr. 2010 - adaptado)
21','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'medium','published',57),
('ENEM-2011.1-Q58',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2011,'QuÃ­mica ambiental','multiple_choice','ENEM 2011.1 â€” QuÃ­mica â€” QuestÃ£o 58

A eutrofizaÃ§Ã£o Ã© um processo em que rios, lagos e
mente fosfatos e nitratos, provocando posterior
trientes sÃ£o assimilados pelos produtores primÃ¡rios
limÃ­trofe, que Ã© o elemento menos disponÃ­vel em
organismos vivos. O ciclo representado na figura
(solo; detergentes; esgoto)
P
(geralmente limitados)
N
(02 suficiente)
CO,
NOz
POr Algas e
nitrogÃªnio
bacteriana C, N, P
DecomposiÃ§Ã£o
de resÃ­duos vegetais e animais
(O, suficiente)
A anÃ¡lise da Ã¡gua de um lago que recebe a descarga
badas revelou as concentraÃ§Ãµes dos elementos
(0,2 mol/L). Nessas condiÃ§Ãµes, o nutriente limÃ­trofe Ã©
AJC.
B)N.
C)P.
D) CO,.
E) POoz?
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'medium','published',58),
('ENEM-2011.1-Q59',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2011,'EquilÃ­brio quÃ­mico','multiple_choice','ENEM 2011.1 â€” QuÃ­mica â€” QuestÃ£o 59

Os refrigerantes tÃªm-se tornado cada vez mais o
sentam Ã¡cido-fosfÃ³rico, substÃ¢ncia prejudicial Ã  fixaÃ§Ã£o
da matriz dos dentes. A cÃ¡rie Ã© um processo dinÃ¢mico
dentÃ¡ria, perda de minerais em razÃ£o da acidez.
dente Ã© um sal denominado hidroxiapatita. O
pH do biofilme (placa bacteriana), provocando a
de defesa salivar levam de 20 a 30 minutos para
equaÃ§Ã£o quÃ­mica seguinte representa esse processo:
desmineralizaÃ§Ã£o
Cas(PO,,;OH (s) <=]
Hidroxiapatita mineralizaÃ§Ã£o
Considerando que uma pessoa consuma refrigerantes
desmineralizaÃ§Ã£o dentÃ¡ria, devido ao aumento da
A) OHâ€, que reage com os Ã­ons Ca?*, deslocando o
B) H*, que reage com as hidroxilas OHâ€, deslocando
C) OHâ€, que reage com os Ã­ons Ca*, deslocando o
D) Hâ€, que reage com as hidroxilas OH, deslocando
E) caâ€, que reage com as hidroxilas OH, deslocando','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'hard','published',59),
('ENEM-2011.1-Q60',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2011,'QuÃ­mica ambiental','multiple_choice','ENEM 2011.1 â€” QuÃ­mica â€” QuestÃ£o 60

A bile Ã© produzida pelo fÃ­gado, armazenada na
vesÃ­cula biliar e tem papel fundamental na di-
gestÃ£o de lipÃ­deos. Os sais biliares sÃ£o esteroi-
des sintetizados no fÃ­gado a partir do colesterol,
e sua rota de sÃ­ntese envolve vÃ¡rias etapas.
Partindo do Ã¡cido cÃ³lico representado na figura,
ocorre a formaÃ§Ã£o dos Ã¡cidos glicocÃ³lico e tau-
rocÃ³lico; o prefixo glico- significa a presenÃ§a de
um resÃ­duo do aminoÃ¡cido glicina e o prefixo
tauro-, do aminoÃ¡cido taurina.
Ãš
ES
cHa ERA
N/
oH cH
cH, |
CH | Os
ne e FA et,
CH, ] | |
Ha
AC Cx Câ€”â€”â€”cH,
nO Nf SAE
| | |
CH e CHOH
noâ€ NAHNSÃ‡A
Ha Hz
Ã¡cido cÃ³lico
A combinaÃ§Ã£o entre o Ã¡cido cÃ³lico e a glicina ou
taurina origina a funÃ§Ã£o amida, formada pela
reaÃ§Ã£o entre o grupo amina desses aminoÃ¡ci-
dos e o grupo:
A) carboxila do Ã¡cido cÃ³lico.
B) aldeÃ­do do Ã¡cido cÃ³lico.
C) hidroxila do Ã¡cido cÃ³lico.
D) cetona do Ã¡cido cÃ³lico.
E) Ã©ster do Ã¡cido cÃ³lico.
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'hard','published',60),
('ENEM-2011.1-Q61',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2011,'Estequiometria','multiple_choice','ENEM 2011.1 â€” QuÃ­mica â€” QuestÃ£o 61

O perÃ³xido de hidrogÃªnio Ã© comumente utilizado
como antissÃ©ptico e alvejante. TambÃ©m pode
ser empregado em trabalhos de restauraÃ§Ã£o de
quadros enegrecidos e no clareamento de den-
tes. Na presenÃ§a de soluÃ§Ãµes Ã¡cidas de oxidan-
tes, como o permanganato de potÃ¡ssio, este
Ã³xido decompÃµe-se, conforme a equaÃ§Ã£o a
seguir:
5 H,O, (aq) + 2 KMnO, (aq) + 3 H,SO,(aq) â€”
5 O,(g) + 2 MNSO, (aq) + K,SO, (aq) + 8 H,O (1)
De acordo com a estequiometria da reaÃ§Ã£o " des-
: ,
crita, a quantidade de permanganato de potÃ¡s-
sio necessÃ¡ria para reagir completamente com
pri de uma soluÃ§Ã£o 0,1 mol/L de perÃ³xido
e hidrogÃªnio Ã© igual a:
A) 2,0x100 mol.
B) 2,0x10 mol.
C) 8.0x10 mol.
D) 8,0x10* mol.
E) 5,0x1 0Âº mol.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'hard','published',61),
('ENEM-2011.1-Q62',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2011,'TermoquÃ­mica','multiple_choice','ENEM 2011.1 â€” QuÃ­mica â€” QuestÃ£o 62

O etanol Ã© considerado um biocombustÃ­vel pro-
missor, pois, sob o ponto de vista do balanÃ§o de
carbono, possui uma taxa de emissÃ£o pratica-
mente igual a zero. Entretanto, esse nÃ£o Ã© o
Ãºnico ciclo biogeoquÃ­mico associado Ã  produÃ§Ã£o
de etanol. O plantio da cana-de-aÃ§Ãºcar, matÃ©ria-
prima para a produÃ§Ã£o de etanol, envolve a
23','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'medium','published',62),
('ENEM-2011.1-Q63',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2011,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2011.1 â€” QuÃ­mica â€” QuestÃ£o 63

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
De acordo com o relatÃ³rio â€œA grande sombra da
pecuÃ¡riaâ€ (Livestock''s Long Shadow), feito pela
OrganizaÃ§Ã£o das NaÃ§Ãµes Unidas para a Agricul-
tura e a AlimentaÃ§Ã£o, o gado Ã© responsÃ¡vel por
cerca de 18% do aquecimento global, uma con-
tribuiÃ§Ã£o maior que a do setor de transportes. Ã€
criaÃ§Ã£o de gado em larga escala contribui para
o aquecimento global por meio da emissÃ£o de:
A) metano durante o processo de digestÃ£o.
B) Ã³xido nitroso durante o processo de rumina-
Ã§Ã£o
C) clorofluorcarbono durante o transporte de
carne.
D) Ã³xido nitroso durante o processo respiratÃ³rio.
E) diÃ³xido de enxofre durante o consumo de
pastagens.
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'hard','published',63),
('ENEM-2011.2-Q64',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2011,'Estequiometria','multiple_choice','ENEM 2011.2 â€” QuÃ­mica â€” QuestÃ£o 64

Considera-se combustÃ­vel aquele material que,
quando em combustÃ£o, consegue gerar energia.
No caso dos biocombustÃ­veis, Suas principais
vantagens de uso sÃ£o a de serem oriundos de
fontes derivad. & eb: veis poluem
Das a
Po que Bras " No S ulado Santo
os e
or 18So, no 3rasis, em-se estimulado o p''antio
e a industrializaÃ§Ã£o de sementes oleaginosas
para produÃ§Ã£o de biocombustÃ­veis.
No quadro, estÃ£o os valores referentes Ã  ener-
gia produzida pela combustÃ£o de alguns bio-
combustÃ­veis:
BIOCOMBUSTÃVEL keallkg
Biodiesel (mamona) 8913
Biodiesel (babaÃ§u) 9 049
Biodiesel (dendÃª) 8 946
Biodiesel (soja) 9421
Etanol (cana-de-aÃ§Ãºcar) - 5 596
Entre os diversos tipos de biocombustÃ­veis
apresentados no quadro, aquele que apresenta
melhor rendimento energÃ©tico em massa Ã© pro-
veniente:
A) do babaÃ§u.
B) da cana-de-aÃ§Ãºcar. Ãº
C) do dendÃª.
D) da soja.
E) da mamona.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'hard','published',64),
('ENEM-2011.2-Q65',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2011,'TermoquÃ­mica','multiple_choice','ENEM 2011.2 â€” QuÃ­mica â€” QuestÃ£o 65

Iniciativas do poder pÃºblico para prevenir o uso
de bebidas alcoÃ³licas por motoristas, causa de
muitos acidentes nas estradas do paÃ­s, trouxe-
ram Ã  ordem do dia, nÃ£o sem suscitar polÃªmica,
o instrumento popularmente conhecido como
bafÃ´metro. "
Do ponto de vista n de detecÃ§Ã£o = e mediÃ§Ã£o, 1 os
instrumentos normalmente usados pelas polÃ­-
cias rodoviÃ¡rias do Brasil e de outros paÃ­ses
utilizam o ar que os â€œsuspeitosâ€ sopram para
dentro do aparelho, atravÃ©s de um tubo descar-
tÃ¡vel, para promover a oxidaÃ§Ã£o do etanol! a
etanal. O mÃ©todo baseia-se no princÃ­pio da pilha
de combustÃ­vel: o etanol Ã© oxidado em meio
Ã¡cido sobre um disco plÃ¡stico poroso coberto
com pÃ³ de platina (catalisador) e umedecido
com Ã¡cido sulfÃºrico, sendo um eletrodo conec-
tado a cada lado desse disco poroso.
A corrente elÃ©trica produzida, proporcional Ã 
concentraÃ§Ã£o de Ã¡lcool no ar expirado dos pul-
mÃµes da pessoa testada, Ã© lida numa escala
que Ã© proporcional ao teor de Ã¡lcool no sangue.
O esquema de funcionamento desse detector
de etanol pode ser visto na figura.
24','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'hard','published',65),
('ENEM-2011.2-Q66',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2011,'QuÃ­mica ambiental','multiple_choice','ENEM 2011.2 â€” QuÃ­mica â€” QuestÃ£o 66

A reciclagem exerce impacto considerÃ¡vel sobre
a eficiÃªncia energÃ©tica. Embora restaurar mate-
riais que foram descartados tambÃ©m consuma
energia, Ã© possÃ­vel que essa energia seja subs-
tancialmente menor. O grÃ¡fico seguinte indica a
quantidade de energia necessÃ¡ria para a produ-
Ã§Ã£o de materiais primÃ¡rios e reciclados. A maio-
ria dos metais ocorre na crosta terrestre como
Ã³xidos que devem ser reduzidos para recuperar
o metal elementar, o que consome grande
quantidade de energia.
250
200
"
Ã£
2 150
EH
2
â€œe 100
Ã‰
so
so ape! amino
r e AlumÃ­ni
DO material primÃ¡rio Material reciclado
novocadernoenem(DQgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'medium','published',66),
('ENEM-2011.2-Q67',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2011,'QuÃ­mica geral','multiple_choice','ENEM 2011.2 â€” QuÃ­mica â€” QuestÃ£o 67. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,0,null,'medium','published',67),
('ENEM-2011.2-Q68',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2011,'TermoquÃ­mica','multiple_choice','ENEM 2011.2 â€” QuÃ­mica â€” QuestÃ£o 68

O biodiesel Ã© um biocombustÃ­vel que pode ser
obtido a partir do processo quÃ­mico em que
Ã³leos ou gorduras sÃ£o transformados em Ã©ste-
res metÃ­licos ou etÃ­licos de Ã¡cidos graxos.
25','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'easy','published',68),
('ENEM-2011.2-Q69',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2011,'EletroquÃ­mica','multiple_choice','ENEM 2011.2 â€” QuÃ­mica â€” QuestÃ£o 69

A matÃ©ria-prima bÃ¡sica para a fabricaÃ§Ã£o de calÃ§ados
tado o fluxograma de fabricaÃ§Ã£o do PVC e sua fÃ³rmula
Siglas: PVC - policloreto de vinila; EDC - dicloro etano;
Ãgua Soda CÃ¡ustica
+Sal e HidrogÃªnio
SS) â€”
-
Ã€
,
[|
Ã©
Salmoura
h
Cloro = EDC = =
â€”â€”
=
PetrÃ³leo Eteno
Para a produÃ§Ã£o do PVC, a obtenÃ§Ã£o do cloro Ã©
A) filtraÃ§Ã£o a vÃ¡cuo.
B) fusÃ£o Ã­gnea.
C) eletrÃ³lise.
D) precipitaÃ§Ã£o fracionada.
E) destilaÃ§Ã£o.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'medium','published',69),
('ENEM-2011.2-Q70',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2011,'QuÃ­mica inorgÃ¢nica','multiple_choice','ENEM 2011.2 â€” QuÃ­mica â€” QuestÃ£o 70

TrÃªs amostras de minÃ©rios de ferro de regiÃµes
aproximados, estÃ£o na tabela:
Tipo de Ã³xido Massa
RegiÃ£ egiÃ£o
encontrado
Considerando que as impurezas sÃ£o inertes aos
rio de ferro com carvÃ£o, de formas simplificadas, sÃ£o:
2
2FeO +
FezO, + 2Câ€”
Dados: Massas molares (g/mol) C = 12; O = 16; Fe =
Os minÃ©rios que apresentam, respectivamente, a
lada de ferro produzido sÃ£o os das regiÃµes:
A) A com 90% e B com 200 kg.
B) B com 80% e A com 161 kg.
C) C com 85% e B com 107 kg.
D) A com 75% e C com 143 kg.
E) B com 95% e A com 161 kg.
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'medium','published',70),
('ENEM-2011.2-Q71',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2011,'QuÃ­mica ambiental','multiple_choice','ENEM 2011.2 â€” QuÃ­mica â€” QuestÃ£o 71

A produÃ§Ã£o mundial de alimentos poderia se
: .
reduzir a 40% da atual sem a aplicaÃ§Ã£o de con-
trole sobre as pragas agrÃ­colas. Por outro lado,
o uso frequente dos agrotÃ³xicos pode causar
contaminaÃ§Ã£o em solos, Ã¡guas superficiais e
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'easy','published',71),
('ENEM-2011.2-Q72',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2011,'QuÃ­mica ambiental','multiple_choice','ENEM 2011.2 â€” QuÃ­mica â€” QuestÃ£o 72

As chamadas estruturas metal-orgÃ¢nicas sÃ£o
cristais metÃ¡licos porosos e estÃ¡veis, capazes
de absorver e comprimir gases em espaÃ§os
Ã­nfimos. Um grama deste material, se espalha-
do, ocuparia uma Ã¡rea de pelo menos 5 000 m?.
Os cientistas esperam que o uso de tais materi-
ais contribua para a produÃ§Ã£o de energias mais
limpas e de mÃ©todos para a captura de gases
do efeito estufa.
(DisponÃ­vel em: http:/Mww1 .folha.uol.com.br.
Acesso em: 20 jul. 2010 - adaptado)
A maior eficiÃªncia destes materiais em absorver
. SS o
gÃ¡s carbÃ´nico Ã© consequÃªncia:
A) da grande superfÃ­cie de contato entre os
cristais porosos e o gÃ¡s carbÃ´nico.
B) da alta densidade apresentada pelos materi-
ais.
C) do uso de grande quantidade de materiais
para absorver grande quantidade de gÃ¡s.
D) da alta estabilidade dos cristais metÃ¡licos.
E) da capacidade ; de comprimir io os gases ocu-
pando grandes Ã¡reas.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'hard','published',72),
('ENEM-2011.2-Q73',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2011,'QuÃ­mica geral','multiple_choice','ENEM 2011.2 â€” QuÃ­mica â€” QuestÃ£o 73. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,1,null,'medium','published',73),
('ENEM-2012.1-Q74',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2012,'QuÃ­mica ambiental','multiple_choice','ENEM 2012.1 â€” QuÃ­mica â€” QuestÃ£o 74

O rÃ³tulo de um desodorante aerossol , informa ao
consumidor que o produto possui em sua com-
posiÃ§Ã£o os gases isobutano, butano e propano,
dentre outras substÃ¢ncias. AlÃ©m dessa informa-
Ã§Ã£o, o rÃ³tulo traz, ainda, a inscriÃ§Ã£o â€œNÃ£o con-
tÃ©m CFCâ€. As reaÃ§Ãµes a seguir, que ocorrem na
estratosfera, justificam a nÃ£o utilizaÃ§Ã£o de CFC
(glorofiuorcarbono
ou Freon) nesse desodoran-
''
D) CF,CL, UV, CF,Ct + CL
1) CL+O O, + CLO-
3 ?
A preocupaÃ§Ã£o " com as possÃ­veis na ameaÃ§as Ã  R
camada de ozÃ´nio (O) baseia-se na sua princi-
an : .
pal funÃ§Ã£o: proteger a matÃ©ria viva na Terra dos
efeitos prejudiciais dos raios solares ultravioleta.
A absorÃ§Ã£o da radiaÃ§Ã£o ultravioleta pelo ozÃ´nio
estratosfÃ©rico Ã© intensa o suficiente para elimi-
nar boa parte da fraÃ§Ã£o de ultravioleta que Ã©
prejudicial Ã  vida.
A finalidade da utilizaÃ§Ã£o dos gases isobutano,
butano e propano neste aerosso]l Ã©:
28','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'hard','published',74),
('ENEM-2012.1-Q75',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2012,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2012.1 â€” QuÃ­mica â€” QuestÃ£o 75

A prÃ³polis Ã© um produto natural conhecido por
suas propriedades anti-inflamatÃ³rias e cicatri-
antes. Esse material contÃ©m aaa AAA
postos identificados atÃ© o momento. Dentre
eles, alguns sÃ£o de estrutura simples, como Ã© o
caso do C;H;CO;CH;CH3, cuja estrutura estÃ¡
mostrada a seguir.
O
NT
Cc
O
SO-CH,CH,
O Ã¡cido carboxÃ­lico e o Ã¡lcool capazes de pro-
duzir o Ã©ster em apreÃ§o por meio da reaÃ§Ã£o de
esterificaÃ§Ã£o sÃ£o, respectivamente,
A) Ã¡cido benzoico e etanol.
B) Ã¡cido propanoico e hexanol.
OC) Ã¡cido fenilacÃ©tico e metanol.
D) Ã¡cido propiÃ´nico e cicloexanol.
E) Ã¡cido acÃ©tico e Ã¡lcool benzÃ­lico.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'medium','published',75),
('ENEM-2012.1-Q76',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2012,'QuÃ­mica geral','multiple_choice','ENEM 2012.1 â€” QuÃ­mica â€” QuestÃ£o 76

No JapÃ£o, um movimento nacional para a pro-
moÃ§Ã£o da luta contra o aquecimento global leva
o slogan: 1 pessoa, 1 dia, 1 kg de CO, a me-
nos! A ideia Ã© cada pessoa reduzir em 1 kg a
quantidade de CO, emitida todo dia, por meio
de pequenos gestos ecolÃ³gicos, como diminuir
a queima de gÃ¡s de cozinha.
(Um hamburguer ecolÃ³gico? Ã‰ pra jÃ¡!
DisponÃ­vel em: http://Iges.iqm.unicamp.br.
Acesso em: 24 fev . 2012 - adaptado)
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'medium','published',76),
('ENEM-2012.1-Q77',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2012,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2012.1 â€” QuÃ­mica â€” QuestÃ£o 77

O benzeno Ã© um hidrocarboneto aromÃ¡tico pre-
sente no petrÃ³leo, no carvÃ£o e em condensados
de gÃ¡s natural.
Seus metabÃ³litos sÃ£o altamente tÃ³xicos e se
depositam na medula Ã³ssea e nos tecidos gor-
durosos.
O limite de exposiÃ§Ã£o pode causar anemia, cÃ¢n-
cer (leucemia) e distÃºrbios do comportamento.
Em termos de reatividade quÃ­mica, quando um
eletrÃ³filo se liga ao benzeno, ocorre a formaÃ§Ã£o
de um intermediÃ¡rio, o carbocÃ¡tion.
Por fim, ocorre a adiÃ§Ã£o ou substituiÃ§Ã£o eletrofÃ­-
lica.
e
=
-
|
-
fe]
carbocÃ¡tion (1) produto (11)
produto (1)
O + Br, + catalisador
Progresso da ReaÃ§Ã£o
Com base no texto e no grÃ¡fico ae do progresso da
reaÃ§Ã£o apresentada, as estruturas quÃ­micas
encontradas em |, Il e Ill sÃ£o, respectivamente:
" "
H
A) DI
Br Br
Br
; ;
29','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'hard','published',77),
('ENEM-2012.1-Q78',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2012,'QuÃ­mica geral','multiple_choice','ENEM 2012.1 â€” QuÃ­mica â€” QuestÃ£o 78. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,2,null,'medium','published',78),
('ENEM-2012.1-Q79',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2012,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2012.1 â€” QuÃ­mica â€” QuestÃ£o 79

Em uma planÃ­cie, ocorreu um acidente ambien-
tal em decorrÃªncia do derramamento de grande
quantidade de um hidrocarboneto que se apre-
senta na forma pastosa Ã  temperatura ambien-
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'easy','published',79),
('ENEM-2012.1-Q80',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2012,'QuÃ­mica geral','multiple_choice','ENEM 2012.1 â€” QuÃ­mica â€” QuestÃ£o 80. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,1,null,'medium','published',80),
('ENEM-2012.1-Q81',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2012,'QuÃ­mica geral','multiple_choice','ENEM 2012.1 â€” QuÃ­mica â€” QuestÃ£o 81. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,2,null,'medium','published',81),
('ENEM-2012.1-Q82',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2012,'QuÃ­mica ambiental','multiple_choice','ENEM 2012.1 â€” QuÃ­mica â€” QuestÃ£o 82

O boato de que os lacres das latas de alumÃ­nio
teriam um alto valor comercial levou muitas
pessoas a juntarem esse material na expectati-
va de ganhar dinheiro com sua venda. As em-
presas fabricantes de alumÃ­nio esclarecem que
isso nÃ£o passa de uma â€œlenda urbanaâ€, pois ao
retirar o anel da lata, dificulta-se a reciclagem do
alumÃ­nio. Como a liga do qual Ã© feito o anel
contÃ©m alto teor de magnÃ©sio, se ele nÃ£o estiver
junto com a lata, fica mais fÃ¡cil ocorrer a oxida-
Ã§Ã£o do alumÃ­nio no forno.
A tabela apresenta . " e os valo-
as semirreaÃ§Ãµes
es de potencial padrÃ£o de reduÃ§Ã£o de alguns
metais:
Potencial PadrÃ£o " de
SemirreaÃ§Ã£o
ReduÃ§Ã£o (V)
Litre-â€”Li - 3,05
K''+eâ€”sK â€”-2,93
Mgâ€ 24 +2e " Mg 2,36
AB +3eE SA â€”1,66 :
Zn +2e Zn â€”0,76
Cut +26 = Cu 0,34
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'hard','published',82),
('ENEM-2012.1-Q83',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2012,'QuÃ­mica geral','multiple_choice','ENEM 2012.1 â€” QuÃ­mica â€” QuestÃ£o 83. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,0,null,'medium','published',83),
('ENEM-2012.1-Q84',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2012,'EquilÃ­brio quÃ­mico','multiple_choice','ENEM 2012.1 â€” QuÃ­mica â€” QuestÃ£o 84

Quando colocados em Ã¡gua, os fosfolipÃ­deos
tendem a formar lipossomos, estruturas forma-
das por uma bicamada lipÃ­dica, conforme mos-
trado na figura. Quando rompida, essa estrutura
tende a se reorganizar em um novo lipossomo.
aARRPOO,
O
FX Po
Q ffI-â€”r FosfolipÃ­dios
OQ 2
O Nes OO O
O . CL O
O O Meio E,
Oo o Aquoso Pa
" e SS
O TS
Ã‡ D
Cs DO
O D Meio
POCBCOOS Aqueso
Esse arranjo caracterÃ­stico se deve ao fato de
os fosfolipÃ­dios apresentarem uma natureza:
A) polar, ou seja, serem inteiramente solÃºveis
em Ã¡gua.
B) apolar, ou seja, nÃ£o serem solÃºveis em solu-
- A terca
ou seja, ja, P podem comportar-se
como Ã¡cidos Ã© bases. Pp
D) insaturada, N ou seja, '' possuÃ­rem duplas liga-
. trutura
Ã‰) anfÃ­fÃ­lica ou seja ossuÃ­rem uma parte hidro-
outra idrotÃ³bica Pp
fÃ­lica e ''
Cp','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'hard','published',84),
('ENEM-2012.1-Q85',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2012,'SoluÃ§Ãµes e concentraÃ§Ã£o','multiple_choice','ENEM 2012.1 â€” QuÃ­mica â€” QuestÃ£o 85

Osmose Ã© um processo R que ocorre
espontÃ¢neo
em todos os organismos vivos e Ã© essencial Ã 
manutenÃ§Ã£o da vida. Uma soluÃ§Ã£o 0,15 mol/L
de NaCf (cloreto de sÃ³dio) possui a mesma
pressÃ£o osmÃ³tica das soluÃ§Ãµes presentes nas
cÃ©lulas humanas.
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'easy','published',85),
('ENEM-2012.1-Q86',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2012,'Estequiometria','multiple_choice','ENEM 2012.1 â€” QuÃ­mica â€” QuestÃ£o 86

Aspartame Ã© um edulcorante artificial (adoÃ§ante
dietÃ©tico) que apresenta potencial adoÃ§ante 200
vezes maior que o aÃ§Ãºcar comum, permitindo
seu uso em pequenas quantidades. Muito usado
pela indÃºstria alimentÃ­cia, principalmente nos
refrigerantes diet, tem valor energÃ©tico que cor-
responde a 4 calorias/grama. Ã‰ contraindicado a
portadores de fenilcetonÃºria, uma doenÃ§a genÃ©-
tica rara que provoca o acÃºmulo da fenilalanina
no organismo, causando retardo mental. O IDA
(Ã­ndice diÃ¡rio aceitÃ¡vel) desse adoÃ§ante Ã© 40
mg/kg de massa corpÃ³rea.
Com base nas Ã informaÃ§Ãµes . do texto, a quanti- ;
dade mÃ¡xima recomendada de aspartame, em
mol, que uma pessoa de 70 kg de massa corpo-
ral pode ingerir por dia Ã© mais prÃ³xima de:
(Dado: massa molar do aspartame = 294 g/mol)
A) 1,3 x 10Âº
B) 9,5 x 10?
c)4x 10?
D) 2,6
E) 823
QuestÃ£o ST (20122) |Ãš|]|]|||||]||||
O senso comum nos diz que os polÃ­meros orgÃ¢-
nicos (plÃ¡sticos) em geral sÃ£o isolantes elÃ©tri-
cos. Entretanto, os polÃ­meros condutores â€”
materiais orgÃ¢nicos que conduzem eletricidade.
O que faz estes polÃ­meros diferentes Ã© a pre-
senÃ§a das ligaÃ§Ãµes covalentes duplas conjuga-
das com ligaÃ§Ãµes simples, ao longo de toda a
cadeia principal, incluindo grupos aromÃ¡ticos.
Isso permite que um Ã¡tomo de carbono desfaÃ§a
a ligaÃ§Ã£o dupla com um vizinho e refaÃ§a-a com
outro. Assim, a carga elÃ©trica desloca-se dentro
do material.
(FRANCISCO, R. H. P. PolÃ­meros condutores. Revis-
ta EletrÃ´nica de CiÃªncias, n. 4, fev. 2002. DisponÃ­vel
em: www.cdec.usp.br. Acesso em: 29 fev. 2012)
32','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'hard','published',86),
('ENEM-2012.1-Q87',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2012,'QuÃ­mica geral','multiple_choice','ENEM 2012.1 â€” QuÃ­mica â€” QuestÃ£o 87. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,0,null,'medium','published',87),
('ENEM-2012.2-Q88',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2012,'QuÃ­mica geral','multiple_choice','ENEM 2012.2 â€” QuÃ­mica â€” QuestÃ£o 88

O quadro apresenta o teor de cafeina em dife-
rentes bebidas comumente consumidas pela
populaÃ§Ã£o.
EsEmcade
cafeina (mg)
"
| Chocolate quente [600 [| > |
Da anÃ¡lise do quadro conclui-se que o menor
teor de cafeina por unidade de volume estÃ¡
presente no:
A) cafÃ© expresso.
B) chÃ¡ preto.
C) chocolate quente.
D) cafÃ© filtrado.
E) refrigerante de cola.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'medium','published',88),
('ENEM-2012.2-Q89',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2012,'QuÃ­mica ambiental','multiple_choice','ENEM 2012.2 â€” QuÃ­mica â€” QuestÃ£o 89

O polÃ­mero PET (tereftalato de polietileno), ma-
terial presente em diversas embalagens descar-
tÃ¡veis, pode levar centenas de anos para ser
degradado e seu processo de reciclagem requer
um grande aporte energÃ©tico. Nesse contexto,
uma tÃ©cnica que visa baratear o processo foi
implementada recentemente. Trata-se do aque-
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'medium','published',89),
('ENEM-2012.2-Q90',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2012,'QuÃ­mica geral','multiple_choice','ENEM 2012.2 â€” QuÃ­mica â€” QuestÃ£o 90. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,0,null,'medium','published',90),
('ENEM-2012.2-Q91',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2012,'Radioatividade','multiple_choice','ENEM 2012.2 â€” QuÃ­mica â€” QuestÃ£o 91

Um aquecedor solar consiste essencialmente em
meio da qual flui Ã¡gua a ser aquecida. A parte inferior
que Ã© o coletor solar. A forma da serpentina tem a
tor e com a prÃ³pria radiaÃ§Ã£o solar sem aumentar
condutor, transmite a energia da radiaÃ§Ã£o solar
para a Ã¡gua. A superfÃ­cie deve ser recoberta com
para que absorva o mÃ¡ximo de radiaÃ§Ã£o solar e emita
relacionam propriedades de alguns metais/ligas
res:
RazÃ£o entre a
absorbÃ¢ncia de
Material A seleti SUvO
o radiaÃ§Ã£o solar e a
K emitÃ¢ncia de radiaÃ§Ã£o
infravermelha
A. â€”Ã“xidoe sulfeto
de nÃ­quel e zinco 8,45
aplicados sobre zinco
B. Ã“xido e sulfeto de
nÃ­quel e zinco sobre 7,42
ferro galvanizado
C. Ã“xido de cobre em
alumÃ­nio " anodizado : 7,12
Os aquecedores solares mais eficientes e, portanto,
ser construÃ­dos utilizando como material metÃ¡lico e
A) cobre e material seletivo quente A.
B) zinco e material seletivo quente B.
C) aÃ§o e material seletivo quente B.
D) aÃ§o e material seletivo quente A.
E) cobre e material seletivo quente C.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'hard','published',91),
('ENEM-2012.2-Q92',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2012,'EquilÃ­brio quÃ­mico','multiple_choice','ENEM 2012.2 â€” QuÃ­mica â€” QuestÃ£o 92

A fosfatidilserina Ã© um fosfolipÃ­dio aniÃ´nico cuja
Ã§Ã£o celular e vem sendo estudada no desenvolvimento
senta a estrutura da fosfatidilserina:
OAFDÃ”ADDADAARAASAS
HC
Estrutura da
Com base nas informaÃ§Ãµes do texto, a natureza da
tipo:
Dado: nÃºmero atÃ´mico do elemento cÃ¡lcio: 20
A) iÃ´nica somente com o grupo aniÃ´nico fosfato, jÃ¡
B) iÃ´nica com os grupos aniÃ´nicos fosfato e carboxila,
divalente.
C) iÃ´nica com o cÃ¡tion amÃ´nio, porque o cÃ¡lcio livre
D) covalente com qualquer dos grupos nÃ£o carregados
doar elÃ©trons ao cÃ¡lcio livre para formar a ligaÃ§Ã£o.
E) covalente com qualquer grupo catiÃ´nico da
rÃ¡ compartilhar seus elÃ©trons com tais grupos.
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'medium','published',92),
('ENEM-2012.2-Q93',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2012,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2012.2 â€” QuÃ­mica â€” QuestÃ£o 93

Um dos mÃ©todos de produÃ§Ã£o de biodiesel envolve
nol em meio bÃ¡sico (NaOH ou KOH), que precisa
esquema reacional da produÃ§Ã£o de biodiesel, em
cas dos Ã©steres de Ã¡cidos graxos.
Ã€ x
o
go: R$
RO OR * baso Vl
+ 3HCOHâ€”Ã‡Ã‡O
A ausÃªncia de Ã¡gua no meio reacional se faz necessÃ¡ria
A) evitar a diminuiÃ§Ã£o da temperatura da mistura
B) manter o meio reacional no estado sÃ³lido.
C) manter a elevada concentraÃ§Ã£o do meio reacional.
D) manter constante o volume de Ã³leo no meio reacional.
E) evitar a hidrÃ³lise dos Ã©steres no meio reacional e','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'medium','published',93),
('ENEM-2012.2-Q94',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2012,'QuÃ­mica ambiental','multiple_choice','ENEM 2012.2 â€” QuÃ­mica â€” QuestÃ£o 94

Pesquisadores conseguiram produzir grafita
magnÃ©tica por um processo inÃ©dito em forno
com atmosfera controlada e em temperaturas
elevadas. No forno sÃ£o colocados grafita co-
mercial em pÃ³ e Ã³xido metÃ¡lico, tal como CuO.
Nessas condiÃ§Ãµes, o Ã³xido Ã© reduzido e ocorre
a oxidaÃ§Ã£o da grafita, com a introduÃ§Ã£o de pe-
quenos defeitos, dando origem Ã  propriedade
magnÃ©tica do material.
Considerando o processo descrito com um ren-
dimento de 100%, 8 g de CuO produzirÃ£o uma
massa de CO, igual a:
Dados: Massa molar em gÃ­mol: C = 12; O = 16;
Cu = 64
A) 3,79.
B)4,49.
C)5,59.
D) 2,29.
E) 2,89.
QuestÃ£o 95(20122)
A grafita Ã© uma variedade alotrÃ³pica do carbo-
no. Trata-se de um sÃ³lido preto, macio e escor-
regadio, que apresenta brilho caracterÃ­stico e
boa condutibilidade elÃ©trica. Considerando es-
sas propriedades, a grafita tem potencial de
aplicabilidade em:
A) Ferramentas para riscar ou cortar materiais,
nanoestruturas capazes de transportar drogas
com efeito radioterÃ¡pico e cÃ¡todos de baterias
alcalinas.
B) Ferramentas para amolar ou polir materiais,
brocas odontolÃ³gicas e condutores de eletrici-
dade.
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'hard','published',94),
('ENEM-2012.2-Q95',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2012,'QuÃ­mica geral','multiple_choice','ENEM 2012.2 â€” QuÃ­mica â€” QuestÃ£o 95. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,4,null,'medium','published',95),
('ENEM-2012.2-Q96',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2012,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2012.2 â€” QuÃ­mica â€” QuestÃ£o 96

Para preparar uma massa bÃ¡sica de pÃ£o, deve-
se misturar apenas farinha, Ã¡gua, sal e fermen-
to. Parte do trabalho deixa-se para o fungo pre-
sente no fermento: ele utiliza amido e aÃ§Ãºcares
da farinha em reaÃ§Ãµes quÃ­micas que resultam
na produÃ§Ã£o de alguns outros compostos impor-
tantes no processo de crescimento da massa.
Antes de assar, Ã© importante que a massa seja
deixada num recipiente por algumas horas para
que o processo de fermentaÃ§Ã£o ocorra.
Esse perÃ­odo de espera Ã© importante para que a
Massa cresÃ§a, pois Ã© quando ocorre a:
A) liberaÃ§Ã£o de energia pelos fungos.
B) formaÃ§Ã£o de diÃ³xido de carbono.
C) evaporaÃ§Ã£o do Ã¡lcool formado na decompo-
siÃ§Ã£o dos aÃ§Ãºcares.
D) reproduÃ§Ã£o do fungo na massa.
E) transformaÃ§Ã£o da Ã¡gua lÃ­quida em vapor
d''Ã¡gua.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'hard','published',96),
('ENEM-2012.2-Q97',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2012,'Estequiometria','multiple_choice','ENEM 2012.2 â€” QuÃ­mica â€” QuestÃ£o 97

Motores a combustÃ£o interna apresentam me-
lhor rendimento quando podem ser adotadas
taxas de compressÃ£o mais altas nas suas cÃ¢-
maras de combustÃ£o, sem que o combustÃ­vel
sofra igniÃ§Ã£o espontÃ¢nea. CombustÃ­veis com
maiores Ã­ndices de resistÃªncia Ã  compressÃ£o,
35','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'easy','published',97),
('ENEM-2012.2-Q98',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2012,'QuÃ­mica geral','multiple_choice','ENEM 2012.2 â€” QuÃ­mica â€” QuestÃ£o 98. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,2,null,'medium','published',98),
('ENEM-2013.1-Q99',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2013,'Estequiometria','multiple_choice','ENEM 2013.1 â€” QuÃ­mica â€” QuestÃ£o 99

(o) brasileiro consome em mÃ©dia 500 miligramas
1. "
de cÃ¡lcio por dia, quando a quantidade reco-
mendada Ã© o dobro. Uma alimentaÃ§Ã£o balance-
ada Ã© a melhor decisÃ£o para evitar problemas
no futuro, como a osteoporose, uma doenÃ§a que
atinge os ossos. Ela se caracteriza pela diminui-
Ã§Ã£o substancial de massa Ã³ssea, tornando os
ossos frÃ¡geis e mais suscetÃ­veis a fraturas.
Considerando-se o valor de 6 x 10Âº molâ€* para
a constante de Avogadro e a massa molar do
cÃ¡lcio igual a 40 g/mol, qual a quantidade mÃ­ni-
ma diÃ¡ria de Ã¡tomos de cÃ¡lcio a ser ingerida
para que uma pessoa supra suas necessida-
des?
A) 7,5x 10Âº
B) 1,5x 10%
C)7,5x 10Âº
D) 1,5x 10%
E) 4,8 x 10Âºâ€
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'hard','published',99),
('ENEM-2013.1-Q100',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2013,'Radioatividade','multiple_choice','ENEM 2013.1 â€” QuÃ­mica â€” QuestÃ£o 100

Glicose marcada com nuclÃ­deos de carbono-11
Ã© utilizada na medicina para se obter imagens
tridimensionais do cÃ©rebro, por meio de tomo-
grafia de emissÃ£o de pÃ³sitrons. A desintegraÃ§Ã£o
do carbono-11 gera um pÃ³sitron, com tempo de
meia-vida de 20,4 min, de acordo com a equa-
Ã§Ã£o da reaÃ§Ã£o nuclear:
n n o
C> B+â‚¬
6 5 1
(pÃ³sitron)
A partir da injeÃ§Ã£o de glicose marcada com esse
nuclÃ­deo, o tempo de aquisiÃ§Ã£o de uma imagem
de tomografia Ã© de cinco meias-vidas.
Considerando que o medicamento contÃ©m 1,00
9 do carbono-11, a massa, em miligramas, do
nuclÃ­deo restante, apos a aquisiÃ§Ã£o da imagem,
Ã© mais prÃ³xima de:
A) 0,200.
B) 0,969.
C) 9,80.
D) 313.
E) 200.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'medium','published',100),
('ENEM-2013.1-Q101',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2013,'TermoquÃ­mica','multiple_choice','ENEM 2013.1 â€” QuÃ­mica â€” QuestÃ£o 101

O uso de embalagens plÃ¡sticas descartÃ¡veis Ã
vem crescendo em todo o mundo, juntamente
com o problema ambiental gerado por seu des-
carte inapropriado.
O politereftalato de etileno (PET), cuja estrutura
Ã© mostrada tem sido muito utilizado na indÃºstria
de refrigerantes e pode ser reciclado e reutiliza-
do.
Uma das opÃ§Ãµes possÃ­veis envolve a produÃ§Ã£o
de matÃ©rias-primas, como o etilenoglico! (1,2-
etanodiol), a partir de objetos compostos de
PET pÃ³s-consumo.
fe) fo]
NT NT
HO AO C-O-CH;CH-O H
n
Com base nas informaÃ§Ãµes do texto, uma alter-
nativa para a obtenÃ§Ã£o de etilenoglicol a partir
doPETÃ©a:
A) solubilizaÃ§Ã£o dos objetos.
B) combustÃ£o dos objetos.
C) trituraÃ§Ã£o dos objetos.
D) hidrÃ³lise dos objetos.
E) fusÃ£o dos objetos.
36','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'medium','published',101),
('ENEM-2013.1-Q102',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2013,'SoluÃ§Ãµes e concentraÃ§Ã£o','multiple_choice','ENEM 2013.1 â€” QuÃ­mica â€” QuestÃ£o 102

O citral, substÃ¢ncia de odor fortemente cÃ­trico, Ã© obtido
cujo Ã³leo essencial possui aproximadamente 80%,
Uma de suas aplicaÃ§Ãµes Ã© na fabricaÃ§Ã£o de produtos
Apis, pois seu cheiro Ã© semelhante a um dos
C1oH15O, com uma cadeia alifÃ¡tica de oito carbonos,
pos substituintes metila, nos carbonos 3 e 7. O citral
que mais contribui para o forte odor.
Para que se consiga atrair um maior nÃºmero de
deve estar presente em alta concentraÃ§Ã£o no produto
fe]
nm D ia xÃ¡
o
FD FF >oÃšU
B)
FF
Ãš Ãš
o','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'medium','published',102),
('ENEM-2013.1-Q103',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2013,'SoluÃ§Ãµes e concentraÃ§Ã£o','multiple_choice','ENEM 2013.1 â€” QuÃ­mica â€” QuestÃ£o 103

Uma das etapas do tratamento da Ã¡gua Ã© a desinfecÃ§Ã£o,
Esse mÃ©todo consiste na dissoluÃ§Ã£o do gÃ¡s cloro
ser desinfectada. As equaÃ§Ãµes das reaÃ§Ãµes quÃ­micas
Cl, (g) + 2 H,O (1) = Hclo
HCIO (aq) + H,O () = H,O* (aq)
A aÃ§Ã£o desinfetante Ã© controlada pelo Ã¡cido hipocloroso,
de 80 vezes superior ao Ã¢nion hipoclorito. O pH do
com que o Ã¡cido hipocloroso se ioniza. Para que a
tratada deve estar mais prÃ³ximo de:
AO.
B)5.
o) 7.
D) 89.
E) 14.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'medium','published',103),
('ENEM-2013.1-Q104',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2013,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2013.1 â€” QuÃ­mica â€” QuestÃ£o 104

Plantas terrestres que ainda estÃ£o em fase de
do-o para formar novas molÃ©culas orgÃ¢nicas, e liberam
tas maduras, cujas Ã¡rvores jÃ¡ atingiram o equilÃ­brio,
produÃ§Ã£o pela fotossÃ­ntese. A morte natural de
centraÃ§Ã£o de O, e de CO, prÃ³ximo Ã  superfÃ­cie do
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'easy','published',104),
('ENEM-2013.1-Q105',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2013,'QuÃ­mica geral','multiple_choice','ENEM 2013.1 â€” QuÃ­mica â€” QuestÃ£o 105. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,1,null,'medium','published',105),
('ENEM-2013.1-Q106',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2013,'QuÃ­mica geral','multiple_choice','ENEM 2013.1 â€” QuÃ­mica â€” QuestÃ£o 106. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,4,null,'medium','published',106),
('ENEM-2013.1-Q107',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2013,'SoluÃ§Ãµes e concentraÃ§Ã£o','multiple_choice','ENEM 2013.1 â€” QuÃ­mica â€” QuestÃ£o 107

A varfarina Ã© um fÃ¡rmaco que diminui a agrega-
Ã§Ã£o plaquetÃ¡ria, e por isso Ã© utilizada como
anticoagulante, desde que esteja presente no
plasma, com uma concentraÃ§Ã£o superior a 1,0
mg/L.
Entretanto, concentraÃ§Ãµes plasmÃ¡ticas superio-
res a 4,0 mg/L podem desencadear hemorragi-
as. As molÃ©culas desse fÃ¡rmaco ficam retidas
no espaÃ§o intravascular e dissolvidas exclusi-
vamente no plasma, que representa aproxima-
damente 60% do sangue em volume.
Em um medicamento, a varfarina Ã© administrada
por via intravenosa na forma de soluÃ§Ã£o aquo-
sa, com concentraÃ§Ã£o de 3,0 mg/mL. Um indivÃ­-
duo adulto, com volume sanguÃ­neo total de 5,0
L, serÃ¡ submetido a um tratamento com soluÃ§Ã£o
injetÃ¡vel desse medicamento.
38','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'medium','published',107),
('ENEM-2013.1-Q108',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2013,'EletroquÃ­mica','multiple_choice','ENEM 2013.1 â€” QuÃ­mica â€” QuestÃ£o 108

Eu tambÃ©m podia decompor a Ã¡gua, se fosse
salgada ou acidulada, usando a pilha de Daniell
como fonte de forÃ§a. Lembro o prazer extraordi-
nÃ¡rio que sentia ao decompor um pouco de
Ã¡gua em uma taÃ§a para ovos quentes, vendo-a
separar-se em seus elementos, o oxigÃªnio em
um eletrodo, o hidrogÃªnio no outro.
A eletricidade de uma pilha de 1 volt parecia tÃ£o
fraca, e no entanto podia ser suficiente para
desfazer um composto quÃ­mico, a Ã¡gua.
(SACKS, O. Tio TungstÃªnio: memÃ³rias de uma infÃ¢n-
cia quÃ­mica. SÃ£o Paulo: Cia das Letras, 2002)
O fragmento do romance de Oliver Sacks relata
a separaÃ§Ã£o dos elementos que compÃµem a
agua. o principio do lisas apresentado Ã©
utilizado industrialmente na:
A) obtenÃ§Ã£o de ouro Ã  partir de pepitas.
= ; "
B) obtenÃ§Ã£o de calcÃ¡rio a partir de rochas.
C) obtenÃ§Ã£o de alumÃ­nio a partir de bauxita.
D) obtenÃ§Ã£o de ferro a partir de seus Ã³xidos.
E) obtenÃ§Ã£o de amÃ´nia a partir de hidrogÃªnio e
nitrogÃªnio.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'hard','published',108),
('ENEM-2013.1-Q109',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2013,'EletroquÃ­mica','multiple_choice','ENEM 2013.1 â€” QuÃ­mica â€” QuestÃ£o 109

A produÃ§Ã£o de aÃ§o envolve o aquecimento do
minÃ©rio de ferro, junto com carvÃ£o (carbono) e
ar atmosfÃ©rico em uma sÃ©rie de reaÃ§Ãµes de
oxidorreduÃ§Ã£o.
O produto Ã© chamado de ferro-gusa e contÃ©m
cerca de 3,3% de carbono. Uma forma de elimi-
nar o excesso de carbono Ã© a oxidaÃ§Ã£o a partir
do aquecimento do ferro-gusa com gÃ¡s oxigÃªnio
puro.
Os dois principais produtos formados sÃ£o aÃ§o
doce (liga de ferro com teor de 0,3% de carbono
restante) e gÃ¡s carbÃ´nico. As massas molares
aproximadas dos elementos carbono e oxigÃªnio
sÃ£o, respectivamente, 12 g/mol e 16 g/mol.
(LEE, J. D. QuÃ­mica inorgÃ¢nica nÃ£o tÃ£o concisa.
SÃ£o Paulo: Edgard Blucher, 1999)
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'medium','published',109),
('ENEM-2013.1-Q110',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2013,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2013.1 â€” QuÃ­mica â€” QuestÃ£o 110

Entre as substÃ¢ncias usadas para o tratamento
de Ã¡gua estÃ¡ o sulfato de alumÃ­nio que, em
meio alcalino, forma partÃ­culas em suspensÃ£o
na Ã¡gua, Ã s quais as impurezas presentes no
meio se aderem.
O mÃ©todo de separaÃ§Ã£o comumente usado para
retirar o sulfato de alumÃ­nio com as impurezas
aderidas Ã© a:
A) flotaÃ§Ã£o.
B) levigaÃ§Ã£o.
C) ventilaÃ§Ã£o.
D) peneiraÃ§Ã£o.
E) centrifugaÃ§Ã£o.
QuestÃ£o IIIÃ‡2OTBAJ |||
As fraldas descartÃ¡veis que contÃªm o polÃ­mero
poliacrilato de sÃ³dio (1) sÃ£o mais eficientes na
Vencionais, constituÃ­das de fibras de celulose
retenÃ§Ã£o de Ã¡gua que as fraldas de pano con-
2) ]
Ho OH
o
O SO | Na + J
OH
(1) (2)
A maior . eficiÃªncia NS dessas fraldas descartÃ¡veis, .
em relaÃ§Ã£o Ã s de pano, deve-se Ã s:
A) interaÃ§Ãµes dipolo-dipolo mais fortes entre o
poliacrilato e a Ã¡gua, em relaÃ§Ã£o as ligaÃ§Ãµes de
hidrogÃªnio entre a celulose e as molÃ©culas de
Ã¡gua.
B) interaÃ§Ãµes Ã­on-Ã­on mais fortes entre o polia-
crilato e as molÃ©culas de Ã¡gua, em relaÃ§Ã£o Ã s
ligaÃ§Ãµes de hidrogÃªnio entre a celulose e as
molÃ©culas de Ã¡gua.
C) ligaÃ§Ãµes de hidrogÃªnio mais fortes entre o
poliacrilato e a Ã¡gua, em relaÃ§Ã£o Ã s interaÃ§Ãµes
ion-dipolo entre a celulose e as molÃ©culas de
Ã¡gua.
39','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'hard','published',110),
('ENEM-2013.1-Q111',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2013,'QuÃ­mica geral','multiple_choice','ENEM 2013.1 â€” QuÃ­mica â€” QuestÃ£o 111. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,4,null,'medium','published',111),
('ENEM-2013.2-Q112',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2013,'QuÃ­mica geral','multiple_choice','ENEM 2013.2 â€” QuÃ­mica â€” QuestÃ£o 112. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,0,null,'medium','published',112),
('ENEM-2013.2-Q113',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2013,'EletroquÃ­mica','multiple_choice','ENEM 2013.2 â€” QuÃ­mica â€” QuestÃ£o 113

ApÃ³s o desmonte da bateria automotiva, Ã© obti-
da uma pasta residual de 6 kg, em que 19%, em
massa, Ã© diÃ³xido de chumbo(IV), 60%, sulfato
de chumbo(ll) e 21%, chumbo metÃ¡lico. O pro-
cesso pirometalÃºrgico Ã© o mais comum na ob-
tenÃ§Ã£o do chumbo metÃ¡lico, porÃ©m, devido Ã 
alta concentraÃ§Ã£o de sulfato de chumbo(ll),
ocorre grande produÃ§Ã£o de diÃ³xido de enxofre
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'medium','published',113),
('ENEM-2013.2-Q114',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2013,'EletroquÃ­mica','multiple_choice','ENEM 2013.2 â€” QuÃ­mica â€” QuestÃ£o 114

Se dermos uma mordida em um pedaÃ§o de
papel alumÃ­nio colocado em cima de uma obtu-
raÃ§Ã£o de amÃ¡lgama (combinaÃ§Ã£o do mercÃºrio
metÃ¡lico com metais e/ou ligas metÃ¡licas), senti-
remos uma dor causada por uma corrente que
pode chegar atÃ© 30 yA.
(SILVA, R. R. et al. QuÃ­mica Nova na Escola, SÃ£o
Paulo, n. 13, maio 2001 - adaptado)
O contato dos materiais metÃ¡licos citados pro-
duz:
A) uma soluÃ§Ã£o eletrolÃ­tica, cujo fluxo de elÃ©-
trons Ã© espontÃ¢neo.
B) um sistema galvÃ¢nico, cujo fluxo de elÃ©trons
nÃ£o Ã© espontÃ¢neo.
C) um sistema eletrolÃ­tico, cujo fluxo de elÃ©trons
nÃ£o Ã© espontÃ¢neo.
D) uma eletrÃ³lise, cujo fluxo de elÃ©trons nÃ£o Ã©
espontÃ¢neo.
E) uma pilha, cujo fluxo de elÃ©trons Ã© espontÃ£Ã¢-
neo.
40','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'hard','published',114),
('ENEM-2013.2-Q115',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2013,'QuÃ­mica geral','multiple_choice','ENEM 2013.2 â€” QuÃ­mica â€” QuestÃ£o 115

BalÃ£o de festa com
bicarbonato de sÃ³dio
preso a uma garrafa
com vinagre.
STO
-
â€”
â€”
A transformaÃ§Ã£o quÃ­mica em questÃ£o Ã© representada
A) CH;COOH (aq) + NaHCO; (s) â€” NaCO?* (aq) +
B) CH;COOH (aq) + NaHCO; (s) â€” Na* (aq) + CH;COOâ€
C) CH;COOH (aq) + NaHCO; (s) â€” Naâ€ (aq) +
D) CH;COOH (aq) + NaHCO; (s) â€” Na* (aq) +
E) CH;COOH (aq) + NaHCO; (s) â€” Naâ€ (aq) +','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'medium','published',115),
('ENEM-2013.2-Q116',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2013,'EquilÃ­brio quÃ­mico','multiple_choice','ENEM 2013.2 â€” QuÃ­mica â€” QuestÃ£o 116

A qualidade de Ã³leos de cozinha, compostos
medida pelo Ã­ndice de iodo. Quanto maior o grau
determinado e melhor a qualidade do Ã³leo. Na figura,
estar presentes em diferentes Ã³leos de cozinha:
PENSADOS 4
oH
Ãcido palmÃ­tico
AA Ã€
JÃ¡
oH
:
Ãcido oleico
AAA A
Ãcido PEA linolÃªnico
Dentre os compostos apresentados, os dois que
nha sÃ£o os Ã¡cidos:
A) palmÃ­tico e linolÃªnico.
B) esteÃ¡rico e oleico.
C) palmÃ­tico e esteÃ¡rico.
D) linolÃªnico e esteÃ¡rico.
E) linolÃªnico e linoleico.
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'medium','published',116),
('ENEM-2013.2-Q117',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2013,'SoluÃ§Ãµes e concentraÃ§Ã£o','multiple_choice','ENEM 2013.2 â€” QuÃ­mica â€” QuestÃ£o 117

Ã€ medida que se expira sobre uma soluÃ§Ã£o de
azul de bromotimol e hidrÃ³xido de sÃ³dio (Na-
OH), sua coloraÃ§Ã£o azul caracterÃ­stica vai se
alterando. O azul de bromotimol Ã© um indicador
Ã¡cido-base que adquire cor azul em pH bÃ¡sico,
verde em pH neutro e amarela em pH Ã¡cido. O
gÃ¡s carbÃ´nico (CO>) expirado reage com a Ã¡gua
presente na soluÃ§Ã£o (HO), produzindo Ã¡cido
carbÃ´nico (HXCOs). Este pode reagir com o Na-
OH da soluÃ§Ã£o inicial, produzindo bicarbonato
de sÃ³dio (NaHCO;):
CO, + HO â€” HCO;
H2CO;3 + NaOH â€” NaHCO; + HO
O que a pessoa irÃ¡ observar Ã  medida que expi-
ra no recipiente contendo essa soluÃ§Ã£o?
A) A soluÃ§Ã£o mudarÃ¡ de azul para verde e, em
seguida, de verde para azul. Isso ocorrerÃ¡ em
funÃ§Ã£o da neutralizaÃ§Ã£o de um meio inicialmen-
te bÃ¡sico acompanhado de um aumento de pH
na soluÃ§Ã£o, Ã  medida que Ã¡cido carbÃ´nico Ã©
adicionado ao meio.
B) A soluÃ§Ã£o mudarÃ¡ de cor, de azul para verde,
e, em seguida, de verde para amarelo. Com o
acrÃ©scimo de Ã¡cido carbÃ´nico, o pH da soluÃ§Ã£o
irÃ¡ reduzir atÃ© tornar-se neutro. Em seguida, um
excesso de Ã¡cido carbÃ´nico tornarÃ¡ o pH da
soluÃ§Ã£o Ã¡cido.
C) A cor da soluÃ§Ã£o nÃ£o serÃ¡ alterada com o
acrÃ©scimo de Ã¡cido carbÃ´nico. Isso porque o
meio Ã© inicialmente neutro e a presenÃ§a de Ã¡ci-
do carbÃ´nico nÃ£o produzirÃ¡ nenhuma mudanÃ§a
no pH da soluÃ§Ã£o.
D) A cor da soluÃ§Ã£o alterarÃ¡ de azul para ama-
relo e, em seguida, de amarelo para verde. Es-
se comportamento Ã© justificado pelo fato de o
Ã¡cido carbÃ´nico reduzir bruscamente o pH da
soluÃ§Ã£o e depois ser neutralizado pelo restante
de NaOH presente no meio.
E) A soluÃ§Ã£o somente terÃ¡ sua cor alterada de
azul para amarelo, po sem formado um Ss.
cesso de Ã¡cido carbÃ´nico no recipiente, o que
reduzirÃ¡ bruscamente o pH da soluÃ§Ã£o.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'hard','published',117),
('ENEM-2013.2-Q118',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2013,'CinÃ©tica quÃ­mica','multiple_choice','ENEM 2013.2 â€” QuÃ­mica â€” QuestÃ£o 118

HÃ¡ processos industriais que envolvem reaÃ§Ãµes
quÃ­micas na obtenÃ§Ã£o de diversos produtos ou
bens consumidos pelo homem. Determinadas
etapas de obtenÃ§Ã£o desses produtos empregam
catalisadores quÃ­micos tradicionais, que tÃªm
sido, na medida do possÃ­vel, substituÃ­dos por
enzimas.
Em processos industriais, uma das vantagens
de se substituÃ­rem os catalisadores quÃ­micos
tradicionais por enzimas decorre do fato de es-
tas serem:
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'medium','published',118),
('ENEM-2013.2-Q119',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2013,'SoluÃ§Ãµes e concentraÃ§Ã£o','multiple_choice','ENEM 2013.2 â€” QuÃ­mica â€” QuestÃ£o 119

O mÃ¡rmore Ã© um material empregado para re-
vestimento de pisos e um de seus principais
constituintes Ã© o carbonato de cÃ¡lcio. Na limpe-
za desses pisos com soluÃ§Ã£o Ã¡cida, ocorre efer-
vescÃªncia. Nessa efervescÃªncia o gÃ¡s liberado
Ã©o:
A) hidrogÃªnio.
= monÃ³xido
de carbono.
) oxigÃªnio.
D) cloro.
E) diÃ³xido de carbono.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'medium','published',119),
('ENEM-2013.2-Q120',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2013,'TermoquÃ­mica','multiple_choice','ENEM 2013.2 â€” QuÃ­mica â€” QuestÃ£o 120

A hematita (a-Fe2Os), alÃ©m de ser utilizada para
| "
obtenÃ§Ã£o do aÃ§o, tambÃ©m Ã© utilizada como um
catalisador de processos quÃ­micos, como na
sÃ­ntese da amÃ´nia, importante matÃ©ria-prima da
indÃºstria agroquÃ­mica.
(MEDEIROS, M. A. F. QuÃ­mica Nova na Escola, SÃ£o
Paulo, v. 32, n. 3, ago. 2010 - adaptado)
O uso da hematita viabiliza economicamente a
produÃ§Ã£o da amÃ´nia, porque:
A) aumenta o tempo do processamento da rea-
Ã§Ã£o.
B) diminui a energia de ativaÃ§Ã£o da reaÃ§Ã£o.
C) aumenta a variaÃ§Ã£o da entalpia da reaÃ§Ã£o.
D) aumenta a quantidade de produtos formados.
E) diminui a rapidez da reaÃ§Ã£o.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'medium','published',120),
('ENEM-2013.2-Q121',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2013,'TermoquÃ­mica','multiple_choice','ENEM 2013.2 â€” QuÃ­mica â€” QuestÃ£o 121

||
O Instituto Luiz Coimbra (UFRJ) lanÃ§ou o pri-
meiro Ã´nibus urbano movido a hidrogÃªnio do
HemisfÃ©rio Sul, com tecnologia inteiramente
nacional. Sua traÃ§Ã£o provÃ©m de trÃªs fontes de
energia, sendo uma delas a pilha de combustÃ­-
vel, na qual o hidrogÃªnio, gerado por um pro-
cesso eletroquÃ­mico, reage com o oxigÃªnio do
ar, formando Ã¡gua.
A transformaÃ§Ã£o de energia que ocorre na pilha
de combustÃ­vel responsÃ¡vel pelo movimento do
Ã´nibus decorre da energia cinÃ©tica oriunda
do(a):
A) eletricidade gerada pela reaÃ§Ã£o de oxirredu-
Ã§Ã£o do hidrogÃªnio com o oxigÃªnio.
B) contraÃ§Ã£o gasosa causada pela reaÃ§Ã£o entre
o hidrogÃªnio e o oxigÃªnio.
42','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'medium','published',121),
('ENEM-2013.2-Q122',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2013,'TermoquÃ­mica','multiple_choice','ENEM 2013.2 â€” QuÃ­mica â€” QuestÃ£o 122

Industrialmente Ã© possÃ­vel separar os compo-
nentes do ar, utilizando-se uma coluna de fraci-
onamento. Com este processo, obtÃªm-se gases
como: oxigÃªnio (O>), nitrogÃªnio (NÂ») e argÃ´nio
(Ar). Nesse processo o ar Ã© comprimido e se
liquefaz; em seguida ele Ã© expandido, volta ao
estado gasoso e seus componentes se separam
NA
A ordem de separaÃ§Ã£o dos gases na coluna de
fracionamento estÃ¡ baseada em qual proprieda-
de da matÃ©ria?
A) Na pressÃ£o parcial dos gases, ou seja, o gÃ¡s
com menor pressÃ£o parcial separa-se primeiro.
B) Na densidade dos gases, ou seja, o menos
denso separa-se primeiro.
C) Na temperatura de ebuliÃ§Ã£o dos gases, ou
seja, o gÃ¡s com menor temperatura de ebuliÃ§Ã£o
separa-se primeiro.
D) Na capacidade tÃ©rmica dos gases, ou seja, o
gÃ¡s que mais absorve calor separa-se primeiro.
E) Na condutividade tÃ©rmica dos gases, ou seja,
o gÃ¡s que mais rÃ¡pido absorve calor separa-se
primeiro.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'hard','published',122),
('ENEM-2014.1-Q123',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2014,'QuÃ­mica ambiental','multiple_choice','ENEM 2014.1 â€” QuÃ­mica â€” QuestÃ£o 123

A liberaÃ§Ã£o dos gases clorofluorcarbonos
(CFCs) na atmosfera pode provocar depleÃ§Ã£o
de ozÃ´nio (Os) na estratosfera. O ocÃ´no cetro,
tosfÃ©rico Ãª responsÃ¡vel por absorver parte da
radiaÃ§Ã£o ultravioleta emitida pelo Sol, a qual Ã©
nociva aos seres VIVOS. Esse processo, na ca-
mada de ozÃ´nio, Ã© ilustrado simplificadamente
na figura.
Logonda
e:
& >
s% oa
0/0 &
eo
hv PÃ¡ Ay
A A |
7 N J
oâ€
O
s% o %&
RA Li
Quimicamente, a destruiÃ§Ã£o do ozÃ´nio na at
mosfera por gases CFCs Ã© decorrÃªncia da:
A) clivagem da molÃ©cula de ozÃ´nio pelos CFCs
para produzir espÃ©cies radicalares.
B) produÃ§Ã£o de oxigÃªnio molecular a partir de
ozÃ´nio, catalisada por Ã¡tomos de cloro.
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'medium','published',123),
('ENEM-2014.1-Q124',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2014,'QuÃ­mica ambiental','multiple_choice','ENEM 2014.1 â€” QuÃ­mica â€” QuestÃ£o 124

Para impedir a contaminaÃ§Ã£o microbiana do
o . .
suprimento de Ã¡gua, deve-se eliminar as emis-
sÃµes de efluentes es quando necessÃ¡rio, tratÃ¡-lo
com desinfetante. O Ã¡cido hipocloroso (HCIO),
produzido pela reaÃ§Ã£o entre cloro e Ã¡gua, Ã© um
dos compostos mais empregados como desinfe-
tante. Contudo, ele nÃ£o atua somente como
oxidante, mas tambÃ©m como um ativo agente
de cloraÃ§Ã£o. A presenÃ§a de matÃ©ria orgÃ¢nica
dissolvida no suprimento de Ã¡gua clorada pode
levar Ã  formaÃ§Ã£o de clorofÃ³rmio (CHCI3) e ou-
tras espÃ©cies orgÃ¢nicas cloradas tÃ³xicas.
Visando eliminar da Ã¡gua o clorofÃ³rmio e outras
molÃ©culas orgÃ¢nicas, o tratamento adequado Ã©
a:
A) filtraÃ§Ã£o, com o uso de filtros de carvÃ£o ativo.
B) fluoretaÃ§Ã£o, pela adiÃ§Ã£o de fluoreto de sÃ³dio.
C) coagulaÃ§Ã£o, pela adiÃ§Ã£o de sulfato de alumÃ­-
nto.
D) correÃ§Ã£o do pH, pela adiÃ§Ã£o de carbonato de
sÃ³dio.
E) floculaÃ§Ã£o, em tanques de concreto com a
Ã¡gua em movimento.
QuestÃ£o I25(20T41) |||
Diesel Ã© uma mistura de hidrocarbonetos que
tambÃ©m apresenta enxofre em sua composiÃ§Ã£o.
Esse enxofre Ã© um componente indesejÃ¡vel,
pois o triÃ³xido de enxofre gerado Ã© um dos
grandes causadores da chuva Ã¡cida. Nos anos
1980, nÃ£o havia regulamentaÃ§Ã£o e era utilizado
HR ; com 13 000 ppm de enxofre. Em
Ã³leo diesel
2009, o diesel passou a ter 1 800 ppm de enxo-
fre (S1800) e, em seguida, foi inserido no mer-
cado o diesel S500 (500 ppm). Em 2012, foi
difundido o diesel S50, com 50 ppm de enxofre
em sua composiÃ§Ã£o. Atualmente, Ã© produzido
um diesel com teores de enxofre ainda meno-
res.
A substituiÃ§Ã£o do diesel usado nos anos 1980
por aquele difundido em 2012 permitiu uma
reduÃ§Ã£o percentual de emissÃ£o de SO; de:
A) 86,2%.
B) 96,2%.
Cc) 97,2%.
D) 99,6%.
E) 99,9%.
43','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'hard','published',124),
('ENEM-2014.1-Q125',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2014,'QuÃ­mica geral','multiple_choice','ENEM 2014.1 â€” QuÃ­mica â€” QuestÃ£o 125. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,3,null,'medium','published',125),
('ENEM-2014.1-Q126',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2014,'QuÃ­mica ambiental','multiple_choice','ENEM 2014.1 â€” QuÃ­mica â€” QuestÃ£o 126

O biodiesel nÃ£o Ã© classificado como uma substÃ¢ncia
dos Ã¡cidos graxos presentes em sua matÃ©ria-prima.
siÃ§Ã£o do Ã³leo vegetal ou gordura animal que lhe deu
responsÃ¡vel pela maior estabilidade do biodiesel frente
do biocombustÃ­vel. O quadro ilustra o teor mÃ©dio de
â€”. Teor mÃ©dio
oleaginosa MirÃ­stico PalmÃ­tico EsteÃ¡rico
(C14:0) (C16:0)
Mio
ET A A E
| canola | so2 (a
[OaGÃ£o | or q 24 |
| Amendoim | =<o6 | na |
Qual das fontes oleaginosas apresentadas produziria
A) Milho.
B) Palma.
C) Canola.
D) AlgodÃ£o.
E) Amendoim.
QuestÃ£o 127 (2014-1)
Parte do gÃ¡s carbÃ´nico da atmosfera Ã© absorvida pela
ocorrem naturalmente, em equilÃ­brio, no sistema
atmosfera pode afetar os recifes de corais.
(1
DiÃ³xido F de carbono
atmosfÃ©rico
A
9 [DA
DiÃ³xido de carbono â€” [| Acido
dissolvido lu) ||) | carbÃ´nico
+ CA EE
2 2 PT ke
Ã‰
:
fo) 6 '' CG)
5
&
sa
(a) fa) 2 &)
e
o
e,
O resultado desse processo nos corais Ã© o(a):
A) seu branqueamento, levando Ã  sua morte e extinÃ§Ã£o.
B) excesso de fixaÃ§Ã£o de cÃ¡lcio, provocando calcificaÃ§Ã£o
C) menor incorporaÃ§Ã£o de carbono, afetando seu
D) estÃ­mulo da atividade enzimÃ¡tica, evitando a
E) dano Ã  estrutura dos esqueletos calcÃ¡rios, diminuindo
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'hard','published',126),
('ENEM-2014.1-Q127',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2014,'QuÃ­mica geral','multiple_choice','ENEM 2014.1 â€” QuÃ­mica â€” QuestÃ£o 127. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,4,null,'medium','published',127),
('ENEM-2014.1-Q128',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2014,'EletroquÃ­mica','multiple_choice','ENEM 2014.1 â€” QuÃ­mica â€” QuestÃ£o 128

A revelaÃ§Ã£o das chapas de raios X gera uma
soluÃ§Ã£o que contÃ©m Ã­ons prata na forma de
Ag(S;O3),â€. Para evitar a descarga desse metal
no ambiente, a recuperaÃ§Ã£o de prata metÃ¡lica
pode ser feita tratando eletroquimicamente essa
soluÃ§Ã£o com uma espÃ©cie adequada. O quadro
apresenta semirreaÃ§Ãµes de reduÃ§Ã£o de alguns
Ã­ons metÃ¡licos.
[enesao oe
ZM (aq) +26 â€” 2Z2n(s) :
Das espÃ©cies a; a adequada para
apresentadas,
essa recuperaÃ§Ã£o Ã©:
A) Cu (s).
B) Pt (s).
C) Al (aq).
D) Sn (s).
E) Zn (aq).','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'medium','published',128),
('ENEM-2014.1-Q129',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2014,'EletroquÃ­mica','multiple_choice','ENEM 2014.1 â€” QuÃ­mica â€” QuestÃ£o 129

A aplicaÃ§Ã£o excessiva de fertilizantes nitrogena-
dos na agricultura pode acarretar alteraÃ§Ãµes no
solo e na Ã¡gua pelo acÃºmulo de compostos
nitrogenados, principalmente a forma mais oxi-
dada, favorecendo a proliferaÃ§Ã£o de algas e
plantas aquÃ¡ticas e alterando o ciclo do nitrogÃª-
nio, representado no esquema. A espÃ©cie nitro-
genada mais oxidada tem sua quantidade con-
trolada por aÃ§Ã£o de microrganismos que promo-
vem a reaÃ§Ã£o de reduÃ§Ã£o dessa espÃ©cie, no
processo denominado desnitrificaÃ§Ã£o.
| ?
v
NH,
"
WV
mm
O processo citado estÃ¡ representado na etapa:
AL.
B).
ec).
D) IV.
E)V.
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'medium','published',129),
('ENEM-2014.1-Q130',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2014,'QuÃ­mica ambiental','multiple_choice','ENEM 2014.1 â€” QuÃ­mica â€” QuestÃ£o 130

O estudo de compostos orgÃ¢nicos permite aos
analistas definir propriedades fÃ­sicas e quÃ­micas
responsÃ¡veis pelas caracterÃ­sticas de cada
substÃ¢ncia descoberta. Um laboratÃ³rio investiga
molÃ©culas quirais cuja cadeia carbÃ´nica seja
insaturada, heterogÃªnea e ramificada.
A fÃ³rmula que se enquadra nas caracterÃ­sticas
da molÃ©cula investigada Ã©:
A) CH; â€”(CH), â€”CH(OH)â€” COâ€”NHâ€”CH;.
B) CH; (CH), â€”CH(CHy)-â€”CO-â€”NHâ€”CH,,
O) er CD AHrd Ã§o a,
D) CH; â€”CH2. â€”CH(CH3)-COâ€”NHâ€” CH.
E) Colo â€”CHa CO NHâ€”CHo,
Visando minimizar impactos ambientais, a legis-
laÃ§Ã£o Abrasileira determina que resÃ­duos quÃ­mi-
cos lanÃ§ados diretamente no corpo receptor
tenham pH entre 5,0 e 9,0. Um resÃ­duo lÃ­quido
aquoso gerado em um processo . industrial ; tem
concentraÃ§Ã£o de Ã­ons hidroxila igual a 1,0x107Âº
mol/L. Para atender a legislaÃ§Ã£o, um quÃ­mico
separou as seguintes substÃ¢ncias, disponibili-
zadas no almoxarifado da empresa: CH;COOH,
Na>SO,, CH;OH, K.CO; e NH,CI.
Para que o resÃ­duo possa ser lanÃ§ado direta-
mente no corpo receptor, qual substÃ¢ncia pode-
ria ser empregada no ajuste do pH?
A) CH;COOH
B) Na;SO,
C) CH;OoH
D) K5CO;
E) NH,CI
QuestÃ£o I32(20T4T) ||
A capacidade de limpeza e a eficiÃªncia de um
sabÃ£o dependem de sua propriedade de formar
micelas estÃ¡veis, que arrastam com facilidade
as molÃ©culas impregnadas no material a ser
limpo. Tais micelas tÃªm em sua estrutura partes
capazes de interagir com substÃ¢ncias polares,
como a Ã¡gua, e partes que podem interagir com
substÃ¢ncias apolares, como as gorduras e os
Ã³leos.
(SANTOS, W.L P.; MÃ“L, G.Ss. (Coords.). Quimica
e sociedade. SÃ£o Paulo: Nova GeraÃ§Ã£o, 2005)
A substÃ¢ncia capaz de formar as estruturas
mencionadas Ã©:
A) CieHoe.
B) CirH33COONa.
C) CH;CH;COONa.
D) CH;CH.CH,COOH.
E) CH;CH.CH;CHOCH.CH.CH2CHsz.
45','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'hard','published',130),
('ENEM-2014.1-Q131',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2014,'QuÃ­mica geral','multiple_choice','ENEM 2014.1 â€” QuÃ­mica â€” QuestÃ£o 131. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,3,null,'medium','published',131),
('ENEM-2014.1-Q132',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2014,'QuÃ­mica geral','multiple_choice','ENEM 2014.1 â€” QuÃ­mica â€” QuestÃ£o 132. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,1,null,'medium','published',132),
('ENEM-2014.1-Q133',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2014,'QuÃ­mica geral','multiple_choice','ENEM 2014.1 â€” QuÃ­mica â€” QuestÃ£o 133

A forma das molÃ©culas, como representadas no
maco, a molÃ©cula contendo um grupo nÃ£o planar Ã©
substituintes planares sÃ£o inativas.
O grupo responsÃ¡vel pela bioatividade desse fÃ¡rmaco
OB |
Ã Ãš
D) E)','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'easy','published',133),
('ENEM-2014.1-Q134',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2014,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2014.1 â€” QuÃ­mica â€” QuestÃ£o 134

O principal processo industrial utilizado na produÃ§Ã£o
no). A equaÃ§Ã£o mostra que esse processo envolve
guida Ã© decomposto em fenol e acetona, ambos
culas mais complexas. ApÃ³s o processo de sÃ­ntese,
mercializaÃ§Ã£o individual.
Catalisador
+ O, <â€”â€”
Cumeno HidroperÃ³xido
de cumila
Considerando as caracterÃ­sticas fÃ­sico-quÃ­micas dos
separaÃ§Ã£o da mistura, em escala industrial, Ã© a:
A) filtraÃ§Ã£o.
B) ventilaÃ§Ã£o.
C) decantaÃ§Ã£o.
D) evaporaÃ§Ã£o.
E) destilaÃ§Ã£o fracionada.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'medium','published',134),
('ENEM-2014.1-Q135',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2014,'QuÃ­mica ambiental','multiple_choice','ENEM 2014.1 â€” QuÃ­mica â€” QuestÃ£o 135

A utilizaÃ§Ã£o de processos de biorremediaÃ§Ã£o de
resÃ­duos gerados pela combustÃ£o incompleta de
compostos orgÃ¢nicos tem se tomado crescente,
visando minimizar a poluiÃ§Ã£o ambiental. Para a
ocorrÃªncia de resÃ­duos de naftaleno, algumas
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'easy','published',135),
('ENEM-2014.1-Q136',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2014,'SoluÃ§Ãµes e concentraÃ§Ã£o','multiple_choice','ENEM 2014.1 â€” QuÃ­mica â€” QuestÃ£o 136

Grande quantidade dos maus odores do nosso
dia a dia estÃ¡ relacionada a compostos alcali-
nos. Assim, em vÃ¡rios desses casos, pode-se
utilizar o vinagre, que contÃ©m entre 3,5% e 5%
de Ã¡cido acÃ©tico, para diminuir ou eliminar o
mau cheiro. Por exemplo, lavar as mÃ£os com
vinagre e depois enxaguÃ¡-las com Ã¡gua elimina
o odor de peixe, jÃ¡ que a molÃ©cula de piridina
(CSH5N) Ã© uma das substÃ¢ncias responsÃ¡veis
pelo odor caracterÃ­stico de peixe podre.
SEVA V. ope ina, vs C.; SOARES. â€œ H.F.
Ã  NIgo aqui nÃ£o cheira bem... Ã€ quimica do mau
cheiro. Quimica Nova na Escola. v. 33. n. 1. fev. 11)
A eficiÃªncia do uso do vinagre nesse caso se
explica pica P'' pela:
A) sobreposiÃ§Ã£o de odor, propiciada pelo cheiro
caracterÃ­stico do vinagre.
B) solubilidade da piridina, de carÃ¡ter Ã¡cido, na
soluÃ§Ã£o Ã¡cida empregada.
o) inibiÃ§Ã£o da proliferaÃ§Ã£o das bactÃ©rias presen
tes, devido Ã  aÃ§Ã£o do Ã¡cido acÃ©tico.
D) degradaÃ§Ã£o enzimÃ¡tica da molÃ©cula de piri- "
dina, acelerada pela presenÃ§a de Ã¡cido acÃ©tico.
E) reaÃ§Ã£o de neutralizaÃ§Ã£o entre o Ã¡cido acÃ©tico
e a piridina, que resulta em compostos sem mau
odor.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'hard','published',136),
('ENEM-2014.1-Q137',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2014,'QuÃ­mica ambiental','multiple_choice','ENEM 2014.1 â€” QuÃ­mica â€” QuestÃ£o 137

Grandes fontes de emissÃ£o do gÃ¡s o diÃ³xido de
enxofre sÃ£o as indÃºstrias de extraÃ§Ã£o de cobre
e nÃ­quel, em decorrÃªncia da oxidaÃ§Ã£o dos minÃ©-
rios sulfurados.
Para evitar a liberaÃ§Ã£o desses Ã³xidos na atmos-
fera e a consequente formaÃ§Ã£o da chuva Ã¡cida,
o gÃ¡s pode ser lavado, em um processo conhe-
cido como dessulfurizaÃ§Ã£o, conforme mostrado
na equaÃ§Ã£o (1).
CaCO; (s) + SO, (g) â€” CaSO; (s) + CO, (g) (1)
novocadernoenem(DQgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'medium','published',137),
('ENEM-2014.2-Q138',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2014,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2014.2 â€” QuÃ­mica â€” QuestÃ£o 138

PartÃ­culas beta, ao atravessarem a matÃ©ria viva,
colidem com uma pequena porcentagem de
molÃ©culas e deixam atrÃ¡s de si um rastro aleato-
omicanente. Sivos CS tssÃ£s cepÃ©cies podem
W
romper ainda outras ligaÃ§Ãµes moleculares, cau-
sando danos celulares."
A capacidade : de os efeitos , descritos > dÃ¡- s
gerar
se porque tal partÃ­cula Ã© um:
A) elÃ©tron e, por possuir massa relativa despre-
zÃ­vel, tem elevada energia cinÃ©tica
translacional
B) nÃªutron e. por nÃ£o possuir carga elÃ©trica, tem
alta capacidade de produzir reaÃ§Ãµes nucleares.
C) nÃºcleo do Ã¡tomo de hÃ©lio (He) e, por possuir
massa elevada, tem grande poder de penetra-
Ã§Ã£o.
D) fÃ³ton e, por nÃ£o possuir massa, tem grande
facilidade de induzir a formaÃ§Ã£o de radicais
livres.
E) nÃºcleo do Ã¡tomo de hidrogÃªnio (H) e, por
possuir carga positiva, tem alta reatividade qui-
mica.
QuestÃ£o 139 (2074
uestÃ£o Ã£o o Ãš
Os bafÃ´metros (etilÃ´metros) indicam a quanti-
dade de Ã¡lcool, C)HsO (etanol), presente no
organismo de uma pessoa atravÃ©s do ar expira-
do por ela.
47','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'hard','published',138),
('ENEM-2014.2-Q139',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2014,'QuÃ­mica geral','multiple_choice','ENEM 2014.2 â€” QuÃ­mica â€” QuestÃ£o 139. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,4,null,'medium','published',139),
('ENEM-2014.2-Q140',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2014,'SeparaÃ§Ã£o de misturas','multiple_choice','ENEM 2014.2 â€” QuÃ­mica â€” QuestÃ£o 140

A Ã¡gua potÃ¡vel precisa ser lÃ­mpida, ou seja, nÃ£o
deve conter partÃ­culas em suspensÃ£o, tais como
terra ou restos de plantas, comuns nas Ã¡guas
de rios e lagoas. A remoÃ§Ã£o das partÃ­culas Ã©
feita em estaÃ§Ãµes de tratamento, onde Ca(OH),
em excesso e AIl(SO,);3 sÃ£o adicionados em um
tanque para formar sulfato de cÃ¡lcio e hidrÃ³xido
de alumÃ­nio. Esse Ãºltimo se forma como flocos
gelatinosos insolÃºveis em Ã¡gua, que sÃ£o capa-
zes de agregar partÃ­culas em suspensÃ£o.
Em uma estaÃ§Ã£o de tratamento, cada 10 gra-
mas de hidrÃ³xido de alumÃ­nio Ã© capaz de carre-
gar 2 gramas de partÃ­culas. ApÃ³s decantaÃ§Ã£o e
filtraÃ§Ã£o, a Ã¡gua lÃ­mpida Ã© tratada com cloro e
distribuÃ­da para as residÃªncias. As massas
molares dos elementos H, O, Al, S e Ca sÃ£o,
respectivamente, 1g/mol, 16g/mol, 27g/mol,
32g/ mol e 40g/mol.
Considerando que 1000 litros da Ã¡gua de um rio
possuem 45 gramas de partÃ­culas em suspen-
sÃ£o, a quantidade mÃ­nima de AIl(SO,); que
deve ser utilizada na estaÃ§Ã£o de tratamento
de Ã¡gua, capaz de tratar 3000 litros de Ã¡gua
de uma sÃ³ vez, para garantir que todas as
partÃ­culas em suspensÃ£o sejam precipitadas, Ã©
mais prÃ³xima de:
A) 599.
B) 4939.
Cc) 9879.
D) 14809.
E) 29609.
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'hard','published',140),
('ENEM-2014.2-Q141',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2014,'Estequiometria','multiple_choice','ENEM 2014.2 â€” QuÃ­mica â€” QuestÃ£o 141

Em um caso de anemia, a quantidade de sulfato
de ferro (ll) (FeESO,, massa molar igual a
152g/mol) recomendada como suplemento de
ferro foi de 300mg dia. Acima desse valor, a
mucosa intestinal atua como barreira, impedindo
a absorÃ§Ã£o de ferro. Foram analisados cinco
frascos de suplemento, contendo soluÃ§Ã£o aquo-
sa de FeSO,, cujos resultados encontram-se no
quadro.
ConcentraÃ§Ã£o de sulfato
de ferro(Il) (mol/L)
Rr oa
2
[5 |
Se for ingerida uma colher (10mL) por dia do
medicamento para anemia, a amostra que con-
terÃ¡ a concentraÃ§Ã£o de sulfato de ferro (Il) mais
prÃ³xima da recomendada Ã© a do frasco de nÃº-
mero:
A) 1.
B)2.
c)3.
D) 4.
E) 5.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'medium','published',141),
('ENEM-2014.2-Q142',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2014,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2014.2 â€” QuÃ­mica â€” QuestÃ£o 142

O Ã¡lcool comercial (soluÃ§Ã£o de etanol) Ã© , vendi- .
"
do na concentraÃ§Ã£o de 96 %. bl volume. Entre-
tanto, para que possa ser utilizado como desin-
fetante, deve-se usar uma soluÃ§Ã£o alcoÃ³lica na
concentraÃ§Ã£o. de 70%, em volume. Suponha
que um hospital recebeu ebioa! doaÃ§Ã£o um lote
de 1000 litros de Ã¡lcool comercial a 296%, em
volume, e pretende trocÃ¡-lo por um lote de Ã¡lco-
ie edil UA
Para que a quantidade total de etanol seja a
mesma nos dois lotes, o volume de Ã¡lcool a
7O%fornecido na troca deve ser mais prÃ³ximo
de:
A) 1042L.
B) 1371L.
C) 1428L.
D) 1632L.
E) 1700L','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'medium','published',142),
('ENEM-2014.2-Q143',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2014,'QuÃ­mica geral','multiple_choice','ENEM 2014.2 â€” QuÃ­mica â€” QuestÃ£o 143

Ãgua dura Ã© aquela que contÃ©m concentraÃ§Ãµes
relativamente altas de Ã­ons Caâ€ e Mgâ€ dissolvi-
dos. Apesar de esses Ã­ons nÃ£o representarem
risco para a saÃºde, eles podem tornar a Ã¡gua
48','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'easy','published',143),
('ENEM-2014.2-Q144',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2014,'QuÃ­mica geral','multiple_choice','ENEM 2014.2 â€” QuÃ­mica â€” QuestÃ£o 144. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,4,null,'medium','published',144),
('ENEM-2014.2-Q145',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2014,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2014.2 â€” QuÃ­mica â€” QuestÃ£o 145

No Brasil e no mundo tÃªm surgido movimentos
e leis para banir o uso de sacolas plÃ¡sticas, em
supermercados, feitas de polietileno.
Obtida a partir do petrÃ³leo, a matÃ©ria-prima do
polietileno Ã© o gÃ¡s etileno, que depois de poli-
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'easy','published',145),
('ENEM-2014.2-Q146',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2014,'Estequiometria','multiple_choice','ENEM 2014.2 â€” QuÃ­mica â€” QuestÃ£o 146

O cobre, muito utilizado em fios da rede elÃ©trica
e com considerÃ¡vel valor de mercado, pode ser
encontrado na natureza na forma de calcocita,
Cu>S(s), de massa molar 159g/mol.
Por meio da reaÃ§Ã£o CuzS(s) + Ox(g) â€” 2Cu(s)
SO>(g), Ã© possÃ­vel obtÃª-lo na forma metÃ¡lica.
A quantidade de matÃ©ria de cobre metÃ¡lico pro-
duzida a partir de uma tonelada de calcocita
com 7,95% (m/m) de pureza Ã©:
3
A) 10x 10) mol
B) 5,0 x 10 mol
o) 10x 10" mol
D) 50x 10, mol
E) 4,0 x 10" mol','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'medium','published',146),
('ENEM-2014.2-Q147',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2014,'Estequiometria','multiple_choice','ENEM 2014.2 â€” QuÃ­mica â€” QuestÃ£o 147

O bisfenol-A Ã© um composto que serve de matÃ©-
ria-prima para a fabricaÃ§Ã£o de polÃ­meros utiliza-
dos em embalagens plÃ¡sticas de alimentos, em
mamadeiras e no revestimento interno de latas.
Esse composto estÃ¡ sendo banido em diversos
paÃ­ses, incluindo o Brasil, principalmente por ser
um mimetizador de estrÃ³genos (hormÃ´nios) que,
atuando como tal no organismo, pode causar
infertilidade na vida adulta.
O bisfenol-A (massa molar igual a 228g/mol) Ã©
preparado pela condensaÃ§Ã£o da propanona
(massa molar igual a 58g/mol) com fenol (mas-
sa molar igual a 94g/mol), em meio Ã¡cido, con-
forme apresentado na equaÃ§Ã£o quÃ­mica.
49','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'medium','published',147),
('ENEM-2014.2-Q148',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2014,'EquilÃ­brio quÃ­mico','multiple_choice','ENEM 2014.2 â€” QuÃ­mica â€” QuestÃ£o 148

A tabela lista os valores de pH de algumas bebidas
Refrigerante
CafÃ©
Vinho
Suco de limÃ£o
cÃ¡
O esmalte dos dentes Ã© constituÃ­do de hidroxiapatita
zaÃ§Ã£o em meio Ã¡cido, de acordo com a equaÃ§Ã£o
Ca,(PO,),OH (s) â€” 5 Ca?*
Das bebidas listadas na tabela, aquela com menor
A) chÃ¡.
B) cafÃ©.
C) vinho.
D) refrigerante.
E) suco de limÃ£o.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'medium','published',148),
('ENEM-2014.2-Q149',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2014,'SoluÃ§Ãµes e concentraÃ§Ã£o','multiple_choice','ENEM 2014.2 â€” QuÃ­mica â€” QuestÃ£o 149

A formaÃ§Ã£o de estalactites depende da reversibilidade
(CaCO;) Ã© encontrado em depÃ³sitos subterrÃ¢neos
Ã¡gua rica em CO, dissolvido infiltra-se no calcÃ¡rio,
Numa segunda etapa, a soluÃ§Ã£o aquosa desses Ã­ons
promovendo a liberaÃ§Ã£o de CO, e a deposiÃ§Ã£o de
Ca? 2 (aq) + 2 HCO; - (aq) â€” CaCO,(s) +
=
Considerando o equilÃ­brio que ocorre na segunda
lo(a):
A) diminuiÃ§Ã£o da concentraÃ§Ã£o de Ãons OHâ€ no meio.
B) aumento da pressÃ£o do ar no interior da caverna.
C) diminuiÃ§Ã£o da concentraÃ§Ã£o de HCO; no meio.
D) aumento da temperatura no interior da caverna.
E) aumento da concentraÃ§Ã£o de CO, dissolvido.
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'medium','published',149),
('ENEM-2014.2-Q150',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2014,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2014.2 â€” QuÃ­mica â€” QuestÃ£o 150

Em um experimento, foram separados trÃªs reci-
pientes A, B e C, contendo 200mL de lÃ­quidos
distintos: o recipiente A continha Ã¡gua, com
densidade de 1,00g/mL; o recipiente B, Ã¡lcool
etÃ­lico, com densidade de 0,79g/mL; e o recipi-
ente C, clorofÃ³rmio, com densidade de
1,48g9/mL.
Em cada um desses recipientes foi adicionada
uma pedra de gelo, com densidade prÃ³xima a
0,90g/mL.
No experimento apresentado, observou-se que
a pedra de gelo:
A) flutuou em A, flutuou em B e flutuou em C.
B) flutuou em A, afundou em B e flutuou em C.
C) afundou em A, afundou em B e flutuou em C.
D) afundou em A, flutuou em B e afundou em C.
E) flutuou em A, afundou em B e afundou em C.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'hard','published',150),
('ENEM-2014.2-Q151',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2014,'QuÃ­mica ambiental','multiple_choice','ENEM 2014.2 â€” QuÃ­mica â€” QuestÃ£o 151

A escolha de uma determinada substÃ¢ncia para
ser utilizada como combustÃ­vel passa pela anÃ¡-
lise da poluiÃ§Ã£o que ela causa ao ambiente e
pela quantidade de energia liberada em sua
combustÃ£o completa.
O quadro apresenta a entalpia de combustÃ£o de
algumas substÃ¢ncias. As massas molares dos
elementos H, C e O sÃ£o, respectivamente,
iguais a 1g/mol,12g/mol e 16g/mol.
Entalpia de
combustÃ£o
(kJ/mol)
Levando-se em conta somente o aspecto ener-
gÃ©tico, a substÃ¢ncia mais eficiente para a ob-
tenÃ§Ã£o de energia, na combustÃ£o de 1kg de
combustÃ­vel, Ã© o:
A) etano.
B) etanol.
C) metanol.
D) acetileno.
E) hidrogÃªnio.
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'medium','published',151),
('ENEM-2014.2-Q152',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2014,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2014.2 â€” QuÃ­mica â€” QuestÃ£o 152

Fertilizantes quÃ­micos mistos, denominados
NPK, sÃ£o utilizados para aumentar a produtivi-
dade agrÃ­cola, por fornecerem os nutrientes
nitrogÃªnio, fÃ³sforo e potÃ¡ssio, necessÃ¡rios para
o desenvolvimento das plantas. A quantidade
de cada nutriente varia de acordo com a finali-
dade do adubo. Um determinado adubo NPK
possui, em sua composiÃ§Ã£o, as seguintes subs-
tÃ¢ncias: nitrato de amÃ´nio (NHANO;3), ureia
(CO(NH;>2)2), nitrato de potÃ¡ssio (KNO;), fosfato
de sÃ³dio (Na;PO;,) e cloreto de potÃ¡ssio (KCl).
A adiÃ§Ã£o do adubo descrito provocou diminuiÃ§Ã£o
no pH de um solo. Considerando o carÃ¡ter Ã¡ci-
do/bÃ¡sico das substÃ¢ncias constituintes desse
adubo, a diminuiÃ§Ã£o do pH do solo deve ser
atribuÃ­da Ã  presenÃ§a, no adubo, de uma quanti-
dade significativa de:
A) ureia.
B) fosfato de sÃ³dio.
C) nitrato de amÃ´nio.
- ia & tro
''
DES TARg E
QuestÃ£o 153 (2014-3)
Alguns materiais polimÃ©ricos nÃ£o podem ser
sr "
utilizados para a produÃ§Ã£o de certos tipos de
artefatos, seja por limitaÃ§Ãµes das propriedades
Mecanicas, sem pela facilidade com que sofrem
degradaÃ§Ã£o, gerando subprodutos indesejÃ¡veis
para aquela aplicaÃ§Ã£o. Torna-se importante,
entÃ£o, a fiscalizaÃ§Ã£o, para determinar a nature-
za do polÃ­mero utilizado na fabricaÃ§Ã£o do artefa-
to. Um dos mÃ©todos possÃ­veis baseia-se na
decomposiÃ§Ã£o do polÃ­mero para a geraÃ§Ã£o dos
monÃ´meros que lhe deram origem.
A decomposiÃ§Ã£o controlada de um artefato ge-
rou a diamina HAN(CH>);NH>, e o diÃ¡cido
HO2C(CH2)ACO2H. Logo, o artefato era feito de:
B) poliamida.
D) poliacrilato.
QuestÃ£o 1I54(20143)
A elevada acidez dos solos Ã© um dos fatores
responsÃ¡veis por reduzir sua capacidade de
troca de cÃ¡tions, intensificando a perda de sais
minerais por arraste. Como consequÃªncia, os
solos ficam deficientes em nutrientes e com
baixo potencial produtivo. Uma estratÃ©gia usada
no controle dessa acidez a aplicar Ã³xidos capa-
zes de formar bases pouco solÃºveis em meio
aquoso.
51','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'hard','published',152),
('ENEM-2014.2-Q153',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2014,'QuÃ­mica geral','multiple_choice','ENEM 2014.2 â€” QuÃ­mica â€” QuestÃ£o 153. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,1,null,'medium','published',153),
('ENEM-2014.3-Q154',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2014,'QuÃ­mica geral','multiple_choice','ENEM 2014.3 â€” QuÃ­mica â€” QuestÃ£o 154. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,3,null,'medium','published',154),
('ENEM-2014.3-Q155',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2014,'LigaÃ§Ãµes quÃ­micas e estrutura','multiple_choice','ENEM 2014.3 â€” QuÃ­mica â€” QuestÃ£o 155

O entendimento de como as ligaÃ§Ãµes quÃ­micas
se formam a um dos assuntos fundamentais da
ciÃªncia. A partir desses fundamentos, pode-se
entender como sÃ£o desenvolvidos novos matÃ©-
rias.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'easy','published',155),
('ENEM-2014.3-Q156',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2014,'LigaÃ§Ãµes quÃ­micas e estrutura','multiple_choice','ENEM 2014.3 â€” QuÃ­mica â€” QuestÃ£o 156

Temperatura de Temperatura
fusÃ£o (ÂºC) ebuliÃ§Ã£o
A E ETTA
As propriedades fÃ­sicas e quÃ­micas de uma certa
unidades que a constituem, isto Ã©, as ligaÃ§Ãµes quÃ­micas
res que a compÃµem. No quadro, estÃ£o relacionadas
Qual substÃ¢ncia apresenta propriedades que caracterizam
A
B)II
fes
D)V
E)V','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'medium','published',156),
('ENEM-2014.3-Q157',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2014,'QuÃ­mica ambiental','multiple_choice','ENEM 2014.3 â€” QuÃ­mica â€” QuestÃ£o 157

Nos tempos atuais, grandes esforÃ§os sÃ£o reali-
zados para minimizar a dependÃªncia dos com-
bustÃ­veis derivados de fontes fosseis, buscando
alternativas como compostos provenientes de
fontes renovÃ¡veis, biodegradÃ¡veis e que cau-
sem menos impacto na atmosfera terrestre.
Um combustÃ­vel renovÃ¡vel (X) de grande impor-
tÃ¢ncia econÃ´mica a obtido a partir da equaÃ§Ã£o
genÃ©rica:
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'medium','published',157),
('ENEM-2014.3-Q158',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2014,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2014.3 â€” QuÃ­mica â€” QuestÃ£o 158

A baunilha a uma espÃ©cie de orquÃ­dea. A partir
de sua flor, a produzida a vanilina (conforme
representaÃ§Ã£o quÃ­mica), que dÃ¡ origem ao aro-
ma de baunilha.
OH
OCH,
COH
Na vanilina â€ estÃ£o " presentes as funÃ§Ãµes a orgÃ¢ni- An:
o
A) aldeÃ­do, Ã©ter e fenol.
B) Ã¡lcool, aldeÃ­do e Ã©ter.
C) Ã¡lcool, cetona e fenol.
D) aldeÃ­do, cetona e fenol.
E) acido carboxÃ­lico, aldeÃ­do e Ã©ter.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'medium','published',158),
('ENEM-2014.3-Q159',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2014,'QuÃ­mica ambiental','multiple_choice','ENEM 2014.3 â€” QuÃ­mica â€” QuestÃ£o 159

O cianeto de sÃ³dio, NaCN, e um poderoso
agente complexante, usado em laboratÃ³rios
quÃ­micos e em indÃºstria de extraÃ§Ã£o de ouro.
Quando uma indÃºstria lanÃ§a NaCN sÃ³lido nas
Ã¡guas de um rio, ocorre o seguinte equilÃ­brio
quÃ­mico:
CNâ€ â€ (aq) + H,O (1) = HCN (aq) + OHâ€ e (aq)
anÃ£o des
ilÃ­bri o quÃ­mico imi Ã© Ã© decorrente de uma
A) sÃ­ntese.
B) hidrolise.
C) oxirreduÃ§Ã£o.
D) precipitaÃ§Ã£o.
E) decomposiÃ§Ã£o.
QuestÃ£o 160 (20143)
Uma forma de poluiÃ§Ã£o natural da Ã¡gua aconte-
ce em regiÃµes ricas em dolomita (Ca
COsMgCO;).
Na presenÃ§a de diÃ³xido de carbono (dissolvido
na Ã¡gua) a dolomita a convertida em Ca(HCO;),
e MgCO;, elevando a concentraÃ§Ã£o de Ã­ons
Ca?â€ e Mg? na Ã¡gua.
Uma forma de purificaÃ§Ã£o dessa Ã¡gua, denomi-
nada Ã¡gua dura, Ã© adicionar Ca(OH), e Na,CO;
a ela. Dessa forma, ocorre uma serie de rea-
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'hard','published',159),
('ENEM-2014.3-Q160',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2014,'QuÃ­mica geral','multiple_choice','ENEM 2014.3 â€” QuÃ­mica â€” QuestÃ£o 160. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,0,null,'medium','published',160),
('ENEM-2014.3-Q161',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2014,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2014.3 â€” QuÃ­mica â€” QuestÃ£o 161

As antocianinas (componente natural de frutas
roxas, como uva e aÃ§aÃ­) sÃ£o molÃ©culas interes-
santes para a produÃ§Ã£o de embalagens inteli-
gentes, pois tem capacidade de mudar de cor,
conforme muda o pH.
Em soluÃ§Ãµes com pH abaixo de 3,0, essas mo-
lÃ©culas apresentam uma coloraÃ§Ã£o do laranja ao
vermelho mais intenso. Com o aumento do pH
para a faixa de 4,0 a 5,0, a coloraÃ§Ã£o vermelha
tende a desaparecer. E aumentos adicionais de
pH levam as antocianinas a apresentarem uma
coloraÃ§Ã£o entre o verde e o azul.
(DisponÃ­vel em: www.biotecnologia.com.br.
Acesso em: 25 nov. 2011 - adaptado)
Estas embalagens sÃ£o " capazes de '' identificar â€
quando o alimento esta em decomposiÃ§Ã£o, pois
se tornam:
A) vermelho claro, pela formaÃ§Ã£o de uma solu-
Ã§Ã£o neutra.
B) verde e azul, devido a presenÃ§a de substan-
cias bÃ¡sicas.
C) laranja e vermelho, pela liberaÃ§Ã£o de hidroxi-
las no alimento.
D) laranja e vermelho intenso, pela produÃ§Ã£o de
Ã¡cidos orgÃ¢nicos.
E) verde e azul, devido ao aumento de Ã­ons de
hidrogÃªnio no alimento.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'hard','published',161),
('ENEM-2014.3-Q162',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2014,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2014.3 â€” QuÃ­mica â€” QuestÃ£o 162

VocÃª jÃ¡ ouviu essa frase: rolou uma quÃ­mica
entre nÃ³s!
(o) amorÃ© frequentemente associado a um fenÃ´-
, : RN
meno mÃ¡gico ou espiritual, porÃ©m existe a atua-
Ã§Ã£o de alguns compostos em nosso corpo, que
provocam sensaÃ§Ãµes quando estamos perto da
pessoa amada, como coraÃ§Ã£o acelerado e au-
mento da frequÃªncia respiratÃ³ria.
Essas sensaÃ§Ãµes sÃ£o transmitidas por neuro-
transmissores, tais como adrenalina, noradrena-
lina, feniletilamina, dopamina e as serotoninas.
53','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'medium','published',162),
('ENEM-2014.3-Q164',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2014,'TermoquÃ­mica','multiple_choice','ENEM 2014.3 â€” QuÃ­mica â€” QuestÃ£o 164

O Brasil e o segundo maior produtor de etanol
combustÃ­vel do mundo, tendo fabricado 26,2
bilhÃµes de litros em 2010. Em uma etapa de seu
processo de produÃ§Ã£o, o etanol foma uma mis-
tura lÃ­quido homogÃªnea com a Ã¡gua e outras
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'easy','published',164),
('ENEM-2015.1-Q165',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2015,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2015.1 â€” QuÃ­mica â€” QuestÃ£o 165

â€œQuestÃ£o 165 (2015.1)
Um grupo de pesquisadores desenvolveu um
mÃ©todo simples, barato e eficaz de remoÃ§Ã£o de
petrÃ³leo contaminante na Ã¡gua, que utiliza um
plÃ¡stico produzido a partir do lÃ­quido da casta-
nha-de-caju (LCC).
A composiÃ§Ã£o quÃ­mica do LCC Ã© muito parecida
com a do petrÃ³leo e suas molÃ©culas, por suas
caracterÃ­sticas, interagem formando agregados
com o petrÃ³leo. Para retirar os agregados da
Ã¡gua, os pesquisadores misturam ao LCC na-
nopartÃ­culas magnÃ©ticas.
(KIFFER, D. Novo mÃ©todo par remoÃ§Ã£o de petrÃ³leo
usa Ã³leo de mamona e castanha-de-caju. DisponÃ­vel
em: www.faperi.br. Acesso em: 31 jul. 2012)
Essa tÃ©cnica considera '' dois . processos de sepa-
.
raÃ§Ã£o de misturas, sendo eles, respectivamente,
A) flotaÃ§Ã£o " e decantaÃ§Ã£o "
B) decomposiÃ§Ã£o e centrifugaÃ§Ã£o.
C) floculaÃ§Ã£o e separaÃ§Ã£o magnÃ©tica.
D) destilaÃ§Ã£o fracionada e peneiraÃ§Ã£o.
E) dissoluÃ§Ã£o fracionada e magnetizaÃ§Ã£o.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'hard','published',165),
('ENEM-2015.1-Q166',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2015,'TermoquÃ­mica','multiple_choice','ENEM 2015.1 â€” QuÃ­mica â€” QuestÃ£o 166

A soda cÃ¡ustica pode ser usada no desentupi-
mento de encanamentos domÃ©sticos e tem, em
sua composiÃ§Ã£o, o hidrÃ³xido de sÃ³dio como
principal componente, alÃ©m de algumas impure-
oo
A soda normalmente Ã© comercializada na forma
sÃ³lida, mas que apresenta aspecto "derretido"
quando exposta ao ar por certo perÃ­odo.
O fenÃ´meno de â€œderretimento" decorre da:
A) absorÃ§Ã£o da umidade presente no ar atmos-
fÃ©rico.
B) fusÃ£o do hidrÃ³xido pela troca de calor com o
ambiente.
C) reaÃ§Ã£o das impurezas do produto com o
oxigÃªnio do ar.
D) adsorÃ§Ã£o de gases atmosfÃ©ricos na superfÃ­-
cie do sÃ³lido.
E) reaÃ§Ã£o do hidrÃ³xido de sÃ³dio com o gÃ¡s ni-
trogÃªnio presente no ar.
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'medium','published',166),
('ENEM-2015.1-Q167',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2015,'EletroquÃ­mica','multiple_choice','ENEM 2015.1 â€” QuÃ­mica â€” QuestÃ£o 167

A hidroponia pode ser definida como uma tÃ©cni-
ca de produÃ§Ã£o de vegetais sem necessaria-
mente a presenÃ§a de solo. Uma das formas de
implementaÃ§Ã£o Ã© manter as plantas com suas
raÃ­zes suspensas em meio lÃ­quido, de onde
retiram os nutrientes essenciais. Suponha que
um produtor de rÃºcula hidropÃ´nica precise ajus-
tar a concentraÃ§Ã£o do Ã­on nitrato (NO3) para
0,009 mol/L em um tanque de 5000 litros e, para
tanto, tem em mÃ£os uma soluÃ§Ã£o comercial
nutritiva de nitrato de cÃ¡lcio 90 g/L. As massas
molares dos elementos N, O e Ca sÃ£o iguais a
14 glmol, 16 g/mol e 40 g/mol, respectivamente.
Qual o valor mais prÃ³ximo do volume da solu-
Ã§Ã£o nutritiva, em litros, que o produtor deve
adicionar ao tanque?
A) 26
B) 41
Cc) 45
D) 51
E) 82
QuestÃ£o I68B(2015.1) ||
Alimentos em conserva sÃ£o frequentemente
armazenados em latas metÃ¡licas seladas, fabri-
cadas com um material chamado folha de flan-
dres que consiste de uma chapa de aÃ§o revesti-
da com uma fina camada de estanho, metal
brilhante e de difÃ­cil oxidaÃ§Ã£o.
Ã‰ comum que a superfÃ­cie interna seja ainda
revestida por uma camada de vemiz Ã  base de
epÃ³xi, embora tambÃ©m existam latas sem esse
revestimento, apresentando uma camada de
estanho mais espessa.
(SANTANA, V. M. S. A leitura e a quÃ­mica das subs-
tÃ¢ncias. Cadernos PDE. IvaiporÃ£: Secretaria de Esta-
do da EducaÃ§Ã£o do ParanÃ¡ (SEED); Universidade
Estadual de Londrina, 2010 - adaptado)
Comprar uma lata de conserva amassada no
supermercado Ã© desaconselhÃ¡vel porque o
amassado pode:
A) alterar a pressÃ£o no interior da lata, promo-
vendo a degradaÃ§Ã£o acelerada do alimento.
B) romper a camada de estanho, permitindo a
corrosÃ£o do ferro e alteraÃ§Ãµes do alimento.
C) prejudicar o apelo visual da embalagem,
apesar de nÃ£o afetar as propriedades do ali-
mento.
D) romper a camada de verniz, fazendo com
que o metal tÃ³xico estanho contamine o alimen-
to.
E) desprender camadas de verniz, que se dis-
solverÃ£o no meio aquoso, contaminando o ali-
mento.
55','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'hard','published',167),
('ENEM-2015.1-Q168',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2015,'QuÃ­mica geral','multiple_choice','ENEM 2015.1 â€” QuÃ­mica â€” QuestÃ£o 168. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,1,null,'medium','published',168),
('ENEM-2015.1-Q169',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2015,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2015.1 â€” QuÃ­mica â€” QuestÃ£o 169

Uma forma de organizaÃ§Ã£o de um sistema bio-
lÃ³gico Ã© a presenÃ§a de sinais diversos utilizados
pelos indivÃ­duos para se comunicarem. No caso
das abelhas da espÃ©cie Apis mellifera, os sinais
utilizados podem ser feromÃ´nios. Para saÃ­rem e
voltarem de suas colmeias, usam um feromÃ´nio
que indica a trilha percorrida por elas (Compos-
to A). Quando pressentem o perigo, expelem
um feromÃ´nio de alarme (Composto B), que
serve de sinal para um combate coletivo. O que
diferencia cada um desses sinais utilizados pe-
las abelhas sÃ£o as estruturas e funÃ§Ãµes orgÃ¢ni-
cas dos feromÃ´nios.
CH,OH
e
Composto Ã€
â€”- CH,
CH,COO(CH,)CH
cy
3
Composto B
As funÃ§Ãµes orgÃ¢nicas que caracterizam os fe-
romÃ´nios de trilha e de alavmme sÃ£o, respectiva-
mente,
A) Ã¡lcool e Ã©ster.
B) aldeÃ­do e cetona.
C) Ã©ter e hidrocarboneto.
D) enol e Ã¡cido carboxÃ­lico.
E) Ã¡cido carboxÃ­lico e amida.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'hard','published',169),
('ENEM-2015.1-Q170',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2015,'EquilÃ­brio quÃ­mico','multiple_choice','ENEM 2015.1 â€” QuÃ­mica â€” QuestÃ£o 170

O permanganato de potÃ¡ssio (KMnO,) Ã© um
agente oxidante forte muito empregado tanto
em nÃ­vel laboratorial quanto industrial. Na oxi-
daÃ§Ã£o de alcenos de cadeia normal, como o 1-
fenil-1-propeno, ilustrado na figura, o KMnO, Ã©
utilizado para a produÃ§Ã£o de Ã¡cidos carboxÃ­li-
..
DN
1-fenil-1-propeno
.
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'medium','published',170),
('ENEM-2015.1-Q171',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2015,'QuÃ­mica geral','multiple_choice','ENEM 2015.1 â€” QuÃ­mica â€” QuestÃ£o 171. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,0,null,'medium','published',171),
('ENEM-2015.1-Q172',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2015,'Radioatividade','multiple_choice','ENEM 2015.1 â€” QuÃ­mica â€” QuestÃ£o 172

A bomba reduz neutros e neutrinos, e abana-se
com o leque da reaÃ§Ã£o em cadeia.
(ANDRADE, C. D. Poesia completa e prosa. Rio de
Janeiro: Aguilar, 1973 - fragmento)
Nesse fragmento de poema, o autor refere-se Ã 
bomba atÃ´mica de urÃ¢nio. Essa reaÃ§Ã£o Ã© dita
"em cadeia" porque na:
A) fissÃ£o o do PU ocorre , " de grande
liberaÃ§Ã£o
quantidade de calor, que dÃ¡ continuidade Ã  rea-
Ã§Ã£o.
B) fissÃ£o " de **U ocorre liberaÃ§Ã£o s " de energia, .
que vai desintegrando o isÃ³topo â€œâ€œU, enrique-
cendo-o em mais Ã‰â€œU.
C) fissÃ£o do ?*5YU ocorre uma liberaÃ§Ã£o de nÃªu-
trons, que bombardearÃ£o outros nÃºcleos.
D) fusÃ£o do YU com PU ocorre formaÃ§Ã£o de
neutrino, que bombardearÃ¡ outros nÃºcleos radi-
oativos.
E) fusÃ£o do ?*U com **U ocorre formaÃ§Ã£o de
outros elementos radioativos mais pesados, que
desencadeiam novos processos de fusÃ£o.
56','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'hard','published',172),
('ENEM-2015.1-Q173',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2015,'EquilÃ­brio quÃ­mico','multiple_choice','ENEM 2015.1 â€” QuÃ­mica â€” QuestÃ£o 173

VÃ¡rios Ã¡cidos sÃ£o utilizados em indÃºstrias que
lagos, podendo afetar o equilÃ­brio ambiental. Para
ser adicionado ao efluente, em quantidades apropriadas,
As equaÃ§Ãµes envolvidas no processo sÃ£o apresentadas:
(1) CaCO, (s) + CO, (g) + H,O ()
(1) HCO, (aq) = H* (aq) +
(III) CaCO, (s) â€” Ca? (aq)
(1) CO, (dg) + HO () == Hr" (aq)
Com base nos valores das constantes de equilÃ­brio
co da constante de equilÃ­brio da reaÃ§Ã£o |?
A) 4,5x10?6
B) 5,0x10Âº
C) 0,8x10Âº
D) 0,2x10Âº
E) 2,2x10%','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'medium','published',173),
('ENEM-2015.1-Q174',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2015,'EletroquÃ­mica','multiple_choice','ENEM 2015.1 â€” QuÃ­mica â€” QuestÃ£o 174

Hidrocarbonetos podem ser obtidos em laboratÃ³rio
nhecido como eletrossÃ­ntese de Kolbe. Essa reaÃ§Ã£o
partir de Ã³leos vegetais, os quais podem ser empregados
tuiÃ§Ã£o aos hidrocarbonetos fÃ³sseis. O esquema ilustra
OH eletrÃ³lise
Ã‰ mr
2
ST
o metano!
Com base nesse processo, o hidrocarboneto produzido
A) 2,2,7,7-tetrametil-octano.
B) 3,3,4 4-tetrametil-nexano.
C) 2,2,5,5-tetrametil-hexano.
D) 3,3,6,6-tetrametil-octano.
E) 2,2,4 4-tetrametil-hexano.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'medium','published',174),
('ENEM-2015.1-Q175',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2015,'Estequiometria','multiple_choice','ENEM 2015.1 â€” QuÃ­mica â€” QuestÃ£o 175

Para proteger estruturas de aÃ§o da corrosÃ£o, a
indÃºstria utiliza uma tÃ©cnica chamada galvani-
zaÃ§Ã£o. Um metal bastante utilizado nesse pro-
Ã© So de que pode Ss biido parir de
cesso a
um enominado esfalerita (ZnS), de
minÃ©ro
pureza 75%.
Considere que a conversÃ£o do minÃ©rio em zinco
metÃ¡lico tem rendimento de 80% nesta sequÃªn-
cia de equaÃ§Ãµes quÃ­micas:
2ZNS + 3 O, 2ZnO + 2 SO,
ZnO + CO â€” Zn + CO,
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'medium','published',175),
('ENEM-2015.1-Q176',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2015,'LigaÃ§Ãµes quÃ­micas e estrutura','multiple_choice','ENEM 2015.1 â€” QuÃ­mica â€” QuestÃ£o 176

Pesticidas sÃ£o substÃ¢ncias utilizadas para pro-
mover o controle de pragas. No entanto, apÃ³s
sua aplicaÃ§Ã£o em ambientes abertos, alguns
pesticidas organoclorados sÃ£o arrastados pela
Ã¡gua atÃ© lagos e rios e, ao passar pelas guelras
dos peixes, podem difundir-se para seus tecidos
lipÃ­dicos e lÃ¡ se acumularem.
A caracterÃ­stica desses compostos, responsÃ¡vel
pelo processo descrito no texto, Ã© o(a):
A) baixa polaridade.
B) baixa massa molecular.
C) ocorrÃªncia de halogÃªnios.
D) tamanho pequeno das molÃ©culas.
E) presenÃ§a de hidroxilas nas cadeias.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'medium','published',176),
('ENEM-2015.1-Q177',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2015,'EletroquÃ­mica','multiple_choice','ENEM 2015.1 â€” QuÃ­mica â€” QuestÃ£o 177

A calda bordalesa Ã© uma alternativa empregada
no combate a doenÃ§as que afetam folhas de
plantas. Sua produÃ§Ã£o consiste na mistura de
uma soluÃ§Ã£o aquosa de sulfato de cobre(ll),
CuSO,, com Ã³xido de cÃ¡lcio, CaO, e sua aplica-
Ã§Ã£o sÃ³ deve ser realizada se estiver levemente
bÃ¡sica. A avaliaÃ§Ã£o rudimentar da basicidade
dessa soluÃ§Ã£o Ã© realizada pela adiÃ§Ã£o de trÃªs
gotas sobre uma faca de ferro limpa. ApÃ³s trÃªs
minutos, caso surja uma mancha avermelhada
no local da aplicaÃ§Ã£o, afirma-se que a calda
bordalesa ainda nÃ£o estÃ¡ com a basicidade
necessÃ¡ria. O quadro apresenta os valores de
potenciais padrÃ£o de reduÃ§Ã£o (EP) para algu-
mas semirreaÃ§Ãµes de reduÃ§Ã£o.
SemirreaÃ§Ã£o de reduÃ§Ã£o
Em - =
Feâ€ +3e- â€”rFe
entr A +2e" â€ Cu â€ os
A equaÃ§Ã£o o quÃ­mica que representa a reaÃ§Ã£o . de
formaÃ§Ã£o da mancha avermelhada Ã©:
A) Ca?'' (aq) + 2 Cu'' (aq) â€” Ca (s) + 2 Cu?* (aq).
B) Ca? (aq) + 2 Fe? (aq) = Ca (s) + 2 Feâ€ (aq).
C) ) Cu? ue (a 2 Fe? (aq) (a = Cu o (s) + 2 Feâ€ (aq). (ag).
D) 3 Ca?â€ (aq) + 2 Fe (s) â€” 3 Ca (s) + 2 Fe* (aq).
E) 3 Cu? Ã© (aq) + 2 Fe (s) â€” 3 Cu (s) + . 2 Feâ€ " (aq).
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'hard','published',177),
('ENEM-2015.1-Q178',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2015,'QuÃ­mica ambiental','multiple_choice','ENEM 2015.1 â€” QuÃ­mica â€” QuestÃ£o 178

O aproveitamento de resÃ­duos florestais vem se
tornando cada dia mais atrativo, pois eles sÃ£o
uma fonte renovÃ¡vel de energia. A figura repre-
senta a queima de um bio-Ã³leo extraÃ­do do resÃ­-
duo de madeira, sendo AH; a variaÃ§Ã£o de ental-
pia devido Ã  queima de 1g desse bio-Ã³leo, resul-
tando em gÃ¡s carbÃ´nico e Ã¡gua lÃ­quida, e AH7 a
variaÃ§Ã£o de entalpia envolvida na conversÃ£o de
1 g de Ã¡gua no estado gasoso para o estado
lÃ­quido.
Energia
A
â€”BioÃ³leo+O(g) >
a
AH, = -18,8 kJ/g
CO. HO
CO (g):HO(g)
1or = -2,4 kJ/g
CO (9); HOM =
A variaÃ§Ã£o de entalpia, em kJ, para a queima de
5g desse bio-Ã³leo resultando em CO, (gasoso)
e H,O (gasoso) Ã©:
A) -106.
- o
D) 212.
E) -16,4.
o
QuestÃ£o 179 (20152)
O urÃ¢nio Ã© um elemento cujos Ã¡tomos contÃªm
92 prÃ³tons, 92 elÃ©trons e entre 135 e 148 nÃªu-
trons. O isÃ³topo de urÃ¢nio ?**U Ã© utilizado como
combustÃ­vel em usinas nucleares, onde, ao ser
bombardeado por nÃªutrons, sofre fissÃ£o de seu
nÃºcleo e libera uma grande quantidade de ener-
gia (235x10** KJ/mol). O isÃ³topo **U ocorre
naturalmente em minÃ©rios de urÃ¢nio, com con-
centraÃ§Ã£o de apenas 0,7%. Para ser utilizado na
geraÃ§Ã£o de energia nuclear, o minÃ©rio Ã© subme-
tido a um processo de enriquecimento, visando
aumentar a concentraÃ§Ã£o do isÃ³topo YU para,
aproximadamente, H 3% o nas pastilhas.
Em dÃ©cadas anteriores, houve um movimento
mundial para aumentar a geraÃ§Ã£o de energia
nuclear buscando substituir, parcialmente, a
geraÃ§Ã£o de energia elÃ©trica a partir da queima
do carvÃ£o, o que diminui a emissÃ£o atmosfÃ©rica
de CO, (gÃ¡s com massa molar igual a 44 g/mol).
A queima do carvÃ£o Ã© representada pela equa-
Ã§Ã£o quÃ­mica:
58','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'hard','published',178),
('ENEM-2015.1-Q179',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2015,'QuÃ­mica geral','multiple_choice','ENEM 2015.1 â€” QuÃ­mica â€” QuestÃ£o 179. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,3,null,'medium','published',179),
('ENEM-2015.1-Q180',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2015,'EquilÃ­brio quÃ­mico','multiple_choice','ENEM 2015.1 â€” QuÃ­mica â€” QuestÃ£o 180

A quÃ­mica verde permite o desenvolvimento tecnolÃ³gico
contrar rotas limpas tem sido um grande desafio.
tenÃ§Ã£o de Ã¡cido adÃ­pico, um insumo muito importante
Rota tradicional (marrom)
OOoH
Co
â€”
180ÂºC lavagem
S
Rota verde
Na, WO,, 4 H,O. (o)
ATA
75-90 ÂºC
OH
Que fator contribui positivamente para que a segunda
meira:
A) Etapa Ãºnica na sÃ­ntese.
B) ObtenÃ§Ã£o do produto puro.
C) AusÃªncia de reagentes oxidantes.
D) AusÃªncia de elementos metÃ¡licos no processo.
E) Gasto de energia nulo na separaÃ§Ã£o do produto.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'medium','published',180),
('ENEM-2015.2-Q181',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2015,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2015.2 â€” QuÃ­mica â€” QuestÃ£o 181

Sais de amÃ´nio sÃ£o sÃ³lidos iÃ´nicos com alto ponto de
originais e ligeiramente solÃºveis em solventes orgÃ¢nicos
serem usados em xaropes e medicamentos injetÃ¡veis.
um odor desagradÃ¡vel e oxida na presenÃ§a do ar
drato de efedrina funde a 217ÂºC, nÃ£o se oxida e Ã©
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'medium','published',181),
('ENEM-2015.2-Q182',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2015,'Estequiometria','multiple_choice','ENEM 2015.2 â€” QuÃ­mica â€” QuestÃ£o 182

O cobre presente nos fios elÃ©tricos e instrumen-
tos musicais Ã© obtido a partir da ustulaÃ§Ã£o do
minÃ©rio calcosita (Cu7zS). Durante esse proces-
So, ocorre o aquecimento desse sulfeto na pre-
senÃ§a de oxigÃªnio, de forma que o cobre fique
â€œlivreâ€ e o enxofre se combine com o O, produ-
zindo SOÂ», conforme a equaÃ§Ã£o quÃ­mica:
A
Cu,S (s) + O, (g) 2 Cu (1) + SO, (q)
? ? ?
As massas molares dos elementos Cu e S sÃ£o, ''
respectivamente, Ã¡ ND iguais a 63,5 g/mol e 32 g/mol.
(CANTO, E. L. Minerais, minÃ©rios, metais: de onde
vÃªm?, para onde vÃ£o? SÃ£o Paulo: Moderna, 1996)
Considerando que se queira obter 16 mois do
metal em uma reaÃ§Ã£o - cujo : rendimento : Ã© : de
80%, a massa, em gramas, do minÃ©rio necessÃ¡-
ria para obtenÃ§Ã£o do cobre Ã© igual a:
A) 955.
B) 1018.
C) 1590.
D) 2035.
E) 3180.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'hard','published',182),
('ENEM-2015.2-Q183',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2015,'TermoquÃ­mica','multiple_choice','ENEM 2015.2 â€” QuÃ­mica â€” QuestÃ£o 183

AlÃ©m de ser uma prÃ¡tica ilegal, a adulteraÃ§Ã£o de
combustÃ­veis Ã© prejudicial ao meio ambiente, ao
governo e, especialmente, ao consumidor final.
Em geral, essa adulteraÃ§Ã£o Ã© feita utilizando
compostos com propriedades fÃ­sicas semelhan-
tes Ã s do combustÃ­vel, mas de menor valor
agregado.
Considerando um combustÃ­vel com 20% de
adulterante, a mistura em que a adulteraÃ§Ã£o
seria identificada visualmente Ã©:
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'medium','published',183),
('ENEM-2015.2-Q184',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2015,'TermoquÃ­mica','multiple_choice','ENEM 2015.2 â€” QuÃ­mica â€” QuestÃ£o 184

A obtenÃ§Ã£o de sistemas coloidais estÃ¡veis de-
pende das interaÃ§Ãµes entre as partÃ­culas disper-
sas e o meio onde se encontram. Em um siste-
ma coloidal aquoso, cujas partÃ­culas sÃ£o hidrofÃ­-
licas, a adiÃ§Ã£o de um solvente orgÃ¢nico miscÃ­vel
em Ã¡gua, como etanol, desestabiliza o coloide,
podendo ocomer a agregaÃ§Ã£o das partÃ­culas
preliminarmente dispersas.
A desestabilizaÃ§Ã£o provocada pelo etanol ocorre
porque:
A) a polaridade da Ã¡gua no sistema coloidal Ã©
reduzida.
B) as cargas superficiais das partÃ­culas coloidais
sÃ£o diminuÃ­das.
C) as camadas de solvataÃ§Ã£o de Ã¡gua nas par-
tÃ­culas sÃ£o diminuÃ­das.
D) o processo de miscibilidade da Ã¡gua e do
solvente libera calor para o meio.
E) a intensidade dos movimentos brownianos
das partÃ­culas coloidais Ã© reduzida.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'medium','published',184),
('ENEM-2015.2-Q185',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2015,'QuÃ­mica inorgÃ¢nica','multiple_choice','ENEM 2015.2 â€” QuÃ­mica â€” QuestÃ£o 185

O papel tem na celulose sua matÃ©ria-prima, e
uma das etapas de sua produÃ§Ã£o Ã© o branque-
amento, que visa remover a lignina da celulose.
Diferentes processos de branqueamento usam,
por exemplo, cloro (Cl), hipoclorito de sÃ³dio
(NaClIO), oxigÃªnio (O>), ozÃ´nio (O;5) ou perÃ³xido
de hidrogÃªnio (HrO>). Alguns processos de
branqueamento levam Ã  formaÃ§Ã£o de compos-
tos organoclorados.
60','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'medium','published',185),
('ENEM-2015.2-Q186',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2015,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2015.2 â€” QuÃ­mica â€” QuestÃ£o 186

O poli(Ã¡cido lÃ¡tico) ou PLA Ã© um material de interesse
bioabsorvÃ­vel. O Ã¡cido lÃ¡tico, um metabÃ³lito comum
duÃ§Ã£o do PLA, de acordo com a equaÃ§Ã£o quÃ­mica
CH,
OH
polimerizaÃ§Ã£o
HO â€”.. 1O
o
Ãcido dil-lÃ¡tico
Que tipo de polÃ­mero de condensaÃ§Ã£o Ã© formado
A) PoliÃ©ster.
B) Polivinila.
C) Poliamida.
D) Poliuretana.
E) Policarbonato.
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'medium','published',186),
('ENEM-2015.2-Q187',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2015,'EquilÃ­brio quÃ­mico','multiple_choice','ENEM 2015.2 â€” QuÃ­mica â€” QuestÃ£o 187

Cinco indÃºstrias de ramos diferentes foram ins-
taladas ao longo do curso de um rio. O descarte
dos efluentes dessas indÃºstrias acarreta impac-
to na qualidade de suas Ã¡guas. O pH foi deter-
minado em diferentes pontos desse rio, a 25ÂºC,
e os resultados sÃ£o apresentados no quadro.
Pontos de coleta Valor do pH
Entre a primeira e a segunda indÃºstria â€”==s5 |
Entre a segunda e a terceira indÃºstria
Entre a terceira e a quarta indÃºstria
Entre a quarta e a quinta indÃºstria
ApÃ³s a quinta indÃºstria 6,5
A indÃºstria que descarta um efluente com carac-
terÃ­sticas bÃ¡sicas Ã© a:
A) primeira. o
B) segunda.
C) terceira.
D) quarta.
E) quinta.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'medium','published',187),
('ENEM-2015.2-Q188',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2015,'QuÃ­mica inorgÃ¢nica','multiple_choice','ENEM 2015.2 â€” QuÃ­mica â€” QuestÃ£o 188

Os calcÃ¡rios sÃ£o materiais compostos por car-
bonato de cÃ¡lcio, que podem atuar como sor-
ventes do diÃ³xido de enxofre (SO>), um impor-
tante poluente atmosfÃ©rico. As reaÃ§Ãµes envolvi-
das no processo sÃ£o a ativaÃ§Ã£o do calcÃ¡rio, por
meio da calcinaÃ§Ã£o, e a fixaÃ§Ã£o de SO, com a
formaÃ§Ã£o de um sal de cÃ¡lcio, como ilustrado
pelas equaÃ§Ãµes quÃ­micas simplificadas.
Caco, A, â€” cao + CO,
CaO + SO, + > O,â€” Sal de cÃ¡lcio
Considerando-se . as " .
reaÃ§Ãµes envolvidas nesse
processo de dessulfurizaÃ§Ã£o, a fÃ³rmula quÃ­mica
do sal de cÃ¡lcio corresponde a:
A) CaSO;
B) CaSO,
5 Casos
2
E) CaS,O;','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'medium','published',188),
('ENEM-2015.2-Q189',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2015,'QuÃ­mica geral','multiple_choice','ENEM 2015.2 â€” QuÃ­mica â€” QuestÃ£o 189

O alumÃ­nio Ã© um metal bastante versÃ¡til, pois, a
partir dele, podem-se confeccionar materiais
amplamente utilizados pela sociedade. A obten-
Ã§Ã£o do alumÃ­nio ocorre a partir da bauxita, que Ã©
purificada e dissolvida em criolita fundida
novocadernoenem(DQgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'easy','published',189),
('ENEM-2015.2-Q190',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2015,'Estequiometria','multiple_choice','ENEM 2015.2 â€” QuÃ­mica â€” QuestÃ£o 190

O vinagre vem sendo usado desde a Antiguida-
de como conservante de alimentos, bem como
agente de limpeza e condimento. Um dos prin-
cipais componentes do vinagre Ã© o Ã¡cido acÃ©tico
(massa molar 60 g/mol), cuja faixa de concen-
traÃ§Ã£o deve se situar entre 4% a 6% (m/v). Em
um teste de controle de qualidade foram anali-
sadas d cinco i marcas de de dif diferentes vinagres, i e as
concentraÃ§Ãµes de Ã¡cido acÃ©tico, em mol/L, se
encontram no q quadro.
ConcentraÃ§Ã£o de Ã¡cido acÃ©tico (mol/L)
1 | 0,007
2 0,070
3 0,150
0,700 >
62','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'medium','published',190),
('ENEM-2015.2-Q191',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2015,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2015.2 â€” QuÃ­mica â€” QuestÃ£o 191

O Nylon Ã© um polÃ­mero (uma poliamida) obtido pela
na, como indicado no esquema reacional.
o o
ido,
+ INÃ”NMÃ”NOY
Ã¡cido hexanodiolco 1,6-diamino-hexano
(Ã¡cido adÃ­pico) (hexametilenodiamina)
Na Ã©poca da invenÃ§Ã£o desse composto, foi proposta
de Ã¡tomos de carbono do diÃ¡cido carboxÃ­lico, seguido
De acordo com as informaÃ§Ãµes do texto, o nome
Ã¡cido butanodioico com o 1,2-diamino-etano Ã©:
A) Nylon 4,3.
B) Nylon 6,2.
C) Nylon 3,4.
D) Nylon 4,2.
E) Nylon 2,6.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'medium','published',191),
('ENEM-2015.2-Q192',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2015,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2015.2 â€” QuÃ­mica â€” QuestÃ£o 192

O quadro apresenta a composiÃ§Ã£o do petrÃ³leo.
z Faixa de tamanho Faixa de
180
Lubrificantes maior
Para a separaÃ§Ã£o dos constituintes com o objetivo de
A) filtraÃ§Ã£o.
B) destilaÃ§Ã£o.
C) decantaÃ§Ã£o.
D) precipitaÃ§Ã£o.
E) centrifugaÃ§Ã£o.
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'easy','published',192),
('ENEM-2015.2-Q193',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2015,'TermoquÃ­mica','multiple_choice','ENEM 2015.2 â€” QuÃ­mica â€” QuestÃ£o 193

O Ã¡lcool utilizado como combustÃ­vel automotivo
(etanol hidratado) deve apresentar uma taxa
mÃ¡xima de Ã¡gua em sua composiÃ§Ã£o para nÃ£o
prejudicar o funcionamento do motor. Uma ma-
neira simples e rÃ¡pida de estimar a quantidade
de etanol em misturas com Ã¡gua Ã© medir a den-
sidade da mistura. O grÃ¡fico mostra a variaÃ§Ã£o
da densidade da mistura (Ã¡gua e etanol) com a
fraÃ§Ã£o percentual da massa de etanol (f.), dada
pela expressÃ£o:
= me
fer 100
Tm.
Em que m. e m, sÃ£o as massas de etanol e de
"
agua na mistura, respectivamente, a uma tem-
peratura de 20ÂºC.
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
Ã‡A Em E E E o coa Es ia oa Ea Ea Ba ea Ea esa cc ia Sa Ea |
VE aPm EmA [Par sa oa Er ER Era Pr (2 ia fer Dra rem pe pr Ps ge
A Em EM [EM] DA EM om mA BD Er Eva Ex] Eca Bea BoA BH Barca Ber Br Ba Da: S f
sssss===============
TE â€”â€” â€”â€” e sâ€”
RE AA A AR Am Praca Rm Ã§a a as o ice e 3
to
Suponha que, em , inspeÃ§Ã£o " de rotina " realizada .
em determinado posto, tenha-se verificado que
50,0 cm? de Ã¡lcool combustÃ­vel tenham massa
igual a 45,0 g Qual Ã© a fraÃ§Ã£o percentual de
etanol nessa mistura?
8) Toe
o
C) 55%
D) 90%
E) 93%','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'hard','published',193),
('ENEM-2015.2-Q194',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2015,'QuÃ­mica geral','multiple_choice','ENEM 2015.2 â€” QuÃ­mica â€” QuestÃ£o 194

A cafeina Ã© um alcaloide, identificado como
1,3,7trimetilxantina (massa bee Fgual a 194
g/mol), cuja estrutura quÃ­mica contÃ©m uma uni-
dade de purina, conforme representado. Esse
alcaloide Ã© encontrado em grande quantidade
nas sementes de cafÃ© e nas folhas de chÃ¡-
verde. Uma xÃ­cara de cafÃ© contÃ©m, em mÃ©dia,
80 mg de cafeÃ­na.
(o)
CH,
Hex, N
| ?
A N
o N
|
CH,
3
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'medium','published',194),
('ENEM-2015.2-Q195',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2015,'TermoquÃ­mica','multiple_choice','ENEM 2015.2 â€” QuÃ­mica â€” QuestÃ£o 195

O acÃºmulo de plÃ¡sticos na natureza pode levar
a impactos ambientais negativos, tanto em am-
bientes terrestres quanto aquÃ¡ticos. Uma das
formas de minimizar esse problema Ã© a recicla-
gem, para a qual Ã© necessÃ¡ria a separaÃ§Ã£o dos
diferentes tipos de plÃ¡sticos.
Em um processo de separaÃ§Ã£o foi proposto o
seguinte procedimento:
a mistura istura de plÃ¡sticos 5
1. Coloque de plÃ¡sticos picados
em um tanque e acrescente Ã¡gua atÃ© a me-
tade da sua capacidade.
Il. Mantenha essa mistura i em repouso por
cerca de 10 minutos.
Ã£
Il. Retire os pedaÃ§os que flutuam e transfi- :
ra para outro tanque com uma soluÃ§Ã£o de
Ã¡lcool.
IV. Coloque os pedaÃ§os sedimentados em
outro tanque com soluÃ§Ã£o de sal e agite
bem ''
Qual propriedade da matÃ©ria possibilita a utiliza-
Ã§Ã£o do procedimento descrito?
A) Massa.
B) Volume.
C) Densidade.
D) Porosidade.
E) Maleabilidade.
QuestÃ£o IOG(20T6.1) |Ã€ÃšÃ€|Ã€|||lllS
O benzeno, um importante solvente para a in-
dÃºstria quÃ­mica, Ã© obtido industrialmente pela
destilaÃ§Ã£o do petrÃ³leo.
Contudo, tambÃ©m pode ser sintetizado pela
trimerizaÃ§Ã£o do acetileno catalisada por ferro
metÃ¡lico sob altas temperaturas, conforme a
equaÃ§Ã£o quÃ­mica:
3 CaHo (9) â€” CsHs (1)
A energia envolvida nesse processo pode ser
calculada indiretamente pela variaÃ§Ã£o de ental-
pia das reaÃ§Ãµes de combustÃ£o das substÃ¢ncias
participantes, nas mesmas condiÃ§Ãµes experi-
mentais:
64','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'hard','published',195),
('ENEM-2015.2-Q196',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2015,'QuÃ­mica geral','multiple_choice','ENEM 2015.2 â€” QuÃ­mica â€” QuestÃ£o 196. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,1,null,'medium','published',196),
('ENEM-2016.1-Q197',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'Estequiometria','multiple_choice','ENEM 2016.1 â€” QuÃ­mica â€” QuestÃ£o 197

A minimizaÃ§Ã£o do tempo e custo de uma reaÃ§Ã£o
quÃ­mica, bem como o aumento na sua taxa de
conversÃ£o, caracterizam a eficiÃªncia de um
processo quÃ­mico. Como consequÃªncia, produ-
tos podem chegar ao consumidor mais baratos.
Um dos parÃ¢metros que mede a eficiÃªncia de
uma reaÃ§Ã£o quÃ­mica Ã© o seu rendimento molar
(R, em %), definido como:
n
R = = â€”â€”â€”â€”â€”â€”â€” produto x 100
n. 2
reagente limitante
Em que n corresponde ao nÃºmero de mois. O
metanol pode ser obtido pela reaÃ§Ã£o entre bro-
meto de metila e hidrÃ³xido de sÃ³dio, conforme a
equaÃ§Ã£o quimica:
CH;3Br + NaOH â€” CH;OH + NaBr
As massas molares (em g/mol) desses elemen-
tos sÃ£o: H = 1; C = 12; O = 16; Na = 23; Br = 80.
O rendimento molar da reaÃ§Ã£o, em que 32 g de
metanol foram obtidos a partir de 142,5 g de
brometo de metila e 80 g de hidrÃ³xido de sÃ³dio,
Ã© mais prÃ³ximo de:
A) 22%.
B) 40%.
Cc) 50%.
D) 67%.
E) 75%.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'hard','published',197),
('ENEM-2016.1-Q198',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2016.1 â€” QuÃ­mica â€” QuestÃ£o 198

Em sua formulaÃ§Ã£o, o spray de pimenta contÃ©m
porcentagens variadas de oleorresina de Capsi-
cum, cujo principio ativo Ã© a capsaicina, e um
solvente (um Ã¡lcool como etanol ou isopropa-
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'easy','published',198),
('ENEM-2016.1-Q199',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'QuÃ­mica geral','multiple_choice','ENEM 2016.1 â€” QuÃ­mica â€” QuestÃ£o 199

A usina de Itaipu Ã© uma das maiores hidrelÃ©tri-
cas do mundo em geraÃ§Ã£o de energia. Com 20
unidades geradoras e 14 000 MW de potÃªncia
total instalada, apresenta uma queda de 118,4m
e vazÃ£o nominal de 690 mâ€/s por unidade gera-
dora. O cÃ¡lculo A da potÃªncia anais teÃ³rica dar leva em
conta a altura da massa de Ã¡gua represada pela
barragem, a gravidade local (ao mis ) e a densi-
dade da agua (1000 kam LA diferenÃ§a entre a
e a instalada Ã© a potÃªncia nÃ£o
Doroveitada
(DisponÃ­vel em: www.itaipu.gov.br.
Acesso em: 11 maio 2013 - adaptado)
Qual e a potÃªncia, em MW, nÃ£o aproveitada em
cada unidade geradora de Itaipu?
AJO
B) 1,18
C) 116,96
D) 816,96
E) 13 183,04','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'hard','published',199),
('ENEM-2016.1-Q200',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2016.1 â€” QuÃ­mica â€” QuestÃ£o 200

O carvÃ£o ativado Ã© um material que possui ele-
vado teor de carbono, sendo muito utilizado
para a remoÃ§Ã£o de compostos orgÃ¢nicos volÃ¡-
teis do meio, como o benzeno. Para a remoÃ§Ã£o
desses compostos, utiliza-se a adsorÃ§Ã£o. Esse
fenÃ´meno ocorre por meio de interaÃ§Ãµes do tipo
intermoleculares entre a superfÃ­cie do carvÃ£o
(adsorvente) e o benzeno (adsorvato, substÃ¢n-
cia adsorvida).
65','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'medium','published',200),
('ENEM-2016.1-Q201',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'Radioatividade','multiple_choice','ENEM 2016.1 â€” QuÃ­mica â€” QuestÃ£o 201

O aquecimento de um material por irradiaÃ§Ã£o
com microondas ocorre por causa da interaÃ§Ã£o
da onda eletro magnÃ©tica com o dipolo elÃ©trico
da molÃ©cula. Um importante atributo do aqueci-
mento por micro-ondas e a absorÃ§Ã£o direta da
energia pelo material a ser aquecido. Assim,
esse aquecimento Ã© seletivo e dependerÃ¡, prin-
cipalmente, da constante dielÃ©trica e da fre-
quÃªncia de relaxaÃ§Ã£o do material. O grÃ¡fico
mostra a taxa de aquecimento de cinco solven-
tes sob irradiaÃ§Ã£o de micro-ondas.
O Ãgua
| â€”o- Metanol v
1097
Dio "
â€”- Propanol y
& 804 | â€”â€” Hexano & A
Ss . &
8 o
- x Âº ? -.
5 60 Y o
ÃŠ fo,
: x
p
i
x o
40 DD o
EE: Sa aaa eus ANNA ANNA SUNS SUNS
O 10 20 30 40 50 60 70 8
Tempo (s)
No grÃ¡fico, qual solvente apresenta taxa mÃ©dia
de aquecimento mais prÃ³xima de zero, no inter-
valo de 0 8 a 40 s?
A) HO
B) CH;OH
C) CH;CH,OH
D) CH;CH;CH,OH
E) CH;CHZCHZCH2CHACHs','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'hard','published',201),
('ENEM-2016.1-Q202',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'EquilÃ­brio quÃ­mico','multiple_choice','ENEM 2016.1 â€” QuÃ­mica â€” QuestÃ£o 202

Em meados de 2003, mais de 20 pessoas mor-
reram no Brasil apÃ³s terem ingerido uma sus-
pensÃ£o de sulfato de bÃ¡rio utilizada como con-
traste em exames radiolÃ³gicos. O sulfato de
bÃ¡rio Ã© um sÃ³lido pouquÃ­ssimo solÃºvel em Ã¡gua,
que nÃ£o se dissolve mesmo na presenÃ§a de
Ã¡cidos. As mortes ocorreram porque um labora-
tÃ³rio farmacÃªutico forneceu o produto contami-
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'medium','published',202),
('ENEM-2016.1-Q203',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'QuÃ­mica ambiental','multiple_choice','ENEM 2016.1 â€” QuÃ­mica â€” QuestÃ£o 203

ApÃ³s seu desgaste completo, os pneus podem
ser queimados para a geraÃ§Ã£o de energia. Den-
tre os gases gerados na combustÃ£o completa
da borracha vulcanizada, alguns sÃ£o poluentes
e provocam a chuva Ã¡cida. Para evitar que es-
capem para a atmosfera, esses gases podem
ser borbulhados em uma soluÃ§Ã£ Ã§Ã£o aquosa con -
tendo uma substÃ¢ncia em adequada. Considere as
informaÃ§Ãµes das substÃ¢ncias listadas no qua-
dro.
Eae
Valor da
juilÃ­brio em
equilÃ­brio
Fenoi â€” | COR TEOR | ,3, 19-10
Piridina | | 1116
CENTOS "
= CHNH* + OH
PR CHNH, + H,0 2
Metilamina + 44x 10%
= CHNHt OH
Hidrogenofos- | HPOZ + H,0 = >
elo:
[fato de potÃ¡ssio) => H PO; + OH
LL:
Hidrogenos- - =
todo | AE | auasade
potÃ¡ssio =SO07 +H,O*
Dentre as substÃ¢ncias listadas no quadro, aque-
la capaz de remover com maior eficiÃªncia os
gases poluentes Ã© o(a):
A) fenol.
B) piridina.
C) metilamina.
D) hidrogenofosfato de potÃ¡ssio.
E) hidrogenosulfato de potÃ¡ssio.
66','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'hard','published',203),
('ENEM-2016.1-Q204',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'QuÃ­mica geral','multiple_choice','ENEM 2016.1 â€” QuÃ­mica â€” QuestÃ£o 204

Os feromÃ´nios sÃ£o substÃ¢ncias utilizadas na
feromÃ´nio isolado de um inseto foi o bombicol,
MMA FAN
Bombicol
O uso de feromÃ´nios em aÃ§Ãµes de controle de insetos
para a agricultura do futuro. SÃ£o agentes altamente
empregados em determinados cultivos, conforme
ANA
OH O
UU
[
(o)
AMA,
So
AADÃ”ADADAOAOS,
EA
Considerando essas estruturas quÃ­micas, o tipo de
bÃ©m apresentada pelo feromÃ´nio utilizado no controle
A) Sitophilus spp. B) Migdolus
D) Grapholita molesta. E)','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'medium','published',204),
('ENEM-2016.1-Q205',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'QuÃ­mica geral','multiple_choice','ENEM 2016.1 â€” QuÃ­mica â€” QuestÃ£o 205

A lipofilia Ã© um dos fatores fundamentais para o
planejamento de um fÃ¡rmaco. Ela mede o grau
de afinidade que a substÃ¢ncia tem com ambien-
tes apolares, podendo ser avaliada por seu coe-
ficiente de partiÃ§Ã£o.
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
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'medium','published',205),
('ENEM-2016.1-Q206',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'EletroquÃ­mica','multiple_choice','ENEM 2016.1 â€” QuÃ­mica â€” QuestÃ£o 206

TEXTO |
BiocÃ©lulas combustÃ­veis sÃ£o uma alternativa
tecnolÃ³gica para substituiÃ§Ã£o das baterias con-
vencionais. Em uma biocÃ©lula microbiolÃ³gica,
bactÃ©rias catalisam reaÃ§Ãµes de oxidaÃ§Ã£o de
substratos orgÃ¢nicos. Liberam elÃ©trons produzi-
dos na respiraÃ§Ã£o celular para um eletrodo,
67','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'easy','published',206),
('ENEM-2016.1-Q207',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'QuÃ­mica geral','multiple_choice','ENEM 2016.1 â€” QuÃ­mica â€” QuestÃ£o 207. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,3,null,'medium','published',207),
('ENEM-2016.1-Q208',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'QuÃ­mica geral','multiple_choice','ENEM 2016.1 â€” QuÃ­mica â€” QuestÃ£o 208. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,3,null,'medium','published',208),
('ENEM-2016.1-Q209',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2016.1 â€” QuÃ­mica â€” QuestÃ£o 209

Para cada litro de etanol produzido em uma
indÃºstria de cana-de-aÃ§Ãºcar sÃ£o gerados cerca
de 18 L de vinhaÃ§a que Ã© utilizada na irrigaÃ§Ã£o
das plantaÃ§Ãµes de cana-de-aÃ§Ãºcar, jÃ¡ que con-
tÃ©m teores mÃ©dios de nutrientes N, P e K iguais
MH .
a sc
mel, 60 mg/L e 2 034 mg/L, respectiva-
(SILVA. M. A. S.; GRIEBELER. N. P.; BORGES, L. C.
Uso de vinhaÃ§a e impactos nas propriedades do solo
e lenÃ§o! freÃ¡tico. Revista Brasileira de Engenharia
AgrÃ­cola e Ambiental. n. 1, 2007 - adaptado)
68','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'medium','published',209),
('ENEM-2016.1-Q210',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'QuÃ­mica geral','multiple_choice','ENEM 2016.1 â€” QuÃ­mica â€” QuestÃ£o 210. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,0,null,'medium','published',210),
('ENEM-2016.1-Q211',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2016.1 â€” QuÃ­mica â€” QuestÃ£o 211

NucleÃ³filos (Nu) sÃ£o bases de Lewis que rea-
gem com haletos de alquila, por meio de uma
reaÃ§Ã£o substituiÃ§Ã£o nucleofÃ­lica (Sy),
chamada
como mostrado no esquema:
E a Bea Na,
( R= grupo a''quila Iquila e e X = halogÃªni: alogÃªnio)
A reaÃ§Ã£o de S,, entre metÃ³xido de sÃ³dio (Nu =
CH3;O) e brometo de metila fornece um com-
posto orgÃ¢nico pertencente Ã  funÃ§Ã£o:
A) Ã©ter.
B) Ã©ster.
C) Ã¡lcool.
D) haleto.
E) hidrocarboneto.
com substÃ¢ncias polares e apolares. A parte iÃ´nica
a parte lipofÃ­lica interage com as apolares. A estru-
por:
;
CH, CH, CH, fo O FÃ³rmula
NÃ“ NÃ“ NÃ“ estrutural
CH, CH, CH, O do tensoativo
RepresentaÃ§Ã£o
esquemÃ¡tica
molÃ©culas formam um arranjo ordenado. Esse arranjo Ã©
Â« NÃ­vel & < NÃ­vel
da da
Ã¡gua Ã¡gua
Â« NÃ­vel
da
Ã¡gua
69','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'hard','published',211),
('ENEM-2016.1-Q212',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2016.1 â€” QuÃ­mica â€” QuestÃ£o 212

Os tensoativos sÃ£o compostos capazes de interagir
dos tensoativos interage com substÃ¢ncias polares, e
tura orgÃ¢nica de um tensoativo pede ser representada
CH, CH, CH, CH, CH,
A NV NÃ”O NO NO NÃ“
HC CH, CH, CH, CH, CH,
Ao adicionar um tensoativo sobre a Ã¡gua, suas
representado esquematicamente por:
A) Â« NÃ­vel B)
da
Ã¡gua
D) Â« NÃ­vel (2)
da
Ã¡gua
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'medium','published',212),
('ENEM-2016.2-Q213',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'SoluÃ§Ãµes e concentraÃ§Ã£o','multiple_choice','ENEM 2016.2 â€” QuÃ­mica â€” QuestÃ£o 213

Nos anos 1990, verificou-se que o rio Potomac
situado no estado norte-americano de Maryland,
tinha em parte de seu curso, Ã¡guas extrema-
mente Ã¡cidas por receber um efluente de uma
mina de carvÃ£o desativada, o qual continha
Ã¡cido sulfÃºrico (H/SO,). Essa Ã¡gua, embora
lÃ­mpida, era desprovida de vida. Alguns quilÃ´-
metros adiante, instalou-se uma fÃ¡brica de pa-
pel e celulose que emprega hidrÃ³xido de sÃ³dio
(NaOH) e carbonato de sÃ³dio (Na;CO;) em seus
processos. Em pouco tempo observou-se que, a
partir do ponto em que a fÃ¡brica lanÃ§a seus
rejeitos no rio, a vida aquÃ¡tica voltou a florescer.
(HARRIS D.C. AnÃ¡lise quÃ­mica quantitativa, Rio de
Janeiro. Livros TÃ©cnicos e CientÃ­ficos. 2012)
A explicaÃ§Ã£o para o retorno da vida aquÃ¡tica
nesserioÃ©a:
A) diluiÃ§Ã£o das Ã¡guas do rio pelo novo efluente
lanÃ§ado nele.
B) precipitaÃ§Ã£o do Ã­on sulfato na presenÃ§a do
efluente da nova fÃ¡brica. .
C) biodegradaÃ§Ã£o do Ã¡cido sulfÃºrico em contato
com o novo efluente descartado.
D) diminuiÃ§Ã£o rintiad da acidez ; das Ã¡guas " do rio : pelo
efluente dÃ¡ fÃ¡brica de papel e''celulose:
E) volatilizaÃ§Ã£o do Ã¡cido sulfÃºrico apÃ³s contato
com o novo efluente introduzido no rio.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'hard','published',213),
('ENEM-2016.2-Q214',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'QuÃ­mica ambiental','multiple_choice','ENEM 2016.2 â€” QuÃ­mica â€” QuestÃ£o 214

A energia nuclear Ã© uma alternativa aos com-
bustÃ­veis fÃ³sseis que, se nÃ£o gerenciada de
forma correta, pode causar impactos ambientais
graves. O principio da geraÃ§Ã£o dessa energia
pode se basear na reaÃ§Ã£o de fissÃ£o controlada
do urÃ¢nio por bombardeio de nÃªutrons. como
ilustrado:
235 U+nâ€”>â€Sr+ 95 139 "â€œXe+2n+ i
energia
Um grande risco 3 decorre da geraÃ§Ã£o " do chama-
do lixo atÃ´mico, NO que exige ; condiÃ§Ãµes A muito PA rÃ­gi-
das de tratamento e armazenamento para evitar
vazamentos para o meio ambiente.
Esse lixo Ã© prejudicial, pois:
A) favorece a proliferaÃ§Ã£o de microrganismos
W " . .
termÃ³filos.
B) produz nÃªutrons livres . que o ionizam o ar, tor-
nando-o condutor.
C) libera gases que alteram a composiÃ§Ã£o 1 da
atmosfera terrestre.
D) acentua o efeito estufa decorrente do calor
produzido na fissÃ£o.
E) emite radiaÃ§Ã£o capaz de provocar danos Ã 
saÃºde dos seres vivos.
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'hard','published',214),
('ENEM-2016.2-Q215',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'SoluÃ§Ãµes e concentraÃ§Ã£o','multiple_choice','ENEM 2016.2 â€” QuÃ­mica â€” QuestÃ£o 215

Para lavar e refrescar o ambiente, que estava a
40ÂºC, uma pessoa resolveu jogar Ã¡gua sobre
um piso de granito. Ela observou que o lÃ­quido
se concentrou em algumas regiÃµes, molhando
parcialmente a superfÃ­cie. Ao adicionar deter
gente sobre essa Ã¡gua. a pessoa verificou que o
lÃ­quido se espalhou e deixou o piso totalmente
molhado.
A molhabilidade da superfÃ­cie foi melhorada em
funÃ§Ã£o da:
A) solubilidade do detergente em Ã¡gua ser alta.
B) tensÃ£o superficial da Ã¡gua ter sido reduzida.
C) pressÃ£o de vapor da Ã¡gua ter sido diminuÃ­da.
D) densidade da soluÃ§Ã£o ser maior que a da
Ã¡gua.
E) viscosidade da soluÃ§Ã£o ser menor que a da
Ã¡gua.
TIE AR ORAR Oy DD','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'medium','published',215),
('ENEM-2016.2-Q216',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'Estequiometria','multiple_choice','ENEM 2016.2 â€” QuÃ­mica â€” QuestÃ£o 216

AtÃ© 1824 acreditava-se que as mÃ¡quinas PP. tÃ©mi- .
cas, cujos exemplos sÃ£o as mÃ¡quinas a vapor e
os as motores = : ter
atuais a combustÃ£o. Poderiam
um funcionamento ideal. Sadi Camot demons-
funcionando em ciclos entre duas fontes tÃ©rmi-
trou a impossibilidade de uma mÃ¡quina tÃ©rmica,
Na (uma quente e outra fria), obter 100% o, de
Ã€
rendimento.
Tal limitaÃ§Ã£o ocorre porque essas mÃ¡quinas:
A) realizam trabalho mecÃ¢nico.
B) produzem aumento da entropia.
C) utilizam transformaÃ§Ãµes adiabÃ¡ticas.
D) contrariam a lei da conservaÃ§Ã£o de energia.
E) funcionam com temperatura igual Ã  da fonte
quente.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'medium','published',216),
('ENEM-2016.2-Q217',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2016.2 â€” QuÃ­mica â€” QuestÃ£o 217

Em Bangladesh, mais da metade dos poÃ§os
artesianos " cuja SA Ã¡gua serve Ã  R populaÃ§Ã£o = local
estÃ¡ contaminada com arsÃªnio proveniente de
" Aa
minerais naturais e de pesticidas. O arsÃªnio
apresenta efeitos tÃ³xicos cumulativos.
A ONU desenvolveu um Kit para tratamento
dessa Ã¡gua a fim de tornÃ¡-la segura para o con-
sumo humano. O princÃ­pio desse Kit Ã© a remo-
Ã§Ã£o do arsÃªnio por meio de uma reaÃ§Ã£o de pre-
cipitaÃ§Ã£o com sais de ferro (III) que origina um
sÃ³lido volumoso de textura gelatinosa.
(DisponÃ­vel em: http://tc.iaea.org.
Acesso em: 11 dez. 2012 - adaptado)
Com o uso desse Kit, a populaÃ§Ã£o local pode
remover o elemento tÃ³xico por meio de:
70','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'medium','published',217),
('ENEM-2016.2-Q218',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'QuÃ­mica geral','multiple_choice','ENEM 2016.2 â€” QuÃ­mica â€” QuestÃ£o 218. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,2,null,'medium','published',218),
('ENEM-2016.2-Q219',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'QuÃ­mica ambiental','multiple_choice','ENEM 2016.2 â€” QuÃ­mica â€” QuestÃ£o 219

O principal componente do sal de cozinha Ã© o
cloreto de sÃ³dio, mas o produto pode ter alumi-
nossilicato de sÃ³dio em pequenas concentra-
Ã§Ãµes. Esse sal, que Ã© insolÃºvel em Ã¡gua, age
como antiumectante, evitando que o sal de co-
zinha tenha um aspecto empedrado.
O procedimento de laboratÃ³rio adequado para
verificar a presenÃ§a do antiumectante em uma
amostra de sal de cozinha Ã© o(a):
A) realizaÃ§Ã£o do teste de chama.
B) medida do pH de uma soluÃ§Ã£o aquosa.
C) medida da turbidez de uma soluÃ§Ã£o aquosa.
D) ensaio da presenÃ§a de substÃ¢ncias orgÃ¢ni-
cas.
E) verificaÃ§Ã£o da presenÃ§a de cÃ¡tions monova-
lentes.
QuestÃ£o 220(20162) |||
Algumas prÃ¡ticas agrÃ­colas fazem uso de quei-
madas, apesar de produzirem grandes efeitos
negativos.
Por exemplo, quando ocorre a queima da palha
de cana-de-aÃ§Ãºcar, utilizada na produÃ§Ã£o de
etanol, hÃ¡ emissÃ£o de poluentes como CO,,
SOx, NOx e materiais particulados (MP) para a
atmosfera. Assim, a produÃ§Ã£o de biocombustÃ­-
veis pode, muitas vezes, ser acompanhada da
emissÃ£o de vÃ¡rios poluentes.
(CARDOSO, A. A.; BiocombustÃ­vel: o mito do com-
bustÃ­vel limpo. QuÃ­mica Nova Escola. n. 28, maio 08)
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'hard','published',219),
('ENEM-2016.2-Q220',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'QuÃ­mica geral','multiple_choice','ENEM 2016.2 â€” QuÃ­mica â€” QuestÃ£o 220. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,2,null,'medium','published',220),
('ENEM-2016.2-Q221',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'TermoquÃ­mica','multiple_choice','ENEM 2016.2 â€” QuÃ­mica â€” QuestÃ£o 221

UtensÃ­lios de uso cotidiano e ferramentas que
contÃªm ferro em sua liga metÃ¡lica tendem a
sofrer processo corrosivo e enferrujar. A corro-
sÃ£o Ã© um processo eletroquÃ­mico e, no caso do
ferro, ocorre a precipitaÃ§Ã£o do Ã³xido de ferro (Il)
hidratado, substÃ¢ncia marrom pouco solÃºvel,
conhecida como ferrugem. Esse processo cor-
rosivo Ã©, de maneira geral, representado pela
equaÃ§Ã£o quimica:
4Fe(s)+30,(g): 2H,0(1) > 2 Fe,O0;:H,O (s)
â€”
Ferrugem
Uma forma de impedir o processo corrosivo
nesses utensÃ­lios Ã©:
A) renovar sua superfÃ­cie, polindo-a semanal-
mente.
B) evitar o contato do utensÃ­lio com o calor,
isolando-o termicamente.
C) impermeabilizar a superfÃ­cie, isolando-a de
seu contato com o ar Ãºmido.
D) esterilizar frequentemente os utensÃ­lios, im-
pedindo a proliferaÃ§Ã£o de bactÃ©rias.
E) guardar os utensÃ­lios em embalagens, iso-
lando-os do contato com outros objetos.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'hard','published',221),
('ENEM-2016.2-Q222',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'EletroquÃ­mica','multiple_choice','ENEM 2016.2 â€” QuÃ­mica â€” QuestÃ£o 222

A bauxita Ã© o minÃ©rio utilizado na fabricaÃ§Ã£o do
alumÃ­nio, a qual apresenta A/2O; (alumina) em
sua composiÃ§Ã£o. ApÃ³s o trituramento e lavagem
para reduzir o teor de impurezas, o minÃ©rio Ã©
misturado a uma soluÃ§Ã£o aquosa de NaOH
(etapa A). A parte sÃ³lida dessa mistura Ã© rejei-
tada e a soluÃ§Ã£o resultante recebe pequenos
cristais de alumina, de onde sedimenta um sÃ³li-
do (etapa B). Esse sÃ³lido e aquecido atÃ© a ob-
tenÃ§Ã£o de um pÃ³ branco, isento de Ã¡gua e cons-
tituÃ­do unicamente por alumina. Finalmente,
esse pÃ³ Ã© aquecido atÃ© sua fusÃ£o e submetido a
uma eletrÃ³lise, cujos produtos sÃ£o o metal puro
fundido (A/) e o gÃ¡s carbÃ´nico (CO,).
71','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'medium','published',222),
('ENEM-2016.2-Q223',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'QuÃ­mica geral','multiple_choice','ENEM 2016.2 â€” QuÃ­mica â€” QuestÃ£o 223. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,4,null,'medium','published',223),
('ENEM-2016.2-Q224',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'QuÃ­mica ambiental','multiple_choice','ENEM 2016.2 â€” QuÃ­mica â€” QuestÃ£o 224

Os mÃ©todos empregados nas anÃ¡lises quÃ­micas
sÃ£o ferramentas importantes para se conhecer a
com posiÃ§Ã£o dos diversos materiais presentes
no meio ambiente. Ã‰ comum, na anÃ¡lise de
metais presentes em amostras ambientais, co-
mo Ã¡gua de rio ou de mar, a adiÃ§Ã£o de um Ã¡cido
mineral forte, normalmente o Ã¡cido nÃ­trico
(HNO;), com a finalidade de impedir a precipita-
Ã§Ã£o de compostos pouco solÃºveis desses me-
tais ao longo do tempo.
Na ocorrÃªncia de precipitaÃ§Ã£o, o resultado da
anÃ¡lise pode ser subestimado, porque:
A) ocorreu passagem de parte dos metais para
uma fase sÃ³lida.
B) houve volatilizaÃ§Ã£o de compostos dos metais
para a atmosfera.
C) os metais passaram a apresentar comporta-
mento de nÃ£o metais.
D) formou-se uma nova fase lÃ­quida, imiscÃ­vel
com a soluÃ§Ã£o original.
E) os metais reagiram com as paredes do reci-
piente que contÃ©m a amostra.
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'hard','published',224),
('ENEM-2016.2-Q225',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'LigaÃ§Ãµes quÃ­micas e estrutura','multiple_choice','ENEM 2016.2 â€” QuÃ­mica â€” QuestÃ£o 225

O paclitaxel Ã© um triterpeno poli-hidroxilado que
foi originalmente isolado da casca de Taxus
brevifolia, Ã¡rvore de crescimento lento e em
risco de extinÃ§Ã£o, mas agora Ã© obtido por rota
quÃ­mica semissintÃ©tica. Esse fÃ¡rmaco Ã© utilizado
como agente quimioterÃ¡pico no tratamento de
tumores de ovÃ¡rio, mama e pulmÃ£o. Seu meca-
nismo de aÃ§Ã£o antitumoral envolve sua ligaÃ§Ã£o
Ã  tubulina interferindo com a funÃ§Ã£o dos mi-
crotÃºbulos.
(KRETZER, |. F. Terapia antitumoral combinada dea
derivados do paclitaxel e etoposÃ­deo associados Ã 
nanoemulsÃ£o lipÃ­dica rica em colesterol â€” LDE. Dis-
ponÃ­vel em: wwwtesesusptar. Acesso em 29.02.2012)
Do acordo 6 dieta antiuimeral descia, SÃ£
" s ,
celular Ã© diretamente afetada pelo pacii-
bo
taxel?
A) DivisÃ£o sÃ£ celular.
8) Transporte passivo.
s
C) EquilÃ­brio osmÃ³tico.
D) GeraÃ§Ã£o de energia.
E) SÃ­ntese de proteÃ­nas.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'hard','published',225),
('ENEM-2016.2-Q226',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'QuÃ­mica ambiental','multiple_choice','ENEM 2016.2 â€” QuÃ­mica â€” QuestÃ£o 226

Os grÃ¡ficos representam a concentraÃ§Ã£o " na
atmosfera, em partes por bl (ppm), bilhÃ£o
(ppb) ou trilhÃ£o (ppt), dos cinco gases respon-
sÃ¡veis por 97% do efeito estufa durante o perÃ­o-
do de 1978 a 2010.
390 '' 7 7 "
DiÃ³xido de carbono | 2
30 Lo -
z Ã©
Ãª | | PA |
- mo Ã 
STA
| : |
"x.
E
ANO |
350 NA
PSA | | |
â€
340 "
ao
| | |
Ã£o
1978 1982 1986 1990 1994 1998 2002 2006 2010
325 Ã“xido T T
nitroso| |
|
o
Ãª Pe |
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
72','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'hard','published',226),
('ENEM-2016.3-Q227',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'QuÃ­mica geral','multiple_choice','ENEM 2016.3 â€” QuÃ­mica â€” QuestÃ£o 227

Benjamin Franklin (1706-1790), por volta de
1757, percebeu que dois barcos que
compunham a frota com a qual viajava para
Londres permaneciam estÃ¡veis, enquanto os
outros eram jogados pelo vento. Ao questiona o
porquÃª daquele fenÃ´meno, foi informado pelo
capitÃ£o que provavelmente os cozinheiros
haviam arremessado Ã³leo pelos lados dos
barcos. Inquirindo mais a respeito, soube que
habitantes das ilhas do PacÃ­fico jogavam Ã³leo
na Ã¡gua para impedir que o vento a agitasse e
atrapalhasse a pesca.
Em 1774, Franklin resolveu testar o fenÃ´meno
jogando uma colher de chÃ¡ (4mL) de Ã³leo de
oliva em um lago onde pequenas ondas eram
formadas. Mais curioso que o efeito de acalmar
as ondas foi o fato de que o Ã³leo havia de
espalhado completamente pelo lago, numa Ã¡rea
de aproximadamente 2000 m?, formando um
filme fino.
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'hard','published',227),
('ENEM-2016.3-Q228',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2016.3 â€” QuÃ­mica â€” QuestÃ£o 228

Adicionar quantidades de Ã¡lcool Ã  gasolina,
diferentes daquelas determinadas pela legisla-
Ã§Ã£o, Ã© uma das formas de adulterÃ¡-la. Um teste
simples para aferir a quantidade de Ã¡lcool pre-
sente na mistura consiste em adicionar uma
soluÃ§Ã£o salina aquosa Ã  amostra de gasolina
sob anÃ¡lise.
Essa metodologia de anÃ¡lise pode ser usada
porque o(a):
A) Ã¡gua da soluÃ§Ã£o salina interage com a gaso-
lina da mistura, formando duas fases, uma delas
de Ã¡lcool puro.
B) Ã¡lcool contido na gasolina interage com a
soluÃ§Ã£o salina, formando duas fases, uma delas
de gasolina pura.
C) gasolina da mistura sob anÃ¡lise interage com
a soluÃ§Ã£o salina, formando duas fases, uma
delas de Ã¡lcool puro.
D) Ã¡gua da soluÃ§Ã£o salina interage com o Ã¡lcool
da mistura, formando duas fases, uma delas de
gasolina com sal.
E) Ã¡lcool contido na gasolina interage com o sal
da soluÃ§Ã£o salina, formando duas fases, uma
delas de gasolina mais Ã¡gua.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'hard','published',228),
('ENEM-2016.3-Q229',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'QuÃ­mica ambiental','multiple_choice','ENEM 2016.3 â€” QuÃ­mica â€” QuestÃ£o 229

A crescente produÃ§Ã£o industrial lanÃ§a ao ar
diversas substÃ¢ncias tÃ³xicas que podem ser
removidas pela passagem do ar contaminado
em tanques para filtraÃ§Ã£o por materiais porosos,
ou para dissoluÃ§Ã£o em agua ou solventes orgÃ£-
nicos de baixa polaridade, ou para neutralizaÃ§Ã£o
em soluÃ§Ãµes Ã¡cidas ou bÃ¡sicas. Um dos poluen-
tes mais tÃ³xicos liberados na atmosfera pela
atividade industrial Ã© a 2,3,7,8-tetraclorodioxina.
73','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'medium','published',229),
('ENEM-2016.3-Q230',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'TermoquÃ­mica','multiple_choice','ENEM 2016.3 â€” QuÃ­mica â€” QuestÃ£o 230

O quadro apresenta alguns exemplos de combustÃ­veis
de transporte.
CombustÃ­vel | Temperatura de fusÃ£o
[Mean [8
Loetano o
SÃ£o combustÃ­veis lÃ­quidos Ã  temperatura ambiente
A) Butano, etanol e metano. B) Etano,
D) Metanol e metano. E) Octano e','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'easy','published',230),
('ENEM-2016.3-Q231',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'EquilÃ­brio quÃ­mico','multiple_choice','ENEM 2016.3 â€” QuÃ­mica â€” QuestÃ£o 231

Um bafÃ´metro simples consiste em um tubo contendo
sÃ­lica umedecida com Ã¡cido sulfÃºrico. Nesse teste,
dÃ¡ visualmente, pois a reaÃ§Ã£o que ocorre Ã© a
(alaranjado) a cromo (Ill) (verde) ou cromo (II) (azul).
Sopro â€”,
ZIN
A equaÃ§Ã£o balanceada da reaÃ§Ã£o quÃ­mica que
A) Cr,0,2 (aq) + 2 H* (aq) + 3 CH,X-CH,-OH (g) > 2
B) Cr,0,7 (aq) + 8 H* (aq) + 3 CH, CH,-OH (g) â€” 2
C) Cro? (aq) + 2 H'' (aq) + 3 CH,-CH,-OH (g) > Cr*''
D) Cr,0,> (aq) + 8 H* (aq) + 3 CH,-CHO (g) = 2 Cri*
E) Cro,2 (aq) + 2 H* (aq) + 3 CH,-CHO (g) > Cr?"
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'medium','published',231),
('ENEM-2016.3-Q232',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'QuÃ­mica geral','multiple_choice','ENEM 2016.3 â€” QuÃ­mica â€” QuestÃ£o 232

ClimatÃ©rio Ã© o nome de um estÃ¡gio no processo de
zado pelo aumento do nÃ­vel da respiraÃ§Ã£o celular
escurecimento do fruto, o que representa a perda de
Ã‰ possÃ­vel prolongar a vida de um fruto climatÃ©rico
utiliza-se o permanganato de potÃ¡ssio (KMnO;,)
sendo o processo representado de forma simplificada
O processo de amadurecimento comeÃ§a quando a
mg de CH, por kg de ar.
As massas molares dos elementos H, C, O, K e Mn
gimol, 39 g/mol e 55 g/mol.
A fim de diminuir essas perdas, sem desperdÃ­cio de
Ã© mais prÃ³xima de:
A) 0,7 mg.
B) 1,0 mg.
Cc) 3,8 mg.
D) 5,6mg.
E) 8,5 mg.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'medium','published',232),
('ENEM-2016.3-Q233',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2016.3 â€” QuÃ­mica â€” QuestÃ£o 233

A busca por substÃ¢ncias capazes de minimizar a aÃ§Ã£o
Brasil levou Ã  sÃ­ntese e ao emprego de um feromÃ´nio
Uma indÃºstria agroquÃ­mica necessita sintetizar um
substituto deverÃ¡ preservar as seguintes propriedades
cadeia normal e a isomeria geomÃ©trica original.
A fÃ³rmula estrutural do substituto adequado ao
A) NANA ARA 7
Ie cocoo,
B)
O) DAFNAFNADNAZN 000
D) MAFRA 7
ANA FENAEFESNA ARA
E)
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'medium','published',233),
('ENEM-2016.3-Q234',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'SoluÃ§Ãµes e concentraÃ§Ã£o','multiple_choice','ENEM 2016.3 â€” QuÃ­mica â€” QuestÃ£o 234

Na preparaÃ§Ã£o da massa do pÃ£o, presente na
mesa do cafÃ© da maioria dos brasileiros, utiliza-
se o fungo Saccharomyces cerevisiae vivo, con-
tido no fermento. Sua finalidade Ã© fazer com que
a massa cresÃ§a por meio da produÃ§Ã£o de gÃ¡s
carbÃ´nico.
Esse processo quÃ­mico de liberaÃ§Ã£o de gÃ¡s Ã©
causado d pela la:
A) glicogÃªnese lÃ¡tica.
B) fermentaÃ§Ã£o alcoÃ³lica.
C) produÃ§Ã£o de Ã¡cido lÃ¡tico.
D) produÃ§Ã£o de lactobacilos.
E) formaÃ§Ã£o do Ã¡cido pirÃºvico.
QuestÃ£o 235 (20163) (20163) | AAA
As Ã¡guas dos oceanos apresentam uma alta
concentraÃ§Ã£o de Ã­ons e pH entre 8,0 e 8,3. Den-
tre esses Ã­ons estÃ£o em equilÃ­brio as espÃ©cies
carbonato (COzâ€) e bicarbonato (HCO;z)), repre-
sentado pela equaÃ§Ã£o quÃ­mica:
HCO. (aq) (a = CO*(a Ear H'' (aq) (a
3 3
As Ã¡guas dos rios, . ao contrÃ¡rio, . apresentam
concentraÃ§Ãµes muito baixas de Ã­ons e substÃ¢n-
cias bÃ¡sicas, com um pH em torno de 6. A alte-
raÃ§Ã£o significativa do pH das Ã¡guas dos rios e
oceanos pode mudar suas composiÃ§Ãµes quÃ­mi-
cas, por precipitaÃ§Ã£o de espÃ©cies dissolvidas ou
redissoluÃ§Ã£o de espÃ©cie presente nos sÃ³lidos
suspensos ou nos sedimentos.
A composiÃ§Ã£o dos oceanos Ã© menos afetada
pelo lanÃ§amento de efluentes Ã¡cidos, pois os
ema leria
A) contÃªm . grande quantidade . de cloreto de
sÃ³dio.
B) contÃªm um volume de Ã¡gua pura menor que
o dos rios.
C) possuem pH Ã¡cido, nÃ£o sendo afetados pela
adiÃ§Ã£o de outros Ã¡cidos.
D) tÃªm a formaÃ§Ã£o dos Ã­ons carbonato favoreci-
da pela adiÃ§Ã£o de Ã¡cido.
E) apresentam um equilÃ­brio entre os Ã­ons car-
bonato e bicarbonato, que atuam como sistema-
tampÃ£o.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'hard','published',234),
('ENEM-2016.3-Q235',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'QuÃ­mica geral','multiple_choice','ENEM 2016.3 â€” QuÃ­mica â€” QuestÃ£o 235. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,4,null,'medium','published',235),
('ENEM-2016.3-Q236',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'QuÃ­mica geral','multiple_choice','ENEM 2016.3 â€” QuÃ­mica â€” QuestÃ£o 236

A Ã¡gua consumida na maioria das cidades bra-
sileiras ES obtida pelo tratamento da Ã¡gua de
mananciais. parte inicial do tratamento consis-
A
te no peneiramento e sedimentaÃ§Ã£o de partÃ­cu-
las maiores. Na etapa seguinte, dissolvem-se na
Ã¡gua carbonato de sÃ³dio e, em seguida, sulfato
de alumÃ­nio.
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'medium','published',236),
('ENEM-2016.3-Q237',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'QuÃ­mica geral','multiple_choice','ENEM 2016.3 â€” QuÃ­mica â€” QuestÃ£o 237. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,0,null,'medium','published',237),
('ENEM-2016.3-Q238',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'QuÃ­mica geral','multiple_choice','ENEM 2016.3 â€” QuÃ­mica â€” QuestÃ£o 238. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,0,null,'medium','published',238),
('ENEM-2016.3-Q239',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'EletroquÃ­mica','multiple_choice','ENEM 2016.3 â€” QuÃ­mica â€” QuestÃ£o 239

Atualmente, soldados em campo, seja em treinamento
prontas e embaladas em bolsas plÃ¡sticas, utilizando
Dentro dessas bolsas existe magnÃ©sio metÃ¡lico em
coloca Ã¡gua dentro da bolsa promovendo a reaÃ§Ã£o
Mg (s) + 2 H,O (1) â€”
O aquecimento dentro da bolsa ocorre por causa da:
A) reduÃ§Ã£o sofrida pelo oxigÃªnio, que Ã© uma reaÃ§Ã£o
B) oxidaÃ§Ã£o sofrida pelo magnÃ©sio, que Ã© uma reaÃ§Ã£o
C) reduÃ§Ã£o sofrida pelo magnÃ©sio, que Ã© uma reaÃ§Ã£o
D) oxidaÃ§Ã£o sofrida pelo hidrogÃªnio, que Ã© uma reaÃ§Ã£o
E) reduÃ§Ã£o sofrida pelo hidrogÃªnio, que Ã© uma reaÃ§Ã£o','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'medium','published',239),
('ENEM-2016.3-Q240',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'QuÃ­mica ambiental','multiple_choice','ENEM 2016.3 â€” QuÃ­mica â€” QuestÃ£o 240

O processo de dessulfurizaÃ§Ã£o Ã© uma das etapas
siste na oxidaÃ§Ã£o do enxofre presente na forma de
do) que Ã© posteriormente removido. Um mÃ©todo para
entÃ£o, esse gÃ¡s Ã© usado para oxidar o restante do
demais molÃ©culas presentes no diesel sofrerÃ£o
(MARQUES
utilizando
O benefÃ­cio do processo Claus Ã© que, na combustÃ£o
A) formadores de hidrocarbonetos.
B) produtores de Ã³xidos de nitrogÃªnio.
C) emissores de monÃ³xido de carbono.
D) promotores de acidificaÃ§Ã£o da chuva.
E) determinantes para o aumento do efeito estufa.
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'medium','published',240),
('ENEM-2016.3-Q241',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'TermoquÃ­mica','multiple_choice','ENEM 2016.3 â€” QuÃ­mica â€” QuestÃ£o 241

As emissÃµes de diÃ³xido de carbono (CO>) por veÃ­culos
combustÃ­vel.
Sabe-se que Ã© possÃ­vel determinar a quantidade
no e do oxigÃªnio, iguais a 12 g/mol e 16 g/mol,
percorreu 600km em um veÃ­culo que consome um
Considerando que o conteÃºdo de carbono em um
emitida pelo veÃ­culo no ambiente, durante a viagem
A) 24kg
B) 33kg
C) 40kg
D) 88kg
E) 147Kkg','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'medium','published',241),
('ENEM-2016.3-Q242',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'Radioatividade','multiple_choice','ENEM 2016.3 â€” QuÃ­mica â€” QuestÃ£o 242

A obtenÃ§Ã£o de energia por meio da fissÃ£o nuclear
bustÃ£o da gasolina.
O calor liberado na fissÃ£o do *U Ã© 8 x 10Âº J/g e na
A massa de gasolina necessÃ¡ria para obter a mesma
A) IC g.
B) 10Âº g.
Cc) 10Âº g.
D) 10Âº g.
E) 10Âº g.
QuestÃ£o 243 (20171)
A ozonÃ³lise, reaÃ§Ã£o utilizada na indÃºstria madeireira
escala de laboratÃ³rio na sÃ­ntese de aldeÃ­dos e cetonas.
oxidaÃ§Ã£o com o OzÃ´nio (O;), em presenÃ§a de Ã¡gua
cetonas, dependendo do grau de substituiÃ§Ã£o da
cetonas, enquanto as ligaÃ§Ãµes duplas terminais ou
mostra o esquema.
O, , H,O
OZ ZOO
Zn
But-1-eno
Considere a ozonÃ³lise do composto 1-fenil-2-metilprop-1-eno:
(MARTINO, A, QuÃ­mica,
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'medium','published',242),
('ENEM-2016.3-Q243',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2016,'QuÃ­mica geral','multiple_choice','ENEM 2016.3 â€” QuÃ­mica â€” QuestÃ£o 243. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,0,null,'medium','published',243),
('ENEM-2017.1-Q244',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2017,'QuÃ­mica geral','multiple_choice','ENEM 2017.1 â€” QuÃ­mica â€” QuestÃ£o 244. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,0,null,'medium','published',244),
('ENEM-2017.1-Q245',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2017,'SoluÃ§Ãµes e concentraÃ§Ã£o','multiple_choice','ENEM 2017.1 â€” QuÃ­mica â€” QuestÃ£o 245

Uma das estratÃ©gias para conservaÃ§Ã£o de ali-
mentos Ã© o salgamento, adiÃ§Ã£o de cloreto de
sÃ³dio (NaCl), historicamente utilizado por tropei-
ros, vaqueiros e sertanejos para conservar car-
nes de boi, porco e peixe.
O que ocorre com as cÃ©lulas presentes nos
alimentos preservados com essa tÃ©cnica?
A) O sal adicionado diminui a concentraÃ§Ã£o de
solutos em Seu interior.
B) O sal adicionado desorganiza e destrÃ³i suas
membranas plasmÃ¡ticas.
C) A adiÃ§Ã£o de sal altera as propriedades de
suas membranas plasmÃ¡ticas.
D) Os Ã­ons Naâ€ e Cl provenientes da dissocia-
Ã§Ã£o do sal entram livremente nelas.
E) A grande concentraÃ§Ã£o de sal no meio extra-
celular provoca a saÃ­da de Ã¡gua de dentro de-
las.
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'medium','published',245),
('ENEM-2017.1-Q246',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2017,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2017.1 â€” QuÃ­mica â€” QuestÃ£o 246

Diversos produtos naturais podem ser obtidos
de plantas por processo de extraÃ§Ã£o. O lapachol
Ã© da classe das naftoquinonas. Sua estrutura
apresenta uma hidroxila enÃ³lica (pK, = 6,0) que
permite que este composto seja isolado da ser-
ragem dos ipÃªs por extraÃ§Ã£o com soluÃ§Ã£o ade-
quada, seguida de filtraÃ§Ã£o simples. Considere
que pK,., = -log Ka, em que K, Ã© a constante
Ã¡cida da reaÃ§Ã£o do lapachol.
delonizaÃ§Ã£o
OH
AD
o
Lapachol
(COSTA, P. R. R. et al. Ãcidos e bases em quÃ­mica
orgÃ¢nica Porto Alegre: Bookman, 2005 - adaptado)
Qual soluÃ§Ã£o deve ser usada para extraÃ§Ã£o do
lapacho da serragem do ipÃª com maior eficiÃªn-
cia?
A) SoluÃ§Ã£o de NasCO;, para formar um sal de
lapachol.
B) SoluÃ§Ã£o-tampÃ£o Ã¡cido acÃ©tico/acetato de
sÃ³dio (pH = 4,5).
C) SoluÃ§Ã£o de NaCl a fim de aumentar a forÃ§a
iÃ´nica do meio.
D) SoluÃ§Ã£o de Na-SO, para formar um par iÃ´ni-
co com lapachol.
E) SoluÃ§Ã£o de HCl a fim de extraÃ­-lo por meio de
reaÃ§Ã£o Ã¡cido-base.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'hard','published',246),
('ENEM-2017.1-Q247',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2017,'Radioatividade','multiple_choice','ENEM 2017.1 â€” QuÃ­mica â€” QuestÃ£o 247

A tÃ©cnica do carbono-14 permite a dataÃ§Ã£o de
fÃ³sseis pela mediÃ§Ã£o dos valores de emissÃ£o
beta desse isÃ³topo presente no fÃ³ssil. Para um
ser em vida, o mÃ¡ximo sÃ£o 15 emissÃµes be-
ta/(min g). ApÃ³s a morte, a quantidade de "Cc se
reduz a metade a cada 5730 anos.
Considere que um fragmento fÃ³ssil de massa
igual a 30 g foi encontrado em um sÃ­tio arqueo-
lÃ³gico, e a mediÃ§Ã£o de radiaÃ§Ã£o apresentou
6750 emissÃµes beta por hora. A idade desse
fÃ³ssil, em anos, Ã©:
A) 450
B) 1433
C) 11460
D) 17190
E) 27000
79','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'medium','published',247),
('ENEM-2017.1-Q248',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2017,'Estequiometria','multiple_choice','ENEM 2017.1 â€” QuÃ­mica â€” QuestÃ£o 248

A cromatografia em papel Ã© um mÃ©todo de separaÃ§Ã£o
nentes de uma mistura entre duas fases imiscÃ­veis.
fase estacionÃ¡ria e a fase mÃ³vel em movimento no
camente pura, que pode absorver atÃ© 22% de Ã¡gua.
onÃ¡ria lÃ­quida e que interage com a fase mÃ³vel,
tes capazes de formar interaÃ§Ãµes intermoleculares
lentamente.
Uma mistura de hexano com 5% (v/v) de acetona foi
ponentes de um extrato vegetal obtido a partir de
substÃ¢ncias representadas.
AAA IA
Licopeno
* * * AROS
a-caroteno
CORRA RASA DAS
WWF
7y-caroteno
(RIBEIRO, N.M.; NUNES, C. R. AnÃ¡lise
A substÃ¢ncia presente na mistura que migra mais
A) licopeno.
B) a-caroteno.
C) y-caroteno.
D) Capsorubina.
E) a-Criptoxantina.
QuestÃ£o 249 (20171)
O Ã¡cido acetilsalicÃ­lico, AAS (massa molar igual a
salicÃ­lico (massa molar igual a 138 g/mol) com anidrido
dor, conforme a equaÃ§Ã£o quÃ­mica:
(o) oH
o o
OH PN PN
+ HC Do â€œeg,
Ãcido salicÃ­lico Anidrido acÃ©tico
ApÃ³s a sÃ­ntese, o AAS Ã© purificado e o rendimento
dades farmacolÃ³gicas (antitÃ©rmico, analgÃ©sico e
como medicamento nas formas de comprimidos,
500mg dessa substÃ¢ncia.
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'hard','published',248),
('ENEM-2017.1-Q249',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2017,'QuÃ­mica geral','multiple_choice','ENEM 2017.1 â€” QuÃ­mica â€” QuestÃ£o 249. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,3,null,'medium','published',249),
('ENEM-2017.1-Q250',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2017,'TermoquÃ­mica','multiple_choice','ENEM 2017.1 â€” QuÃ­mica â€” QuestÃ£o 250

O ferro Ã© encontrado na natureza na forma de seus
ta (Fe;O,) e a wustita (FeO). Na siderurgia, o
altos fornos em condiÃ§Ãµes adequadas. Uma das
carbono. O CO (gasoso) Ã© utilizado para reduzir o
FeO (s) + CO (g)
Considere as seguintes equaÃ§Ãµes termoquÃ­micas:
Fe,O, (s) + 3 CO (g) â€” 2 Fe (s) + 3 CO,
3 FeO (s) + CO, (g) â€” Fe,O, (s) + CO (g)
2 Fe,O, (s) + CO, (g) â€” 3 Fe,O, (s) + CO
O valor mais prÃ³ximo de AH, em kJ/mol de FeO,
(gasoso) Ã©:
A)-14.
B)- 17
C) -50
D) -64.
E) -100
QuestÃ£o 251 (20171)
O biodiesel Ã© um biocombustÃ­vel obtido a partir de
do diesel de petrÃ³leo para motores de combustÃ£o
rÃ­deos, presentes em Ã³leos vegetais e gorduras
como o metanol ou etanol, na presenÃ§a de um
"
CH, O-C-R,
| o
1 j:
CH -O-C-R, + SANA,
3CH,OH
| -
1
CH,-O-C-R,
A funÃ§Ã£o quÃ­mica presente no produto que representa
A) Ã©ter.
B) Ã©ster.
C) Ã¡lcool.
D) cetona.
E) Ã¡cido carboxÃ­lico.
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'hard','published',250),
('ENEM-2017.1-Q251',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2017,'QuÃ­mica geral','multiple_choice','ENEM 2017.1 â€” QuÃ­mica â€” QuestÃ£o 251. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,1,null,'medium','published',251),
('ENEM-2017.1-Q252',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2017,'EletroquÃ­mica','multiple_choice','ENEM 2017.1 â€” QuÃ­mica â€” QuestÃ£o 252

A eletrÃ³lise Ã© um processo nÃ£o espontÃ¢neo de
suas aplicaÃ§Ãµes Ã© a obtenÃ§Ã£o do gÃ¡s cloro e do
cloreto de sÃ³dio. Nesse procedimento, utiliza-se uma
=
e
COOCOdOÃ‡a. Dx
Ex)
Ã€
Bateria
Cl, (g)
SoluÃ§Ã£o aquosa [6]
de NaCl u
| =
Ãnodo de carbono 3
|
=
Diafragma de amianto =
mm
CÃ©lula
(IlustraÃ§Ã£o de SHREVE,
No processo eletrolÃ­tico Ilustrado anteriormente, o
A) vapor de Ã¡gua.
B) oxigÃªnio molecular.
C) hipoclorito de sÃ³dio.
D) hidrogÃªnio molecular.
E) cloreto de hidrogÃªnio.
QuestÃ£o 253 (20171)
A invenÃ§Ã£o do LED azul, que permite a geraÃ§Ã£o de
construÃ§Ã£o de lÃ¢npadas energeticamente mais
fluorescentes. Em um experimento de laboratÃ³rio,
der um LED azul que requer 3,6 volts para o seu
e seus respectivos potenciais mostrados no quadro.
SemirreaÃ§Ã£o de
Ce (ag) + o â€” Ce (eq)
Cr,O0, (aq) + 14 H'' (aq) +6 eÂº â€” 2
NÂº (aq) +20 O Ni(s)
Z6Âº (aq +20 Zn)
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'hard','published',252),
('ENEM-2017.1-Q253',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2017,'QuÃ­mica geral','multiple_choice','ENEM 2017.1 â€” QuÃ­mica â€” QuestÃ£o 253. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,2,null,'medium','published',253),
('ENEM-2017.1-Q254',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2017,'QuÃ­mica geral','multiple_choice','ENEM 2017.1 â€” QuÃ­mica â€” QuestÃ£o 254. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,3,null,'medium','published',254),
('ENEM-2017.1-Q255',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2017,'QuÃ­mica geral','multiple_choice','ENEM 2017.1 â€” QuÃ­mica â€” QuestÃ£o 255. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,4,null,'medium','published',255),
('ENEM-2017.1-Q256',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2017,'Propriedades da matÃ©ria','multiple_choice','ENEM 2017.1 â€” QuÃ­mica â€” QuestÃ£o 256

No ar que respiramos existem os chamados gases
cam â€œO Novoâ€, â€œo Ocultoâ€, â€œo Inativoâ€. E de fato sÃ£o
que nÃ£o interferem em nenhuma reaÃ§Ã£o quÃ­mica,
tamente por esse motivo ficaram sem ser observados
de longos e engenhosos esforÃ§os, conseguiu forÃ§ar
mente com o flÃºor Ã¡vido e vivaz, e a faÃ§anha pareceu
Nobel.
(LEVI, P. A tabela
Qual propriedade do flÃºor justifica sua escolha como
A) Densidade.
B) CondutÃ¢ncia.
C) Eletronegatividade
D) Estabilidade nuclear
E) Temperatura de ebuliÃ§Ã£o.
novocadernoenem(DQgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'medium','published',256),
('ENEM-2017.1-Q257',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2017,'QuÃ­mica ambiental','multiple_choice','ENEM 2017.1 â€” QuÃ­mica â€” QuestÃ£o 257

A toxicidade de algumas substÃ¢ncias Ã© normalmente
letal mediana). Ele representa a dosagem aplicada
ses indivÃ­duos e Ã© normalmente medido utilizando
para os seres humanos, pois, ao se extrapolar os
nar o nÃ­vel tolerÃ¡vel de contaminaÃ§Ã£o de alimentos,
pelas pessoas. O quadro apresenta trÃªs pesticidas
da substÃ¢ncia ingerida pela cobaia.
Pesticidas
Malation
Atrazina
Sessenta ratos. Com massa de 200 g cada, foram
raÃ§Ã£o, contaminadas, cada uma delas com um dos
3 mg por grama de raÃ§Ã£o, foram administradas para
de raÃ§Ã£o.
Qual(ais) grupo(s) terÃ¡(Ã£o) uma mortalidade mÃ­nima
A) O grupo que se contaminou somente com atrazina.
B) O grupo que se contaminou somente com diazinon.
C) Os grupos que se contaminaram com atrazina e
D) Os grupos que se contaminaram com diazinon e
E) Nenhum dos grupos contaminados com atrazina,','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'hard','published',257),
('ENEM-2017.1-Q258',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2017,'QuÃ­mica inorgÃ¢nica','multiple_choice','ENEM 2017.1 â€” QuÃ­mica â€” QuestÃ£o 258

Um fato corriqueiro ao se cozinhar arroz Ã© o
ma azul do fogo, mudando-a para uma chama
Ã§Ãµes diversas, relacionadas Ã s substÃ¢ncias presentes
(NaCl), nela se encontram carboidratos, proteÃ­nas e
Cientificamente, sabe-se que essa mudanÃ§a de cor
A) reaÃ§Ã£o do gÃ¡s de cozinha com o sal, volatilizando
B) emissÃ£o de fÃ³tons pelo sÃ³dio, excitado por causa
C) produÃ§Ã£o de derivado amarelo, pela reaÃ§Ã£o com
D) reaÃ§Ã£o do gÃ¡s de cozinha com a Ã¡gua, formando
E) excitaÃ§Ã£o das molÃ©culas de proteÃ­nas, com formaÃ§Ã£o','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'medium','published',258),
('ENEM-2017.2-Q259',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2017,'Radioatividade','multiple_choice','ENEM 2017.2 â€” QuÃ­mica â€” QuestÃ£o 259

O avanÃ§o cientÃ­fico e tecnolÃ³gico da fÃ­sica nuclear
mento radioativo dos nÃºcleos atÃ´micos instÃ¡veis,
de grande penetraÃ§Ã£o no corpo humano, utilizada,
A aplicaÃ§Ã£o citada no texto se refere a qual tipo de
A) Beta.
B) Alfa.
C) Gama.
D) Raios X.
E) Ultravioleta.
novocadernoenem(DQgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'easy','published',259),
('ENEM-2017.2-Q260',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2017,'QuÃ­mica ambiental','multiple_choice','ENEM 2017.2 â€” QuÃ­mica â€” QuestÃ£o 260

Muitas indÃºstrias e fÃ¡bricas lanÃ§am para o ar,
atravÃ©s de suas chaminÃ©s, poluentes prejudici-
ais Ã s plantas e aos animais. Um desses polu-
entes reage quando em contato com o gÃ¡s oxi-
gÃªnio no e a Ã¡gua x da atmosfera, confome as
equaÃ§Ãµes quÃ­micas:
EquaÃ§Ã£o 1: 2 SO; + O, â€” 2SO;
" 2: SO; + HO â€” H/SO,
EquaÃ§Ã£o
De acordo com as equaÃ§Ãµes, a alteraÃ§Ã£o ambi-
ental decorrente da presenÃ§a desse poluente
intensifica o(a):
A) formaÃ§Ã£o de chuva Ã¡cida.
B surgimento de ilha de calor.
o) reduÃ§Ã£o da camada de ozÃ´nio.
D) ocorrÃªncia de inversÃ£o tÃ©rmica.
E) emissÃ£o de gases de efeito estufa.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'medium','published',260),
('ENEM-2017.2-Q261',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2017,'QuÃ­mica ambiental','multiple_choice','ENEM 2017.2 â€” QuÃ­mica â€” QuestÃ£o 261

O Conselho Nacional do Meio Ambiente (Co-
nama) estabelece os limites mÃ¡ximos de chum-
bo, cÃ¡dmio e mercÃºrio para as familiares pilhas
e baterias portÃ¡teis comercializadas no territÃ³rio
nacional e os critÃ©rios e padrÃµes para o seu
gerenciamento ambientalmente adequado. Os
estabelecimentos que comercializam esses
produtos, bem como a rede de assistÃªncia tÃ©c-
nica autorizada, devem receber dos usuÃ¡rios as
pilhas e baterias usadas para repasse aos res-
pectivos fabricantes ou importadores.
(ResoluÃ§Ã£o Conama n. 401, de 4 de novembro de
2008. DisponÃ­vel em: www.mma.gov.br.
Acesso em: 14 maio 2013 - adaptado)
Do ponto de vista ambiental, a destinaÃ§Ã£o final
apropriada para esses produtos Ã©:
A) direcionar as pilhas e baterias para compos-
tagem.
B) colocar as pilhas e baterias em um coletor de
lixo seletivo.
C) enviar as pilhas e baterias usadas para fir-
mas de recarga.
D) acumular as pilhas e baterias em amazÃ©ns
de estocagem.
E) destinar as pilhas e baterias Ã  reutilizaÃ§Ã£o de
seus componentes.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'hard','published',261),
('ENEM-2017.2-Q262',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2017,'QuÃ­mica geral','multiple_choice','ENEM 2017.2 â€” QuÃ­mica â€” QuestÃ£o 262

A bauxita, composta por cerca de 50% de AlzO;,
Ã© o mais importante minÃ©rio de alumÃ­nio. As
seguintes etapas sÃ£o necessÃ¡rias para a obten-
Ã§Ã£o de alumÃ­nio metÃ¡lico:
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'easy','published',262),
('ENEM-2017.2-Q263',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2017,'EletroquÃ­mica','multiple_choice','ENEM 2017.2 â€” QuÃ­mica â€” QuestÃ£o 263

O ferro metÃ¡lico Ã© obtido em altos-fornos pela
mistura do minÃ©rio hematita (a-Fe,O;3) contendo
impurezas, coque (C) e calcÃ¡rio (CaCO;z), sendo
estes mantidos sob um fluxo de ar quente que
leva Ã  queima do coque, com a temperatura no
alto-forno chegando prÃ³ximo a 2000ÂºC. As eta-
pas caracterizam o processo em funÃ§Ã£o da
temperatura.
Entre 200ÂºC e 700ÂºC:
3 FezO; + CO â€” 2 Fe3O, + CO,
CaCO; â€” CaO + CO,
FezO, + CO â€” 3 FeO + CO,
Entre 700ÂºC e 1200ÂºC:
C + CO, â€”2CO0
FeO + CO â€” Fe + CO,
Entre 1200ÂºC e 2000ÂºC:
Ferro impuro se funde
FormaÃ§Ã£o de escÃ³ria fundida (CaSiO;)
2C+0,> CO
(BROWN, T. L.; LEMAY, H. E.; BURSTEN, B. E.
QuÃ­mica: a ciÃªncia central. SÃ£o Paulo:
Pearson Education, 2005 - adaptado)
No processo de reduÃ§Ã£o desse metal, o agente
redutor Ã© o:
AJC.
B) CO.
C) CO;
D) CaO.
E) CaCO;.
86','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'hard','published',263),
('ENEM-2017.2-Q264',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2017,'QuÃ­mica ambiental','multiple_choice','ENEM 2017.2 â€” QuÃ­mica â€” QuestÃ£o 264

As lÃ¢mpadas fluorescentes apresentam vanta-
gens como maior eficiÃªncia luminosa, vida Ãºtil
mais longa e reduÃ§Ã£o do consumo de energia.
Contudo, um dos constituintes dessas lÃ¢mpadas
Ã© o mercÃºrio, que apresenta sÃ©rias restriÃ§Ãµes
ambientais em funÃ§Ã£o de sua toxicidade.
Dessa forma, as lÃ¢mpadas fluorescentes devem
passar por um processo prÃ©vio de descontami-
naÃ§Ã£o antes do descarte ou reciclagem do ma-
terial.
O ideal Ã© que nesse processo se tenha o menor
impacto ambiental e, se possÃ­vel, o mercÃºrio
recuperado e empregado em novos produ:
seja
(DURÃƒO JR., W.A.; WINDMOLLER, C. C. A questÃ£o
do mercÃºrio em lÃ¢mpadas fluorescentes. QuÃ­mica
Nova na Escola, n. 28, 2008 - adaptado)
Considerando os impactos ambientais negati-
vos, o processo menos indicado de desconta-
minaÃ§Ã£o desse metal presente nas lÃ¢mpadas
seria o(a):
A) encapsulamento, no qual as lÃ¢mpadas sÃ£o
trituradas por via seca ou Ãºmida, o material re-
sultante Ã© encapsulado em concreto e a dispo-
siÃ§Ã£o final do resÃ­duo Ã© armazenada em aterros.
B) lixiviaÃ§Ã£o Ã¡cida, com a dissoluÃ§Ã£o dos resÃ­-
duos sÃ³lidos das lÃ¢npadas em Ã¡cido (HNO;),
seguida de filtraÃ§Ã£o e neutralizaÃ§Ã£o da soluÃ§Ã£o
para recuperar os compostos de mercÃºrio.
C) incineraÃ§Ã£o, com a oxidaÃ§Ã£o das lÃ¢mpadas
junto com o lixo urbano em altas temperaturas,
com reduÃ§Ã£o do material sÃ³lido e lanÃ§amento
dos gases e vapores para a atmosfera.
D) processo tÃ©rmico, no qual o resÃ­duo Ã© aque-
cido em sistema fechado para vaporizar o mer-
cÃºrio e em seguida ocorre o resfriamento para
condensar o vapor e obter o mercÃºrio elemen-
tar.
E) separaÃ§Ã£o por via quÃ­mica, na qual as lÃ¢m-
padas sÃ£o trituradas em sistema fechado, em
seguida aditivos quÃ­micos sÃ£o adicionados para
precipitaÃ§Ã£o e separaÃ§Ã£o do mÃ©rcurio.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'hard','published',264),
('ENEM-2017.2-Q265',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2017,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2017.2 â€” QuÃ­mica â€” QuestÃ£o 265

Em algumas regiÃµes brasileiras, Ã© comum se
encontrar um animal com odor caracterÃ­stico, o
zorrilho. Esse odor serve para a proteÃ§Ã£o desse
animal, afastando seus predadores.
Um dos feromÃ´nios responsÃ¡veis por esse odor
Ã© uma substÃ¢ncia que apresenta isomeria trans
e um grupo tiol ligado Ã  sua cadeia.
A estrutura desse feromÃ´nio, que ajuda na pro-
teÃ§Ã£o do zorrilho, Ã©:
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'medium','published',265),
('ENEM-2017.2-Q266',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2017,'QuÃ­mica ambiental','multiple_choice','ENEM 2017.2 â€” QuÃ­mica â€” QuestÃ£o 266

No Brasil, os postos de combustÃ­veis comercia-
lizavram uma gasolina com cerca de 22% de
Ã¡lcool anidro.
Na queima de 1 litro desse combustÃ­vel sÃ£o
liberados cerca de 2 kg de CO, na atmosfera. o
plantio de Ã¡rvores pode atenuar os efeitos des-
sa emissÃ£o de CO,.
A quantidade de carbono fixada por uma Ã¡rvore
corresponde a aproximadamente 50% de sua
biomassa seca, e para cada 12 g de carbono
fixados, 44 g de CO, sÃ£o retirados da atmosfera.
No Brasil, o plantio de eucalipto (Eucalyptus
grandis) Ã© bem difundido, sendo que apÃ³s 11
anos essa Ã¡rvore pode ter a massa de 106 kg,
dos quais 29 kg sÃ£o Ã¡gua.
Uma Ãºnica Ã¡rvore de Eucalyptus grandis, com
as caracterÃ­sticas descritas, Ã© capaz de fixar a
quantidade de CO, liberada na queima de um
volume dessa gasolina mais prÃ³ximo de:
A) 19L.
B) 39 L.
C)7IL
D) 97 L.
E) 141 L.
87','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'hard','published',266),
('ENEM-2017.2-Q267',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2017,'SoluÃ§Ãµes e concentraÃ§Ã£o','multiple_choice','ENEM 2017.2 â€” QuÃ­mica â€” QuestÃ£o 267

A horticultura tem sido recomendada para a agricultura
escassez de processos compatÃ­veis para conservar
taÃ§Ã£o osmÃ³tica, tem se mostrado uma alternativa
boas condiÃ§Ãµes de armazenamento e qualidade
(GOMES, A. T.; CEREDA, M. P.; VILPOUX, O. DesidrataÃ§Ã£o
volvimento da agricultura familiar. Revista Brasileira de
Esse processo para conservar os alimentos remove
A) aumento do ponto de ebuliÃ§Ã£o do solvente.
B) passagem do soluto atravÃ©s de uma membrana
C) utilizaÃ§Ã£o de solutos volÃ¡teis, que facilitam a
D) aumento da volatilidade do solvente pela adiÃ§Ã£o
E) pressÃ£o gerada pela diferenÃ§a de concentraÃ§Ã£o','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'medium','published',267),
('ENEM-2017.2-Q268',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2017,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2017.2 â€” QuÃ­mica â€” QuestÃ£o 268

A absorÃ§Ã£o e o transporte de substÃ¢ncias tÃ³xicas
estas se difundem atravÃ©s das membranas das cÃ©lulas.
testes laboratoriais empregam o octan-1-0l como
ser testada Ã© adicionada a uma mistura bifÃ¡sica do
dido o coeficiente de partiÃ§Ã£o octan-1-ol:Ã¡gua (K.a):
Ko oa = =
Em que Co: Ã‰ a concentraÃ§Ã£o da substÃ¢ncia na fase
na fase aquosa. Foram avaliados cinco poluentes de
fluorobutano e metanol.
O poluente que apresentou K,.. tendendo a zero Ã© o:
A) Ã©ter dietÃ­lico.
B) fluorobutano.
C) benzeno.
D) metanol.
E) butano.
QuestÃ£o 269 (20172)
Os polÃ­meros sÃ£o materiais amplamente utilizados
embalagens e filmes plÃ¡sticos, por exemplo. Na
nÃ´meros usados na produÃ§Ã£o de polÃ­meros de adiÃ§Ã£o
HC =
o ns
HC Cc!
H,N
Acrilamida Cloreto de vinila Estireno
(cloropropeno)
Dentre os homopolÃ­meros formados a partir dos
em Ã¡gua Ã©:
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'hard','published',268),
('ENEM-2017.2-Q269',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2017,'QuÃ­mica geral','multiple_choice','ENEM 2017.2 â€” QuÃ­mica â€” QuestÃ£o 269. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,3,null,'medium','published',269),
('ENEM-2017.2-Q270',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2017,'Estequiometria','multiple_choice','ENEM 2017.2 â€” QuÃ­mica â€” QuestÃ£o 270

Os combustÃ­veis de origem fÃ³ssil, como o petrÃ³leo
devido Ã  liberaÃ§Ã£o de diÃ³xido de carbono durante
Massas molares e as reaÃ§Ãµes de combustÃ£o nÃ£o
| combustivel | Massa molar (g/mol)
een o
ETNNEBBTTTIEITIA
Considerando a combustÃ£o completa de 58 g de
tÃ¢ncia que emite mais CO, Ã© o:
A) etano.
B) butano.
C) metano.
D) propano.
E) acetileno.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'medium','published',270),
('ENEM-2017.2-Q271',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2017,'QuÃ­mica geral','multiple_choice','ENEM 2017.2 â€” QuÃ­mica â€” QuestÃ£o 271

Pesquisadores avaliaram a qualidade da Ã¡gua potÃ¡vel
substÃ¢ncias encontradas, destacam-se as apresentadas
pode ser verificada por anÃ¡lises quÃ­micas, como uma
de sÃ³dio.
N fe) [9
Mn .â€
N
A
+ AO
Ã€
/ Z
NAO
CafeÃ­na Atrazina
COOL
Benzo[a]pireno
(DisponÃ­vel
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'easy','published',271),
('ENEM-2017.2-Q272',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2017,'EquilÃ­brio quÃ­mico','multiple_choice','ENEM 2017.2 â€” QuÃ­mica â€” QuestÃ£o 272

Sabendo-se que as enzimas podem ter sua atividade
e pH, foi realizado um experimento para testar as
enzima.
Os resultados estÃ£o apresentados no grÃ¡fico.
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
Ã‰
Ãª
10ÂºC, pH<7 20 ÂºC, pH<7 30 ÂºC, pH<7
Em relaÃ§Ã£o ao funcionamento da enzima, os resultados
A) aumento do pH leva a um a atividade maior da
B) temperatura baixa (10 ÂºC) Ã© o principal inibidor da
C) ambiente bÃ¡sico reduz a quantidade de enzima
D) ambiente bÃ¡sico reduz a quantidade de substrato
E) temperatura Ã³tima de funcionamento da enzima Ã©','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'medium','published',272),
('ENEM-2017.2-Q273',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2017,'SoluÃ§Ãµes e concentraÃ§Ã£o','multiple_choice','ENEM 2017.2 â€” QuÃ­mica â€” QuestÃ£o 273

Alguns profissionais burlam a fiscalizaÃ§Ã£o quando
sa de hidrÃ³xido de sÃ³dio a tambores de leite de validade
de Ã¡cido lÃ¡tico, encontra-se na faixa permitida pela
zado. A reaÃ§Ã£o entre o hidrÃ³xido de sÃ³dio e o Ã¡cido
CH;CH(OH)COOH (aq) + NaOH (aq)
A consequÃªncia dessa adulteraÃ§Ã£o Ã© o(a):
A) aumento do pH do leite.
B) diluiÃ§Ã£o significativa do leite.
C) precipitaÃ§Ã£o do lactato de sÃ³dio.
D) diminuiÃ§Ã£o da concentraÃ§Ã£o de sais.
E) aumento da concentraÃ§Ã£o dos Ã­ons H*.
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'medium','published',273),
('ENEM-2017.2-Q274',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2017,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2017.2 â€” QuÃ­mica â€” QuestÃ£o 274

O hidrocarboneto representado pela estrutura quÃ­mica
das flores de determinadas plantas. AlÃ©m disso, sua
perfil de insaturaÃ§Ãµes.
Considerando esse perfil especÃ­fico, quantas ligaÃ§Ãµes
AJ
B) 2
c)4
D)6
E)7','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'easy','published',274),
('ENEM-2018.1-Q275',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2018,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2018.1 â€” QuÃ­mica â€” QuestÃ£o 275

Pesquisas demonstram que nanodisposiÃ­tivos baseados
dos por luz, poderÃ£o ter aplicaÃ§Ãµes em tecnologias
de de componentes mecÃ¢nicos. Exemplo de movimento
pela flexÃ£o de uma lÃ¢mina delgada de silÃ­cio, ligado
porte, em dois comprimentos de onda, conforme
reaÃ§Ãµes reversÃ­veis da cadeia do polÃ­mero, que
+
e 365 nm
o â€”â€”
Ao x
x Y ;
ARE. Ar
Ã­ Fe
e: |
AP ho Ã£
420 nm
>:
(TOMA, H. E. A nanotecnologia das molÃ©culas.
O fenÃ´meno de movimento molecular, promovido pela
A) movimento vibracional dos Ã¡tomos, que leva ao
B) isomerizaÃ§Ã£o das ligaÃ§Ãµes N=N, sendo a forma cis
C) tautomerizaÃ§Ã£o das unidades monomÃ©ricas do
D) ressonÃ¢ncia entre os elÃ©trons tt do grupo azo e os
E) variaÃ§Ã£o conformacional das ligaÃ§Ãµes N=N, que
fÃ­cie.
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'hard','published',275),
('ENEM-2018.1-Q276',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2018,'TermoquÃ­mica','multiple_choice','ENEM 2018.1 â€” QuÃ­mica â€” QuestÃ£o 276

O carro flex Ã© uma realidade no Brasil. Estes
veÃ­culos estÃ£o equipados com motor que tem a
capacidade de funcionar com mais de um tipo
de combustÃ­vel. No entanto, as pessoas que
tÃªm esse tipo de veÃ­culo, na hora do abasteci-
mento, tÃªm sempre a dÃºvida: Ã¡lcool ou gasoli-
na? Para avaliar o consumo desses combustÃ­-
veis, realizou-se um percurso com um veÃ­culo
flex, consumindo 40 litros de gasolina e no per-
curso de volta utilizou-se etanol. Foi considera-
do o mesmo consumo de energia tanto no per-
curso de ida quanto no de volta.
O quadro resume alguns dados aproximados
sobre esses combustÃ­veis.
Densidade Calor de
| Etano | og | 8 |
O volume de etanol combustÃ­vel, em litro, con-
sumido no percurso de volta Ã© mais prÃ³ximo de:
A) 27.
B) 32.
c) 37.
D) 58.
E) 67.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'hard','published',276),
('ENEM-2018.1-Q277',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2018,'QuÃ­mica geral','multiple_choice','ENEM 2018.1 â€” QuÃ­mica â€” QuestÃ£o 277

A identificaÃ§Ã£o de riscos de produtos Perigosos
Ã
para o transporte rodoviÃ¡rio Ã© obrigatÃ³ria e rea-
lizada por meio da sinalizaÃ§Ã£o composta por um
painel de seguranÃ§a, de cor alaranjada, e um
rÃ³tulo de risco. As informaÃ§Ãµes inseridas no
painel de seguranÃ§a e no rÃ³tulo de risco, con-
forme determina a legislaÃ§Ã£o, permitem que se
identifique o produto transportado e os perigos a
ele associados.
A sinalizaÃ§Ã£o mostrada identifica uma substÃ¢n-
cia que estÃ¡ sendo transportada em um cami-
nhÃ£o.
-
268
GÃS
1 005
TÃ“XICO
2
Os trÃªs algarismos da parte superior do painel
indicam o â€œNÃºmero de riscoâ€. O nÃºmero 268
indica tratar-se de um gÃ¡s (2), tÃ³xico (6) e cor-
rosivo (8). Os quatro dÃ­gitos da parte inferior
correspondem ao â€œNÃºmero ONUâ€, que identifica
o produto transportado.
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'hard','published',277),
('ENEM-2018.1-Q278',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2018,'QuÃ­mica geral','multiple_choice','ENEM 2018.1 â€” QuÃ­mica â€” QuestÃ£o 278. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,3,null,'medium','published',278),
('ENEM-2018.1-Q279',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2018,'SoluÃ§Ãµes e concentraÃ§Ã£o','multiple_choice','ENEM 2018.1 â€” QuÃ­mica â€” QuestÃ£o 279

Usando um densÃ­metro cuja menor divisÃ£o da
escala, isto Ã©, a diferenÃ§a entre duas marcaÃ§Ãµes
consecutivas, Ã© de 5,0 x 10? em?, um estudante
realizou um teste de densidade: colocou este
instrumento na Ã¡gua pura e observou que ele
atingiu o repouso na posiÃ§Ã£o mostrada.
Legenda:
DensÃ­metro
Ãgua
Em dois outros recipientes A e B contendo 2
litros de Ã¡gua pura, em cada um, ele adicionou
100g e 200g de NaCl, respectivamente.
Quando o cloreto de sÃ³dio Ã© adicionado Ã  Ã¡gua
pura seia dissociaÃ§Ã£o formando os Ã­ons
NaÃ£''e er. Considere que esses Ã­ons ocupam 05
espaÃ§os intermoleculares na soluÃ§Ã£o.
Nestes recipientes, a posiÃ§Ã£o de equilÃ­brio do
"o 1 ne
densÃ­metro estÃ¡ representada em: D)
A B
Ã€
A B
B)
A B
e
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'hard','published',279),
('ENEM-2018.1-Q280',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2018,'CinÃ©tica quÃ­mica','multiple_choice','ENEM 2018.1 â€” QuÃ­mica â€” QuestÃ£o 280

||| QuestÃ£o 280 (2018.1) (20T8.1)
Mento vermelho para Clntaras de quadros Ã©
murais. Esse pigmento, conhecido como vermi-
lion, escurece com o passar dos anos, fenÃ´me-
no cuja origem Ã© alvo de pesquisas. Aventou-se
a hipÃ³tese de que o vermilion seja decomposto
sob a aÃ§Ã£o da luz, produzindo uma fina camada
de mercÃºrio metÃ¡lico na superfÃ­cie. Essa reaÃ§Ã£o
seria catalisada por Ã­on cloreto presente na
umidade do ar.
(WOGAN, T. Mercury''s Dark Influence on Art.
DisponÃ­vel em: www.chemistryworld.com.
Acesso em: 26 abr. 2018 - adaptado)
Segundo a hipÃ³tese proposta, o Ã­on cloreto atua
na decomposiÃ§Ã£o fotoquÃ­mica do vermilion:
A) reagindo como agente oxidante.
B) deslocando o equilÃ­brio quÃ­mico.
C) diminuindo a energia de ativaÃ§Ã£o.
D) precipitando cloreto de mercÃºrio.
E) absorvendo a energia da luz visÃ­vel.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'hard','published',280),
('ENEM-2018.1-Q281',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2018,'AtomÃ­stica e tabela periÃ³dica','multiple_choice','ENEM 2018.1 â€” QuÃ­mica â€” QuestÃ£o 281

Na mitologia grega, NiÃ³bia era a filha de TÃ¢nta-
lo, dois personagens conhecidos pelo sofrimen-
to. O elemento quÃ­mico de nÃºmero atÃ´mico (Z)
igual a 41 tem propriedades quÃ­micas e fÃ­sicas
tÃ£o parecidas com as do elemento de nÃºmero
atÃ´mico 73 que chegaram a ser confundidos.
Por isso, em homenagem a esses dois perso-
nagens da mitologia grega, foi conferido a esses
elementos os nomes de niÃ³bio (Z = 41) e tÃ¢ntalo
(Z = 73). Esses dois elementos quÃ­micos adqui-
riram grande importÃ¢ncia econÃ´mica na meta-
lurgia, na produÃ§Ã£o de supercondutores e em
outras aplicaÃ§Ãµes na indÃºstria de ponta, exata-
mente pelas propriedades quÃ­micas e fÃ­sicas
comuns aos dois.
93','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'medium','published',281),
('ENEM-2018.1-Q282',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2018,'QuÃ­mica ambiental','multiple_choice','ENEM 2018.1 â€” QuÃ­mica â€” QuestÃ£o 282

Companhias que fabricam jeans usam cloro
para o clareamento, seguido de lavagem. Algu-
mas estÃ£o substituindo o cloro por substÃ¢ncias
ambientalmente mais seguras como perÃ³xidos,
que podem = degradados por enzimas cha-
madas peroxidases. Pensando nisso, pesquisa-
dores inseriram genes codificadores de peroxi-
dases em leveduras cultivadas nas condiÃ§Ãµes
de clareamento e lavagem dos jeans e selecio-
naram as sobreviventes para produÃ§Ã£o dessas
roRTORA
,G.J; G. J.; FUNKE, ,B.R; B. R.; CASE, , C. C. L. L. Mi Micro-
biologia. Rio de Janeiro: Artmed, 2016 - adaptado)
Nesse caso, o uso dessas leveduras modifica-
das objetiva:
A) reduzir a quantidade de resÃ­duos tÃ³xicos nos
efluentes da lavagem.
B) eliminar a necessidade de tratamento da
Ã¡gua consumida.
" elevar a capacidade de clareamento dos
jeans.
D) aumentar a resistÃªncia do jeans a perÃ³xidos.
E) associar aÃ§Ã£o bactericida ao clareamento.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'hard','published',282),
('ENEM-2018.1-Q283',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2018,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2018.1 â€” QuÃ­mica â€” QuestÃ£o 283

A hidroxilamina (NHOH) Ã© extremamente reati-
va em reaÃ§Ãµes de substituiÃ§Ã£o nucleofÃ­lica, justi-
ficando sua utilizaÃ§Ã£o em diversos processos. Ã€
reaÃ§Ã£o de substituiÃ§Ã£o nucleofÃ­lica entre o ani-
drido acÃ©tico e a hidroxilamina estÃ¡ representa-
da.
Ã€ Ã€ NH,
ow * o ?
a Us Produto Ã€
oâ€ epa
Anidrido o o
acÃ©tico A + A DAL
â€
Y
H
Produto B
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'medium','published',283),
('ENEM-2018.1-Q284',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2018,'QuÃ­mica geral','multiple_choice','ENEM 2018.1 â€” QuÃ­mica â€” QuestÃ£o 284. O enunciado e as alternativas estÃ£o na pÃ¡gina original abaixo.','[]'::jsonb,'[]'::jsonb,null,'["A","B","C","D","E"]'::jsonb,0,null,'medium','published',284),
('ENEM-2018.1-Q285',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2018,'EquilÃ­brio quÃ­mico','multiple_choice','ENEM 2018.1 â€” QuÃ­mica â€” QuestÃ£o 285

CÃ©lulas solares Ã  base de TiO, sensibilizadas
por corantes (S) sÃ£o promissoras e poderÃ£o vir
a substituir as cÃ©lulas de silÃ­cio. Nessas cÃ©lulas,
o corante adsorvido sobre o TiO, Ã© responsÃ¡vel
por absorver a energia luminosa (hv), e o coran-
te excitado (S*) Ã© capaz de transferir elÃ©trons
para o TiO,. Um esquema dessa cÃ©lula e os
processos envolvidos estÃ£o ilustrados na figura.
A conversÃ£o de energia solar em elÃ©trica ocorre
por meio da sequÃªncia de reaÃ§Ãµes apresenta-
das na sequÃªncia.
94','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'medium','published',285),
('ENEM-2018.1-Q286',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2018,'CinÃ©tica quÃ­mica','multiple_choice','ENEM 2018.1 â€” QuÃ­mica â€” QuestÃ£o 286

Alguns materiais sÃ³lidos sÃ£o compostos por Ã¡tomos
dem ser covalentes, iÃ´nicas ou metÃ¡licas. A figura
da distÃ¢ncia interatÃ´mica em um sÃ³lido cristalino.
ra de zero kelvin, a distÃ¢ncia de equilÃ­brio da ligaÃ§Ã£o
de energia potencial. Acima dessa temperatura, a
energia cinÃ©tica e faz com que eles oscilem em torno
os), que Ã© diferente para cada temperatura. A distÃ¢ncia
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
Ã© [| AO
| (OZ
&
WA
TZ T
T=0K
O deslocamento observado na distÃ¢ncia mÃ©dia revela
A)ionizaÃ§Ã£o.
B) dilataÃ§Ã£o.
C) dissociaÃ§Ã£o.
D) quebra de ligaÃ§Ãµes covalentes.
E) formaÃ§Ã£o de ligaÃ§Ãµes metÃ¡licas.
novocadernoenem(DQgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'medium','published',286),
('ENEM-2018.1-Q287',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2018,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2018.1 â€” QuÃ­mica â€” QuestÃ£o 287

Tensoativos sÃ£o compostos orgÃ¢nicos que possuem
regiÃµes, uma hidrofÃ³bica e outra hidrofÃ­lica. O principal
1940 e teve grande aceitaÃ§Ã£o no mercado de
ao do sabÃ£o. No entanto, o uso desse produto
resistÃªncia Ã  degradaÃ§Ã£o biolÃ³gica, por causa dos
porÃ§Ã£o hidrofÃ³bica desse tensoativo aniÃ´nico. As
levando Ã  persistÃªncia no melo ambiente por longos
dos paÃ­ses por tensoativos biodegradÃ¡veis, ou seja,
(PENTEADO,
uma abordagem
Qual a fÃ³rmula estrutural do tensoativo persistente no
n MED on
15 20
SO, Na*
To
|
SO, Na*
? SPTTTTTSS
NOIS DOCDÃ”EAN
E)','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'medium','published',287),
('ENEM-2018.1-Q288',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2018,'EquilÃ­brio quÃ­mico','multiple_choice','ENEM 2018.1 â€” QuÃ­mica â€” QuestÃ£o 288

As abelhas utilizam a sinalizaÃ§Ã£o quÃ­mica para
zes de reconhecer diferenÃ§as entre molÃ©culas. A
Ã¡cido 9-hidroxidec-2-enoico, enquanto as
NÃ³s podemos distinguir as abelhas-operÃ¡rias e rainhas
sinalizaÃ§Ã£o quÃ­mica para perceber a diferenÃ§a. Pode-se
(LE COUTEUR, R;
que mudaram
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'easy','published',288),
('ENEM-2018.1-Q289',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2018,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2018.1 â€” QuÃ­mica â€” QuestÃ£o 289

O manejo adequado do solo possibilita a manu-
tenÃ§Ã£o de sua fertilidade Ã  medida que as trocas
de nutrientes entre matÃ©ria orgÃ¢nica, Ã¡gua, solo
e o ar sÃ£o mantidas para garantir a produÃ§Ã£o.
Algumas espÃ©cies iÃ´nicas de alumÃ­nio sÃ£o tÃ³xi-
cas, nÃ£o sÃ³ para a planta, mas para muitos or-
ganismos como as bactÃ©rias responsÃ¡veis pelas
transformaÃ§Ãµes no ciclo do nitrogÃªnio. O alumÃ­i-
nio danifica as membranas das cÃ©lulas das raÃ­-
zes e restringe a expansÃ£o de suas paredes,
com isso, a planta nÃ£o cresce adequadamente.
Para promover benefÃ­cios para a produÃ§Ã£o agrÃ­-
cola, Ã© recomendada a remediaÃ§Ã£o do solo utili-
zando calcÃ¡rio (CaCO;).
(BRADY, N. C.; WEIL, R. R. Elementos da natureza
e propriedades dos solos. Porto Alegre:
Bookman, 2013 - adaptado)
Essa remediaÃ§Ã£o promove no solo o(a):
AA) diminuiÃ§Ã£o do pH, deixando-o fÃ©rtil.
B) solubilizaÃ§Ã£o do alumÃ­nio, ocorrendo sua
lixiviaÃ§Ã£o pela chuva.
C) interaÃ§Ã£o do Ã­on cÃ¡lcio com o Ã­on alumÃ­nio,
produzindo uma liga metÃ¡lica.
D) reaÃ§Ã£o do carbonato de cÃ¡lcio com os Ã­ons
alumÃ­nio, formando alumÃ­nio metÃ¡lico.
E) aumento da sua alcalinidade, tomando os
Ã­ons alumÃ­nio menos disponÃ­veis.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'hard','published',289),
('ENEM-2018.1-Q290',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2018,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2018.1 â€” QuÃ­mica â€” QuestÃ£o 290

O petrÃ³leo Ã© uma fonte de energia de baixo
custo e de larga utilizaÃ§Ã£o como matÃ©ria-prima
para uma grande variedade de produtos. Ã‰ um
Ã³leo formado de vÃ¡rias substÃ¢ncias de origem
orgÃ¢nica, em sua maioria hidrocarbonetos de
diferentes massas molares. SÃ£o utilizadas tÃ©c-
nicas de separaÃ§Ã£o para obtenÃ§Ã£o dos compo-
nentes comercializÃ¡veis do petrÃ³leo. AlÃ©m dis-
so, para aumentar a quantidade de fraÃ§Ãµes co-
mercializÃ¡veis, otimizando o produto de origem
fÃ³ssil, utiliza-se o processo de craqueamento.
O que ocorre nesse processo?
A) TransformaÃ§Ã£o das fraÃ§Ãµes do petrÃ³leo em
outras molÃ©culas menores.
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'medium','published',290),
('ENEM-2018.1-Q291',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2018,'AtomÃ­stica e tabela periÃ³dica','multiple_choice','ENEM 2018.1 â€” QuÃ­mica â€” QuestÃ£o 291

O grafeno Ã© uma forma alotrÃ³pica do carbono
constituÃ­do por uma folha planar (arranjo bidi-
mensional) de Ã¡tomos de carbono compactados
e com a espessura de apenas um Ã¡tomo. Sua
estrutura Ã© hexagonal, conforme a figura.
o o o o o o
? ? ? ? ? ? ?
O fe o f. fe o o
o? ? O x. o . Y. o?
es sd p Ã  o ps PS 8
o . Q o o . .
N"
d Ã  d Ã  2 d
o " " o â€ "
Nesse arranjo, os Ã¡tomos de carbono possuem
" 4
hibridaÃ§Ã£o:
A) sp de geometria Usa
B) spâ€œ de geometria trigonal planar.
C) sp? alternados com carbonos com hibridaÃ§Ã£o
sp de geometria linear.
D) sp d de geometria planar.
E) sp''d'' com geometria hexagonal planar.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'hard','published',291),
('ENEM-2018.1-Q292',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2018,'QuÃ­mica ambiental','multiple_choice','ENEM 2018.1 â€” QuÃ­mica â€” QuestÃ£o 292

O alemÃ£o Fritz Haber recebeu o PrÃªmio o Nobel
de quÃ­mica de 1918 pelo desenvolvimento de
um processo viÃ¡vel para a sÃ­ntese da amÃ´nia
(NH3). Em seu discurso de premiaÃ§Ã£o, Haber
justificou a importÃ¢ncia do feito dizendo que:
â€œDesde a metade do sÃ©culo passado, tornou-se
conhecido que um suprimento de nitrogÃªnio Ã©
uma necessidade bÃ¡sica para o aumento das
safras de alimentos; entretanto, tambÃ©m se
sabia que as plantas nÃ£o podem absorver o
nitrogÃªnio em sua forma simples, que Ã© o princi-
pal constituinte da atmosfera. Elas precisam que
o nitrogÃªnio seja combinado [...] para poderem
assimilÃ¡-lo.
Economias agrÃ­colas basicamente mantÃªm o
balanÃ§o do nitrogÃªnio ligado. No entanto, com o
advento da era industrial, os produtos do solo
sÃ£o levados de onde cresce a colheita para
lugares distantes, onde sÃ£o consumidos, fazen-
do com que o nitrogÃªnio ligado nÃ£o retorne Ã 
terra da qual foi retirado.
97','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'hard','published',292),
('ENEM-2018.2-Q293',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2018,'QuÃ­mica geral','multiple_choice','ENEM 2018.2 â€” QuÃ­mica â€” QuestÃ£o 293

As soluÃ§Ãµes de hipoclorito de sÃ³dio tÃªm ampla
aplicaÃ§Ã£o como desinfetantes e alvejantes. Em
uma empresa de limpeza, o responsÃ¡vel pela
Ã¡rea de compras deve decidir entre dois fome-
cedores que tÃªm produtos similares, mas com
diferentes teores de cloro.
Um dos fornecedores vende baldes de 10kg de
produto granulado, contendo 65% de cloro ativo,
a um custo de R$ 65,00. Outro fornecedor ofe-
rece, a um custo de R$ 20,00, bombonas de
50kg de produto lÃ­quido contendo 10% de cloro
ativo.
Considerando apenas o quesito preÃ§o por kg de
cloro ativo e desprezando outras variÃ¡veis, para
cada bombona de 5Okg haverÃ¡ uma economia
de:
A) R$ 4,00.
B) R$ 6,00.
C) R$ 10,00.
D) R$ 30,00.
E) R$ 45,00.
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'hard','published',293),
('ENEM-2018.2-Q294',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2018,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2018.2 â€” QuÃ­mica â€” QuestÃ£o 294

Em derramamentos de Ã³leo no mar, os produtos
conhecidos como â€œdispersantes" sÃ£o usados
para reduzir a tensÃ£o superficial do petrÃ³leo
derramado, permitindo que o vento e as ondas
â€œquebremâ€ a mancha em gotÃ­culas microscÃ³pi-
cas. Estas sÃ£o dispersadas pela Ã¡gua do mar
antes que a mancha de petrÃ³leo atinja a costa.
N. a tentativa ; de fazer uma reproduÃ§Ã£o " do efeito ;
d esse produto dute em casa, um es tudante prep: prepara
um recipiente contendo agua e gotas de Ã³leo de
soja. HÃ¡ disponÃ­vel apenas azeite, vinagre, de-
tergente, Ã¡gua 2 sanitÃ¡ria . e sal de cozinha. ;
Qual dos materiais disponÃ­veis provoca uma
aÃ§Ã£o semelhante Ã  situaÃ§Ã£o descrita?
A) Azeite.
B) Vinagre.
C) Detergente.
D) Ãgua sanitÃ¡ria.
E) Sal de cozinha.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'hard','published',294),
('ENEM-2018.2-Q295',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2018,'Radioatividade','multiple_choice','ENEM 2018.2 â€” QuÃ­mica â€” QuestÃ£o 295

O terremoto e o tsunami ocorridos no JapÃ£o em
11 de marÃ§o de 2011 romperam as paredes de
isolamento de alguns reatores da usina nuclear
de Fukushima, o que ocasionou a liberaÃ§Ã£o de
substÃ¢ncias radioativas. Entre elas estÃ¡ o
iodo-131, cuja presenÃ§a na natureza estÃ¡ limita-
da por sua meia-vida de oito dias. O tempo es-
timado para que esse material se desintegre atÃ©
atingir 1/16 da sua massa inicial Ã© de:
A) 8 dias.
B) 16 dias.
C) 24 dias.
D) 32 dias.
E) 128 dias.
CR E E','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'medium','published',295),
('ENEM-2018.2-Q296',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2018,'Radioatividade','multiple_choice','ENEM 2018.2 â€” QuÃ­mica â€” QuestÃ£o 296

o elemento radioativo tÃ³rio (Th) pode substituir
1 o
os combustÃ­veis fÃ³sseis e baterias. Pequenas
quantidades desse elemento seriam suficientes
para gerar grande quantidade de energia. Ã€
partÃ­cula liberada em seu decaimento poderia
ser bloqueada utilizando-se uma caixa de aÃ§o
inoxidÃ¡vel. A equaÃ§Ã£o nuclear para o decaimen-
to do 239Th Ã©:
290: 226 + " + :
Th s:Ra partÃ­cula energia
Considerando a equaÃ§Ã£o de decaimento nucle-
ar, a partÃ­cula que fica bloqueada na caixa de
aÃ§o inoxidÃ¡vel Ã© o(a):
A) alfa.
B) beta.
C) prÃ³ton.
D) nÃªutron.
E) pÃ³sitron.
98','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'medium','published',296),
('ENEM-2018.2-Q297',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2018,'Estequiometria','multiple_choice','ENEM 2018.2 â€” QuÃ­mica â€” QuestÃ£o 297

Pesquisadores desenvolveram uma nova e mais
vastatina, empregada para reduzir os nÃ­veis de
berta, a sÃ­ntese da atorvastatina cÃ¡lcica (CaCesHesgF2N4O10,
a partir do Ã©ster 4-metil-3-oxopentanoato de metila
(Unicamp descobre nova rota para produzir medicamento
Considere o rendimento global de 20% na sÃ­ntese
porÃ§Ã£o de 1 : 1. Simplificadamente, o processo Ã©
[â€ " 11 etapas de sÃ­ntese
ZU Tâ€”â€” >
o Rendimento global
de 20%
DisponÃ­vel em:
Considerando o processo descrito, a massa, em
do Ã©ster Ã© mais prÃ³xima de:
A) 20.
B) 29.
C) 160.
D) 202.
E) 231.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'medium','published',297),
('ENEM-2018.2-Q298',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2018,'SoluÃ§Ãµes e concentraÃ§Ã£o','multiple_choice','ENEM 2018.2 â€” QuÃ­mica â€” QuestÃ£o 298

O aproveitamento integral e racional das matÃ©rias-primas
de segmentos industriais, tais como o de combustÃ­veis,
geraÃ§Ã£o. Este processo requer um tratamento prÃ©vio
rais diluÃ­dos. No prÃ©-tratamento de material lignocelulÃ³sico
Ã¡cido sulfÃºrico, que foi preparada diluindo-se 2000
Ã§Ã£o igual a 98 g/L, ocorrendo dissociaÃ§Ã£o total do
res aproximados de logaritmos decimais.
(DisponÃ­vel
Sabendo-se que as massas molares, em g/mol, dos
1, 16 e 32, qual Ã© o pH da soluÃ§Ã£o diluÃ­da de Ã¡cido
A) 2,6
B) 3,0
c)3,2
D) 3,3
E) 3,6
novocadernoenem(DQgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'medium','published',298),
('ENEM-2018.2-Q299',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2018,'TermoquÃ­mica','multiple_choice','ENEM 2018.2 â€” QuÃ­mica â€” QuestÃ£o 299

A figura apresenta um processo alternativo para
as folhas da cana-de-aÃ§Ãºcar. Suas principais etapas
LAVAGEM DO
SAÃDA BAGAÃ‡O
&
CANA ENTRADA DOBAGAÃ‡O. (2)
BEN ABS
patas o. 4 Ãs =
| | PET
fio * E -
3 Ã³
VV 3
MOAGEM DA HIDRÃ“LISE DA
CANA CELULOSE
(DisponÃ­vel em:
Em qual etapa ocorre a sÃ­ntese desse combustÃ­vel?
AJ B)2 oc)3','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'medium','published',299),
('ENEM-2018.2-Q300',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2018,'Estequiometria','multiple_choice','ENEM 2018.2 â€” QuÃ­mica â€” QuestÃ£o 300

Objetos de prata sofrem escurecimento devido Ã 
seu brilho caracterÃ­stico quando envoltos por papel
Ã¡gua quente e sal de cozinha. A reaÃ§Ã£o nÃ£o balanceada
Ag,S (s) + Al (s) â€”
Dados da massa molar dos elementos (g morâ€):
(UCKO, D. A.
Utilizando o processo descrito, a massa de prata
to que contÃ©m 2,48 g de Ag,S Ã©:
A) O,54 g.
B) 1,08 g.
Cc) 1,919.
D) 2,16 g.
E) 3,82 g.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,3,null,'medium','published',300),
('ENEM-2018.2-Q301',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2018,'SoluÃ§Ãµes e concentraÃ§Ã£o','multiple_choice','ENEM 2018.2 â€” QuÃ­mica â€” QuestÃ£o 301

O suco de repolho-roxo pode ser utilizado como
basta misturar um pouco desse suco Ã  soluÃ§Ã£o
cadora de pH, com valores de 1 a 14, mostrada a
1 2 3 4 5 6 FT
[eme TO Fes â€” [O
Utilizando-se o indicador Ã¡cido-base e a escola para
trico, tÃªm-se, respectivamente, as cores:
A) vermelha e vermelha.
B) vermelha e azul.
C) rosa e roxa.
D) roxa e amarela.
E) roxa e vermelha.
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'medium','published',301),
('ENEM-2018.2-Q302',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2018,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2018.2 â€” QuÃ­mica â€” QuestÃ£o 302

O Ã¡cido acetilsalicÃ­lico Ã© um analgÃ©sico que
pode ser obtido pela reaÃ§Ã£o de esterificaÃ§Ã£o do
Ã¡cido salicÃ­lico. Quando armazenado em condi-
Ã§Ãµes de elevadas temperaturas e umidade,
ocorrem mudanÃ§as fÃ­sicas e quÃ­micas em sua
estrutura, gerando um odor caracterÃ­stico. Ã€
figura representa a fÃ³rmula estrutural do Ã¡cido
acetilsalicÃ­lico.
O O H
O
O
Ãcido acetilsalicÃ­lico
Esse odor Ã© provocado pela liberaÃ§Ã£o de:
A) etanol.
B) etanal.
C) Ã¡cido etanoico.
D) etanoato de etila.
E) benzoato de etila.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,2,null,'medium','published',302),
('ENEM-2018.2-Q303',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2018,'EletroquÃ­mica','multiple_choice','ENEM 2018.2 â€” QuÃ­mica â€” QuestÃ£o 303

Na hidrogenaÃ§Ã£o parcial de Ã³leos vegetais, efe-
tuada pelas indÃºstrias alimentÃ­cias, ocorrem
processos paralelos que conduzem Ã  conversÃ£o
das gorduras cis e trans. Diversos estudos tÃªm
sugerido uma relaÃ§Ã£o direta entre os Ã¡cidos
graxos trans e o aumento do risco de doenÃ§as
vasculares.
(RIBEIRO, A.P.B.et al. interesterificaÃ§Ã£o quÃ­mica:
alternativa para obtenÃ§Ã£o de gorduras zero e trans.
QuÃ­mica Nova, n. 5, 2007 - adaptado)
Qual tipo de reaÃ§Ã£o quimica a indÃºstria alimen,
; " tm indÃ­etria al
tÃ­cia deve evitar minimizar a obtenÃ§Ã£o des-
para
ses subprodutos?
A) AdiÃ§Ã£o.
e
B) Ãcido-base.
C) SubstituiÃ§Ã£o.
D) OxirreduÃ§Ã£o.
E) IsomerizaÃ§Ã£o.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'medium','published',303),
('ENEM-2018.2-Q304',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2018,'QuÃ­mica geral','multiple_choice','ENEM 2018.2 â€” QuÃ­mica â€” QuestÃ£o 304

As indÃºstrias de cerÃ¢mica utilizam argila para
produzir artefatos como tijolos e telhas. Uma
amostra de argila contÃ©m 45% em massa de
sÃ­lica (SiO)) e 10% em massa de Ã¡gua (H;O).
novocadernoenem(DQgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,1,null,'easy','published',304),
('ENEM-2018.2-Q305',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2018,'QuÃ­mica orgÃ¢nica','multiple_choice','ENEM 2018.2 â€” QuÃ­mica â€” QuestÃ£o 305

VÃ¡rias caracterÃ­sticas e propriedades de molÃ©-
culas orgÃ¢nicas podem ser inferidas analisando
sua fÃ³rmula estrutural. Na natureza, alguns
compostos apresentam a mesma fÃ³rmula mole-
cular e diferentes fÃ³rmulas estruturais. SÃ£o os
chamados isÃ´meros, como ilustrado nas estrutu-
ras.
() (o)
Uh
OH OH
v
Ãª
â€”
OH OH
Entre as molÃ©culas apresentadas, observa-se a
ocorrÃªncia de isomeria:
A) Ã³tica. Ãš
B) de funÃ§Ã£o.
C) de cadeia.
D) geomÃ©trica.
E) de compensaÃ§Ã£o.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'medium','published',305),
('ENEM-2018.2-Q306',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2018,'TermoquÃ­mica','multiple_choice','ENEM 2018.2 â€” QuÃ­mica â€” QuestÃ£o 306

Bebidas podem ser refrigeradas de modo mais
rÃ¡pido utilizando-se caixas de isopor contendo
gelo e um pouco de sal grosso comercial. Nesse
processo ocorre o derretimento do gelo com
consequente formaÃ§Ã£o de lÃ­quido e resfriamento
das bebidas. Uma interpretaÃ§Ã£o equivocada,
baseada no senso comum, relaciona esse efeito
Ã  grande capacidade do sal grosso de remover
calor do gelo.
Do ponto de vista cientÃ­fico, o resfriamento rÃ¡pi-
do ocorre em razÃ£o da:
A) variaÃ§Ã£o da solubilidade do sal.
B) alteraÃ§Ã£o da polaridade da Ã¡gua.
C) elevaÃ§Ã£o da densidade do lÃ­quido.
D) modificaÃ§Ã£o da viscosidade do lÃ­quido.
E) diminuiÃ§Ã£o da temperatura de fusÃ£o do lÃ­qui-
do.
101','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'medium','published',306),
('ENEM-2018.2-Q307',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2018,'SoluÃ§Ãµes e concentraÃ§Ã£o','multiple_choice','ENEM 2018.2 â€” QuÃ­mica â€” QuestÃ£o 307

O sulfato de bÃ¡rio (BaSO,) Ã© mundialmente
utilizado na forma de suspensÃ£o como contraste
em radiografias de esÃ´fago, estÃ´mago e intesti-
no. Por se tratar de um sal pouco solÃºvel, quan-
do em meio aquoso estabelece o seguinte equi-
lÃ­brio:
BaSO, (s) â€” Ba?* (aq) + SO, (aq)
Por causa da toxicidade do bÃ¡rio (Baâ€*), Ã© dese-
jado que o contraste nÃ£o seja absorvido, sendo
totalmente eliminado nas fezes. A eventual ab-
sorÃ§Ã£o de Ã­ons Baâ€, porÃ©m, pode levar a rea-
Ã§Ãµes adversas ainda nas primeiras horas apÃ³s
sua administraÃ§Ã£o, como vÃ´mito, cÃ³licas, diar-
reia, tremores, crises convulsivas e atÃ© mesmo
a morte.
(PEREIRA, L, F. Entenda o caso da intoxicaÃ§Ã£o por
Celobar. DisponÃ­vel em: www.unifesp.br.
Acesso em: 20 nov. 2013 - adaptado)
Para garantir a seguranÃ§a do paciente que fizer
uso do contraste, deve-se preparar essa sus-
pensÃ£o em:
A) Ã¡gua destilada.
B) soro fisiolÃ³gico.
C) soluÃ§Ã£o de cloreto de bÃ¡rio, BaCl,.
D) soluÃ§Ã£o de sulfato de bÃ¡rio, BaSO,.
E) soluÃ§Ã£o de sulfato de potÃ¡ssio, KSO,.','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'hard','published',307),
('ENEM-2018.2-Q308',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2018,'Radioatividade','multiple_choice','ENEM 2018.2 â€” QuÃ­mica â€” QuestÃ£o 308

A radiaÃ§Ã£o na regiÃ£o do infravermelho interage
com a oscilaÃ§Ã£o do campo elÃ©trico gerada pelo
movimento vibracional de Ã¡tomos de uma liga-
Ã§Ã£o quÃ­mica. Quanto mais fortes forem as liga-
Ã§Ãµes e mais leves os Ã¡tomos envolvidos, maior
serÃ¡ a energia e, portanto, maior a frequÃªncia
da radiaÃ§Ã£o no infravermelho associada Ã  vibra-
Ã§Ã£o da ligaÃ§Ã£o quÃ­mica. A estrutura quÃ­mica da
molÃ©cula 2-animo-6-cianopiridina Ã© mostrada.
NCâ€ NO â€œNH,
A ligaÃ§Ã£o quÃ­mica dessa molÃ©cula, envolvendo
Ã¡tomos diferentes do hidrogÃªnio, que absorve a
radiaÃ§Ã£o no infravermelho com maior frequÃªncia
Ã©:
A) C-C
B) C-N
Cc) C=C
D) C=N
E) C=N
novocadernoenem(Qgmail.com','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,4,null,'medium','published',308),
('ENEM-2018.2-Q309',(select id from public.subjects where slug='quimica'),(select id from public.exams where slug='enem'),2018,'TermoquÃ­mica','multiple_choice','ENEM 2018.2 â€” QuÃ­mica â€” QuestÃ£o 309

Sobre a diluiÃ§Ã£o do Ã¡cido sulfÃºrico em Ã¡gua, o
quÃ­mico e escritor Primo Levi afirma que, "estÃ¡
escrito em todos os tratados, Ã© preciso operar
Ã s avessas, quer dizer, verter o Ã¡cido na Ã¡gua e
nÃ£o o contrario, senÃ£o aquele lÃ­quido oleoso de
aspecto tÃ£o inÃ³cuo estÃ¡ sujeito a iras furibun-
das: sabem-no atÃ© os meninos do ginÃ¡sio".
(furibundo: adj. furioso)
(LEVI, P. A tabela periÃ³dica. Rio de Janeiro:
Relume-DumarÃ¡, 1994 - adaptado)
O alerta dado pro Levi e justifica-se porque a:
Ã  diviÃ§Ã£o do Ã¡cido fipera muito calor
Mina Aida |; ,
) mistura de agua Ã© acido Ã© exp''osiva.
C) Ã¡gua provoca a neutralizaÃ§Ã£o do Ã¡cido.
D) mistura final de Ã¡gua e Ã¡cido separa-se em
fases.
E) Ã¡gua inibe a liberaÃ§Ã£o dos vapores proveni-
entes do Ã¡cido.
102','[]'::jsonb,'[]'::jsonb,null,'["Alternativa A","Alternativa B","Alternativa C","Alternativa D","Alternativa E"]'::jsonb,0,null,'hard','published',309)
on conflict (source_ref) do update set
 subject_id=excluded.subject_id, exam_id=excluded.exam_id, year=excluded.year, topic=excluded.topic,
 question_type=excluded.question_type, prompt=excluded.prompt, source_images=excluded.source_images,
 stem_image_url=excluded.stem_image_url, options=excluded.options, correct_index=excluded.correct_index,
 difficulty=excluded.difficulty, status=excluded.status;



