import { defineStore } from 'pinia'
import axios from 'axios'

export const useNotificationStore = defineStore('notifications', {
    state: () => ({
        notifications: [],
    }),
    actions: {
        async fetchNotifications() {
            try {
                const { data } = await axios.get('/notifications/my-notifications')
                this.notifications = data
            } catch (e) {
                console.error('Error al cargar notificaciones', e)
            }
        },
        async markAsSeen(notificationId) {
            try {
                await axios.put(`/notifications/mark-as-seen/${notificationId}`)
                const notification = this.notifications.find(n => n.id === notificationId)
                if (notification) notification.seen = true
            } catch (e) {
                console.error('Error al marcar notificacion como leida', e)
            }
        },
        async add(notification) {
            try {
                const { data } = await axios.post('/notifications', notification)
                this.notifications.unshift(data)
            } catch (e) {
                console.error('Error al agregar notificacion', e)
            }
        },
        async delete(notificationId) {
            try {
                await axios.delete(`/notifications/${notificationId}`)
                this.notifications = this.notifications.filter(n => n.id !== notificationId)
            } catch (e) {
                console.error('Error al eliminar notificacion', e)
            }
        },
        async markAllAsSeen() {
            this.notifications.forEach(element => {
                this.markAsSeen(element.id)
            });
        }
    }
})
