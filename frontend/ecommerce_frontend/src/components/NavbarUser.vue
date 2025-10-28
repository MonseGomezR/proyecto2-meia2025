<template>
    <header class="bg-white shadow">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="relative flex justify-between items-center h-16">
                <div class="flex items-center">
                    <router-link to="/" class="text-xl font-semibold text-gray-800">MyShop</router-link>

                    <nav class="hidden sm:flex sm:ml-8 sm:space-x-4">
                        <router-link to="/" class="px-3 py-2 text-sm text-gray-700 hover:text-gray-900">Home</router-link>
                        <router-link to="/shop" class="px-3 py-2 text-sm text-gray-700 hover:text-gray-900">Shop</router-link>
                        <router-link to="/orders" class="px-3 py-2 text-sm text-gray-700 hover:text-gray-900">Orders</router-link>
                        <router-link to="/support" class="px-3 py-2 text-sm text-gray-700 hover:text-gray-900">Support</router-link>
                    </nav>
                </div>

                <div class="flex items-center">
                    <div class="hidden sm:flex sm:items-center sm:space-x-3">
                        <div class="flex items-center space-x-3">
                            <div class="w-8 h-8 rounded-full bg-indigo-500 text-white flex items-center justify-center text-sm font-medium">
                                {{ initials }}
                            </div>
                            <button
                                ref="btn"
                                @click="toggleDropdown"
                                class="text-sm text-gray-700 hover:text-gray-900 focus:outline-none"
                                aria-haspopup="true"
                                :aria-expanded="dropdownOpen"
                            >
                                <span class="font-medium">{{ user.name }}</span>
                            </button>
                        </div>

                        <div
                            v-if="dropdownOpen"
                            ref="dropdown"
                            class="origin-top-right absolute right-4 mt-12 w-48 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 z-50"
                        >
                            <div class="py-1">
                                <router-link to="/profile" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Profile</router-link>
                                <router-link to="/settings" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Settings</router-link>
                                <button @click="logout" class="w-full text-left px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Logout</button>
                            </div>
                        </div>
                    </div>

                    <button
                        @click="toggleMobile"
                        class="sm:hidden ml-3 px-3 py-2 rounded bg-gray-100 text-sm text-gray-700 hover:bg-gray-200 focus:outline-none"
                        aria-controls="mobile-menu"
                        :aria-expanded="mobileOpen"
                    >
                        {{ mobileOpen ? 'Close' : 'Menu' }}
                    </button>
                </div>
            </div>
        </div>

        <div v-if="mobileOpen" id="mobile-menu" class="sm:hidden border-t border-gray-200">
            <div class="px-4 pt-4 pb-3 space-y-1">
                <router-link to="/" class="block px-3 py-2 text-base text-gray-700 hover:bg-gray-50 rounded">Home</router-link>
                <router-link to="/shop" class="block px-3 py-2 text-base text-gray-700 hover:bg-gray-50 rounded">Shop</router-link>
                <router-link to="/orders" class="block px-3 py-2 text-base text-gray-700 hover:bg-gray-50 rounded">Orders</router-link>
                <router-link to="/support" class="block px-3 py-2 text-base text-gray-700 hover:bg-gray-50 rounded">Support</router-link>

                <div class="pt-3 border-t border-gray-200">
                    <div class="flex items-center space-x-3 px-3">
                        <div class="w-10 h-10 rounded-full bg-indigo-500 text-white flex items-center justify-center text-sm font-medium">
                            {{ initials }}
                        </div>
                        <div>
                            <div class="text-sm font-medium text-gray-800">{{ user.name }}</div>
                            <div class="text-xs text-gray-500">{{ user.email }}</div>
                        </div>
                    </div>
                    <div class="mt-3 px-3 space-y-1">
                        <router-link to="/profile" class="block px-3 py-2 text-sm text-gray-700 hover:bg-gray-50 rounded">Profile</router-link>
                        <router-link to="/settings" class="block px-3 py-2 text-sm text-gray-700 hover:bg-gray-50 rounded">Settings</router-link>
                        <button @click="logout" class="w-full text-left px-3 py-2 text-sm text-gray-700 hover:bg-gray-50 rounded">Logout</button>
                    </div>
                </div>
            </div>
        </div>
    </header>
</template>

<script setup>
import { ref, computed, onMounted, onBeforeUnmount } from 'vue'

const props = defineProps({
    user: {
        type: Object,
        default: () => ({ name: 'User', email: '' })
    }
})
const emit = defineEmits(['logout'])

const mobileOpen = ref(false)
const dropdownOpen = ref(false)
const btn = ref(null)
const dropdown = ref(null)

const initials = computed(() => {
    const name = props.user?.name || 'User'
    return name
        .split(' ')
        .filter(Boolean)
        .map(n => n[0])
        .slice(0, 2)
        .join('')
        .toUpperCase()
})

function toggleMobile() {
    mobileOpen.value = !mobileOpen.value
    if (mobileOpen.value) dropdownOpen.value = false
}

function toggleDropdown() {
    dropdownOpen.value = !dropdownOpen.value
}

function logout() {
    emit('logout')
    dropdownOpen.value = false
    mobileOpen.value = false
}

function handleClickOutside(e) {
    if (!dropdownOpen.value) return
    const btnEl = btn.value
    const dropdownEl = dropdown.value
    if (btnEl && dropdownEl && !btnEl.contains(e.target) && !dropdownEl.contains(e.target)) {
        dropdownOpen.value = false
    }
}

onMounted(() => document.addEventListener('click', handleClickOutside))
onBeforeUnmount(() => document.removeEventListener('click', handleClickOutside))
</script>