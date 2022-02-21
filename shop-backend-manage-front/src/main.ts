import { createApp } from 'vue'
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'

import router from './router/index.js'

import App from './App.vue'

console.log(ElementPlus);

const app = createApp(App)

app.use(router)

// https://element-plus.gitee.io/zh-CN/component/button.html
app.use(ElementPlus)
app.mount('#app')