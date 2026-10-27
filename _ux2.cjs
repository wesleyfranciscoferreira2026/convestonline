const fs = require('fs');
const file = 'src/pages/AITutor.jsx';
const raw = fs.readFileSync(file, 'utf8');
const nl = raw.includes('\r\n') ? '\r\n' : '\n';
let lines = raw.split(/\r?\n/);

const idx = lines.findIndex(l => l.includes('value={input}'));
if (idx < 0) { console.log('NOT FOUND'); process.exit(1); }

// linhas: value={input}, onChange=..., disabled=...  -> reordenar
const valueLine = lines[idx];
const onChangeLine = lines[idx + 1];
const disabledLine = lines[idx + 2];
console.log(JSON.stringify([valueLine, onChangeLine, disabledLine]));

lines.splice(idx, 3,
  valueLine,
  onChangeLine,
  disabledLine,
);

fs.writeFileSync(file, lines.join(nl));
console.log('ok');
