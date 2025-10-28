<template>
    <div>
        <a href="/">
            <button
                class="absolute top-25 left-5 text-gray-600 hover:text-gray-800 text-m underline disabled:text-gray-400 transition-all duration-200">
                Volver al inicio
            </button>
        </a>
        <div v-if="product" class="max-w-3xl mx-auto mt-6 p-6 bg-white rounded-lg shadow">
            <div class="flex flex-col md:flex-row gap-6">
                <img :src="product.image_url" alt="Imagen producto"
                    class="rounded-lg w-full md:w-1/3 object-cover max-h-80" />

                <div class="flex-1 flex flex-col gap-4">
                    <h1 class="text-2xl font-bold">{{ product.name }}</h1>
                    <p class="text-gray-600">{{ product.description }}</p>
                    <p class="font-semibold text-lg">Precio: Q{{ product.price.toFixed(2) }}</p>
                    <p class="text-sm text-gray-500">Estado: {{ stateLabel(product.state) }}</p>

                    <div class="flex flex-wrap gap-2">
                        <span v-for="cat in product.categories" :key="cat.id"
                            class="px-2 py-1 bg-gray-200 rounded text-sm">{{ cat.name }}</span>
                    </div>

                    <p class="mt-2">
                        <span :class="product.stock > 0 ? 'text-teal-600' : 'text-pink-600'">
                            Stock: {{ product.stock }}
                        </span>
                    </p>

                    <div v-if="isUser" class="flex items-center gap-3 mt-2">
                        <button @click="decreaseCount"
                            class="px-3 py-1 bg-gray-200 rounded hover:bg-gray-300">-</button>
                        <span class="font-semibold">{{ count }}</span>
                        <button @click="increaseCount"
                            class="px-3 py-1 bg-gray-200 rounded hover:bg-gray-300">+</button>
                    </div>

                    <div>
                        <button v-if="isUser" @click="addToCart" :disabled="count === 0 || product.stock === 0"
                            class="mt-3 px-4 py-2 bg-pink-600 text-white rounded hover:bg-pink-700 disabled:bg-gray-400">
                            Agregar al carrito.
                        </button>

                        <button v-else-if="isMod"
                            class="mt-3 px-4 py-2 bg-pink-600 text-white rounded hover:bg-pink-700 disabled:bg-gray-400">
                            Administrar
                        </button>

                        <button v-else @click="goToLogin"
                            class="mt-3 px-4 py-2 bg-cyan-600 text-white rounded hover:bg-cyan-700 disabled:bg-gray-400">
                            Inicia sesión para comprar y vender.
                        </button>
                    </div>

                    <div class="mt-4">
                        <p class="font-medium mb-1">Rating:</p>
                        <div class="flex gap-1">
                            <span v-for="star in 5" :key="star" class="text-yellow-400">★</span>
                            <span class="text-gray-500 ml-2">({{ reviews.length }} reviews)</span>
                        </div>
                    </div>

                    <div class="mt-6">
                        <h2 class="text-lg font-semibold mb-3">Opiniones de usuarios</h2>

                        <div v-if="reviews.length === 0" class="text-gray-500 mb-4">
                            Aún no hay opiniones.
                        </div>

                        <div v-else class="space-y-3 mb-4">
                            <div v-for="review in reviews" :key="review.id" class="border rounded p-3 bg-gray-50">
                                <p class="font-semibold text-gray-800">{{ review.user.username }}</p>
                                <p class="text-sm text-gray-600">{{ review.comment }}</p>
                                <p class="text-xs text-gray-400">{{ formatDate(review.createdAt) }}</p>
                            </div>
                        </div>

                        <div v-if="isUser" class="mt-4">
                            <h3 class="font-semibold mb-2">Deja tu opinión</h3>
                            <textarea v-model="newReview" rows="3"
                                class="w-full border rounded p-2 focus:ring-2 focus:ring-teal-500 outline-none"
                                placeholder="Escribe tu opinión..." required></textarea>
                            <button @click="submitReview"
                                class="mt-2 px-4 py-2 bg-teal-600 text-white rounded hover:bg-teal-700"
                                :disabled="!newReview.trim()">
                                Enviar opinión
                            </button>
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
import { ref, onMounted, computed } from "vue";
import { useRoute } from "vue-router";
import axios from "axios";
import { useCartStore } from "@/stores/carts";
import { useAuthStore } from "@/stores/auth";
import CartFloating from "@components/CartFloating.vue";
import router from "../../router";

const route = useRoute();
const auth = useAuthStore()
const product = ref(null);
const count = ref(0);
const cartStore = useCartStore()

const stateLabel = (state) => {
    if (!state) return ''
    return state === 'NEW' ? 'Nuevo' : state === 'USED' ? 'Usado' : state
}

const role = computed(() => auth.user?.roles?.[0] || '')
const isAuthenticated = computed(() => auth.isAuthenticated)
const isUser = computed(() => role.value === 'ROLE_USER')
const isMod = computed(() => role.value === 'ROLE_MODERATOR' || role.value === 'ROLE_ADMIN')

const props = defineProps({
    id: String
})

const reviews = ref([])
const newReview = ref("")

onMounted(async () => {
    try {
        const res = await axios.get(`/products/${props.id}`);
        product.value = res.data;

        //const reviewsRes = await axios.get(`/products/${props.id}/reviews`)
        //reviews.value = reviewsRes.data
    } catch (err) {
        console.error(err);
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
    cartStore.addManyToCart(product.value, count.value)
    count.value = 0;
}

const goToLogin = () => {
    router.replace('/auth/login')
}

const formatDate = (dateStr) => new Date(dateStr).toLocaleString()

const submitReview = async () => {
    if (!newReview.value.trim()) return
    try {
        await axios.post(`/products/${props.id}/reviews`, { comment: newReview.value })
        reviews.value.unshift({
            id: Date.now(),
            user: { username: auth.user.username },
            comment: newReview.value,
            createdAt: new Date().toISOString()
        })
        newReview.value = ""
    } catch (err) {
        console.error(err)
        alert("No se pudo enviar la opinión")
    }
}
</script>
