<!-- src/layouts/UserLayout.vue -->
<template>
  <div class="min-h-screen flex flex-col">
    <!-- Navbar -->
    <NavbarUser />

    <main class="flex-1 container mx-auto px-4 py-6">
      <slot />
    </main>

    <Footer />
  </div>
</template>

<script setup>
import NavbarUser from '@/components/NavbarUser.vue'
import Footer from '@/components/Footer.vue'
</script>


