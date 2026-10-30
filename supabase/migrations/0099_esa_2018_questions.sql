-- ESA 2018 - questoes recortadas da prova (Prova Geral).
-- Gabarito NAO disponivel. correct_index = 0 (placeholder).

insert into public.questions (source_ref, subject_id, exam_id, year, topic, question_type, prompt, source_images, option_images, stem_image_url, options, correct_index, explanation, difficulty, status, sort_order)
values


on conflict (source_ref) do update set
  stem_image_url = excluded.stem_image_url,
  source_images = excluded.source_images,
  options = excluded.options,
  correct_index = excluded.correct_index,
  subject_id = excluded.subject_id,
  topic = excluded.topic,
  status = excluded.status;