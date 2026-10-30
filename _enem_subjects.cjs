const { createWorker } = require('tesseract.js');
const fs = require('fs');
const path = require('path');

const IMG_DIR = process.env.IMG_DIR;

const bioKw = ['célula', 'DNA', 'gene', 'ecologia', 'espécie', 'evolução', 'fotossíntese', 'mitose', 'enzima', 'bactéria', 'vírus', 'molécula', 'tecido', 'hormônio', 'neurônio', 'biodiversidade', 'mutação', 'cromossomo', 'ribossomo', 'mitocôndria', 'cloroplasto', 'osmose', 'homeostase', 'metabolismo', 'cadeia alimentar', 'polinização', 'germinação', 'autotrófico', 'heterotrófico', 'cadeia trófica', 'bioma', 'extinção', 'conservação', 'transgênico', 'PCR', 'genoma', 'proteína', 'aminoácido', 'síntese', 'transcrição', 'tradução', 'replicação', 'imunidade', 'anticorpo', 'linfócito', 'macrófago', 'vacina', 'antígeno', 'parasita', 'fungo', 'protozoário', 'helminto', 'vetor', 'hospedeiro', 'patógeno'];
const chemKw = ['mol', 'átomo', 'molécula', 'elemento', 'composto', 'reação', 'equação', 'balanceamento', 'estequiometria', 'concentração', 'molaridade', 'solução', 'soluto', 'solvente', 'ácido', 'base', 'sal', 'óxido', 'pH', 'redox', 'oxidação', 'redução', 'eletroquímica', 'pilha', 'eletrólise', 'orgânico', 'hidrocarboneto', 'álcool', 'fenol', 'éter', 'aldeído', 'cetona', 'éster', 'amina', 'amida', 'polímero', 'monômero', 'isômero', 'isomeria', 'função orgânica', 'termodinâmica', 'entalpia', 'entropia', 'equilíbrio', 'cinética', 'catalisador', 'radioatividade', 'isótopo', 'nuclídeo', 'configuração eletrônica', 'orbital', 'ligação iônica', 'ligação covalente', 'força intermolecular', 'solubilidade', 'Kps', 'titulação', 'indicador', 'tampão', 'hidrólise', 'neutralização', 'complexação', 'coordenação', 'geometria', 'isomeria geométrica', 'enantiômero', 'racêmico', 'polarização', 'cromatografia', 'espectroscopia', 'termodinâmica', 'espontaneidade', 'energia livre'];
const physKw = ['velocidade', 'aceleração', 'força', 'massa', 'energia', 'trabalho', 'potência', 'impulso', 'momento', 'gravidade', 'peso', 'mola', 'oscilação', 'pendulo', 'onda', 'som', 'luz', 'óptica', 'refração', 'reflexão', 'lente', 'espelho', 'eletricidade', 'corrente', 'tensão', 'resistência', 'Ohm', 'capacitor', 'indutor', 'circuito', 'magnetismo', 'campo magnético', 'termodinâmica', 'calor', 'temperatura', 'entropia', 'pressão', 'volume', 'gás', 'cinemática', 'dinâmica', 'estática', 'equilíbrio', 'torque', 'momento de inércia', 'rotação', 'translação', 'movimento circular', 'MHS', 'amplitude', 'frequência', 'período', 'comprimento de onda', 'interferência', 'difração', 'polarização', 'relatividade', 'Einstein', 'fóton', 'quantum', 'Planck', 'fotoelétrico', 'atomo de Bohr', 'espectro', 'semicondutor', 'diodo', 'transistor', 'transformador', 'gerador', 'motor', 'alternador', 'corrente alternada', 'frequência', 'fase', 'amplitude', 'potência', 'energia', 'carga', 'Coulomb', 'campo elétrico', 'potencial', 'capacitância', 'indutância', 'RLC', 'ressonância', 'aerodinâmica', 'arrasto', 'sustentação', 'Bernoulli', 'Venturi', 'balística', 'projétil', 'trajetória', 'órbita', 'satélite', 'velocidade orbital', 'força centrípeta', 'movimento circular', 'torque', 'momento angular', 'oscilador', 'amortecimento', 'onda estacionária', 'onda progressiva', 'som', 'ultrassom', 'intensidade', 'decibel', 'acústica', 'reverberação', 'vibração', 'ressonância', 'interferência', 'superposição', 'difração', 'fenda', 'rede', 'espectro', 'interferômetro', 'Michelson', 'Young', 'refração', 'ângulo', 'espelho', 'lente', 'convergente', 'divergente', 'foco', 'imagem', 'virtual', 'real', 'miopia', 'hipermetropia', 'astigmatismo', 'olho', 'retina', 'fóvea', 'cones', 'bastonetes'];

function detectSubject(text) {
  const lower = text.toLowerCase();
  let bioScore = 0, chemScore = 0, physScore = 0;
  for (const kw of bioKw) { if (lower.includes(kw.toLowerCase())) bioScore++; }
  for (const kw of chemKw) { if (lower.includes(kw.toLowerCase())) chemScore++; }
  for (const kw of physKw) { if (lower.includes(kw.toLowerCase())) physScore++; }
  if (bioScore === 0 && chemScore === 0 && physScore === 0) return 'unknown';
  const max = Math.max(bioScore, chemScore, physScore);
  if (bioScore === max) return 'biologia';
  if (chemScore === max) return 'quimica';
  return 'fisica';
}

(async () => {
  const files = fs.readdirSync(IMG_DIR).filter(f => f.endsWith('.jpg')).sort();
  const worker = await createWorker('por');
  const results = [];
  
  for (const f of files) {
    const imgPath = path.join(IMG_DIR, f);
    const { data } = await worker.recognize(imgPath);
    const text = data.text;
    const subject = detectSubject(text);
    const qMatches = text.match(/Questão\s*\d+/gi) || [];
    const badCrop = qMatches.length > 1;
    results.push({ file: f, subject, badCrop, qCount: qMatches.length, textLen: text.length });
    console.log(`${f}: ${subject} ${badCrop ? 'BAD_CROP' : 'OK'}`);
  }
  
  await worker.terminate();
  fs.writeFileSync('C:/Users/wokup/AppData/Local/Temp/opencode/enem_subjects.json', JSON.stringify(results, null, 2));
  console.log('\nTotal:', results.length);
  const subs = results.reduce((acc, r) => { acc[r.subject] = (acc[r.subject]||0)+1; return acc; }, {});
  console.log('Subjects:', JSON.stringify(subs));
  console.log('Bad crops:', results.filter(r => r.badCrop).length);
})();
