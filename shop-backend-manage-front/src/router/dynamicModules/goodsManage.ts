import { RouteRecordRaw } from 'vue-router'
const goodsManage: Array<RouteRecordRaw> = [
  {
    path: '/',
    name: 'index',
    meta: {
      title: '分类'
    },
    component: () => import('_c/Index/Index.vue'),
    children: [
      {
        path: '/goods_categories',
        name: 'goods_categories',
        meta: {
          title: '商品分类'
        },
        component: () => import('_c/cateogory/goodsCategory/index.vue')
      }
    ]
  },
  {
    path: '/',
    name: 'goodsIndex',
    meta: {
      title: '商品'
    },
    component: () => import('_c/Index/Index.vue'),
    children: [
      {
        path: '/all_goods_list',
        name: 'all_goods_list',
        meta: {
          title: '所有商品'
        },
        component: () => import('_c/goods/allGoodsList/index.vue')
      },
      {
        path: '/detail_goods_list',
        name: 'detail_goods_list',
        meta: {
          title: '分类商品'
        },
        component: () => import('_c/goods/detailGoodsList/index.vue')
      }
    ]
  },
]
export default goodsManage