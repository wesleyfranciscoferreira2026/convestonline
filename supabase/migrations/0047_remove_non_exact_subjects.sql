-- ============================================================================
-- Remove todas as questoes que nao sao de exatas (matematica, fisica, quimica).
-- Remove: biologia, portugues, ingles, historia, geografia, filosofia,
--         sociologia, literatura, arte, programacao, direito, etc.
-- ============================================================================

delete from public.questions
where subject_id in (
  select id from public.subjects
  where slug not in ('matematica', 'fisica', 'quimica')
);

-- Remove subjects nao-exatas (opcional, mas limpa o catalogo)
-- delete from public.subjects where slug not in ('matematica', 'fisica', 'quimica');
