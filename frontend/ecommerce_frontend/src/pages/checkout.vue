<template>
  <section class="container mx-auto px-4 py-8">
    <h2 class="text-3xl font-bold text-gray-800 mb-6 text-center">Checkout</h2>

    <div v-if="items.length === 0 && !cartStore.loading"
      class="text-gray-500 flex-grow flex items-center justify-center">
      El carrito esta vacio
    </div>

    <div v-else-if="cartStore.loading" class="flex items-center justify-center py-10">
      <i class="pi pi-spin pi-spinner" style="font-size: 2rem"></i>
    </div>

    <div v-else class="grid md:grid-cols-2 gap-8">
      <div>
        <h3 class="text-xl font-semibold mb-4">Resumen del carrito</h3>
        <div class="space-y-4">
          <div v-for="item in items" :key="item.product.id" class="flex items-center justify-between border-b pb-2">
            <div class="flex items-center gap-3">
              <img :src="item.product.image_url" alt="" class="w-16 h-16 object-cover rounded" />
              <div>
                <p class="font-medium">{{ item.product.name }}</p>
                <p class="text-gray-500 text-sm">
                  Q{{ item.product.price.toFixed(2) }} x {{ item.quantity }}
                </p>
              </div>
            </div>
            <p class="font-semibold">Q{{ (item.product.price * item.quantity).toFixed(2) }}</p>
          </div>
        </div>
        <div class="mt-4 border-t pt-4">
          <p class="font-semibold text-lg">Total: Q{{ total.toFixed(2) }}</p>
        </div>
      </div>

      
      <div>
        <h3 class="text-xl font-semibold mb-4">Informacion de envio</h3>
        <form @submit.prevent="placeOrder" class="space-y-4">
          <div>
            <label class="block mb-1 font-medium">Nombre</label>
            <input :value="`${firstName} ${lastName}`" type="text" readonly
              class="border rounded w-full p-2 bg-gray-100" />
          </div>

          <div>
            <label class="block mb-1 font-medium">Direccion</label>
            <input :value="address" type="text" readonly class="border rounded w-full p-2 bg-gray-100" />
          </div>

          <div>
            <label class="block mb-1 font-medium">Telefono</label>
            <input :value="phone" type="tel" readonly class="border rounded w-full p-2 bg-gray-100" />
          </div>

          <div>
            <label class="block mb-1 font-medium">Email</label>
            <input :value="email" type="email" readonly class="border rounded w-full p-2 bg-gray-100" />
          </div>

          <div class="mt-6">
            <h3 class="text-xl font-semibold mb-2">Metodo de pago</h3>

            <div v-if="savedCards.length > 0" class="space-y-2">
              <label class="block text-sm font-medium mb-1">Selecciona una tarjeta</label>
              <select v-model="selectedCardNumber" class="border rounded w-full p-2 bg-white">
                <option v-for="card in savedCards" :key="card.number" :value="card.number">
                  **** **** **** {{ card.number.slice(-4) }} — vence {{ card.expiration_date }}
                </option>
              </select>
            </div>

            <button type="button" class="mt-3 w-full bg-cyan-600 text-white py-2 rounded hover:bg-cyan-700 transition"
              @click="showAddCard = !showAddCard">
              {{ showAddCard ? 'Cancelar' : 'Agregar nueva tarjeta' }}
            </button>

            <transition name="fade">
              <form v-if="showAddCard" @submit.prevent="addCard"
                class="mt-4 space-y-3 border p-4 rounded bg-gray-50 shadow-sm">
                <div>
                  <label class="block mb-1 text-sm font-medium">Numero de tarjeta</label>
                  <input v-model="card.number" type="text" maxlength="16" placeholder="XXXX XXXX XXXX XXXX"
                    class="border rounded w-full p-2 text-sm" required />
                </div>

                <div>
                  <label class="block mb-1 text-sm font-medium">Nombre</label>
                  <input v-model="card.name" type="text" placeholder="Nombre de la tarjeta"
                    class="border rounded w-full p-2 text-sm" required />
                </div>

                <div class="flex gap-3">
                  <div class="flex-1">
                    <label class="block mb-1 text-sm font-medium">Mes</label>
                    <input v-model="card.expMonth" type="text" maxlength="2" placeholder="MM"
                      class="border rounded w-full p-2 text-sm" required />
                  </div>
                  <div class="flex-1">
                    <label class="block mb-1 text-sm font-medium">Año</label>
                    <input v-model="card.expYear" type="text" maxlength="4" placeholder="YYYY"
                      class="border rounded w-full p-2 text-sm" required />
                  </div>
                  <div class="flex-1">
                    <label class="block mb-1 text-sm font-medium">CVC</label>
                    <input v-model="card.cvv" type="text" maxlength="3" placeholder="CVC"
                      class="border rounded w-full p-2 text-sm" required />
                  </div>
                </div>

                <button type="submit"
                  class="w-full mt-2 bg-green-600 text-white py-2 rounded text-sm hover:bg-green-700 transition">
                  Guardar tarjeta
                </button>
              </form>
            </transition>
          </div>

          <button type="submit" class="mt-6 w-full bg-teal-600 text-white py-2 rounded hover:bg-green-700 transition">
            <i v-if="loading" class="pi pi-spin pi-spinner"></i>
            <p v-else>Confirmar compra</p> 
          </button>
        </form>
      </div>
    </div>
  </section>
</template>

<script setup>
import { computed, reactive, ref, onMounted } from 'vue'
import { useCartStore } from '@/stores/carts'
import { useAuthStore } from '@/stores/auth'
import { useRouter } from 'vue-router'
import axios from 'axios'

const cartStore = useCartStore()
const auth = useAuthStore()
const router = useRouter()

const firstName = computed(() => auth.user?.person?.first_name || '')
const lastName = computed(() => auth.user?.person?.last_name || '')
const email = computed(() => auth.user?.email || '')
const phone = computed(() => auth.user?.person?.phone || '')
const address = computed(() => auth.user?.person?.address || '')

const items = computed(() => cartStore.cart.items || [])
const total = computed(() => cartStore.cart.total || 0)

const savedCards = ref([])
const selectedCardNumber = ref(null)
const showAddCard = ref(false)
const loading = ref(false)

const card = reactive({
  number: '',
  expMonth: '',
  expiration_date: '',
  cvv: '',
  name: ''
})

const fetchCards = async () => {
  try {
    const { data } = await axios.get('/cards')
    savedCards.value = data
    if (data.length > 0) {
      selectedCardNumber.value = data[0].number
    }
  } catch (err) {
    console.error('Error al cargar tarjetas:', err)
  }
}

const addCard = async () => {
  try {
    console.log(card)
    await axios.post('/cards', card)
    alert('Tarjeta guardada correctamente')
    showAddCard.value = false
    Object.assign(card, { number: '', expMonth: '', expYear: '', cvv: '' })
    fetchCards()
  } catch (err) {
    console.error(err)
    alert(err.response?.data?.message || 'Error al guardar la tarjeta')
  }
}

const placeOrder = async () => {
  if (items.value.length === 0) {
    alert('Tu carrito esta vacio')
    return
  }

  if (!selectedCardNumber.value) {
    alert('Por favor selecciona una tarjeta')
    return
  }

  try {
    loading.value = true
    const { data } = await axios.post('/orders/create', {
      cardId: selectedCardNumber.value
    })
    loading.value = false
    cartStore.clearCart()
    alert('Pedido realizado correctamente')
    router.push(`/orders/${data.guia}`)
  } catch (err) {
    console.error(err)
    alert(err.response?.data?.message || 'Error al realizar el pedido')
  }
}

onMounted(() => {
  cartStore.fetchCart()
  fetchCards()
})
</script>

<style scoped>
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.2s ease;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}
</style>
