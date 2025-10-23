<template>
    <div>
        <div v-if="product" class="max-w-3xl mx-auto p-6 bg-white rounded-lg shadow">
            <!-- Imagen y nombre -->
            <div class="flex flex-col md:flex-row gap-6">
                <img :src="product.image_url" alt="Imagen producto"
                    class="rounded-lg w-full md:w-1/3 object-cover max-h-80" />

                <div class="flex-1 flex flex-col gap-4">
                    <h1 class="text-2xl font-bold">{{ product.name }}</h1>
                    <p class="text-gray-600">{{ product.description }}</p>
                    <p class="font-semibold text-lg">Precio: Q{{ product.price.toFixed(2) }}</p>
                    <p class="text-sm text-gray-500">Estado: {{ product.state }}</p>

                    <!-- Categorías -->
                    <div class="flex flex-wrap gap-2">
                        <span v-for="cat in product.categories" :key="cat.id"
                            class="px-2 py-1 bg-gray-200 rounded text-sm">{{ cat.name }}</span>
                    </div>

                    <!-- Stock -->
                    <p class="mt-2">
                        <span :class="product.stock > 0 ? 'text-green-600' : 'text-red-600'">
                            Stock: {{ product.stock }}
                        </span>
                    </p>

                    <!-- Contador para agregar al carrito -->
                    <div class="flex items-center gap-3 mt-2">
                        <button @click="decreaseCount"
                            class="px-3 py-1 bg-gray-200 rounded hover:bg-gray-300">-</button>
                        <span class="font-semibold">{{ count }}</span>
                        <button @click="increaseCount"
                            class="px-3 py-1 bg-gray-200 rounded hover:bg-gray-300">+</button>
                    </div>

                    <!-- Botón agregar al carrito -->
                    <button @click="addToCart" :disabled="count === 0 || product.stock === 0"
                        class="mt-3 px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700 disabled:bg-gray-400">
                        Agregar al carrito
                    </button>

                    <!-- Ratings (placeholder) -->
                    <div class="mt-4">
                        <p class="font-medium mb-1">Rating:</p>
                        <div class="flex gap-1">
                            <span v-for="star in 5" :key="star" class="text-yellow-400">★</span>
                            <span class="text-gray-500 ml-2">(0 reviews)</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div v-else class="text-center mt-10 text-gray-500">
            <i class="pi pi-spin pi-spinner" style="font-size: 2rem"></i>

        </div>
    </div>

    <CartFloating />
</template>

<script setup>
import { ref, onMounted } from "vue";
import { useRoute } from "vue-router";
import axios from "axios";
import { useCartStore } from "@/stores/carts";

import CartFloating from "@components/CartFloating.vue";
const route = useRoute();
const product = ref(null);
const count = ref(0);
const cartStore = useCartStore()

const props = defineProps({
    id: String
})

onMounted(async () => {
    try {
        const res = await axios.get(`/products/${props.id}`);
        product.value = res.data;
    } catch (err) {
        console.error(err);
        alert("No se pudo cargar el producto");
    }
});

const increaseCount = () => {
    if (count.value < product.value.stock) count.value++;
};
const decreaseCount = () => {
    if (count.value > 0) count.value--;
};


const addToCart = () => {
    if (count.value === 0) return;
    cartStore.addManyToCart(props.id, count.value)
    count.value = 0;
}
</script>
