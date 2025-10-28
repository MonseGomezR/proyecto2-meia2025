<template>
    <section class="max-w-4xl mx-auto p-6">
        <!-- Encabezado -->
        <h2 class="text-3xl font-bold mb-6 text-gray-800 text-center">Mi Perfil</h2>

        <div v-if="userInfo" class="bg-white shadow rounded-2xl p-6 mb-8">
            <h3 class="text-xl font-semibold text-teal-600 mb-4">Informacion del usuario</h3>
            <div class="grid sm:grid-cols-2 gap-4 text-gray-700">
                <p><span class="font-medium">Nombre:</span> {{ userInfo.firstName }} {{ userInfo.lastName }}</p>
                <p><span class="font-medium">Correo:</span> {{ userInfo.email }}</p>
                <p><span class="font-medium">Direccion:</span> {{ userInfo.address }}</p>
                <p><span class="font-medium">Telefono:</span> {{ userInfo.phone }}</p>
                <p><span class="font-medium">Ganancias:</span> {{ userInfo.ganancias.toFixed(2) }}</p>
            </div>
        </div>
        <div v-else class="text-center text-gray-500 py-4">
            <i class="pi pi-spin pi-spinner" style="font-size: 2rem;"></i>
        </div>

        <div class="bg-white shadow rounded-2xl p-6">
            <div class="flex justify-between items-center mb-4">
                <h3 class="text-xl font-semibold text-teal-600">Notificaciones</h3>
                <button @click="markAllAsSeen"
                    class="bg-teal-500 hover:bg-teal-600 text-white px-3 py-1.5 rounded text-sm shadow">
                    Marcar todas como leidas
                </button>
            </div>

            <div v-if="loading" class="text-center text-gray-500 py-4">Cargando notificaciones...</div>

            <div v-else-if="notifications.length === 0" class="text-center text-gray-500 py-4">
                No tienes notificaciones.
            </div>

            <ul v-else class="divide-y divide-gray-200">
                <li v-for="note in notifications" :key="note.id"
                    class="p-4 hover:bg-gray-50 transition flex justify-between items-start">
                    <div>
                        <h4 class="font-semibold text-gray-800">{{ note.title }}</h4>
                        <p class="text-gray-600 text-sm">{{ note.description }}</p>
                    </div>
                    <span class="text-xs font-medium" :class="note.seen ? 'text-gray-400' : 'text-teal-600'">
                        {{ note.seen ? 'Leida' : 'Nueva' }}
                    </span>
                </li>
            </ul>
        </div>
    </section>
</template>

<script setup>
import { onMounted, ref } from 'vue'
import { useAuthStore } from '@/stores/auth'
import { useNotificationStore } from '@/stores/notifications'
import axios from 'axios'

const auth = useAuthStore()
const notificationStore = useNotificationStore()

const notifications = ref([])
const loading = ref(true)
const userInfo = ref(null)

const fetchInfo = async () => {
    const res = await axios.get('/users/me')
    userInfo.value = res.data
}

const fetchNotifications = async () => {
    loading.value = true
    await notificationStore.fetchNotifications()
    notifications.value = notificationStore.notifications
    loading.value = false
}

const markAllAsSeen = async () => {
    await notificationStore.markAllAsSeen()
    await fetchNotifications()
}

onMounted(() => {
    fetchNotifications()
    fetchInfo()
})
</script>

<style scoped>
h3 {
    border-bottom: 2px solid #14b8a6;
    padding-bottom: 0.3rem;
}
</style>
