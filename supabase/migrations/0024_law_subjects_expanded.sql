-- Garante disciplinas de Direito base (idempotente).
insert into public.subjects (slug, name, description, icon, sort_order) values
('direito-administrativo', 'Direito Administrativo', 'Administracao publica, atos administrativos e servicos publicos.', 'Briefcase', 101),
('direito-constitucional', 'Direito Constitucional', 'Constituicao, direitos fundamentais e organizacao do Estado.', 'Scale', 102),
('direito-penal', 'Direito Penal', 'Principios penais, teoria do crime e excludentes.', 'Gavel', 103),
('direito-civil', 'Direito Civil', 'Pessoas, contratos e responsabilidade civil.', 'BookOpen', 104),
('processo-civil', 'Processo Civil', 'Regras fundamentais do processo e tutela jurisdicional.', 'FileText', 105),
('processo-penal', 'Processo Penal', 'Investigacao, acao penal e garantias processuais.', 'Gavel', 106),
('direito-do-trabalho', 'Direito do Trabalho', 'Relacao de emprego, jornada e direitos trabalhistas.', 'Briefcase', 107),
('direito-tributario', 'Direito Tributario', 'Competencia, tributos e obrigacoes tributarias.', 'FileText', 108),
('direito-do-consumidor', 'Direito do Consumidor', 'Protecao do consumidor e relacoes de consumo.', 'Target', 109),
('direito-ambiental', 'Direito Ambiental', 'Principios ambientais e responsabilidade por danos.', 'Sparkles', 110)
on conflict (slug) do update set name=excluded.name, description=excluded.description, icon=excluded.icon, sort_order=excluded.sort_order;

-- Materias de Direito adicionais, conforme indice do livro
-- "11.000 questoes comentadas" (ISBN 978-85-02-20144-6).
-- Apenas cadastro de disciplinas; questoes serao adicionadas por banca/topico.

insert into public.subjects (slug, name, description, icon, sort_order) values
('direito-eleitoral', 'Direito Eleitoral', 'Processo eleitoral, partidos politicos, propaganda e justica eleitoral.', 'Landmark', 111),
('direito-empresarial', 'Direito Empresarial e Comercial', 'Empresa, titulo de credito, sociedades e falencia.', 'Briefcase', 112),
('direito-financeiro-e-economico', 'Direito Financeiro e Economico', 'Financas publicas, orcamento e ordem economica.', 'Landmark', 113),
('direito-internacional', 'Direito Internacional Publico e Privado', 'Relacoes internacionais, conflitos de leis e jurisdicao.', 'Globe2', 114),
('direito-previdenciario', 'Direito Previdenciario e Seguridade Social', 'Beneficios previdenciarios e seguridade social.', 'Users', 115),
('direitos-difusos-coletivos', 'Direitos Difusos, Coletivos e Individuais Homogeneos', 'Tutela coletiva de interesses difusos e coletivos.', 'Users', 116),
('direitos-humanos', 'Direitos Humanos', 'Direitos fundamentais e sistemas de protecao.', 'Scale', 117),
('estatuto-crianca-adolescente', 'Estatuto da Crianca e do Adolescente', 'Protecao integral da crianca e do adolescente.', 'Users', 118),
('etica-legislacao-profissional', 'Etica e Legislacao Profissional', 'Etica profissional e estatuto da OAB.', 'Scale', 119)
on conflict (slug) do update set name=excluded.name, description=excluded.description, icon=excluded.icon, sort_order=excluded.sort_order;