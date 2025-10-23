<template>
    <div class="flex items-center justify-between border-b py-2">
        <div class="flex items-center gap-3">
            <img v-if="item.product.image_url" :src="item.product.image_url" alt="Imagen del producto"
                class="w-12 h-12 object-cover rounded-lg" />

            <div>
                <p class="font-medium">{{ item.product.name }}</p>

                <div class="flex items-center gap-2 mt-1">
                    <button @click="decreaseQuantity" class="px-2 py-1 bg-gray-200 rounded hover:bg-gray-300 text-sm">
                        <i class="pi pi-minus" style="color: red"></i>
                    </button>

                    <span class="font-semibold">{{ item.quantity }}</span>

                    <button @click="increaseQuantity" class="px-2 py-1 bg-gray-200 rounded hover:bg-gray-300 text-sm">
                        <i class="pi pi-plus" style="color: red"></i>
                    </button>
                </div>
            </div>
        </div>

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

const increaseQuantity = () => {
    cartStore.updateQuantity(props.item.id, props.item.quantity + 1)
}

const decreaseQuantity = () => {
    if (props.item.quantity > 1) {
        cartStore.updateQuantity(props.item.id, props.item.quantity - 1)
    } else {
        cartStore.removeFromCart(props.item.id)
    }
}

const removeFromCart = async (itemId) => {
    await cartStore.removeFromCart(itemId)
}
</script>
