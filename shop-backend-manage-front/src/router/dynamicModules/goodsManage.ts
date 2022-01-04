import { RouteRecordRaw } from 'vue-router'
const goodsManage: Array<RouteRecordRaw> = [
  {
    path: '/',
    name: 'index',
    meta: {
      title: '分类管理'
    },
    component: () => import('_c/Index'),
    children: [
      {
        path: '/goods_categories',
        name: 'goods_categories',
        meta: {
          title: '商品分类'
        },
        component: () => import('_c/cateogory/goodsCategory')
      }
    ]
  },
  {
    path: '/goods',
    name: 'goodsIndex',
    meta: {
      title: '商品管理'
    },
    component: () => import('_c/Index'),
    children: [
      {
        path: '/all_goods_list',
        name: 'all_goods_list',
        meta: {
          title: '所有商品'
        },
        component: () => import('_c/goods/allGoodsList')
      },
      {
        path: '/detail_goods_list',
        name: 'detail_goods_list',
        meta: {
          title: '分类商品'
        },
        component: () => import('_c/goods/detailGoodsList')
      },
      // {
      //   path: '/test',
      //   name: 'test',
      //   meta: {
      //     title: 'tqweest'
      //   },
      //   component: () => import('_c/test')
      // },
    ]
  },
]
export default goodsManage