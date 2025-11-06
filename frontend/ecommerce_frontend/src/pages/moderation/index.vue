<template>
    <div class="min-h-screen bg-gray-50">
        <div class="max-w-6xl mx-auto p-6">
            <h2 class="text-3xl font-bold text-gray-800 mb-8 text-center">
                Panel de Aprobación
            </h2>

            <div class="flex justify-center mb-6 border-b border-gray-200">
                <button @click="activeTab = 'pending'" :class="[
                    'px-6 py-2 font-medium transition-all duration-200',
                    activeTab === 'pending'
                        ? 'border-b-4 border-teal-600 text-teal-700'
                        : 'text-gray-500 hover:text-gray-700'
                ]">
                    Productos Pendientes
                </button>

                <button @click="activeTab = 'processed'" :class="[
                    'px-6 py-2 font-medium transition-all duration-200',
                    activeTab === 'processed'
                        ? 'border-b-4 border-teal-600 text-teal-700'
                        : 'text-gray-500 hover:text-gray-700'
                ]">
                    Productos Existentes
                </button>

                <button @click="activeTab = 'users'" :class="[
                    'px-6 py-2 font-medium transition-all duration-200',
                    activeTab === 'users'
                        ? 'border-b-4 border-cyan-600 text-cyan-700'
                        : 'text-gray-500 hover:text-gray-700'
                ]">
                    Usuarios Registrados
                </button>
            </div>

            <div v-if="activeTab === 'pending'" class="bg-white shadow-md rounded-xl p-6 border border-gray-200">
                <h3 class="text-xl font-semibold text-teal-700 mb-4">Aprobación de Productos</h3>

                <div v-if="loadingPending" class="text-center text-gray-500 py-6">
                    <i class="pi pi-spin pi-spinner" style="font-size: 2rem"></i>
                </div>

                <div v-else-if="pendingProducts.length === 0" class="text-center text-gray-500 py-6">
                    No hay productos pendientes de aprobación.
                </div>

                <div v-else class="space-y-4">
                    <div v-for="product in pendingProducts" :key="product.id"
                        class="bg-gray-50 rounded-xl p-5 border border-gray-200 flex flex-col md:flex-row justify-between items-start md:items-center gap-4 hover:bg-gray-100 transition">
                        <div class="flex-1 flex flex-col gap-2">
                            <h3 class="text-xl font-semibold text-gray-800">{{ product.name }}</h3>
                            <p class="text-sm text-gray-600">{{ product.description }}</p>
                            <p class="text-sm text-gray-600 font-medium">Precio: Q{{ product.price.toFixed(2) }}</p>
                            <p class="text-sm text-gray-600 font-medium">
                                Estado: {{ product.state === 'NEW' ? 'Nuevo' : 'Usado' }}
                            </p>
                            <div class="flex flex-wrap gap-2">
                                <span v-for="cat in product.categories" :key="cat.id"
                                    class="px-2 py-1 bg-gray-200 rounded text-sm">{{ cat.name }}</span>
                            </div>
                        </div>

                        <div class="flex gap-2 mt-2 md:mt-0">
                            <button @click="approveProduct(product.id)"
                                class="px-4 py-2 bg-teal-600 hover:bg-teal-700 text-white rounded-lg transition">
                                Aprobar
                            </button>
                            <button @click="rejectProduct(product.id)"
                                class="px-4 py-2 bg-pink-500 hover:bg-pink-600 text-white rounded-lg transition">
                                Rechazar
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <div v-else-if="activeTab === 'processed'" class="bg-white shadow-md rounded-xl p-6 border border-gray-200">
                <h3 class="text-xl font-semibold text-teal-700 mb-4">Productos Existentes</h3>

                <div v-if="loadingProcessed" class="text-center text-gray-500 py-6">
                    <i class="pi pi-spin pi-spinner" style="font-size: 2rem"></i>
                </div>

                <div v-else-if="processedProducts.length === 0" class="text-center text-gray-500 py-6">
                    No hay productos aprobados o rechazados.
                </div>

                <div v-else class="space-y-4">
                    <div v-for="product in processedProducts" :key="product.id"
                        class="bg-gray-50 rounded-xl p-5 border border-gray-200 flex flex-col gap-2 hover:bg-gray-100 transition">
                        <div class="flex justify-between items-center">
                            <div>
                                <h3 class="text-xl font-semibold text-gray-800">{{ product.name }}</h3>
                                <p class="text-sm text-gray-600">{{ product.description }}</p>
                                <p class="text-sm text-gray-600 font-medium">Precio: Q{{ product.price.toFixed(2) }}</p>
                                <p class="text-sm text-gray-600 font-medium">
                                    Estado: {{ product.state === 'NEW' ? 'Nuevo' : 'Usado' }}
                                </p>
                            </div>
                            <span :class="[
                                'px-3 py-1 text-sm font-medium rounded-lg',
                                product.status === 'APPROVED'
                                    ? 'bg-teal-100 text-teal-700'
                                    : product.status === 'REJECTED'
                                    ? 'bg-pink-100 text-pink-700'
                                    : 'bg-gray-100 text-gray-700'
                            ]">
                                {{ product.status  }}
                            </span>
                        </div>
                    </div>
                </div>
            </div>

            <div v-else-if="activeTab === 'users'" class="bg-white shadow-md rounded-xl p-6 border border-gray-200">
                <h3 class="text-xl font-semibold text-cyan-700 mb-4">Usuarios Registrados</h3>

                <div v-if="loadingUsers" class="text-center text-gray-500 py-6">
                    <i class="pi pi-spin pi-spinner" style="font-size: 2rem"></i>
                </div>

                <div v-else-if="users.length === 0" class="text-center text-gray-500 py-6">
                    No hay usuarios registrados.
                </div>

                <div v-else class="space-y-3">
                    <div v-for="user in users" :key="user.id"
                        class="border border-gray-200 rounded-lg p-4 bg-gray-50 hover:bg-gray-100 transition">
                        <p class="text-gray-700 font-semibold">{{ user.firstName }} {{ user.lastName }}</p>
                        <p class="text-sm text-gray-600">Correo: {{ user.email }}</p>
                        <p class="text-sm text-gray-600">DPI: {{ user.dpi }}</p>
                        <p class="text-sm text-gray-600">Teléfono: {{ user.phone }}</p>
                        <p class="text-sm text-gray-600">Dirección: {{ user.address }}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import axios from 'axios'

const activeTab = ref('pending')
const pendingProducts = ref([])
const processedProducts = ref([])
const users = ref([])

const loadingPending = ref(true)
const loadingProcessed = ref(false)
const loadingUsers = ref(false)

const fetchPendingProducts = async () => {
    loadingPending.value = true
    try {
        const res = await axios.get('/products/waiting')
        pendingProducts.value = res.data
    } catch (err) {
        console.error(err)
        alert('Error al cargar productos pendientes')
    } finally {
        loadingPending.value = false
    }
}

const fetchProcessedProducts = async () => {
    loadingProcessed.value = true
    try {
        const res = await axios.get('/products/all')
        processedProducts.value = res.data
    } catch (err) {
        console.error(err)
        alert('Error al cargar productos existentes')
    } finally {
        loadingProcessed.value = false
    }
}

const fetchUsers = async () => {
    loadingUsers.value = true
    try {
        const res = await axios.get('/admin/usuarios')
        users.value = res.data
    } catch (err) {
        console.error(err)
        alert('Error al cargar usuarios')
    } finally {
        loadingUsers.value = false
    }
}

const approveProduct = async (id) => {
    console.log(id)
    try {
        await axios.put(`/products/${id}/approve`)
        
        pendingProducts.value = pendingProducts.value.filter(p => p.id !== id)
        fetchProcessedProducts()
        alert('Producto aprobado correctamente')
    } catch (err) {
        console.error(err)
        alert('No se pudo aprobar el producto')
    }
}

const rejectProduct = async (id) => {
    try {
        await axios.put(`/products/${id}/reject`)
        pendingProducts.value = pendingProducts.value.filter(p => p.id !== id)
        fetchProcessedProducts()
        alert('Producto rechazado')
    } catch (err) {
        console.error(err)
        alert('No se pudo rechazar el producto')
    }
}

onMounted(() => {
    fetchPendingProducts()
    fetchProcessedProducts()
    fetchUsers()
})
</script>
