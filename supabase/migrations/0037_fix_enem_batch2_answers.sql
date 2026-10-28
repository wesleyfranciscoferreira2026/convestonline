-- Correcao de gabaritos conforme gabarito oficial (OCR da imagem enviada).
-- Mapeamento por numero de questao -> letra do gabarito.

update public.questions set correct_index = 2 where source_ref = 'ENEM-2009.1-Q01';
update public.questions set correct_index = 4 where source_ref = 'ENEM-2009.1-Q02';
update public.questions set correct_index = 1 where source_ref = 'ENEM-2009.1-Q03';
update public.questions set correct_index = 3 where source_ref = 'ENEM-2009.1-Q05';
update public.questions set correct_index = 2 where source_ref = 'ENEM-2009.1-Q06';
update public.questions set correct_index = 3 where source_ref = 'ENEM-2009.1-Q07';
update public.questions set correct_index = 2 where source_ref = 'ENEM-2009.1-Q08';
update public.questions set correct_index = 3 where source_ref = 'ENEM-2009.1-Q09';
update public.questions set correct_index = 3 where source_ref = 'ENEM-2009.1-Q10';
update public.questions set correct_index = 0 where source_ref = 'ENEM-2009.2-Q12';
update public.questions set correct_index = 1 where source_ref = 'ENEM-2009.2-Q13';
update public.questions set correct_index = 3 where source_ref = 'ENEM-2009.2-Q14';
update public.questions set correct_index = 4 where source_ref = 'ENEM-2009.2-Q16';
update public.questions set correct_index = 1 where source_ref = 'ENEM-2009.2-Q17';
update public.questions set correct_index = 3 where source_ref = 'ENEM-2009.3-Q22';
update public.questions set correct_index = 4 where source_ref = 'ENEM-2010.1-Q30';
update public.questions set correct_index = 2 where source_ref = 'ENEM-2010.1-Q31';
update public.questions set correct_index = 3 where source_ref = 'ENEM-2010.1-Q34';
update public.questions set correct_index = 0 where source_ref = 'ENEM-2010.1-Q36';
