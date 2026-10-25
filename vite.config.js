import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// GitHub Pages serve sites de projeto em /<repo>/ — o build de produção usa
// esse base path; o dev local continua na raiz. Sobrescreva com VITE_BASE_PATH.
export default defineConfig(({ command }) => ({
  plugins: [react()],
  base: process.env.VITE_BASE_PATH ?? (command === 'build' ? '/convestonline/' : '/'),
}))
