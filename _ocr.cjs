const fs = require('fs');
const path = require('path');

const file = 'C:/Users/wokup/Downloads/WhatsApp Image 2026-10-28 at 01.21.45.jpeg';
const buf = fs.readFileSync(file);

// OCR.space free API with the public test key "helloworld"
const formData = new FormData();
formData.append('file', new Blob([buf], { type: 'image/jpeg' }), 'gabarito.jpeg');
formData.append('language', 'por');
formData.append('isOverlayRequired', 'false');
formData.append('OCREngine', '2');

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
    console.log('--- OCR TEXT ---');
    console.log(text);
    fs.writeFileSync('C:/Users/wokup/Documents/convestonline/_ocr.txt', text);
  })
  .catch((e) => console.error('fetch error', e.message));