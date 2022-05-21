<template>
  <el-card>
    <el-button type="primary" size="small" @click="openDialog(-1)">增加</el-button>
  </el-card>
  <el-table :data="treeData" class="el_table">
    <el-table-column label="分类名称" property="label">
      <template #default="scope">
        <el-tree :data="scope.row" default-expand-all>
          <template #default="{ node, data }">
            <span class="custom-tree-node">
              <span style="margin-top: 10px;min-width: 60px;">{{ node.label }}</span>
              <span v-if="!data.children" style="margin-top: 10px;margin-left: 20px;">
                <el-button size="mini" style="margin-right: 20px;margin-left: 20px;" @click="clickJumpToSpecific(data.id, node.label)">跳转
                </el-button>
                <el-button size="mini" style="margin-right: 20px;" @click="openDialog(2, data)">编辑</el-button>
                <el-popconfirm title="确定要删除吗?" @confirm="deleteData(data.id)">
                  <template #reference>
                     <el-button size="mini" style="margin-right: 300px;">删除</el-button>
                  </template>
                </el-popconfirm>
              </span>
            </span>
          </template>
        </el-tree>
      </template>
    </el-table-column>
    <el-table-column label="操作">
      <template #default="scope">
        <el-button size="mini" type="primary" @click="openDialog(-2, scope.row[0])">添加</el-button>
        <el-button size="mini" type="primary" @click="openDialog(1, scope.row[0])">编辑</el-button>
        <el-popconfirm title="确定要删除吗?" @confirm="deleteData(scope.row[0].id)">
          <template #reference>
            <el-button size="mini" type="danger">删除</el-button>
          </template>
        </el-popconfirm>
      </template>
    </el-table-column>
  </el-table>
  <category-dialog ref="dialogRef" :operationIndex="operationIndex" @refreshPage="getTableData"></category-dialog>
</template>

<script lang="ts" setup>
import { defineAsyncComponent, onMounted, Ref, ref } from 'vue';
import { ElMessage } from 'element-plus'
import { getAllGoodsCategoryListApi, deleteGoodsCategoryApi } from '@/api/goodsCategory'
import { useRouter } from 'vue-router';
const categoryDialog = defineAsyncComponent(() => import('./categoryDialog.vue'))

/**
 * 初始化列表中的数据
 */
let treeData: any = ref([])

const getTableData = async () => {
  let res = await getAllGoodsCategoryListApi()
  if (res.status === 200) {
    treeData.value = toTreeData(res.data)
  }
}

const toTreeData = (data: any[]) => {
  const res = []
  const categoryLevel: { [t: string]: any } = {}
  data.forEach(i => {
    if (i.categoryLevel === 1) {
      categoryLevel[i.id] = { id: i.id, label: i.categoryName, children: [] }
    }
  })
  data.forEach(i => {
    if (i.categoryLevel === 2 && categoryLevel[i.parentId]) {
      categoryLevel[i.parentId]['children'].push({ id: i.id, label: i.categoryName })
    }
  })
  for (let i in categoryLevel) {
    res.push([categoryLevel[i]])
  }
  return res
}

onMounted(() => {
  getTableData()
})

/**
 *点击跳转到具体
 */

const router = useRouter()
const clickJumpToSpecific = (id: number, label: string) => {
  router.push({ path: '/detail_goods_list', query: { id: id, label: label } })
}

/**
 * 打开对话框
 */
const dialogRef: Ref = ref(null)
const operationIndex: Ref<number> = ref(-1)
type rowType = {
  id: number,
  label: String
}

/**
 * 根据 operation 判断操作类型
 * 1  修改一级分类
 * 2  修改二级分类
 * -1  添加一级分类
 * -2  添加二级分类
 */
const openDialog = (operation: number, row?: rowType) => {
  dialogRef.value.dialogVisible = true
  // 添加
  if (operation === -1) dialogRef.value.formModel = {}
  if (operation === -2 && row) {
    dialogRef.value.formModel = { id: row.id }
  }
  // 修改
  if (operation === 1 && row) {
    dialogRef.value.formModel.id = row.id
    dialogRef.value.formModel.categoryName = row.label
  }
  if (operation === 2 && row) {
    dialogRef.value.formModel.id = row.id
    dialogRef.value.formModel.categoryName = row.label
  }
  operationIndex.value = operation
}

// 删除操作
const deleteData = async (id: number) => {
  await deleteGoodsCategoryApi({ id: id })
  ElMessage({
    message: '删除成功',
    type: 'success',
  })
  getTableData()
}

</script>

<style scoped>
.el_table {
  padding: 10px 30px;
}

.custom-tree-node {
  flex: 1;
  display: flex;
  justify-content: space-between;
  font-size: 14px;
  padding-right: 8px;
}
</style>