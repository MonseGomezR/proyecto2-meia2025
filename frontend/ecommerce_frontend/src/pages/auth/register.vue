<template>
  <div class="flex justify-center items-center min-h-screen bg-gray-100">
    <form @submit.prevent="handleRegister" class="bg-white p-6 rounded shadow w-full max-w-md">
      <h2 class="text-xl font-bold mb-4 text-center">Registrar Usuario</h2>

      <input v-model="username" placeholder="Usuario" class="w-full p-2 mb-3 border rounded" />
      <input v-model="email" type="email" placeholder="Correo electronico" class="w-full p-2 mb-3 border rounded" />
      <input v-model="password" type="password" placeholder="Contraseña" class="w-full p-2 mb-3 border rounded" />
      <input v-model="dpi" placeholder="DPI" class="w-full p-2 mb-3 border rounded" />
      <input v-model="firstName" placeholder="Nombre" class="w-full p-2 mb-3 border rounded" />
      <input v-model="lastName" placeholder="Apellido" class="w-full p-2 mb-3 border rounded" />
      <input v-model="phone" placeholder="Telefono" class="w-full p-2 mb-3 border rounded" />
      <input v-model="address" placeholder="Direccion" class="w-full p-2 mb-3 border rounded" />

      <button class="w-full bg-teal-600 text-white py-2 rounded hover:bg-teal-700">
        Registrar
      </button>

      <p v-if="error" class="text-pink-600 mt-2 text-center">{{ error }}</p>
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
const dpi = ref('')
const firstName = ref('')
const lastName = ref('')
const phone = ref('')
const address = ref('')
const error = ref('')

const handleRegister = async () => {
  if(username.value === '' || email.value === '' || password.value === '' || dpi.value === '' || firstName.value === '' || lastName.value === '' || phone.value === '' || address.value === '') {
    error.value = 'Por favor completa todos los campos'
    return
  }

  if(dpi.value.length !== 13) {
    error.value = 'El DPI debe tener 13 caracteres'
    return
  }

  try {
    await auth.register({
      username: username.value,
      email: email.value,
      password: password.value,
      dpi: dpi.value,
      firstName: firstName.value,
      lastName: lastName.value,
      phone: phone.value,
      address: address.value
    })
    alert('Registro exitoso. Por favor inicia sesion.')
    router.push('/auth/login')
  } catch (err) {
    error.value = 'Error al registrar usuario: '
  }
}
</script>
