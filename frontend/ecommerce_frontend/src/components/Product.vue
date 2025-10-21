<template>
    <section class="container mx-auto px-4 py-8">
        <h2 class="text-3xl font-bold text-gray-800 mb-6 text-center">Productos Destacados</h2>

        <div v-if="loading" class="flex justify-center items-center h-40 text-gray-500 text-lg">
            Cargando productos...
        </div>

        <div v-else-if="products.length === 0" class="text-center text-gray-600 text-lg">
            No hay productos disponibles.
        </div>

        <div v-else class="grid gap-6 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4">
            <div v-for="product in products" :key="product.id"
                class="bg-white rounded-2xl shadow-md hover:shadow-lg transition-all duration-300 p-4 flex flex-col">
                <img :src="product.image_url || defaultImage" :alt="product.name"
                    class="w-full h-48 object-cover rounded-lg mb-4" />

                <h3 class="text-lg font-semibold text-gray-800 truncate">
                    {{ product.name }}
                </h3>

                <p class="text-gray-600 text-sm mb-2 line-clamp-2">
                    {{ product.description }}
                </p>

                <div class="mt-auto">
                    <p class="text-xl font-bold text-teal-500 mb-3">
                        Q{{ product.price.toFixed(2) }}
                    </p>

                    <button @click="addToCart(product)"
                        class="w-full bg-teal-600 hover:bg-teal-700 text-white py-2 rounded-lg transition-colors">
                        Agregar al carrito
                    </button>
                </div>
            </div>
        </div>
    </section>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import axios from 'axios'

const products = ref([])
const loading = ref(true)
import defaultImage from '@/assets/placeholder.jpg'

const fetchProducts = async () => {
    try {
        const res = await axios.get('/products')
        products.value = res.data 
    } catch (error) {
        console.error('Error cargando productos:', error)
    } finally {
        loading.value = false
    }
}

const addToCart = (product) => {
    alert(`"${product.name}" agregado al carrito`)
}

onMounted(() => {
    fetchProducts()
})
</script>
