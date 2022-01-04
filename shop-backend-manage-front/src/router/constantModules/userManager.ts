import { RouteRecordRaw } from 'vue-router'
const UserManagerRouter: Array<RouteRecordRaw> = [
  {
    path: '/login',
    name: 'Login',
    meta: {
      title: '登陆系统',
      show: false
    },
    component: () => import('_c/Login')
  }
]
export default UserManagerRouter