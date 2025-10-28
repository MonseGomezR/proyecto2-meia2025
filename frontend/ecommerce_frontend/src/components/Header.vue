<template>
    <header class="bg-gradient-to-r from-teal-100 to-cyan-100 sticky top-0 z-50 shadow">
        <div class="max-w-screen-xl mx-auto px-4 py-4 flex justify-between items-center">
            <a href="/"
                class="flex items-center font-bold text-teal-600 text-2xl focus:outline-none focus:ring-2 focus:ring-teal-600 rounded">
                eCommerce GT
            </a>

            <nav class="hidden md:flex space-x-6">
                <a v-for="link in navLinks" :key="link.href" :href="link.href"
                    class="text-gray-700 hover:text-teal-600 transition-colors duration-200 focus:outline-none focus:ring-2 focus:ring-teal-600 rounded">
                    {{ link.label }}
                </a>
            </nav>

            <div class="hidden md:flex items-center space-x-4 relative">
                <template v-if="isAuthenticated">
                    <span class="text-gray-700">Hola, {{ name }}</span>

                    <div class="relative">
                        <button @click="toggleNotifications"
                            class="relative focus:outline-none focus:ring-2 focus:ring-teal-600 rounded p-2">
                            <i class="pi pi-bell text-gray-700 text-xl"></i>

                            <span v-if="unreadCount > 0"
                                class="absolute -top-1 -right-1 bg-red-600 text-white text-xs font-bold rounded-full px-1.5 py-0.5">
                                {{ unreadCount }}
                            </span>
                        </button>

                        <div v-if="showNotifications"
                            class="absolute right-0 mt-2 w-80 bg-white shadow-lg rounded border p-2 z-50 max-h-96 overflow-y-auto">
                            <div v-if="notifications.length === 0" class="text-gray-500 text-sm text-center py-2">
                                No hay notificaciones
                            </div>

                            <div v-for="note in notifications" :key="note.id">
                                <div v-if="!note.seen"
                                    class="border-b py-2 last:border-b-0 px-2 flex justify-between items-start"
                                    @click="router.push('/profile')">
                                    <div>
                                        <p class="font-semibold text-sm text-gray-800">{{ note.title }}</p>
                                    </div>

                                    <div class="flex flex-col items-end space-y-1">
                                        <button @click="markAsSeen(note.id)"
                                            class="text-blue-500 text-xs hover:underline">
                                            Ver
                                        </button>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                    <button @click="router.push('/profile')">
                        <i class="pi pi-user"></i>
                    </button>

                    <button @click="handleLogout"
                        class="bg-pink-600 hover:bg-pink-700 text-white px-4 py-2 rounded shadow">
                        Cerrar sesion
                    </button>
                </template>

                <template v-else>
                    <a href="/auth/login" class="bg-cyan-600 hover:bg-cyan-700 text-white px-4 py-2 rounded shadow">
                        Login
                    </a>
                    <a href="/auth/register" class="bg-teal-600 hover:bg-teal-700 text-white px-4 py-2 rounded shadow">
                        Register
                    </a>
                </template>
            </div>

            <button @click="toggleMenu"
                class="md:hidden p-2 focus:outline-none focus:ring-2 focus:ring-teal-600 rounded"
                :aria-expanded="isMenuOpen.toString()" aria-controls="mobile-menu" aria-label="Toggle menu">
                <span v-if="!isMenuOpen">☰</span>
                <span v-else>✕</span>
            </button>
        </div>
    </header>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'
import { useAuthStore } from '@/stores/auth'
import { useRouter } from 'vue-router'
import { useNotificationStore } from '@/stores/notifications'

const auth = useAuthStore()
const router = useRouter()

const notificationsStore = useNotificationStore()
const notifications = computed(() => notificationsStore.notifications)
const showNotifications = ref(false)
const unreadCount = computed(() => notifications.value.filter(n => !n.seen).length)

const toggleNotifications = async () => {
    showNotifications.value = !showNotifications.value
    if (showNotifications.value && auth.isAuthenticated) {
        await notificationsStore.fetchNotifications()
    }
}

const markAsSeen = (id) => {
    notificationsStore.markAsSeen(id)

}

const isAuthenticated = computed(() => auth.isAuthenticated)
const name = computed(() => auth.user?.person?.first_name + " " + auth.user?.person?.last_name || '')
const role = computed(() => auth.user?.roles?.[0] || '')

const navLinksCommon = []
const navLinksUser = [
    { href: '/', label: 'Inicio' },
    { href: '/orders', label: 'Ordenes' },
    { href: '/sales', label: 'Ventas' },
    { href: '/profile', label: 'Mi Perfil' }
]
const navLinksMod = []
const navLinksAdmin = []

const navLinks = computed(() => {
    if (role.value === 'ROLE_ADMIN') return navLinksAdmin
    if (role.value === 'ROLE_MODERATOR') return navLinksMod
    if (role.value === 'ROLE_USER') return navLinksUser
    return navLinksCommon
})

const isMenuOpen = ref(false)
const toggleMenu = () => (isMenuOpen.value = !isMenuOpen.value)
const handleLogout = () => {
    auth.logout()
    isMenuOpen.value = false
    router.replace('/auth/login')
}

onMounted(() => {
    if (auth.isAuthenticated) {
        notificationsStore.fetchNotifications()
    }
})
</script>
