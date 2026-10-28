-- Correcao de gabaritos das questoes ENEM originais (0020) conforme gabarito oficial.

update public.questions set correct_index = 2 where source_ref = 'ENEM-2016.1-Q202';
update public.questions set correct_index = 2 where source_ref = 'ENEM-2016.1-Q199';
update public.questions set correct_index = 4 where source_ref = 'ENEM-2016.1-Q201';
update public.questions set correct_index = 3 where source_ref = 'ENEM-2016.1-Q205';
update public.questions set correct_index = 1 where source_ref = 'ENEM-2016.1-Q206';
