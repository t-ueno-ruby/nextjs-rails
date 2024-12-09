import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vite.dev/config/
export default defineConfig({
  plugins: [react()],
  // https://shinke1987.net/?p=1123#toc5
  server: {
    host: '0.0.0.0',
    port: 4000,
  }
})
