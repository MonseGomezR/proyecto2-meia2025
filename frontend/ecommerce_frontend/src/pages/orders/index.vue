<template>
    <section class="max-w-5xl mx-auto p-6">
        <h2 class="text-3xl font-bold mb-6 text-center text-gray-800">
            Mis Ordenes
        </h2>

        <!-- Cargando -->
        <div v-if="cargando" class="text-center text-gray-500">
            <i class="pi pi-spin pi-spinner" style="font-size: 2rem"></i>
        </div>

        <!-- Sin ordenes -->
        <div v-else-if="ordenes.length === 0" class="text-center text-gray-500">
            Aun no tienes ordenes registradas.
        </div>

        <!-- Lista de ordenes -->
        <div v-else class="space-y-4">
            <div v-for="orden in ordenes" :key="orden.id"
                class="bg-white shadow rounded-lg p-4 border border-gray-200 hover:shadow-md transition-all duration-200">
                <div class="flex justify-between items-center">
                    <div>
                        <p>
                            <span class="font-semibold">Guia:</span>
                            {{ orden.guia }}
                        </p>
                        <p>
                            <span class="font-semibold">Fecha:</span>
                            {{ new Date(orden.created_at).toLocaleString() }}
                        </p>
                        <p>
                            <span class="font-semibold">Total:</span>
                            Q{{ orden.total.toFixed(2) }}
                        </p>
                        <p>
                            <span class="font-semibold">Estado:   </span>
                            <span class="px-3 py-1 rounded text-white text-sm" :class="{
                                'bg-yellow-500': orden.status.name === 'PENDIENTE',
                                'bg-orange-500': orden.status.name === 'EN PROCESO',
                                'bg-blue-500': orden.status.name === 'ENVIADO',
                                'bg-purple-600': orden.status.name === 'EN RUTA',
                                'bg-green-600': orden.status.name === 'COMPLETADO',
                                'bg-red-500': orden.status.name === 'CANCELADO'
                            }">
                                {{ nombresEstado[orden.status.name] }}
                            </span>
                        </p>
                    </div>

                    <router-link :to="`/orders/${orden.guia}`"
                        class="bg-teal-600 hover:bg-teal-700 text-white font-medium py-2 px-4 rounded-lg transition-all duration-200">
                        Ver detalles
                    </router-link>
                </div>
            </div>
        </div>
    </section>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import axios from 'axios'

const ordenes = ref([])
const cargando = ref(true)

const nombresEstado = {
    PENDIENTE: 'Pendiente',
    'EN PROCESO': 'En proceso',
    ENVIADO: 'Enviada',
    'EN RUTA': 'En ruta',
    COMPLETADO: 'Completado',
    CANCELADO: 'Cancelada'
}

onMounted(async () => {
    try {
        const { data } = await axios.get('/orders')
        ordenes.value = data
    } catch (error) {
        console.error('Error al cargar las ordenes:', error)
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
