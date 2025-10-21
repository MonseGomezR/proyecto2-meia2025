<template>
  <div class="flex justify-center items-center min-h-screen bg-gray-100">
    <form @submit.prevent="handleRegister" class="bg-white p-6 rounded shadow w-full max-w-sm">
      <h2 class="text-xl font-bold mb-4 text-center">Registrar Usuario</h2>
      <input v-model="username" placeholder="Usuario" class="w-full p-2 mb-3 border rounded" />
      <input v-model="email" placeholder="Email" class="w-full p-2 mb-3 border rounded" />
      <input v-model="password" type="password" placeholder="Contraseña" class="w-full p-2 mb-3 border rounded" />
      <button class="w-full bg-green-600 text-white py-2 rounded hover:bg-green-700">Registrar</button>
      <p v-if="error" class="text-red-600 mt-2 text-center">{{ error }}</p>
    </form>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { useAuthStore } from '@/stores/auth'

const auth = useAuthStore()
const router = useRouter()

const username = ref('')
const email = ref('')
const password = ref('')
const error = ref('')

const handleRegister = async () => {
  try {
    await auth.register({ username: username.value, email: email.value, password: password.value })
    router.push('/login')
  } catch {
    error.value = 'Error al registrar usuario'
  }
}
</script>
