<template>
  <div class="flex justify-center items-center min-h-screen bg-gray-100">
    <form @submit.prevent="handleLogin" class="bg-white p-6 rounded shadow w-full max-w-sm">
      <h2 class="text-xl font-bold mb-4 text-center">Iniciar Sesión</h2>
      <input v-model="username" placeholder="Usuario" class="w-full p-2 mb-3 border rounded" />
      <input v-model="password" type="password" placeholder="Contraseña" class="w-full p-2 mb-3 border rounded" />
      <button class="w-full bg-cyan-600 text-white py-2 rounded hover:bg-cyan-700">Entrar</button>
      <p v-if="error" class="text-pink-600 mt-2 text-center">{{ error }}</p>
    </form>
  </div>
</template>

<script setup>
import { ref, nextTick } from 'vue'
import { useRouter } from 'vue-router'
import { useAuthStore } from '@/stores/auth'

const auth = useAuthStore()
const router = useRouter()

const username = ref('')
const password = ref('')
const error = ref('')

const handleLogin = async () => {
  try {
    await auth.login(username.value, password.value)
    await nextTick()
    router.replace('/') 
  } catch (err) {
    error.value = err.response?.data?.message || 'Usuario o contraseña incorrectos'
  }
}
</script>
