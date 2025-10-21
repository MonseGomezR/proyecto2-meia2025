import { defineStore } from 'pinia'
import axios from 'axios'

export const useAuthStore = defineStore('auth', {
  state: () => ({
    token: localStorage.getItem('token') || null,
    user: JSON.parse(localStorage.getItem('user')) || null,
  }),
  getters: {
    isAuthenticated: state => !!state.token
  },
  actions: {
    async login(username, password) {
      const res = await axios.post('/auth/login', { username, password })
      const { token, username: userName, email, roles } = res.data

      this.$patch({
        user: { username: userName, email, roles },
        token: token
      })

      localStorage.setItem('token', token)
      localStorage.setItem('user', JSON.stringify(this.user))

      axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
    },

    async register(formData) {
      await axios.post('/auth/register', formData)
    },

    logout() {
      this.token = null
      this.user = null
      localStorage.removeItem('token')
      localStorage.removeItem('user')
      delete axios.defaults.headers.common['Authorization']
    },
    initializeAuth() {
      const token = localStorage.getItem('token')
      if (token) {
        this.token = token
        axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
      }
    }
  }
})
