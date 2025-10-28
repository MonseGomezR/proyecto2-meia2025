<template>
    <section class="p-6 max-w-5xl mx-auto">
        <h2 class="text-2xl font-bold mb-4 text-center">Productos</h2>

        <!-- TABS -->
        <div class="flex justify-center mb-6 border-b border-gray-200">
            <button @click="activeTab = 'create'" :class="[
                'px-6 py-2 font-medium transition-all duration-200',
                activeTab === 'create'
                    ? 'border-b-4 border-teal-600 text-teal-700'
                    : 'text-gray-500 hover:text-gray-700'
            ]">
                Crear Producto
            </button>
            <button @click="activeTab = 'sales'" :class="[
                'px-6 py-2 font-medium transition-all duration-200',
                activeTab === 'sales'
                    ? 'border-b-4 border-cyan-600 text-cyan-700'
                    : 'text-gray-500 hover:text-gray-700'
            ]">
                Ventas
            </button>
        </div>

        <!-- SECCION: NUEVO PRODUCTO -->
        <div v-if="activeTab === 'create'" class="bg-white shadow-md rounded-xl p-6 border border-gray-200">
            <h3 class="text-xl font-semibold text-teal-700 mb-4">Agregar nuevo producto</h3>
            <form @submit.prevent="createProduct" class="space-y-4">
                <div>
                    <label class="block font-semibold mb-1">Nombre</label>
                    <input v-model="product.name"
                        class="w-full border rounded-lg p-2 focus:ring-2 focus:ring-teal-500 outline-none" required />
                </div>
                <div>
                    <label class="block font-semibold mb-1">Descripcion</label>
                    <textarea v-model="product.description"
                        class="w-full border rounded-lg p-2 focus:ring-2 focus:ring-teal-500 outline-none"
                        rows="3"></textarea>
                </div>
                <div>
                    <label class="block font-semibold mb-1">Precio</label>
                    <input v-model.number="product.price" type="number" min="0"
                        class="w-full border rounded-lg p-2 focus:ring-2 focus:ring-teal-500 outline-none" required />
                </div>
                <div>
                    <label class="block font-semibold mb-1">Stock</label>
                    <input v-model.number="product.stock" type="number" min="1"
                        class="w-full border rounded-lg p-2 focus:ring-2 focus:ring-teal-500 outline-none" required />
                </div>
                <div>
                    <label class="block font-semibold mb-1">Estado</label>
                    <select v-model="product.state"
                        class="w-full border rounded-lg p-2 focus:ring-2 focus:ring-teal-500 outline-none" required>
                        <option value="" disabled>Selecciona...</option>
                        <option value="NEW">Nuevo</option>
                        <option value="USED">Usado</option>
                    </select>
                </div>
                <div>
                    <label class="block font-semibold mb-2">Categorias</label>
                    <div class="grid grid-cols-2 gap-2">
                        <label v-for="cat in categories" :key="cat.id"
                            class="flex items-center space-x-2 border p-2 rounded hover:bg-gray-50 cursor-pointer">
                            <input type="checkbox" :value="cat.id" v-model="product.categories"
                                class="accent-blue-600" />
                            <span>{{ cat.name }}</span>
                        </label>
                    </div>
                    <p class="text-sm text-gray-600 mt-2">Seleccionadas: {{ product.categories.length }}</p>
                </div>
                <div>
                    <label class="block font-semibold mb-1">Imagen (URL)</label>
                    <input v-model="product.image_url" placeholder="Pega un enlace de imagen..."
                        class="w-full border rounded-lg p-2 mb-2 focus:ring-2 focus:ring-teal-500 outline-none" />
                    <div v-if="product.image_url" class="mt-3">
                        <p class="font-medium mb-1">Vista previa:</p>
                        <img :src="product.image_url" alt="Vista previa"
                            class="rounded-lg shadow w-full object-cover max-h-64" />
                    </div>
                </div>
                <button type="submit" class="mt-4 bg-teal-600 text-white px-4 py-2 rounded hover:bg-teal-700 w-full"
                    :disabled="loading">
                    {{ loading ? "Guardando..." : "Guardar producto" }}
                </button>
            </form>
        </div>

        <!-- SECCION: PRODUCTOS VENDIDOS -->
        <div v-else-if="activeTab === 'sales'" class="bg-white shadow-md rounded-xl p-6 border border-gray-200">
            <h3 class="text-xl font-semibold text-cyan-700 mb-4">Productos vendidos</h3>
            <div v-if="loadingSales" class="text-center text-gray-500">
                <i class="pi pi-spin pi-spinner" style="font-size: 2rem"></i>
            </div>
            <div v-else-if="orderItems.length === 0" class="text-center text-gray-500">
                No tienes productos vendidos aun.
            </div>
            <table v-else class="w-full table-auto border-collapse border border-gray-300">
                <thead class="bg-teal-200">
                    <tr>
                        <th class="border px-4 py-2">Producto</th>
                        <th class="border px-4 py-2">Cantidad</th>
                        <th class="border px-4 py-2">Subtotal</th>
                        <th class="border px-4 py-2">Estado</th>
                        <th class="border px-4 py-2">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="item in orderItems" :key="item.id">
                        <td class="border px-4 py-2">{{ item.product.name }}</td>
                        <td class="border px-4 py-2">{{ item.cantidad }}</td>
                        <td class="border px-4 py-2">{{ item.subtotal.toFixed(2) }}</td>
                        <td class="border px-4 py-2">{{ item.status.name }}</td>
                        <td class="border px-4 py-2">
                            <button :disabled="completed(item)"
                                class="bg-cyan-500 text-white px-3 py-1 rounded hover:bg-cyan-600 disabled:bg-gray-400"
                                @click="advanceStatus(item)">
                                Avanzar Estado
                            </button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
</template>

<script setup>
import { reactive, ref, onMounted } from 'vue';
import axios from 'axios';

const activeTab = ref('create');

const product = reactive({
    name: '',
    description: '',
    image_url: '',
    price: 0,
    stock: 1,
    state: '',
    categories: []
});

const categories = ref([]);
const loading = ref(false);

const orderItems = ref([]);
const loadingSales = ref(true);

const fetchCategories = async () => {
    try {
        const res = await axios.get('/products/categories');
        categories.value = res.data;
    } catch (err) {
        console.error(err);
        alert('No se pudieron cargar las categorias');
    }
};

const createProduct = async () => {
    if (!product.name || !product.price || !product.stock || !product.state) {
        alert('Por favor completa todos los campos obligatorios.');
        return;
    }

    try {
        loading.value = true;
        const productToSend = { ...product, status: 'WAITING' };
        await axios.post('/products/create', productToSend);
        alert('Producto creado correctamente');
        Object.assign(product, {
            name: '',
            description: '',
            price: 0,
            stock: 1,
            categories: [],
            image_url: '',
            state: ''
        });
    } catch (err) {
        console.error(err);
        alert(err.response?.data?.message || err.message);
    } finally {
        loading.value = false;
    }
};

const fetchSoldProducts = async () => {
    loadingSales.value = true;
    try {
        const { data } = await axios.get('/orders/my-sales');
        orderItems.value = data;
    } catch (err) {
        console.error(err);
    } finally {
        loadingSales.value = false;
    }
};

const completed = (item) => item.status.name === 'ENVIADO' || item.status.name === 'CANCELADO';

const advanceStatus = async (item) => {
    try {
        await axios.post(`/orders/update-order-item/${item.id}`);
        fetchSoldProducts();
    } catch (err) {
        console.error(err);
    }
};

onMounted(() => {
    fetchCategories();
    fetchSoldProducts();
});
</script>

<style scoped>
table {
    border-spacing: 0;
}

th,
td {
    text-align: left;
}

button:disabled {
    opacity: 0.6;
    cursor: not-allowed;
}
</style>
