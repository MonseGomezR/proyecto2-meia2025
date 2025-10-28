<template>
    <div class="min-h-screen bg-gray-50">
        <div class="max-w-7xl mx-auto p-6">
            <h2 class="text-3xl font-bold text-gray-800 mb-8 text-center">
                Reportes del Sistema
            </h2>

            <div
                class="flex flex-col md:flex-row items-center justify-between gap-4 mb-6 bg-white p-4 shadow rounded-lg">
                <div class="flex gap-4">
                    <div>
                        <label class="block text-sm text-gray-600">Desde</label>
                        <input type="date" v-model="startDate" class="border rounded-lg p-2" />
                    </div>
                    <div>
                        <label class="block text-sm text-gray-600">Hasta</label>
                        <input type="date" v-model="endDate" class="border rounded-lg p-2" />
                    </div>
                </div>

                <button @click="fetchReports"
                    class="px-4 py-2 bg-teal-600 text-white rounded-lg hover:bg-teal-700 transition">
                    Generar Reportes
                </button>
            </div>

            <div class="flex justify-center mb-6 border-b border-gray-200">
                <button v-for="tab in tabs" :key="tab.key" @click="activeTab = tab.key" :class="[
                    'px-6 py-2 font-medium transition-all duration-200',
                    activeTab === tab.key
                        ? 'border-b-4 border-teal-600 text-teal-700'
                        : 'text-gray-500 hover:text-gray-700'
                ]">
                    {{ tab.label }}
                </button>
            </div>

            <div class="bg-white shadow-md rounded-xl p-6 border border-gray-200">
                <div v-if="loading" class="text-center py-8 text-gray-500">
                    <i class="pi pi-spin pi-spinner" style="font-size: 2rem"></i>
                </div>

                <div v-else>
                    <div v-if="activeTab === 'top-products'">
                        <h3 class="text-xl font-semibold text-teal-700 mb-4">
                            Top 10 Productos más Vendidos
                        </h3>
                        <ul class="space-y-2">
                            <li v-for="(item, i) in reports.topProducts" :key="item.productId"
                                class="flex justify-between border-b pb-2">
                                <span>{{ i + 1 }}. {{ item.name }}</span>
                                <span class="font-medium">Vendidos: {{ item.totalSold }}</span>
                            </li>
                        </ul>
                    </div>

                    <div v-else-if="activeTab === 'top-clients-profit'">
                        <h3 class="text-xl font-semibold text-cyan-700 mb-4">
                            Top 5 Clientes con Más Ganancias
                        </h3>
                        <ul class="space-y-2">
                            <li v-for="(client, i) in reports.topClientsProfit" :key="client.clientId"
                                class="flex justify-between border-b pb-2">
                                <span>{{ i + 1 }}. {{ client.name }}</span>
                                <span class="font-medium">Q{{ client.totalProfit.toFixed(2) }}</span>
                            </li>
                        </ul>
                    </div>

                    <div v-else-if="activeTab === 'top-clients-sold'">
                        <h3 class="text-xl font-semibold text-blue-700 mb-4">
                            Top 5 Clientes con Más Ventas
                        </h3>
                        <ul class="space-y-2">
                            <li v-for="(client, i) in reports.topClientsSold" :key="client.clientId"
                                class="flex justify-between border-b pb-2">
                                <span>{{ i + 1 }}. {{ client.name }}</span>
                                <span class="font-medium">Productos vendidos: {{ client.totalSold }}</span>
                            </li>
                        </ul>
                    </div>

                    <div v-else-if="activeTab === 'top-clients-orders'">
                        <h3 class="text-xl font-semibold text-emerald-700 mb-4">
                            Top 10 Clientes con Más Pedidos
                        </h3>
                        <ul class="space-y-2">
                            <li v-for="(client, i) in reports.topClientsOrders" :key="client.clientId"
                                class="flex justify-between border-b pb-2">
                                <span>{{ i + 1 }}. {{ client.name }}</span>
                                <span class="font-medium">{{ client.totalOrders }} pedidos</span>
                            </li>
                        </ul>
                    </div>

                    <div v-else-if="activeTab === 'top-clients-products'">
                        <h3 class="text-xl font-semibold text-purple-700 mb-4">
                            Top 10 Clientes con Más Productos en Venta
                        </h3>
                        <ul class="space-y-2">
                            <li v-for="(client, i) in reports.topClientsProducts" :key="client.clientId"
                                class="flex justify-between border-b pb-2">
                                <span>{{ i + 1 }}. {{ client.name }}</span>
                                <span class="font-medium">{{ client.totalProducts }} productos</span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import { ref } from 'vue'
import axios from 'axios'

const tabs = [
    { key: 'top-products', label: 'Top Productos' },
    { key: 'top-clients-profit', label: 'Top Clientes (Ganancias)' },
    { key: 'top-clients-sold', label: 'Top Clientes (Ventas)' },
    { key: 'top-clients-orders', label: 'Top Clientes (Pedidos)' },
    { key: 'top-clients-products', label: 'Top Clientes (Productos en Venta)' }
]

const activeTab = ref('top-products')
const startDate = ref('')
const endDate = ref('')
const loading = ref(false)

const reports = ref({
    topProducts: [],
    topClientsProfit: [],
    topClientsSold: [],
    topClientsOrders: [],
    topClientsProducts: []
})

const fetchReports = async () => {
    loading.value = true
    try {
        const res = await axios.get('/admin/reports', {
            params: { startDate: startDate.value, endDate: endDate.value }
        })
        reports.value = res.data
    } catch (err) {
        console.error(err)
        alert('Error al cargar reportes')
    } finally {
        loading.value = false
    }
}
</script>
