<script lang="ts" setup>
import { operation, formRules } from './attr'
import { computed, onMounted, Ref, ref, watch } from 'vue';
import { ElMessage } from 'element-plus'
import { insertGoodsList, updateGoodsList } from '@/api/goodsList'
import { GoodsCategoryLevel2Api } from '@/api/goodsCategory';


/**
 * 初始化数据
 */
const props = defineProps({
  opretionIndex: {
    type: Number,
    required: true
  }
})

const showTitle = computed(() => {
  const afterTitle = '商品'
  return (props.opretionIndex === -1 ? '添加' : '编辑') + afterTitle
})

/**
 * 定义用于提交的 formModel 
 * 监听 formModel, 当父组件修改 formModel 使得能够改变
 */
let formModel = ref<{ [t: string]: any }>({})
watch(formModel, () => { })

/**
 * 点击提交操作
 * props.operationIndex 为 1 为创建操作, 否则为删除操作
 */
const dialogVisible = ref(false);

const refreshPage = defineEmits(["refreshPage"]);

const formRef: Ref = ref(null)
// props.opretionIndex 为 1 为创建操作, 否则为删除操作
const dialogConfirm = () => {
  formRef.value.validate(async (valid: Boolean) => {
    if (valid) {
      if (props.opretionIndex === -1) {
        await insertGoodsList(formModel.value)
        ElMessage({
          message: '添加成功',
          type: 'success',
        })
      } else {
        delete formModel.value.categoryName
        await updateGoodsList(formModel.value)
        ElMessage({
          message: '修改成功',
          type: 'success',
        })
      }
      refreshPage('refreshPage')
      formRef.value.resetFields()
      dialogVisible.value = false
    }
  })
}

/**
 * 得到分类数据
 */

type categoryType = {
  categoryName: string,
  id: number
}
const categoryData = ref<Array<categoryType>>([])

const getCategoryData = async () => {
  const res = await GoodsCategoryLevel2Api()
  if (res.status === 200) {
    categoryData.value = res.data
  }
}

onMounted(() => {
  getCategoryData()
})

defineExpose({ dialogVisible, formModel })

</script>

<template>
  <el-dialog v-model="dialogVisible" :title="showTitle" width="30%">
    <el-form :model="formModel" :rules="formRules" ref="formRef" label-width="100px">
      <el-form-item v-for="option in operation" :label="option.label" :prop="option.prop">
        <template v-if="option.operate === 'input'">
          <template v-if="option.type === 'number'">
            <el-input v-model.number="formModel[option.prop]"></el-input>
          </template>
          <template v-else>
            <el-input v-model="formModel[option.prop]"></el-input>
          </template>
        </template>
        <template v-if="option.operate === 'select'">
          <el-select v-model="formModel[option.prop]" style="width:100%" placeholder=" ">
            <el-option v-for="o in categoryData" :label="o.categoryName" :value="o.id"></el-option>
          </el-select>
        </template>
      </el-form-item>
    </el-form>
    <template #footer>
      <span class="dialog-footer">
        <el-button @click="dialogVisible = false; formRef.resetFields()">取消</el-button>
        <el-button type="primary" @click="dialogConfirm">确定</el-button>
      </span>
    </template>
  </el-dialog>
</template>

