<script lang="ts" setup>
import { ref, onMounted, defineAsyncComponent, Ref } from 'vue';
import { getAllOrder, insertOrder, deleteOrder } from '@/api/order'
import { ElMessage } from 'element-plus'

const orderDialogs = defineAsyncComponent(() => import('./orderDialogs.vue'))

const orderDialogsRef: Ref = ref(null)
const openDialog = (index: number, row?: Object) => {
  if (row) {
    orderDialogsRef.value.formModel = JSON.parse(JSON.stringify(row))
  } else {
    orderDialogsRef.value.formModel = {}
  }
  orderDialogsRef.value.dialogVisible = !orderDialogsRef.value.dialogVisible
  opretionIndex.value = index
}


let tableData = ref([])
const getData = async () => {
  const res = await getAllOrder()
  if (res.status === 200) {
    tableData.value = res.data
  }
}

onMounted(() => {
  getData()
})

const tableColumns = [
  { prop: 'orderId', label: '订单号' },
  { prop: 'goodsId', label: '商品编号' },
  { prop: 'goodsName', label: '商品名称' },
  { prop: 'createTime', label: '创建时间' }
]


const deleteData = async (id: number) => {
  await deleteOrder({ id: id })
  ElMessage({
    message: '删除成功',
    type: 'success',
  })
  getData()
}

const opretionIndex: Ref<number> = ref(-1)

</script>

<template>
  <el-card>
    <el-button type="primary" size="small" @click="openDialog(-1)">增加</el-button>
  </el-card>
  <el-table :data="tableData" class="el_table">
    <el-table-column
      v-for="col in tableColumns"
      :property="col.prop"
      :label="col.label"
      align:string="center"
      show-overflow-tooltip
    ></el-table-column>
    <el-table-column label="操作">
      <template #default="scope">
        <el-button size="mini" type="primary" @click="openDialog(scope.$index, scope.row)">编辑</el-button>
        <el-button size="mini" type="danger" @click="deleteData(scope.row.id)">删除</el-button>
      </template>
    </el-table-column>
  </el-table>
  <order-dialogs ref="orderDialogsRef" :opretionIndex="opretionIndex" @refreshPage="getData()"></order-dialogs>
</template>

<style scoped>
.el_table {
  padding: 10px 30px;
}
</style>