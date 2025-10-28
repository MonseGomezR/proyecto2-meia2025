<template>
    <transition name="slide">
        <aside v-if="ui.showCart" class="fixed right-0 top-0 w-80 h-full bg-white shadow-lg p-4 z-50 flex flex-col">
            <button @click="ui.toggleCart" class="absolute top-4 right-4 text-gray-500 hover:text-black text-xl">
                <i class="pi pi-times-circle" style="color: red"></i>
            </button>

            <h2 class="text-xl font-bold mb-4">Tu carrito ({{ itemCount }})</h2>

            <div v-if="items.length === 0 && !cartStore.loading" class="text-gray-500 flex-grow flex items-center justify-center">
                El carrito esta vacio
            </div>

            <div v-else-if="cartStore.loading">
                <i class="pi pi-spin pi-spinner" style="font-size: 2rem"></i>
            </div>

            <div v-else class="flex-grow overflow-y-auto space-y-2">
                <CartItem v-for="item in items" :key="item.id" :item="item" />
            </div>

            <div class="mt-4 border-t pt-4">
                <p class="text-lg font-bold mb-2">
                    Total: Q{{ total }}
                </p>
                <button @click="goCheckout" :disabled="isEmpty" class="w-full bg-pink-500 text-white py-2 rounded-xl hover:bg-pink-700 transition disabled:bg-gray-400">
                    Finalizar compra
                </button>
                <button :disabled="items.length === 0 || cartStore.loading" class="w-full mt-2 text-gray-600 hover:text-gray-800 text-sm underline disabled:text-gray-400" @click="clearCart">
                    Vaciar carrito
                </button>
            </div>
        </aside>
    </transition>
</template>

<script setup>
import { onMounted, computed } from 'vue'
import { useUiStore } from '@/stores/ui'
import { useCartStore } from '@/stores/carts'
import CartItem from './CartItem.vue'
import router from '../router'

const ui = useUiStore()
const cartStore = useCartStore()
const isEmpty = computed(() => cartStore.cart.items.length === 0)

const items = computed(() => cartStore.cart.items || [])
const total = computed(() => cartStore.cart.total || 0)

const itemCount = computed(() => cartStore.itemCount|| 0)
const clearCart = cartStore.clearCart

var fetchCart = cartStore.fetchCart

onMounted(() => {
    fetchCart()
})

const goCheckout = () => {
    ui.toggleCart()
    router.push('/checkout')
}
</script>

<style scoped>
.slide-enter-active,
.slide-leave-active {
    transition: transform 0.3s ease;
}

.slide-enter-from,
.slide-leave-to {
    transform: translateX(100%);
}
</style>
