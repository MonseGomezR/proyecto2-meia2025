<template>
    <div class="min-h-screen bg-gray-50">
        <div class="max-w-6xl mx-auto p-6">
            <h2 class="text-3xl font-bold text-gray-800 mb-8 text-center">Ordenes</h2>

            <div class="flex justify-center mb-6 border-b border-gray-200">
                <button @click="activeTab = 'ready'" :class="[
                    'px-6 py-2 font-medium transition-all duration-200',
                    activeTab === 'ready'
                        ? 'border-b-4 border-teal-600 text-teal-700'
                        : 'text-gray-500 hover:text-gray-700'
                ]">
                    Listos para Envio
                </button>
                <button @click="activeTab = 'route'" :class="[
                    'px-6 py-2 font-medium transition-all duration-200',
                    activeTab === 'route'
                        ? 'border-b-4 border-cyan-600 text-cyan-700'
                        : 'text-gray-500 hover:text-gray-700'
                ]">
                    En Ruta
                </button>
                <button @click="activeTab = 'delivered'" :class="[
                    'px-6 py-2 font-medium transition-all duration-200',
                    activeTab === 'delivered'
                        ? 'border-b-4 border-pink-600 text-pink-700'
                        : 'text-gray-500 hover:text-gray-700'
                ]">
                    Completados
                </button>
            </div>

            <div v-if="activeTab === 'ready'">
                <div v-if="loadingReady" class="text-center text-gray-600 py-8">
                    <i class="pi pi-spin pi-spinner" style="font-size: 2rem"></i>
                </div>

                <div v-else-if="readyOrders.length === 0" class="text-center text-gray-500 py-8">
                    No hay ordenes listas para envio.
                </div>

                <div v-else class="space-y-6">
                    <div v-for="order in readyOrders" :key="order.id"
                        class="bg-white shadow-md rounded-xl p-5 border border-gray-200 flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
                        <div>
                            <h3 class="text-xl font-semibold text-gray-800">
                                Guia: <span class="text-teal-600">{{ order.guia }}</span>
                            </h3>
                            <p class="text-sm text-gray-600 mt-1">
                                Cliente: <span class="font-medium">{{ order.user.username }}</span>
                            </p>
                            <p class="text-sm text-gray-600">
                                Total: <span class="font-medium">Q{{ order.total.toFixed(2) }}</span>
                            </p>
                            <p class="text-sm text-gray-600">
                                Fecha de creacion:
                                <span class="font-medium">{{ formatDate(order.created_at) }}</span>
                            </p>
                            <p v-if="isLate(order.created_at)" class="text-sm text-red-600 font-semibold mt-1">
                                Pedido atrasado (mas de 5 dias sin envio)
                            </p>
                        </div>

                        <div class="flex gap-2">
                            <button @click="updateStatus(order.id)"
                                class="px-4 py-2 bg-teal-600 hover:bg-teal-700 text-white rounded-lg transition">
                                Marcar como En Ruta
                            </button>

                            <button v-if="isLate(order.created_at)" @click="penalizar(order.user.id)"
                                class="px-4 py-2 bg-red-500 hover:bg-red-600 text-white rounded-lg transition">
                                Penalizar Usuario
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <div v-else-if="activeTab === 'route'">
                <div v-if="loadingEnRuta" class="text-center text-gray-600 py-8">
                    <i class="pi pi-spin pi-spinner" style="font-size: 2rem"></i>
                </div>

                <div v-else-if="enRutaOrders.length === 0" class="text-center text-gray-500 py-8">
                    No hay ordenes en ruta.
                </div>

                <div v-else class="space-y-6">
                    <div v-for="order in enRutaOrders" :key="order.id"
                        class="bg-white shadow-md rounded-xl p-5 border border-gray-200 flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
                        <div>
                            <h3 class="text-xl font-semibold text-gray-800">
                                Guia: <span class="text-cyan-600">{{ order.guia }}</span>
                            </h3>
                            <p class="text-sm text-gray-600 mt-1">
                                Cliente: <span class="font-medium">{{ order.user.username }}</span>
                            </p>
                            <p class="text-sm text-gray-600">
                                Total: <span class="font-medium">Q{{ order.total.toFixed(2) }}</span>
                            </p>
                            <p class="text-sm text-gray-600">
                                Fecha de Envio:
                                <span class="font-medium">{{ formatDate(order.ship_date) }}</span>
                            </p>
                        </div>

                        <div class="flex gap-2">
                            <button @click="updateStatus(order.id)"
                                class="px-4 py-2 bg-cyan-600 hover:bg-cyan-700 text-white rounded-lg transition">
                                Marcar como Entregada
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div v-else-if="activeTab === 'delivered'">
                <div v-if="loadingCompleto" class="text-center text-gray-600 py-8">
                    <i class="pi pi-spin pi-spinner" style="font-size: 2rem"></i>
                </div>

                <div v-else-if="completedOrders.length === 0" class="text-center text-gray-500 py-8">
                    No hay ordenes completas
                </div>

                <div v-else class="space-y-6">
                    <div v-for="order in completedOrders" :key="order.id"
                        class="bg-white shadow-md rounded-xl p-5 border border-gray-200 flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
                        <div>
                            <h3 class="text-xl font-semibold text-gray-800">
                                Guia: <span class="text-pink-600">{{ order.guia }}</span>
                            </h3>
                            <p class="text-sm text-gray-600 mt-1">
                                Cliente: <span class="font-medium">{{ order.user.username }}</span>
                            </p>
                            <p class="text-sm text-gray-600">
                                Total: <span class="font-medium">Q{{ order.total.toFixed(2) }}</span>
                            </p>
                            <p class="text-sm text-gray-600">
                                Fecha de Entrega:
                                <span class="font-medium">{{ formatDate(order.delivery_date) }}</span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import axios from 'axios'

const activeTab = ref('ready')
const readyOrders = ref([])
const enRutaOrders = ref([])
const completedOrders = ref([])
const loadingReady = ref(true)
const loadingEnRuta = ref(true)
const loadingCompleto = ref(true)

const fetchReadyOrders = async () => {
    loadingReady.value = true
    try {
        const res = await axios.get('/orders/ready-to-send')
        readyOrders.value = res.data
    } catch (e) {
        console.error('Error al obtener ordenes listas para envio:', e)
    } finally {
        loadingReady.value = false
    }
}

const fetchEnRutaOrders = async () => {
    loadingEnRuta.value = true
    try {
        const res = await axios.get('/orders/in-route')
        enRutaOrders.value = res.data
    } catch (e) {
        console.error('Error al obtener ordenes en ruta:', e)
    } finally {
        loadingEnRuta.value = false
    }
}

const fetchCompletos = async () => {
    loadingCompleto.value = true
    try {
        const res = await axios.get('/orders/completed')
        completedOrders.value = res.data
    } catch (e) {
        console.error('Error al obtener ordenes completas:', e)
    } finally {
        loadingCompleto.value = false
    }
}

const updateStatus = async (orderId) => {
    loadingReady.value = true
    loadingEnRuta.value = true
    loadingCompleto.value = true
    try {
        await axios.post(`/orders/update-status/${orderId}`)
        const order = readyOrders.value.find(o => o.id === orderId)
        if (order) {
            if (order.status.name === 'EN RUTA') {
                alert('Orden marcada como En Ruta.')
                enRutaOrders.value.unshift(order)
                readyOrders.value = readyOrders.value.filter(o => o.id !== orderId)
                activeTab.value = 'route'
            } else if (order.status.name === 'COMPLETADO') {
                alert('Orden marcada como Completada.')
                completedOrders.value.unshift(order)
                enRutaOrders.value = enRutaOrders.value.filter(o => o.id !== orderId)
                activeTab.value = 'delivered'
            }
        }
    } catch (e) {
        console.error('Error al marcar como En Ruta:', e)
    } finally {
        fetchReadyOrders()
        fetchEnRutaOrders()
        fetchCompletos()
    }
}


const penalizar = async (userId) => {
    try {
        await axios.post(`/users/penalizar/${userId}`)
        alert('Usuario penalizado correctamente.')
    } catch (e) {
        console.error('Error al penalizar usuario:', e)
    }
}

const formatDate = (dateString) => {
    const date = new Date(dateString)
    return date.toLocaleDateString()
}

const isLate = (createdAt) => {
    const created = new Date(createdAt)
    const today = new Date()
    const diffDays = Math.floor((today - created) / (1000 * 60 * 60 * 24))
    return diffDays > 5
}

onMounted(() => {
    fetchReadyOrders()
    fetchEnRutaOrders()
    fetchCompletos()
})
</script>


<style scoped>
button:disabled {
    opacity: 0.6;
    cursor: not-allowed;
}
</style>
