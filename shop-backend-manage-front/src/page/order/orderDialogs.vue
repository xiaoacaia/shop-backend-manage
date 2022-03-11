<script lang="ts" setup>
import { computed, onMounted, Ref, ref, watch } from 'vue';
import { GoodsCategoryLevel2Api } from '@/api/goodsCategory';
import { operation, formRules } from './attr'
import { ElMessage } from 'element-plus'
import { getAllOrder, insertOrder, updateOrder, deleteOrder } from '@/api/order'

const dialogVisible = ref(false);

/**
 * 定义用于提交的 formModel 
 * 监听 formModel, 当父组件修改 formModel 使得能够改变
 */
let formModel = ref<{ [t: string]: any }>({})
watch(formModel, () => { })

const showTitle = computed(() => {
  const afterTitle = '订单'
  return (props.opretionIndex === -1 ? '添加' : '编辑') + afterTitle
})

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

const props = defineProps({
  opretionIndex: {
    type: Number,
    required: true
  }
})

const refreshPage = defineEmits(["refreshPage"]);

const formRef: Ref = ref(null)
const dialogConfirm = () => {
  formRef.value.validate(async (valid: Boolean) => {
    if (valid) {
      if (props.opretionIndex === -1) {
        await insertOrder(formModel.value)
        ElMessage({
          message: '添加成功',
          type: 'success',
        })
      } else {
        delete formModel.value.categoryName
        await updateOrder(formModel.value)
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


defineExpose({ dialogVisible, formModel })
</script>

<template>
  <el-dialog v-model="dialogVisible" width="30%" :title="showTitle">
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
        <template v-if="option.operate === 'date'">
          <el-date-picker
            style="width:100%"
            v-model="formModel[option.prop]"
            type="date"
            placeholder="请选择创建时间"
            value-format="YYYY-MM-DD"
          ></el-date-picker>
        </template>
      </el-form-item>
    </el-form>
    <template #footer>
      <span class="dialog-footer">
        <el-button @click="dialogVisible = false;formRef.resetFields()">取消</el-button>
        <el-button type="primary" @click="dialogConfirm">确定</el-button>
      </span>
    </template>
  </el-dialog>
</template>
