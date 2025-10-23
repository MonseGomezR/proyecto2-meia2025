import { defineStore } from 'pinia'
import { ref } from 'vue'

export const useUiStore = defineStore('ui', () => {
    const showCart = ref(false)
    const toggleCart = () => (showCart.value = !showCart.value)
    const openCart = () => (showCart.value = true)
    const closeCart = () => (showCart.value = false)

    return { showCart, toggleCart, openCart, closeCart }
})
