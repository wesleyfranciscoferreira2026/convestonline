const fs = require('fs');
const file = 'src/pages/AITutor.jsx';
const raw = fs.readFileSync(file, 'utf8');
const nl = raw.includes('\r\n') ? '\r\n' : '\n';
let c = raw;

function rep(from, to) {
  const f = from.split('\n').join(nl);
  const t = to.split('\n').join(nl);
  if (!c.includes(f)) { console.log('NOT FOUND: ' + f.slice(0, 120).replace(/\n/g, '\\n')); process.exit(1); }
  c = c.replace(f, t);
}

// 1) Card de "IA do site" so aparece quando a funcao esta no ar.
rep(
  "      {mode === 'site' && (",
  "      {mode === 'site' && siteReady === true && ("
);

// 2) Quando a IA do site nao esta disponivel, orienta a usar a propria chave.
rep(
  "      {!configured && mode === 'own' && (",
  "      {(mode === 'own' || siteReady === false) && (\n        <Card className=\"ai-setup-card\">\n          <EmptyState\n            icon={Key}\n            title={siteReady === false ? 'IA do site ainda nao ativada' : 'Configure sua chave de API'}\n            description={\n              siteReady === false\n                ? 'A funcao de IA do site ainda nao foi publicada no Supabase. Enquanto isso, use sua propria chave do Groq (gratuita) e tudo funciona normalmente.'\n                : 'Voce escolheu usar sua propria chave. Crie uma conta no Groq (gratuito) e cole a chave abaixo.'\n            }\n            action={\n              <div className=\"ai-setup-actions\">\n                <a\n                  href=\"https://console.groq.com/keys\"\n                  target=\"_blank\"\n                  rel=\"noopener noreferrer\"\n                  className=\"btn btn-outline\"\n                >\n                  Criar chave no Groq\n                </a>\n                <button type=\"button\" className=\"btn btn-primary\" onClick={() => { setDraft(config); setDraftMode('own'); setConfigOpen(true) }}>\n                  Colar minha chave\n                </button>\n              </div>\n            }\n          />\n          <p className=\"ai-setup-note\">\n            A chave fica salva apenas no seu navegador (localStorage). Nunca e enviada para nossos servidores.\n          </p>\n        </Card>\n      )}\n\n      {false && ("
);

fs.writeFileSync(file, c);
console.log('ok');
