<!-- components/CartFloating.vue -->
<template>
    <button v-if="isUser" @click="ui.toggleCart"
      class="fixed bottom-6 right-6 bg-pink-600 text-white rounded-full p-4 shadow-lg hover:bg-pink-700 transition w-14 h-14">
      <i class="pi pi-shopping-cart" style="color: white; font-size: 1.5rem;"></i>
    </button>
    <CartSidebar />
</template>

<script setup>
import { computed } from 'vue'
import { useUiStore } from '@/stores/ui'
import { useAuthStore } from '@/stores/auth'
import CartSidebar from './CartSidebar.vue'

const ui = useUiStore()
const auth = useAuthStore()
const role = computed(() => auth.user?.roles?.[0] || '')
const isUser = computed(() => role.value === 'ROLE_USER')
</script>
