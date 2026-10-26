-- ============================================================================
-- Convest+ — Imagens em questões e ano da prova
-- ============================================================================
alter table public.questions
  add column if not exists stem_image_url text,
  add column if not exists option_images jsonb not null default '[]'::jsonb,
  add column if not exists year integer;

create index if not exists questions_exam_year_idx on public.questions (exam_id, year);

-- Bucket público para as imagens das questões (leitura pública, escrita só admin)
insert into storage.buckets (id, name, public)
values ('question-images', 'question-images', true)
on conflict (id) do nothing;

drop policy if exists "question_images_admin_insert" on storage.objects;
create policy "question_images_admin_insert" on storage.objects
  for insert to authenticated
  with check (bucket_id = 'question-images' and public.is_admin());

drop policy if exists "question_images_admin_update" on storage.objects;
create policy "question_images_admin_update" on storage.objects
  for update to authenticated
  using (bucket_id = 'question-images' and public.is_admin())
  with check (bucket_id = 'question-images' and public.is_admin());

drop policy if exists "question_images_admin_delete" on storage.objects;
create policy "question_images_admin_delete" on storage.objects
  for delete to authenticated
  using (bucket_id = 'question-images' and public.is_admin());
