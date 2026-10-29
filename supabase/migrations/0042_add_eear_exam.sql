-- ============================================================================
-- Adiciona EEAR (Escola de Especialistas de Aeronautica) ao catalogo de provas.
-- ============================================================================
insert into public.exams (slug, name, category, description, sort_order) values
  ('eear', 'EEAR', 'militar', 'Escola de Especialistas de Aeronautica', 39)
on conflict (slug) do nothing;
