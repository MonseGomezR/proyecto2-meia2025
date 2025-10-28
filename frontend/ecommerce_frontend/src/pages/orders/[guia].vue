<template>
    <div>
        <a href="/orders">
            <button
                class="absolute top-25 left-5 text-gray-600 hover:text-gray-800 text-m underline disabled:text-gray-400 transition-all duration-200">
                Volver a mis ordenes
            </button>
        </a>
    </div>

    <div class="max-w-3xl mx-auto p-6 m-10">
        <h2 class="text-3xl font-bold mb-6 text-center text-gray-800">
            Estado de tu pedido
        </h2>

        <div v-if="cargando" class="text-center text-gray-500">
            <i class="pi pi-spin pi-spinner" style="font-size: 2rem"></i>
        </div>

        <div v-else-if="!orden" class="text-center text-red-500">
            No se encontro la orden.
        </div>

        <div v-else class="space-y-6">
            <div class="bg-white shadow rounded-lg p-4 border border-gray-200">
                <p><span class="font-semibold">Numero de guia:</span> {{ orden.guia }}</p>
                <p><span class="font-semibold">Fecha de creacion:</span> {{ new Date(orden.created_at).toLocaleString()
                    }}</p>
                <p><span class="font-semibold">Total:</span> Q{{ orden.total.toFixed(2) }}</p>
                <p>
                    <span class="font-semibold">Estado actual: </span>
                    <span class="px-3 py-1 rounded text-white text-sm" :class="estadoColor(estado.name)">
                        {{ nombresEstado[estado.name] }}
                    </span>
                </p>
            </div>

            <div class="relative">
                <div class="absolute top-1/2 transform -translate-y-1/2 w-full h-1 bg-gray-300"></div>
                <div class="absolute top-1/2 transform -translate-y-1/2 h-1 bg-cyan-600 transition-all duration-700"
                    :style="{ width: ((progreso + 1) / estados.length) * 100 + '%' }"></div>

                <div class="flex justify-between mt-6">
                    <div v-for="(estadoPaso, index) in estados" :key="estadoPaso"
                        class="flex flex-col items-center relative">
                        <div class="w-12 h-12 rounded-full flex items-center justify-center text-white text-xl transition-all duration-500 shadow-md"
                            :class="{
                                'bg-cyan-600': index <= progreso,
                                'bg-gray-300 text-gray-500': index > progreso
                            }">
                            <i :class="iconosEstado[estadoPaso]"></i>
                        </div>
                        <p class="text-sm mt-2 text-gray-700 font-medium">
                            {{ nombresEstado[estadoPaso] }}
                        </p>
                    </div>
                </div>
            </div>

            <div class="space-y-4 mt-6">
                <h3 class="text-xl font-semibold">Productos</h3>
                <div v-for="item in orden.orderItems" :key="item.id"
                    class="p-3 border rounded-lg border-gray-200 bg-gray-50">
                    <div class="flex justify-between mb-2">
                        <p class="font-medium">{{ item.product.name }} (x{{ item.cantidad }})</p>
                        <span class="px-2 py-1 text-sm rounded text-white" :class="estadoColor(item.status.name)">
                            {{ miniNombresEstado[item.status.name] }}
                        </span>
                    </div>

                    <div class="relative h-2 bg-gray-300 rounded-full">
                        <div class="absolute h-2 rounded-full bg-cyan-600 transition-all duration-500"
                            :style="{ width: miniProgress(item) + '%' }"></div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</template>

<script setup>
import { ref, onMounted, computed } from 'vue'
import axios from 'axios'

const orden = ref(null)
const cargando = ref(true)
const estado = ref(null)

const props = defineProps({ guia: String })

const estados = ['PENDIENTE', 'EN PROCESO', 'ENVIADO', 'EN RUTA', 'COMPLETADO']

const nombresEstado = {
    PENDIENTE: 'Pendiente',
    'EN PROCESO': 'En proceso',
    ENVIADO: 'Enviado',
    'EN RUTA': 'En ruta',
    COMPLETADO: 'Completado',
    CANCELADO: 'Cancelada',
}

const iconosEstado = {
    PENDIENTE: 'pi pi-clock',
    'EN PROCESO': 'pi pi-cog',
    ENVIADO: 'pi pi-send',
    'EN RUTA': 'pi pi-truck',
    COMPLETADO: 'pi pi-check-circle',
    CANCELADO: 'pi pi-times-circle'
}

// Nombres reducidos para mini-progreso
const miniNombresEstado = {
    PENDIENTE: 'Pendiente',
    'EN PROCESO': 'En proceso',
    ENVIADO: 'Enviado'
}

// Colores
const estadoColor = (estado) => {
    switch (estado) {
        case 'PENDIENTE': return 'bg-yellow-500'
        case 'EN PROCESO': return 'bg-cyan-500'
        case 'ENVIADO': return 'bg-purple-500'
        case 'EN RUTA': return 'bg-green-600'
        case 'COMPLETADO': return 'bg-blue-600'
        case 'CANCELADO': return 'bg-red-500'
        default: return 'bg-gray-400'
    }
}

const miniEstadoColor = (estado) => {
    switch (estado) {
        case 'PENDIENTE': return 'bg-yellow-500'
        case 'EN PROCESO': return 'bg-orange-500'
        case 'ENVIADO': return 'bg-blue-500'
        default: return 'bg-gray-400'
    }
}

// Progreso general de la orden
const progreso = computed(() => {
    if (!estado.value) return 0
    const idx = estados.indexOf(estado.value.name)
    return idx >= 0 ? idx : 0
})

// Progreso mini de cada OrderItem
const miniEstados = ['PENDIENTE', 'EN PROCESO', 'ENVIADO']
const miniProgress = (item) => {
    const idx = miniEstados.indexOf(item.status.name)
    return idx >= 0 ? ((idx + 1) / miniEstados.length) * 100 : 0
}

// Cargar orden
onMounted(async () => {
    try {
        const { data } = await axios.get(`/orders/${props.guia}`)
        orden.value = data
        estado.value = data.status
    } catch (error) {
        console.error('Error al cargar la orden:', error)
    } finally {
        cargando.value = false
    }
})
</script>

<style scoped>
section {
    animation: fadeIn 0.4s ease;
}

@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(5px);
    }

    to {
        opacity: 1;
        transform: translateY(0);
    }
}
</style>