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

A chave do Groq já está salva em `.env.secrets.local` (arquivo ignorado pelo git). Só falta ligá-la ao Supabase.

**Opção A — pelo GitHub Actions (sem instalar nada):**
1. Gere um token de acesso em <https://supabase.com/dashboard/account/tokens>.
2. Em **Settings → Secrets and variables → Actions**, cadastre:
   - `SUPABASE_ACCESS_TOKEN` = o token acima
   - `GROQ_API_KEY` = `gsk_...`
3. Dê um push na `main`: o workflow publica o secret e a Edge Function automaticamente.
   (Se os secrets não existirem, o job é ignorado e nada quebra.)

> Já configurado: os dois secrets existem no repositório e a função `ai-chat` está publicada.
> Para rotacionar a chave do Groq: `npm i --no-save libsodium-wrappers` e
> `node scripts/set-gh-secret.cjs GROQ_API_KEY gsk_...`, depois um push na `main`.

**Opção B — pelo terminal:**
```bash
npm run ai:login    # abre o navegador (uma vez)
npm run ai:deploy   # publica o secret + a funcao ai-chat
```

O modelo usado é `openai/gpt-oss-120b` (Groq). Para trocar, edite `GROQ_MODEL` (ou o secret no GitHub) e publique de novo.

> ⚠️ A chave apareceu no chat. Se ela vazar publicamente, revogue em <https://console.groq.com/keys> e gere outra.

Sem a publicação da função, o app continua funcionando: a tela da IA detecta que a função não está no ar e oferece o modo "Minha chave" (a chave do aluno fica só no navegador).

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
