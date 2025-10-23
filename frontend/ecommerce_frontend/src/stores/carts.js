import { defineStore } from 'pinia'
import { ref, computed } from 'vue'
import axios from 'axios'
import { useUiStore } from './ui'

export const useCartStore = defineStore('cart', () => {
    const cart = ref({ id: null, items: [], total: 0 })
    const loading = ref(false)

    const ui = useUiStore()

    const itemCount = computed(() =>
        cart.value.items.reduce((sum, i) => sum + i.quantity, 0)
    )

    const fetchCart = async () => {
        loading.value = true
        try {
            const res = await axios.get('/cart')
            cart.value = res.data
        } finally {
            loading.value = false
        }
    }

    const addToCart = async (product, quantity = 1) => {
        await axios.post('/cart/add', {
            id: product.id,
            quantity,
        })
        await fetchCart()
        ui.openCart()
    }

    const addManyToCart = async (product, quantity) => {
        await axios.post('/cart/add', {
            id: product.id,
            quantity,
        })
        await fetchCart()
        ui.openCart()
    }

    const removeFromCart = async (itemId) => {
        await axios.delete(`/cart/remove/${itemId}`)
        await fetchCart()
    }

    const clearCart = async () => {
        for (const item of cart.value.items) {
            await axios.delete(`/cart/remove/${item.id}`)
        }
        await fetchCart()
    }

    const updateQuantity = async (itemId, newQuantity) => {
        const item = this.items.find(i => i.id === itemId)
        if (item) {
            item.quantity = newQuantity
        }
    }

    return {
        cart,
        itemCount,
        loading,
        fetchCart,
        addToCart,
        addManyToCart,
        removeFromCart,
        clearCart,
        updateQuantity,
    }
})
