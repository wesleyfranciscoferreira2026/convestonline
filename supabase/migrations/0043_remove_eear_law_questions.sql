-- Remove todas as questoes da EEAR e de Direito.
delete from public.questions where source_ref like 'EEAR-%';
delete from public.questions where source_ref like 'LAW-%';
-- Remove tentativas vinculadas (opcional, mantem historico)
-- delete from public.question_attempts where question_id in (select id from public.questions where source_ref like 'EEAR-%' or source_ref like 'LAW-%');