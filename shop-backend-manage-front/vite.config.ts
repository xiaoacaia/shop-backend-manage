import { defineConfig,resolve } from 'vite'
import vue from '@vitejs/plugin-vue'

const path = require('path')
const resolve = (dir: string) => path.join(__dirname, dir);
// https://cn.vitejs.dev/config/#conditional-config
export default defineConfig({
  plugins: [vue()],
  resolve: {
    extensions: ['.js', '.vue', '.json', '.ts'],
    alias: {
      '@': resolve('src'),
      '_c': resolve('src/page'),
    }
  }
})
