<template>
  <section class="container mx-auto px-4 py-8">
    <h2 class="text-3xl font-bold text-gray-800 mb-6 text-center">Checkout</h2>

    <div v-if="cartItems.length === 0" class="text-center text-gray-500">
      Tu carrito está vacío.
    </div>

    <div v-else class="grid md:grid-cols-2 gap-8">
      <!-- Resumen de productos -->
      <div>
        <h3 class="text-xl font-semibold mb-4">Resumen del carrito</h3>
        <div class="space-y-4">
          <div v-for="item in cartItems" :key="item.product.id" class="flex items-center justify-between">
            <div class="flex items-center gap-3">
              <img :src="item.product.image_url" alt="" class="w-16 h-16 object-cover rounded" />
              <div>
                <p class="font-medium">{{ item.product.name }}</p>
                <p class="text-gray-500 text-sm">Q{{ item.product.price.toFixed(2) }} x {{ item.quantity }}</p>
              </div>
            </div>
            <p class="font-semibold">Q{{ (item.product.price * item.quantity).toFixed(2) }}</p>
          </div>
        </div>
        <div class="mt-4 border-t pt-4">
          <p class="font-semibold text-lg">Subtotal: Q{{ subtotal.toFixed(2) }}</p>
          <p class="font-semibold text-lg">Total: Q{{ total.toFixed(2) }}</p>
        </div>
      </div>

      <!-- Formulario de envío -->
      <div>
        <h3 class="text-xl font-semibold mb-4">Información de envío</h3>
        <form @submit.prevent="placeOrder" class="space-y-4">
          <div>
            <label class="block mb-1 font-medium">Nombre completo</label>
            <input v-model="shipping.name" type="text" required class="border rounded w-full p-2" />
          </div>
          <div>
            <label class="block mb-1 font-medium">Dirección</label>
            <input v-model="shipping.address" type="text" required class="border rounded w-full p-2" />
          </div>
          <div>
            <label class="block mb-1 font-medium">Teléfono</label>
            <input v-model="shipping.phone" type="tel" required class="border rounded w-full p-2" />
          </div>
          <div>
            <label class="block mb-1 font-medium">Email</label>
            <input v-model="shipping.email" type="email" required class="border rounded w-full p-2" />
          </div>
          <button type="submit" class="mt-4 w-full bg-green-600 text-white py-2 rounded hover:bg-green-700">
            Confirmar compra
          </button>
        </form>
      </div>
    </div>
  </section>
</template>

<script setup>
import { computed, reactive } from 'vue'
import { useCartStore } from '@/stores/carts'
import axios from 'axios'
import { useRouter } from 'vue-router'

const cartStore = useCartStore()
const router = useRouter()

const cartItems = computed(() => cartStore.items)

const subtotal = computed(() => {
  return cartItems.value.reduce((acc, item) => acc + item.product.price * item.quantity, 0)
})

const total = computed(() => {
  // Aquí puedes agregar impuestos o envío
  return subtotal.value
})

const shipping = reactive({
  name: '',
  address: '',
  phone: '',
  email: ''
})

const placeOrder = async () => {
  if (cartItems.value.length === 0) {
    alert('Tu carrito está vacío')
    return
  }

  try {
    const orderPayload = {
      items: cartItems.value.map(i => ({ productId: i.product.id, quantity: i.quantity })),
      shipping
    }

    await axios.post('/orders', orderPayload)
    alert('Pedido realizado correctamente')
    cartStore.clearCart()
    router.push('/')
  } catch (err) {
    console.error(err)
    alert(err.response?.data?.message || 'Error al realizar el pedido')
  }
}
</script>
