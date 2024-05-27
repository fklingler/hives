import { createRouter, createWebHistory } from 'vue-router'
import Hives from '../views/Hives.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'hives',
      component: Hives
    },
    {
      path: '/hives/:id',
      name: 'hive-detail',
      // route level code-splitting
      // this generates a separate chunk (About.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import('../views/HiveDetails.vue')
    },
    {
      // Catch-all route that redirects to root path
      path: '/:pathMatch(.*)*',
      redirect: '/'
    }
  ]
})

export default router
