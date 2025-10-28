import { defineStore } from 'pinia'
import axios from 'axios'
import { useNotificationStore } from './notifications'

export const useAuthStore = defineStore('auth', {
  state: () => ({
    token: localStorage.getItem('token') || null,
    user: JSON.parse(localStorage.getItem('user')) || null,
  }),

  getters: {
    isAuthenticated: state => !!state.token,
    userRole: state => state.user?.roles?.[0] || null,
    person: state => state.user?.person || null,
  },

  actions: {
    async login(username, password) {
      const res = await axios.post('/auth/login', { username, password })

      const { token, username: userName, email, roles, person } = res.data

      this.$patch({
        user: { username: userName, email, roles, person },
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
      const notificationStore = useNotificationStore()
      notificationStore.notifications = []
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
