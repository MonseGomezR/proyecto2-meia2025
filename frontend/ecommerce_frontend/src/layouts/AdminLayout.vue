<template>
  <div class="min-h-screen flex bg-gray-100">
    <SidebarAdmin class="w-64 bg-white shadow-md" />
    <div class="flex-1 flex flex-col">
        
      <TopbarAdmin class="h-16 bg-white shadow flex items-center px-6" />

      <main class="flex-1 p-6 overflow-auto">
        <slot />
      </main>

    </div>
  </div>
</template>

<script setup>
import SidebarAdmin from '@/components/SidebarAdmin.vue'
import TopbarAdmin from '@/components/TopbarAdmin.vue'
</script>
