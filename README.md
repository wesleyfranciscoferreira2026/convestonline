# Convest+

Plataforma moderna de estudos e aprendizagem — organize sua rotina, aprenda conteúdos, resolva exercícios e acompanhe sua evolução.

🌐 **Site:** https://wesleyfranciscoferreira2026.github.io/convestonline/

Deploy automático via GitHub Actions → GitHub Pages a cada push na `main`
(ver `.github/workflows/deploy.yml`). Para ativar login e dados reais no site
publicado, cadastre os segredos `VITE_SUPABASE_URL` e `VITE_SUPABASE_ANON_KEY`
em **Settings → Secrets and variables → Actions**.

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

## Convest IA (inteligência artificial)

A IA tem dois modos, escolhidos em **Convest IA > Configurar**:

| Modo | Como funciona | Quem configurou |
| --- | --- | --- |
| **IA do site** (padrão) | A chamada passa por uma Supabase Edge Function; a chave do provedor fica em um *secret* do servidor e nunca chega ao navegador. Qualquer visitante usa sem configurar nada. | Você (dono do site) |
| **Minha chave** | O navegador chama o provedor (Groq/OpenAI) direto, com a chave que o aluno colou. A chave fica só no `localStorage` dele. | Cada aluno |

### Ativar a "IA do site" (recomendado)

A chave do Groq já está salva em `.env.secrets.local` (arquivo ignorado pelo git). Só falta ligá-la ao Supabase:

1. Instale o [Supabase CLI](https://supabase.com/docs/guides/cli) e faça login **no seu terminal** (abre o navegador):
   ```bash
   npm run ai:login
   ```
   Equivale a `npx supabase login`. Só precisa ser feito uma vez.
2. Publique o secret e a função:
   ```bash
   npm run ai:deploy
   ```
   O script (`scripts/deploy-ai.mjs`) já usa o projeto `fyujuqqjjadrtmsnqzrb`, lê a chave de `.env.secrets.local` e publica o secret `GROQ_API_KEY` + a Edge Function `ai-chat`. Se faltar o login, ele avisa com a instrução certa em vez de erro genérico.
3. Modelo usado: `openai/gpt-oss-120b` (Groq). Para trocar, edite `GROQ_MODEL` em `.env.secrets.local` e rode `npm run ai:deploy` de novo.

> ⚠️ A chave apareceu no chat. Se ela vazar publicamente, revogue em <https://console.groq.com/keys> e gere outra.

Sem o passo 2, o app continua funcionando: ele cai automaticamente para a chave do aluno, se houver uma salva no navegador.

### Limites de uso

O provedor (Groq) impõe limite de requisições por minuto/dia no plano gratuito. Quando isso acontece, o app mostra um aviso explícito de *rate limit* com o tempo de espera sugerido, em vez de um erro genérico. As mensagens são traduzidas em `src/lib/ai.js` (`friendlyAIError`).

### Onde a IA é usada

- **Convest IA** — chat de tira-dúvidas.
- **Exercícios > Gerar com IA** — cria questões por matéria, banca e tema.
- **Provas > Gerar com IA** — monta uma prova completa.
- **Questões de Direito** — gera uma questão inédita a cada resposta.

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
