<template>
    <header class="bg-gradient-to-r from-teal-100 to-cyan-100 sticky top-0 z-50 shadow">
        <div class="max-w-screen-xl mx-auto px-4 py-4 flex justify-between items-center">

            <!-- Logo -->
            <a href="/"
                class="flex items-center font-bold text-teal-600 text-2xl focus:outline-none focus:ring-2 focus:ring-teal-600 rounded">
                eCommerce GT
            </a>

            <!-- Desktop Nav -->
            <nav class="hidden md:flex space-x-6">
                <a v-for="link in navLinks" :key="link.href" :href="link.href"
                    class="text-gray-700 hover:text-teal-600 transition-colors duration-200 focus:outline-none focus:ring-2 focus:ring-teal-600 rounded">
                    {{ link.label }}
                </a>
            </nav>

            <!-- Desktop Auth Buttons -->
            <div class="hidden md:flex items-center space-x-4">
                <template v-if="isAuthenticated">
                    <span class="text-gray-700">Hola, {{ username }}</span>
                    <button @click="handleLogout"
                        class="bg-red-600 hover:bg-red-700 text-white px-4 py-2 rounded shadow">
                        Cerrar sesión
                    </button>
                </template>
                <template v-else>
                    <a href="/auth/login" class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded shadow">Login</a>
                    <a href="/auth/register"
                        class="bg-green-600 hover:bg-green-700 text-white px-4 py-2 rounded shadow">Register</a>
                </template>
            </div>

            <!-- Mobile Menu Button -->
            <button @click="toggleMenu"
                class="md:hidden p-2 focus:outline-none focus:ring-2 focus:ring-teal-600 rounded"
                :aria-expanded="isMenuOpen.toString()" aria-controls="mobile-menu" aria-label="Toggle menu">
                <!-- icon simple -->
                <span v-if="!isMenuOpen">☰</span>
                <span v-else>✕</span>
            </button>

        </div>

        <!-- Mobile Menu -->
        <div v-if="isMenuOpen" id="mobile-menu" class="md:hidden bg-white shadow-lg py-4 px-4">
            <nav>
                <ul class="flex flex-col space-y-3">
                    <li v-for="link in navLinks" :key="link.href">
                        <a :href="link.href" class="block text-gray-700 hover:text-teal-600 py-2 px-2 rounded"
                            @click="toggleMenu">
                            {{ link.label }}
                        </a>
                    </li>

                    <template v-if="isAuthenticated">
                        <li>
                            <span class="block text-gray-700 py-2 px-2">Hola, {{ username }}</span>
                        </li>
                        <li>
                            <button @click="handleLogout"
                                class="w-full bg-red-600 hover:bg-red-700 text-white py-2 px-2 rounded">
                                Cerrar sesión
                            </button>
                        </li>
                    </template>

                    <template v-else>
                        <li>
                            <a href="/auth/login"
                                class="block bg-blue-600 hover:bg-blue-700 text-white text-center py-2 px-2 rounded"
                                @click="toggleMenu">
                                Login
                            </a>
                        </li>
                        <li>
                            <a href="/auth/register"
                                class="block bg-green-600 hover:bg-green-700 text-white text-center py-2 px-2 rounded"
                                @click="toggleMenu">
                                Register
                            </a>
                        </li>
                    </template>
                </ul>
            </nav>
        </div>

    </header>
</template>

<script setup>
import { ref, computed } from 'vue'
import { useAuthStore } from '@/stores/auth'
import { useRouter } from 'vue-router'

const auth = useAuthStore()
const router = useRouter()

console.log(auth.token)

const isAuthenticated = computed(() => auth.isAuthenticated)
const username = computed(() => auth.user?.username || '')

const isMenuOpen = ref(false)
const toggleMenu = () => {
    isMenuOpen.value = !isMenuOpen.value
}

const handleLogout = () => {
    auth.logout()
    isMenuOpen.value = false
    router.replace('/auth/login')
}

const navLinks = ref([
    { href: '#productos', label: 'Productos' },
    { href: '#tecnologia', label: 'Tecnologia' },
    { href: '#hogar', label: 'Hogar' },
    { href: '#academico', label: 'Academico' },
    { href: '#personal', label: 'Personal' },
    { href: '#decoracion', label: 'Decoracion' },
    { href: '#varios', label: 'Varios' },
])
</script>

<style scoped>
#mobile-menu {
    transition: all 0.3s ease-in-out;
}
</style>
