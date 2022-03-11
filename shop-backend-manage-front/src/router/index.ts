import { createRouter, createWebHashHistory, RouteRecordRaw } from 'vue-router'

// constantModules
const constantFiles = import.meta.glob('./constantModules/*.ts')
let constantModules: any[] = []
for (const path in constantFiles) {
  await constantFiles[path]().then((mod) => {
    constantModules = constantModules.concat(mod.default)
  })
}

// dynamicModules
const dynamicFiles = import.meta.glob('./dynamicModules/*.ts')
let dynamicModules: any[] = []
for (const path in dynamicFiles) {
  await dynamicFiles[path]().then((mod) => {
    dynamicModules = dynamicModules.concat(mod.default)
  })
}

const router = createRouter({
  history: createWebHashHistory(),
  routes: [
    ...constantModules,
    ...dynamicModules,
    {
      path: '/login_out',
      name: 'login_out',
      meta: {
        title: '退出系统'
      }
    },
  ]
})

router.beforeEach((to, from, next) => {
  if (to.path == "/login") {
    next();
  } else if (to.path == '/login_out') {
    window.localStorage.removeItem("have_login");
    window.location.href = "/";
  }
  else {
    if (!window.localStorage.getItem("have_login")) {
      next({ path: "/login" });
    } else {
      next();
    }
  }
});

export default router