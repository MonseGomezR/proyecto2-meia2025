<template>
  <div :id="id"
    class="relative bg-white rounded-2xl shadow-md hover:shadow-lg transition-all duration-300 p-4 flex flex-col overflow-hidden group">

    <img :src="product.image_url || defaultImage" :alt="product.name"
      class="w-full h-48 object-cover rounded-lg mb-4" />

    <h3 class="text-lg font-semibold text-gray-800 truncate">
      {{ product.name }}
    </h3>

    <p class="text-gray-600 text-sm mb-2 line-clamp-2">
      {{ product.description }}
    </p>

    <div class="mt-auto">
      <p class="text-xl font-bold text-teal-600 mb-3">
        Q{{ product.price.toFixed(2) }}
      </p>

      <button @click="emit('viewDetails', product)"
        class="w-full bg-teal-600 hover:bg-teal-700 text-white py-2 rounded-lg transition-colors">
        Ver más
      </button>
    </div>

    <button v-if="isUser" @click="handleFloatingAction"
      class="absolute top-6 right-4 bg-gray-300 hover:bg-teal-600 text-white p-3 rounded-full shadow-lg opacity-0 group-hover:opacity-100 transition-opacity duration-300 w-12 h-12">
      <i class="pi pi-plus" style="color: white"></i>
    </button>
  </div>
</template>

<script setup>
import { computed } from 'vue'
import { useAuthStore } from '@/stores/auth'

const emit = defineEmits(['addToCart', 'viewDetails', 'manage-product'])

const auth = useAuthStore()

const role = computed(() => auth.user?.roles?.[0] || '')
const isUser = computed(() => role.value === 'ROLE_USER')
const isMod = computed(() => role.value === 'ROLE_MODERATOR' || role.value === 'ROLE_ADMIN')

const props = defineProps({
  product: { type: Object, required: true },
  defaultImage: { type: String, default: '/placeholder-product.jpg' },
  id: { type: String, default: null }
})
const handleFloatingAction = () => {
  if (isUser.value) {
    emit('addToCart', props.product)
  } else if (isMod.value) {
    emit('manage-product', props.product)
  }
}
</script>
