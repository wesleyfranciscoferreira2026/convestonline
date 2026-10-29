-- ESSA - questoes recortadas do livro de estudos (Hacking Math).
-- Gabarito NAO disponivel. correct_index = 0 (placeholder).
-- Revise e preencha correct_index manualmente.

insert into public.questions (source_ref, subject_id, exam_id, year, topic, question_type, prompt, source_images, option_images, stem_image_url, options, correct_index, explanation, difficulty, status, sort_order)
values
('ESSA-2008-Q08-P05', (select id from public.subjects where slug='matematica'), (select id from public.exams where slug='esa'), 2008, 'ESSA 2008', 'multiple_choice', '', '["https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/essa-2008/page05-q08-essa-2008.jpg"]'::jsonb, '[]'::jsonb, 'https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/essa-2008/page05-q08-essa-2008.jpg', '["A","B","C","D","E"]'::jsonb, 0, null, 'medium', 'published', 240808),
('ESSA-2009-Q09-P05', (select id from public.subjects where slug='matematica'), (select id from public.exams where slug='esa'), 2009, 'ESSA 2009', 'multiple_choice', '', '["https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/essa-2009/page05-q09-essa-2009.jpg"]'::jsonb, '[]'::jsonb, 'https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/essa-2009/page05-q09-essa-2009.jpg', '["A","B","C","D","E"]'::jsonb, 0, null, 'medium', 'published', 240909),
('ESSA-2009-Q23-P23', (select id from public.subjects where slug='matematica'), (select id from public.exams where slug='esa'), 2009, 'ESSA 2009', 'multiple_choice', '', '["https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/essa-2009/page23-q23-essa-2009.jpg"]'::jsonb, '[]'::jsonb, 'https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/essa-2009/page23-q23-essa-2009.jpg', '["A","B","C","D","E"]'::jsonb, 0, null, 'medium', 'published', 240923),
('ESSA-2010-Q10-P05', (select id from public.subjects where slug='matematica'), (select id from public.exams where slug='esa'), 2010, 'ESSA 2010', 'multiple_choice', '', '["https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/essa-2010/page05-q10-essa-2010.jpg"]'::jsonb, '[]'::jsonb, 'https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/essa-2010/page05-q10-essa-2010.jpg', '["A","B","C","D","E"]'::jsonb, 0, null, 'medium', 'published', 241010)

on conflict (source_ref) do update set
  stem_image_url = excluded.stem_image_url,
  source_images = excluded.source_images,
  options = excluded.options,
  correct_index = excluded.correct_index,
  subject_id = excluded.subject_id,
  topic = excluded.topic,
  status = excluded.status;