import { RouteRecordRaw } from 'vue-router'
const goodsManage: Array<RouteRecordRaw> = [
  {
    path: '/',
    name: 'order',
    meta: {
      title: '订单'
    },
    component: () => import('_c/Index/Index.vue'),
    children: [
      {
        path: '/all_orders',
        name: 'all_orders',
        meta: {
          title: '所有订单'
        },
        component: () => import('_c/order/index.vue')
      }
    ]
  },
]
export default goodsManage