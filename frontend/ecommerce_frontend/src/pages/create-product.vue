<template>
    <div class="max-w-md mx-auto bg-white p-6 rounded-lg shadow">
        <h2 class="text-xl font-bold mb-4">Crear producto</h2>

        <form @submit.prevent="createProduct">
            <div class="mb-3">
                <label class="block font-semibold mb-1">Nombre</label>
                <input v-model="product.name" class="border rounded w-full p-2" required />
            </div>

            <div class="mb-3">
                <label class="block font-semibold mb-1">Descripción</label>
                <textarea v-model="product.description" class="border rounded w-full p-2" rows="3"></textarea>
            </div>

            <div class="mb-3">
                <label class="block font-semibold mb-1">Precio</label>
                <input v-model.number="product.price" type="number" class="border rounded w-full p-2" required />
            </div>

            <div class="mb-3">
                <label class="block font-semibold mb-1">Stock</label>
                <input v-model.number="product.stock" type="number" class="border rounded w-full p-2" required />
            </div>

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

            <div class="mb-3">
                <label class="block font-semibold mb-1">Imagen (URL o archivo)</label>
                <input v-model="imageUrl" placeholder="Pega un enlace de imagen..."
                    class="border rounded w-full p-2 mb-2" />
                <input type="file" @change="handleFileUpload" class="block w-full" />
            </div>

            <div v-if="previewUrl" class="mt-3">
                <p class="font-medium mb-1">Vista previa:</p>
                <img :src="previewUrl" alt="Vista previa" class="rounded-lg shadow w-full object-cover max-h-64" />
            </div>

            <button type="submit" class="mt-4 bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700 w-full"
                :disabled="loading">
                {{ loading ? "Guardando..." : "Guardar producto" }}
            </button>
        </form>
    </div>

</template>

<script setup>
import { ref, reactive, onMounted, watch } from "vue";
import axios from "axios";
import { useAuthStore } from "@/stores/auth";

const auth = useAuthStore();
auth.initializeAuth();

const product = reactive({
    name: "",
    description: "",
    price: 0,
    stock: 0,
    categories: [],
    image_url: "",
});

const categories = ref([]);
const imageUrl = ref("");
const file = ref(null);
const previewUrl = ref("");
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

watch(imageUrl, (newUrl) => {
    previewUrl.value = newUrl || "";
});

const handleFileUpload = (event) => {
    const selectedFile = event.target.files[0];
    file.value = selectedFile;
    if (selectedFile) previewUrl.value = URL.createObjectURL(selectedFile);
};

const uploadToCloudinary = async (file) => {
    const formData = new FormData();
    formData.append("file", file);

    const response = await axios.post("/products/upload", formData);
    return response.data.url;
};

const createProduct = async () => {
    try {
        loading.value = true;

        let finalImageUrl = imageUrl.value;
        if (!finalImageUrl && file.value) {
            finalImageUrl = await uploadToCloudinary(file.value);
        }
        if (!finalImageUrl) {
            alert("Por favor, sube o pega una imagen.");
            return;
        }

        const productToSend = {
            name: product.name,
            description: product.description,
            image_url: finalImageUrl,
            price: product.price,
            stock: product.stock,
            categories: product.categories,
            state: "WAITING",
        };

        await axios.post("/products", productToSend);
        alert("Producto creado correctamente");

        Object.assign(product, {
            name: "",
            description: "",
            price: 0,
            stock: 0,
            categories: [],
        });
        imageUrl.value = "";
        file.value = null;
        previewUrl.value = "";
    } catch (err) {
        console.error(err);
        alert(err.response?.data?.message || err.message);
    } finally {
        loading.value = false;
    }
};
</script>