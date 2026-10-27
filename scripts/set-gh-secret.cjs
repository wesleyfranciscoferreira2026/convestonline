// Cadastra um secret do GitHub Actions usando a API (criptografia libsodium).
// Uso: node scripts/set-gh-secret.cjs NOME_VALOR
const { execSync } = require('child_process');
const sodium = require('libsodium-wrappers');

const REPO = 'wesleyfranciscoferreira2026/convestonline';

function ghToken() {
  const out = execSync('git credential fill', {
    input: 'protocol=https\nhost=github.com\n\n',
    encoding: 'utf8',
  });
  const map = {};
  for (const line of out.split('\n')) {
    const i = line.indexOf('=');
    if (i > 0) map[line.slice(0, i)] = line.slice(i + 1);
  }
  return map.password;
}

async function main() {
  const [name, ...rest] = process.argv.slice(2);
  if (!name || rest.length === 0) {
    console.error('Uso: node scripts/set-gh-secret.cjs NOME VALOR');
    process.exit(1);
  }
  const value = rest.join(' ');

  const token = ghToken();
  const headers = {
    Authorization: `Bearer ${token}`,
    Accept: 'application/vnd.github+json',
    'X-GitHub-Api-Version': '2022-11-28',
    'Content-Type': 'application/json',
  };

  const keyRes = await fetch(`https://api.github.com/repos/${REPO}/actions/secrets/public-key`, { headers });
  const keyData = await keyRes.json();
  if (!keyData?.key) {
    console.error('Falha ao obter a chave publica do repositorio:', keyRes.status, JSON.stringify(keyData));
    process.exit(1);
  }

  await sodium.ready;
  const binKey = sodium.from_base64(keyData.key, sodium.base64_variants.ORIGINAL);
  const enc = sodium.crypto_box_seal(value, binKey);

  const res = await fetch(`https://api.github.com/repos/${REPO}/actions/secrets/${name}`, {
    method: 'PUT',
    headers,
    body: JSON.stringify({
      encrypted_value: sodium.to_base64(enc, sodium.base64_variants.ORIGINAL),
      key_id: keyData.key_id,
    }),
  });
  console.log(name, res.status === 201 || res.status === 204 ? 'cadastrado' : `falhou (${res.status})`);
  if (res.status !== 201 && res.status !== 204) console.error(await res.text());
}
main();