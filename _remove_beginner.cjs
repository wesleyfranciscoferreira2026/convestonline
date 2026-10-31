const fs = require('fs');
const p = 'src/pages/Dashboard.jsx';
const lines = fs.readFileSync(p, 'utf8').split('\n');

// Find BeginnerPromo outside function (line ~615)
let beginnerIdx = -1;
for (let i = 0; i < lines.length; i++) {
  if (lines[i].includes('<BeginnerPromo />') && i > 600) {
    beginnerIdx = i;
    break;
  }
}
console.log('BeginnerPromo at index', beginnerIdx, 'line', beginnerIdx + 1);

// Remove it
const result = lines.filter((_, idx) => idx !== beginnerIdx && idx !== beginnerIdx - 1 && idx !== beginnerIdx + 1);
// Actually, let's just remove the two lines (comment + BeginnerPromo)
// and the blank line after
fs.writeFileSync(p, result.join('\n'), 'utf8');
console.log('removed');
