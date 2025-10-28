<template>
  <section class="container mx-auto px-4 py-8">
    <h2 class="text-3xl font-bold text-gray-800 mb-6 text-center">Productos Destacados</h2>

    <div v-if="loading" class="flex justify-center items-center h-40 text-gray-500 text-lg">
      <i class="pi pi-spin pi-spinner" style="font-size: 2rem"></i>
    </div>

    <div v-else-if="products.length === 0" class="text-center text-gray-600 text-lg">
      No hay productos disponibles.
    </div>

    <div v-else class="grid gap-6 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4">
      <ProductCard v-for="product in products" :key="product.id" :product="product" @add-to-cart="addToCart"
        @view-details="viewDetails(product.id)" />
    </div>
  </section>

  <CartFloating/>
</template>

<script setup>
import { ref, onMounted, computed } from 'vue'
import axios from 'axios'
import { useUiStore } from '@/stores/ui'
import { useCartStore } from '@/stores/carts'
import ProductCard from '@components/ProductCard.vue'
import CartFloating from '@components/CartFloating.vue'
import { useAuthStore } from '@/stores/auth'
import router from '../router'

const auth = useAuthStore()
const ui = useUiStore()
const cartStore = useCartStore()

const products = ref([])
const loading = ref(true)

const role = computed(() => auth.user?.roles?.[0] || '')
const isUser = computed(() => role.value === 'ROLE_USER')

const fetchProducts = async () => {
  try {
    const res = await axios.get('/products')
    console.log(res.data)
    products.value = res.data
  } catch (error) {
    console.error('Error cargando productos:', error)
  } finally {
    loading.value = false
  }
}

const addToCart = (product) => {
  cartStore.addToCart(product)
}

const viewDetails = (id) => {
  router.push(`/products/${id}`);
};

onMounted(() => {
  fetchProducts()
})
</script>
