<template>
    <aside
        class="h-screen flex flex-col bg-white border-r transition-width duration-200"
        :class="collapsed ? 'w-20' : 'w-64'"
        aria-label="Admin sidebar"
    >
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
                        </span>
                        <span v-if="!collapsed" class="truncate">{{ item.name }}</span>
                    </router-link>
                </li>
            </ul>
        </nav>

        <div class="px-3 py-3 border-t">
            <button
                @click="goToSettings"
                class="w-full flex items-center gap-3 px-3 py-2 text-sm text-gray-700 rounded-md hover:bg-gray-100"
                :title="collapsed ? 'Settings' : null"
            >
                <span class="flex-none w-6 h-6">
                </span>
                <span v-if="!collapsed">Settings</span>
            </button>

            <button
                @click="logout"
                class="w-full mt-2 flex items-center gap-3 px-3 py-2 text-sm text-red-600 rounded-md hover:bg-red-50"
                :title="collapsed ? 'Logout' : null"
            >
                <span class="flex-none w-6 h-6">
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
    router.push('/login')
}


</script>