<template>
  <el-card>
    <el-button type="primary" size="small" @click="openDialog(-1)">增加</el-button>
    <!-- <el-button type="danger" size="small" @click="deleteSelectData()">批量删除</el-button> -->
  </el-card>

  <el-table :data="tableData" class="el_table">
    <!-- <el-table-column type="selection" width="55" /> -->
    <el-table-column
      v-for="col in tableColumns"
      :property="col.prop"
      :label="col.label"
      :width="col.width"
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
  <div class="el_pagination">
    <el-pagination
      background
      layout="prev, pager, next"
      :total="totalSize"
      :page-count="Math.ceil(totalSize / 10)"
      @current-change="changePagination"
    ></el-pagination>
  </div>
  <goods-dialog
    ref="goodsDialogRef"
    :opretionIndex="opretionIndex"
    @refreshPage="changePagination(currentPage)"
  ></goods-dialog>
</template>

<script lang="ts" setup>
import { tableColumns } from './attr'
import { ElMessage } from 'element-plus'
import { defineAsyncComponent, onMounted, Ref, ref } from 'vue';
import { getAllGoodsList, deleteGoodsList } from '@/api/goodsList'

const goodsDialog = defineAsyncComponent(() => import('./goodsDialog.vue'))
const currentPage = ref(1)
/**
 * 初始化列表中的数据
 */
const tableData = ref([])

// const getTableData = async () => {
//   tableData.value = await getAllGoodsList()
// }

onMounted(() => {
  changePagination(currentPage.value)
})

/**
 * 打开对话框
 */
const goodsDialogRef: Ref = ref(null)
const opretionIndex: Ref<number> = ref(-1)
// 根据 index 判断操作类型
const openDialog = (index: number, row?: Object) => {
  goodsDialogRef.value.dialogVisible = true
  if (row) {
    goodsDialogRef.value.formModel = JSON.parse(JSON.stringify(row))
  } else {
    goodsDialogRef.value.formModel = {}
  }
  opretionIndex.value = index
}

// 删除操作
const deleteData = async (id: number) => {
  await deleteGoodsList({ id: id })
  ElMessage({
    message: '删除成功',
    type: 'success',
  })
  changePagination(currentPage.value)
}

/**
 * 分页操作
 */
const totalSize = ref()
const changePagination = async (page: number) => {
  currentPage.value = page
  const res = await getAllGoodsList()
  if (res.status === 200) {
    tableData.value = res.data
    totalSize.value = tableData.value.length
    tableData.value = tableData.value.slice((page - 1) * 10, (page - 1) * 10 + 9)
  }
}

</script>

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