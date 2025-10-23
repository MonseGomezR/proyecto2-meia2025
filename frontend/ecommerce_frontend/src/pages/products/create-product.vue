<template>
    <div class="max-w-md mx-auto bg-white p-6 rounded-lg shadow">
        <h2 class="text-xl font-bold mb-4">Crear producto</h2>

        <form @submit.prevent="createProduct">
            <!-- Nombre -->
            <div class="mb-3">
                <label class="block font-semibold mb-1">Nombre</label>
                <input v-model="product.name" class="border rounded w-full p-2" required />
            </div>

            <!-- Descripción -->
            <div class="mb-3">
                <label class="block font-semibold mb-1">Descripción</label>
                <textarea v-model="product.description" class="border rounded w-full p-2" rows="3"></textarea>
            </div>

            <!-- Precio -->
            <div class="mb-3">
                <label class="block font-semibold mb-1">Precio</label>
                <input v-model.number="product.price" type="number" class="border rounded w-full p-2" min="0"
                    required />
            </div>

            <!-- Stock -->
            <div class="mb-3">
                <label class="block font-semibold mb-1">Stock</label>
                <input v-model.number="product.stock" type="number" class="border rounded w-full p-2" min="0"
                    required />
            </div>

            <!-- Estado: Nuevo o Usado -->
            <div class="mb-3">
                <label class="block font-semibold mb-1">Estado</label>
                <select v-model="product.state" class="border rounded w-full p-2" required>
                    <option value="" disabled>Selecciona...</option>
                    <option value="NEW">Nuevo</option>
                    <option value="USED">Usado</option>
                </select>
            </div>

            <!-- Categorías -->
            <div class="mb-3">
                <label class="block font-semibold mb-2">Categorías</label>
                <div class="grid grid-cols-2 gap-2">
                    <label v-for="cat in categories" :key="cat.id"
                        class="flex items-center space-x-2 border p-2 rounded hover:bg-gray-50 cursor-pointer">
                        <input type="checkbox" :value="cat.id" v-model="product.categories" class="accent-blue-600" />
                        <span>{{ cat.name }}</span>
                    </label>
                </div>
                <p class="text-sm text-gray-600 mt-2">
                    Seleccionadas: {{ product.categories.length }}
                </p>
            </div>

            <!-- Imagen (URL) -->
            <div class="mb-3">
                <label class="block font-semibold mb-1">Imagen (URL)</label>
                <input v-model="product.image_url" placeholder="Pega un enlace de imagen..."
                    class="border rounded w-full p-2 mb-2" />
            </div>

            <!-- Vista previa -->
            <div v-if="product.image_url" class="mt-3">
                <p class="font-medium mb-1">Vista previa:</p>
                <img :src="product.image_url" alt="Vista previa"
                    class="rounded-lg shadow w-full object-cover max-h-64" />
            </div>

            <!-- Botón de submit -->
            <button type="submit" class="mt-4 bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700 w-full"
                :disabled="loading">
                {{ loading ? "Guardando..." : "Guardar producto" }}
            </button>
        </form>
    </div>
</template>

<script setup>
import { reactive, ref, onMounted } from "vue";
import axios from "axios";

const product = reactive({
    name: "",
    description: "",
    image_url: "",
    price: 0,
    stock: 1,
    state: "", 
    categories: [],
});

const categories = ref([]);
const loading = ref(false);

const fetchCategories = async () => {
    try {
        const res = await axios.get("/products/categories");
        categories.value = res.data;
    } catch (err) {
        console.error(err);
        alert("No se pudieron cargar las categorías");
    }
};

onMounted(fetchCategories);

const createProduct = async () => {
    if (!product.name || !product.price || !product.stock || !product.image_url || !product.state) {
        alert("Por favor completa todos los campos obligatorios.");
        return;
    }

    try {
        loading.value = true;
        const productToSend = { ...product, status: "WAITING" };
        await axios.post("/products/create", productToSend);
        alert("Producto creado correctamente");

        // Reset form
        Object.assign(product, {
            name: "",
            description: "",
            price: 0,
            stock: 1,
            categories: [],
            image_url: "",
            state: "",
        });
    } catch (err) {
        console.error(err);
        alert(err.response?.data?.message || err.message);
    } finally {
        loading.value = false;
    }
};
</script>
