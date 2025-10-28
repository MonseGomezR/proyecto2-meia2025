<template>
    <div class="flex items-center justify-between border-b py-2">
        <div class="flex items-center gap-3">
            <img v-if="item.product.image_url" :src="item.product.image_url" alt="Imagen del producto"
                class="w-12 h-12 object-cover rounded-lg" />
            <div>
                <p class="font-medium">{{ item.product.name }}</p>

                <div class="flex items-center gap-2 mt-1">


                    <span class="font-semibold">{{ item.quantity }}</span>


                </div>
            </div>
        </div>

        <!-- SECCION: BOTTOM -->
        <div class="flex items-center gap-3">
            <p class="font-semibold">
                Q{{ (item.product.price * item.quantity).toFixed(2) }}
            </p>
            <button @click="removeFromCart(item.id)" class="text-red-500 hover:text-red-700"
                title="Eliminar del carrito">
                <i class="pi pi-trash" style="color: red"></i>
            </button>
        </div>
    </div>
</template>

<script setup>
import { useCartStore } from '@/stores/carts'

const props = defineProps({
    item: { type: Object, required: true },
})

const cartStore = useCartStore()

const removeFromCart = async (itemId) => {
    await cartStore.removeFromCart(itemId)
}
</script>
