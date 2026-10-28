const fs = require('fs');
const file = 'C:/Users/wokup/Downloads/WhatsApp Image 2026-10-28 at 01.21.45.jpeg';
const buf = fs.readFileSync(file);

const formData = new FormData();
formData.append('file', new Blob([buf], { type: 'image/jpeg' }), 'gabarito.jpeg');
formData.append('language', 'por');
formData.append('isOverlayRequired', 'false');
formData.append('OCREngine', '3');
formData.append('scale', 'true');

fetch('https://api.ocr.space/parse/image', {
  method: 'POST',
  headers: { apikey: 'helloworld' },
  body: formData,
})
  .then((r) => r.json())
  .then((d) => {
    console.log('status', d?.OCRExitCode);
    console.log('error', d?.IsErroredOnProcessing, d?.ErrorMessage);
    const text = d?.ParsedResults?.map((p) => p.ParsedText).join('\n') || '';
    console.log('--- OCR TEXT (engine 3, scaled) ---');
    console.log(text);
    fs.writeFileSync('C:/Users/wokup/Documents/convestonline/_ocr3.txt', text);
  })
  .catch((e) => console.error('fetch error', e.message));