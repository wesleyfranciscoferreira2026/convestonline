# Aura Study

Plataforma moderna de estudos e aprendizagem — organize sua rotina, aprenda conteúdos, resolva exercícios e acompanhe sua evolução.

## Stack

- **Front-end:** React 18 + Vite + React Router
- **Back-end:** Supabase (Auth + PostgreSQL com Row Level Security)
- **Ícones:** Lucide · **Fonte:** Inter (substituta da Pacaembu, conforme PRD)

## Como rodar

1. **Instale as dependências**
   ```bash
   npm install
   ```

2. **Configure o Supabase**
   - Crie um projeto em [supabase.com](https://supabase.com) (se ainda não tiver).
   - No **SQL Editor**, execute o arquivo [`supabase/migrations/0001_initial_schema.sql`](supabase/migrations/0001_initial_schema.sql) — ele cria as tabelas, políticas de segurança (RLS) e as 8 matérias iniciais.
   - Em **Authentication > Providers**, garanta que o provedor de e-mail está ativo.

3. **Configure as variáveis de ambiente**
   - Copie `.env.example` para `.env.local`.
   - Preencha `VITE_SUPABASE_URL` e `VITE_SUPABASE_ANON_KEY` (em Project Settings > API — use apenas a chave **anon public**).

4. **Inicie o servidor de desenvolvimento**
   ```bash
   npm run dev
   ```

## Scripts

| Comando           | Ação                              |
| ----------------- | --------------------------------- |
| `npm run dev`     | Servidor de desenvolvimento       |
| `npm run build`   | Build de produção em `dist/`      |
| `npm run preview` | Pré-visualização do build         |

## Roadmap (conforme PRD)

- [x] **Fase 1 — Fundação:** identidade visual, navegação, dashboard, autenticação, banco de dados, layout responsivo
- [ ] **Fase 2 — Aprendizagem:** matérias e tópicos, página de conteúdo, exercícios de múltipla escolha, registro de progresso
- [ ] **Fase 3 — Organização:** planejamento completo, favoritos, histórico, estatísticas detalhadas
- [ ] **Fase 4 — Administração:** painel admin, cadastro de conteúdos, publicação
