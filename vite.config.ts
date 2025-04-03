import { defineConfig } from 'vite'
import Rails from 'vite-plugin-rails'
import tailwindcss from '@tailwindcss/vite'

export default defineConfig({
  plugins: [
    tailwindcss(),
    Rails({
      envVars: { RAILS_ENV: 'development' },
    }),
  ],
})
