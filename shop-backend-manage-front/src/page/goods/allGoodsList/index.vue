<script lang="ts" setup>
import { tableColumns } from './attr'
import { ElMessage } from 'element-plus'
import { defineAsyncComponent, onMounted, reactive, Ref, ref } from 'vue';
import { getAllGoodsList, deleteGoodsList, getSelectConditionData } from '@/api/goodsList'
import { AxiosResponse } from 'axios';
const orderDialogs = defineAsyncComponent(() => import('../../order/orderDialogs.vue'))

const goodsDialog = defineAsyncComponent(() => import('./goodsDialog.vue'))
const currentPage = ref(1)
let currentOpration = ref(0)
/**
 * 初始化列表中的数据
 */
const tableData = ref([])

onMounted(() => {
  getData(currentPage.value, 0)
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
  getData(currentPage.value, currentOpration.value)
}

/**
 * 分页操作
 */
const totalSize = ref()

/**
 * 筛选
 */
const selectConditionModal = reactive({
  goodsId: '',
  goodsName: '',
})

const resetSelectCondition = () => {
  selectConditionModal.goodsId = ''
  selectConditionModal.goodsName = ''
  currentOpration.value = 0
  getData(currentPage.value, 0)
}

/**
 * 获取数据
 * 0 表示获取默认数据
 * 1 表示获取筛选数据
 */
const getData = async (page: number, opeation: number) => {
  if (opeation === 0) {
    getSpecificData(page, await getAllGoodsList())
  }
  if (opeation === 1) {
    getSpecificData(page, await getSelectConditionData(selectConditionModal))
  }
}

let currentPageSize = ref(10)
const getSpecificData = (page: number, res: AxiosResponse<any, any>) => {
  if (res.status === 200) {
    totalSize.value = res.data.length
    tableData.value = res.data.slice((page - 1) * currentPageSize.value, (page - 1) * currentPageSize.value + currentPageSize.value)
  }
}

const paginationgetData = (page: number) => {
  currentPage.value = page
  getData(page, currentOpration.value)
}

const handleSizeChange = (size: number) => {
  currentPageSize.value = size
  getData(currentPage.value, currentOpration.value)
}

// 查询条件重置
const conditionSelect = () => {
  currentOpration.value = 1
  getData(1, 1)
}


const orderDialogsRef: Ref = ref(null)
const addOrder = (row: any) => {
  if (row.goodsStock <= 0) {
    ElMessage({
      message: '库存不足，无法添加',
      type: 'error',
    })
    return
  }
  orderDialogsRef.value.dialogVisible = !orderDialogsRef.value.dialogVisible
  orderDialogsRef.value.formModel = JSON.parse(JSON.stringify({
    gId: row.id,
    goodsId: row.goodsId
  }))
}

</script>

<template>
  <el-card>
    <el-button type="primary" size="small" @click="openDialog(-1)">增加</el-button>
    <br />
    <br />
    <el-form :model="selectConditionModal">
      <el-row>
        <el-col :span="6">
          <el-form-item label="商品编号">
            <el-input v-model="selectConditionModal.goodsId"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="2"></el-col>
        <el-col :span="6">
          <el-form-item label="商品名称">
            <el-input v-model="selectConditionModal.goodsName"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="6"></el-col>
        <el-col :span="4">
          <el-button type="primary" @click="conditionSelect">查询</el-button>
          <el-button @click="resetSelectCondition">重置</el-button>
        </el-col>
      </el-row>
    </el-form>
  </el-card>

  <el-table :data="tableData" class="el_table">
    <!-- <el-table-column type="selection" width="55" /> -->
    <el-table-column v-for="col in tableColumns" :property="col.prop" :label="col.label" :width="col.width"
      align:string="center" show-overflow-tooltip></el-table-column>
    <el-table-column label="操作" :width="300">
      <template #default="scope">
        <el-button size="mini" type="primary" @click="openDialog(scope.$index, scope.row)">编辑</el-button>
        <el-popconfirm title="确定要删除吗?" @confirm="deleteData(scope.row.id)">
          <template #reference>
            <el-button size="mini" type="danger">删除</el-button>
          </template>
        </el-popconfirm>
        <el-button size="mini" type="primary" @click="addOrder(scope.row)">添加订单</el-button>
      </template>
    </el-table-column>
  </el-table>
  <div class="el_pagination">
    <el-pagination :page-sizes="[5, 10, 20, 50, 100]" background layout="sizes, prev, pager, next" :total="totalSize"
      :page-count="Math.ceil(totalSize / currentPageSize)" @current-change="paginationgetData"
      @size-change="handleSizeChange"></el-pagination>
  </div>
  <goods-dialog ref="goodsDialogRef" :opretionIndex="opretionIndex"
    @refreshPage="getData(currentPage, currentOpration)"></goods-dialog>
  <order-dialogs ref="orderDialogsRef" :opretionIndex="-1" @refreshPage="getData(currentPage, currentOpration)">
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