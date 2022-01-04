<template>
  <el-dialog v-model="dialogVisible" :title="showTitle" width="30%">
    <el-form :model="formModel" :rules="formRules" ref="formRef">
      <el-form-item label="分类名称" prop="categoryName">
        <el-input v-model="formModel.categoryName"></el-input>
      </el-form-item>
    </el-form>
    <template #footer>
      <span class="dialog-footer">
        <el-button @click="dialogVisible = false">取消</el-button>
        <el-button type="primary" @click="dialogConfirm">确定</el-button>
      </span>
    </template>
  </el-dialog>
</template>

<script lang="ts" setup>
import { insertGoodsCategoryLevel1Api, insertGoodsCategoryLevel2Api, updateGoodsCategoryByIdApi } from '@/api/goodsCategory'
import { computed, Ref, ref, watch } from 'vue';
import { ElMessage } from 'element-plus'
import { formRules } from './attr'

// 对话框是否显示
const dialogVisible = ref(false);

// 提交之后用于刷新
const refreshPage = defineEmits(["refreshPage"]);

// 展示标题
const showTitle = computed(() => {
  const afterTitle = '分类'
  return (props.operationIndex === -1 || props.operationIndex === -2 ? '添加' : '编辑') + afterTitle
})

/**
 * 定义用于提交的 formModel 
 * 监听 formModel, 当父组件修改 formModel 使得能够改变
 */
let formModel = ref<{ [t: string]: any }>({})
watch(formModel, () => { })

/**
 * 点击提交操作
 */
const props = defineProps({
  operationIndex: {
    type: Number,
    required: true
  }
})

const formRef: Ref = ref(null)
const dialogConfirm = () => {
  formRef.value.validate(async (valid: Boolean) => {
    if (valid) {
      // 添加新的分类数据
      if (props.operationIndex === -1) {
        await insertGoodsCategoryLevel1Api({ categoryName: formModel.value.categoryName })
        ElMessage({
          message: '添加成功',
          type: 'success',
        })
      } else if (props.operationIndex === -2) {
        await insertGoodsCategoryLevel2Api({ categoryName: formModel.value.categoryName, parentId: formModel.value.id })
        ElMessage({
          message: '添加成功',
          type: 'success',
        })
      } else {
        // 修改分类名称
        await updateGoodsCategoryByIdApi(formModel.value)
        ElMessage({
          message: '修改成功',
          type: 'success',
        })
      }
      refreshPage('refreshPage')
      dialogVisible.value = false
    }
  })
}

defineExpose({ dialogVisible, formModel })

</script>