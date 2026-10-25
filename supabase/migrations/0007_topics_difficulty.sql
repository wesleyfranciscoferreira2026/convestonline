-- ============================================================================
-- Convest — Tópicos e níveis de dificuldade nas questões
-- ============================================================================
alter table public.questions add column if not exists topic text;

-- Índice para filtragem por tópico
create index if not exists questions_topic_idx on public.questions (topic);

-- Atualiza questões existentes com tópicos (Matemática/Física/História)
update public.questions set topic = 'Equações' where prompt ilike '%equação%';
update public.questions set topic = 'Funções' where prompt ilike '%f(x)%' or prompt ilike '%função%';
update public.questions set topic = 'Geometria' where prompt ilike '%retângulo%' or prompt ilike '%área%';
update public.questions set topic = 'Revolução Francesa' where prompt ilike '%Revolução Francesa%';
update public.questions set topic = 'Brasil Colônia' where prompt ilike '%independência%' or prompt ilike '%Brasil%';
update public.questions set topic = 'Eletricidade' where prompt ilike '%resistor%' or prompt ilike '%tensão%' or prompt ilike '%Ohm%';
