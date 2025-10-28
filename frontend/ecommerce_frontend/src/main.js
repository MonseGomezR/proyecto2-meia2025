import { createApp } from 'vue'
import { createPinia } from 'pinia'
import { useAuthStore } from '@/stores/auth'

import axios from 'axios' 
import App from './App.vue'
import router from './router'

import PrimeVue from 'primevue/config'
import ToastService from 'primevue/toastservice'

import './style.css'
import 'primeicons/primeicons.css'

const app = createApp(App)
axios.defaults.baseURL = "https://unbaffled-foliolate-allegra.ngrok-free.dev/api"
axios.interceptors.request.use(config => {
  const token = localStorage.getItem('token')
  if (token) {
    config.headers.Authorization = `Bearer ${token}`
    config.headers['ngrok-skip-browser-warning'] = 'true'
  }
  return config
})

app.use(createPinia())
app.use(router)
app.use(PrimeVue)
app.use(ToastService)

const auth = useAuthStore()
auth.initializeAuth()

app.mount('#app')
