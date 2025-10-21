<template>
  <div class="p-8">
    <h2 class="text-2xl font-bold mb-4">Bienvenido, {{ auth.user.username }}!</h2>
    <p>Esta es la página principal protegida.</p>
    <Product/>
  </div>
</template>

<script setup>
import { useAuthStore } from '@/stores/auth'
import Product from '@/components/Product.vue';
const auth = useAuthStore()
</script>
