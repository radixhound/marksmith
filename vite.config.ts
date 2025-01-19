import { defineConfig } from 'vite'
import RubyPlugin from 'vite-plugin-ruby'

export default defineConfig({
  // base: '/',
  plugins: [
    RubyPlugin(),
  ],
})
