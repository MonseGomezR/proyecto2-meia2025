import { createRouter, createWebHistory } from 'vue-router'
import routes from 'virtual:generated-pages'
import { useAuthStore } from '@/stores/auth'
import { roleRestrictions } from './roleRestrictions'

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

router.beforeEach((to, from, next) => {
  const auth = useAuthStore()
  auth.initializeAuth()

  // Buscar la primera ruta registrada (padre o hija) que tenga restricciones
  const matchedRoute = to.matched.find(r => roleRestrictions[r.path])
  const requiredRoles = matchedRoute ? roleRestrictions[matchedRoute.path] : undefined

  if (requiredRoles) {
    if (!auth.isAuthenticated) {
      alert('Inicia sesion para acceder a esta pagina')
      return next('/')
    }

    const hasRole = requiredRoles.some(role => auth.user?.roles.includes(role))
    if (!hasRole) {
      alert('No tienes permisos para acceder a esta pagina')
      if(auth.user?.roles.includes('ROLE_ADMIN')) {
        return next('/admin/dashboard')
      } else if(auth.user?.roles.includes('ROLE_LOGISTIC')) {
        return next('/envios')
      } else if(auth.user?.roles.includes('ROLE_MODERATOR')) {
        return next('/moderation')
      } else {
        return next('/')
      }
    }
  }

  next()
})



export default router
