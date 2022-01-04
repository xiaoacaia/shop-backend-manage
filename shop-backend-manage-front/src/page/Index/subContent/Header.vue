<template>
  <div class="header">
    <span>{{ name }}</span>
  </div>
</template>

<script lang="ts" setup>import { onMounted, Ref, ref } from 'vue';
import { useRouter } from 'vue-router';
let name: Ref = ref('商品分类')

const router = useRouter()
router.afterEach((to) => {
  name.value = to.meta.title
});

onMounted(() => {
  name.value = router.currentRoute.value.meta.title
})

</script>

<style scoped>
.header {
  width: 100%;
  height: 50px;
  border-bottom: 1px solid #e9e9e9;
  display: flex;
  /* justify-content: space-between; */
  align-items: center;
  padding: 0 20px;
}
</style>