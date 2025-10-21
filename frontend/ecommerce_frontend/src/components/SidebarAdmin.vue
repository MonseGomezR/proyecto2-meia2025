<template>
    <aside
        class="h-screen flex flex-col bg-white border-r transition-width duration-200"
        :class="collapsed ? 'w-20' : 'w-64'"
        aria-label="Admin sidebar"
    >
        <!-- Header -->
        <div class="flex items-center justify-between px-3 py-4 border-b">
            <div class="flex items-center gap-3">
                <div class="flex items-center justify-center bg-indigo-600 text-white rounded-md w-8 h-8">
                    
                    <span class="font-bold">A</span>
                </div>
                <span v-if="!collapsed" class="font-semibold text-gray-800">Admin</span>
            </div>

            <button
                @click="collapsed = !collapsed"
                :aria-expanded="!collapsed"
                class="p-2 rounded hover:bg-gray-100"
                title="Toggle sidebar"
            >
                <svg v-if="!collapsed" xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
                </svg>
                <svg v-else xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h7"/>
                </svg>
            </button>
        </div>

        <!-- Navigation -->
        <nav class="flex-1 overflow-y-auto py-4">
            <ul class="space-y-1 px-2">
                <li v-for="item in items" :key="item.name">
                    <router-link
                        :to="item.to"
                        class="flex items-center gap-3 px-3 py-2 rounded-md text-sm text-gray-700 hover:bg-gray-100"
                        :class="isActive(item.to) ? 'bg-gray-100 text-indigo-600 font-medium' : ''"
                        :title="collapsed ? item.name : null"
                    >
                        <span class="flex-none w-6 h-6">
                            <component :is="getIcon(item.icon)" class="w-6 h-6" />
                        </span>
                        <span v-if="!collapsed" class="truncate">{{ item.name }}</span>
                    </router-link>
                </li>
            </ul>
        </nav>

        <!-- Footer actions -->
        <div class="px-3 py-3 border-t">
            <button
                @click="goToSettings"
                class="w-full flex items-center gap-3 px-3 py-2 text-sm text-gray-700 rounded-md hover:bg-gray-100"
                :title="collapsed ? 'Settings' : null"
            >
                <span class="flex-none w-6 h-6">
                    <component :is="getIcon('settings')" class="w-6 h-6" />
                </span>
                <span v-if="!collapsed">Settings</span>
            </button>

            <button
                @click="logout"
                class="w-full mt-2 flex items-center gap-3 px-3 py-2 text-sm text-red-600 rounded-md hover:bg-red-50"
                :title="collapsed ? 'Logout' : null"
            >
                <span class="flex-none w-6 h-6">
                    <component :is="getIcon('logout')" class="w-6 h-6" />
                </span>
                <span v-if="!collapsed">Logout</span>
            </button>
        </div>
    </aside>
</template>

<script setup>
import { ref } from 'vue'
import { useRoute, useRouter } from 'vue-router'

const collapsed = ref(false)
const route = useRoute()
const router = useRouter()

const items = [
    { name: 'Dashboard', to: '/admin', icon: 'dashboard' },
    { name: 'Products', to: '/admin/products', icon: 'products' },
    { name: 'Orders', to: '/admin/orders', icon: 'orders' },
    { name: 'Users', to: '/admin/users', icon: 'users' }
]

const isActive = (to) => route.path === to || route.path.startsWith(to + '/')

function goToSettings() {
    router.push('/admin/settings')
}

function logout() {
    // replace with your real logout logic
    router.push('/login')
}

// Icons as inline functional components (keeps file self-contained)
const IconDashboard = {
    name: 'IconDashboard',
    render() {
        return (
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M13 5v6h6" />
            </svg>
        )
    }
}

const IconProducts = {
    name: 'IconProducts',
    render() {
        return (
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 13V7a2 2 0 00-2-2h-6l-2 2H6a2 2 0 00-2 2v6" />
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 21h8" />
            </svg>
        )
    }
}

const IconOrders = {
    name: 'IconOrders',
    render() {
        return (
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7h18M3 12h18M3 17h18" />
            </svg>
        )
    }
}

const IconUsers = {
    name: 'IconUsers',
    render() {
        return (
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20v-2a4 4 0 00-4-4H7a4 4 0 00-4 4v2" />
                <circle cx="9" cy="7" r="4" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" />
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 8a4 4 0 010 8" />
            </svg>
        )
    }
}

const IconSettings = {
    name: 'IconSettings',
    render() {
        return (
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3" />
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19.4 15a1.65 1.65 0 00.33 1.82l.06.06a2 2 0 11-2.83 2.83l-.06-.06a1.65 1.65 0 00-1.82-.33 1.65 1.65 0 00-1 1.51V21a2 2 0 11-4 0v-.09a1.65 1.65 0 00-1-1.51 1.65 1.65 0 00-1.82.33l-.06.06A2 2 0 114.27 17l.06-.06a1.65 1.65 0 00.33-1.82 1.65 1.65 0 00-1.51-1H3a2 2 0 110-4h.09a1.65 1.65 0 001.51-1 1.65 1.65 0 00-.33-1.82L4.21 6.7a2 2 0 112.83-2.83l.06.06a1.65 1.65 0 001.82.33H9a1.65 1.65 0 001-1.51V3a2 2 0 114 0v.09c.0.61.39 1.17 1 1.51.6.34 1.3.15 1.82-.33l.06-.06a2 2 0 112.83 2.83l-.06.06a1.65 1.65 0 00-.33 1.82V9c.0.61.39 1.17 1 1.51.6.34 1.3.15 1.82-.33l.06-.06a2 2 0 012.83 2.83l-.06.06a1.65 1.65 0 00-.33 1.82V15z" />
            </svg>
        )
    }
}

const IconLogout = {
    name: 'IconLogout',
    render() {
        return (
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7" />
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 8v8" />
            </svg>
        )
    }
}

function getIcon(name) {
    switch (name) {
        case 'dashboard': return IconDashboard
        case 'products': return IconProducts
        case 'orders': return IconOrders
        case 'users': return IconUsers
        case 'settings': return IconSettings
        case 'logout': return IconLogout
        default: return IconDashboard
    }
}
</script>