-- ESA 2015 - questoes recortadas da prova (Prova Geral).
-- Gabarito NAO disponivel. correct_index = 0 (placeholder).

insert into public.questions (source_ref, subject_id, exam_id, year, topic, question_type, prompt, source_images, option_images, stem_image_url, options, correct_index, explanation, difficulty, status, sort_order)
values
('ESA-2015-Q02', (select id from public.subjects where slug='matematica'), (select id from public.exams where slug='esa'), 2015, 'ESA 2015', 'multiple_choice', '', '["https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/esa-2015/page04-q02-esa-2015.jpg"]'::jsonb, '[]'::jsonb, 'https://wesleyfranciscoferreira2026.github.io/convestonline/exam-figures/esa-2015/page04-q02-esa-2015.jpg', '["A","B","C","D","E"]'::jsonb, 0, null, 'medium', 'published', 70002)

on conflict (source_ref) do update set
  stem_image_url = excluded.stem_image_url,
  source_images = excluded.source_images,
  options = excluded.options,
  correct_index = excluded.correct_index,
  subject_id = excluded.subject_id,
  topic = excluded.topic,
  status = excluded.status;