<template>
  <div class="main">
    <el-aside class="aside">
      <div class="head">
        <span class="head_span" style="color: black;">电商后台管理系统</span>
      </div>
      <div class="line" />
      <el-menu
        class="el_menu"
        :router="true"
        :default-openeds="defaultOpen"
        :default-active="$route.path"
      >
        <template v-for="(menu, index) in allRoute">
          <el-sub-menu v-if="menu.children" :index="index.toString()">
            <template #title>
              <span style="font-weight: bold;">{{ menu.meta!.title }}</span>
            </template>
            <el-menu-item-group>
              <template v-for="item in menu.children">
                <el-menu-item :index="item.path">
                  <span style="font-weight: bold;">{{ item.meta!.title }}</span>
                </el-menu-item>
              </template>
            </el-menu-item-group>
          </el-sub-menu>
          <el-menu-item-group v-else>
            <el-menu-item v-if="menu.meta!.show !== false" :index="menu.path">
              <span style="font-weight: bold;">{{ menu.meta!.title }}</span>
            </el-menu-item>
          </el-menu-item-group>
        </template>
      </el-menu>
    </el-aside>

    <el-container class="main_content">
      <Header />
      <div class="content">
        <router-view />
      </div>
      <Footer />
    </el-container>
  </div>
</template>

<script lang="ts" setup>
import { useRouter } from 'vue-router';
import Header from './subContent/Header.vue'
import Footer from './subContent/Footer.vue'

const defaultOpen = ["1", "2"]

const router = useRouter()
const allRoute = router.options.routes

</script>

<style scoped>
.main {
  display: flex;
}

.aside {
  width: 300px !important;
  height: 100vh;
  display: flex;
  flex-direction: column;
}

.head {
  height: 65px;
  display: flex;
  align-items: center;
  justify-content: center;
}
.head_span {
  font-size: 1.2em;
  color: #fff;
}

.el_menu {
  flex: 2;
}

.main_content {
  display: flex;
  width: 100%;
  flex-direction: column;
  max-height: 100vh;
  overflow: hidden;
}

.content {
  height: calc(100vh - 100px);
  overflow: auto;
  padding: 10px;
}
</style>