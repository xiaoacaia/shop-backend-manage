<script lang="ts" setup>
import { ref, onMounted, defineAsyncComponent, Ref } from 'vue';
import { getAllOrder, deleteOrder } from '@/api/order'
import { ElMessage } from 'element-plus'

const orderDialogs = defineAsyncComponent(() => import('./orderDialogs.vue'))

const currentPage = ref(1)

const orderDialogsRef: Ref = ref(null)
const openDialog = (index: number, row?: any) => {
  if (row) {
    if (row.orderId) row.orderId = Number(row.orderId)
    orderDialogsRef.value.formModel = JSON.parse(JSON.stringify(row))
  } else {
    orderDialogsRef.value.formModel = {}
  }
  orderDialogsRef.value.dialogVisible = !orderDialogsRef.value.dialogVisible
  opretionIndex.value = index
}

let currentPageSize = ref(10)

let tableData = ref([])
const getData = async (page: number) => {
  const res = await getAllOrder({ orderId: '' })
  if (res.status === 200) {
    tableData.value = res.data
    totalSize.value = res.data.length
    tableData.value = res.data.slice((page - 1) * currentPageSize.value, (page - 1) * currentPageSize.value + currentPageSize.value)
  }
}

const paginationgetData = (page: number) => {
  currentPage.value = page
  getData(page)
}

const handleSizeChange = (size: number) => {
  currentPageSize.value = size
  getData(currentPage.value)
}

onMounted(() => {
  getData(currentPage.value)
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
  getData(currentPage.value)
}

const opretionIndex: Ref<number> = ref(-1)


const totalSize = ref()


const orderId = ref('')
const selectOrder = async () => {
  const res = await getAllOrder({ orderId: orderId.value })
  if (res.status === 200) {
    tableData.value = res.data
    totalSize.value = res.data.length
    tableData.value = res.data.slice((currentPage.value - 1) * currentPageSize.value, (currentPage.value - 1) * currentPageSize.value + currentPageSize.value)
  }
}

const resetOrder = async () => {
  orderId.value = ''
  const res = await getAllOrder({ orderId: '' })
  if (res.status === 200) {
    tableData.value = res.data
    totalSize.value = res.data.length
    tableData.value = res.data.slice((currentPage.value - 1) * currentPageSize.value, (currentPage.value - 1) * currentPageSize.value + currentPageSize.value)
  }
}
</script>

<template>
  <el-card>
    <el-button type="primary" size="small" @click="openDialog(-1)">增加</el-button>
    <br />
    <br />
    <el-row>
      <el-col :span="6">
        <el-input v-model="orderId"></el-input>
      </el-col>
      <el-col :span="1"></el-col>
      <el-col :span="4">
        <el-button type="primary" @click="selectOrder">查询</el-button>
        <el-button @click="resetOrder">重置</el-button>
      </el-col>
    </el-row>
  </el-card>
  <el-table :data="tableData" class="el_table">
    <el-table-column v-for="col in tableColumns" :property="col.prop" :label="col.label" align:string="center"
      show-overflow-tooltip></el-table-column>
    <el-table-column label="操作">
      <template #default="scope">
        <el-button size="mini" type="primary" @click="openDialog(scope.$index, scope.row)">编辑</el-button>
        <el-button size="mini" type="danger" @click="deleteData(scope.row.id)">删除</el-button>
      </template>
    </el-table-column>
  </el-table>
  <div class="el_pagination">
    <el-pagination :page-sizes="[5, 10, 20, 50, 100]" background layout="sizes, prev, pager, next" :total="totalSize"
      :page-count="Math.ceil(totalSize / currentPageSize)" @current-change="paginationgetData"
      @size-change="handleSizeChange"></el-pagination>
  </div>

  <order-dialogs ref="orderDialogsRef" :opretionIndex="opretionIndex" @refreshPage="getData(currentPage)">
  </order-dialogs>
</template>

<style scoped>
.el_table {
  padding: 10px 30px;
}

.el_pagination {
  margin: auto;
  width: 50%;
  margin-top: 20px;
}
</style>