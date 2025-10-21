import { createRouter, createWebHistory } from 'vue-router'
import routes from 'virtual:generated-pages'
import { useAuthStore } from '@/stores/auth'
import { roleRestrictions } from './roleRestrictions'
import UserLayout from '../layouts/UserLayout.vue'
import AdminLayout from '../layouts/AdminLayout.vue'

const router = createRouter({
  history: createWebHistory(),
  routes: [
    ...routes,
    {
      path: '/:pathMatch(.*)*',
      redirect: '/'
    }
  ]
})

routes.forEach(route => {
  if (route.path.startsWith('/admin')) {
    route.component = AdminLayout
  } else {
    route.component = UserLayout
  }
})

router.beforeEach((to, from, next) => {
  const auth = useAuthStore()
  auth.initializeAuth()

  const requiredRoles = roleRestrictions[to.path]

  if (requiredRoles) {
    if (!auth.isAuthenticated) {
      alert('Inicia sesión para acceder a esta página')
      return next('/')
    }

    if (!requiredRoles.some(role => auth.user?.roles.includes(role))) {
      alert('No tienes permisos para acceder a esta página')
      return next('/')
    }
  }

  next()
})


export default router
