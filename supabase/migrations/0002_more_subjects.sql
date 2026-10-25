-- ============================================================================
-- Aura Study / Convest — Fase 1 (complemento): novas matérias
-- Aplique este arquivo no SQL Editor se você já rodou a 0001 antes.
-- Seguro de reexecutar (on conflict do nothing).
-- ============================================================================

insert into public.subjects (slug, name, description, icon, sort_order) values
  ('biologia',    'Biologia',    'Citologia, genética, ecologia e evolução.',   'Leaf',     4),
  ('filosofia',   'Filosofia',   'Ética, lógica, política e metafísica.',      'Brain',    9),
  ('sociologia',  'Sociologia',  'Sociedade, cultura e instituições sociais.',   'Users',    10),
  ('literatura',  'Literatura',  'Movimentos literários e análise de textos.',   'BookText', 11),
  ('arte',        'Arte',        'História da arte, estilos e expressões.',     'Palette',  12)
on conflict (slug) do nothing;

-- Reorganiza a ordem das matérias já existentes para manter a sequência lógica.
update public.subjects set sort_order = 1  where slug = 'matematica';
update public.subjects set sort_order = 2  where slug = 'fisica';
update public.subjects set sort_order = 3  where slug = 'quimica';
update public.subjects set sort_order = 4  where slug = 'biologia';
update public.subjects set sort_order = 5  where slug = 'portugues';
update public.subjects set sort_order = 6  where slug = 'ingles';
update public.subjects set sort_order = 7  where slug = 'historia';
update public.subjects set sort_order = 8  where slug = 'geografia';
update public.subjects set sort_order = 9  where slug = 'filosofia';
update public.subjects set sort_order = 10 where slug = 'sociologia';
update public.subjects set sort_order = 11 where slug = 'literatura';
update public.subjects set sort_order = 12 where slug = 'arte';
update public.subjects set sort_order = 13 where slug = 'programacao';
