import { reactive, ref } from "vue"

/**
 * 表格中列的数据
 */
type tableColumnsType = {
  prop: "goodsId" | "goodsName" | "categoryName" | "goodsPrice" | "goodsStock"
  label: string
  width?: string
}

export const tableColumns: Array<tableColumnsType> = [
  { prop: 'goodsId', label: '商品编号' },
  { prop: 'goodsName', label: '商品名称' },
  { prop: 'goodsPrice', label: '单价' },
  { prop: 'goodsStock', label: '剩余数量' }
]

/**
 * 添加或删除表单数据
 */
type operationType = {
  operate: string
  prop: "goodsId" | "goodsName" | "categoryName" | "goodsPrice" | "goodsStock"
  label: string
  type?: string
  width?: string
}

export const operation: Array<operationType> = [
  { operate: 'input', prop: 'goodsId', label: '商品编号', type: 'number' },
  { operate: 'input', prop: 'goodsName', label: '商品名称' },
  { operate: 'select', prop: 'goodsType', label: '商品类型'},
  { operate: 'input', prop: 'goodsPrice', label: '单价', type: 'number' },
  { operate: 'input', prop: 'goodsStock', label: '剩余数量', type: 'number' }
]

/**
 * 校验规则
 */
export const formRules: Partial<Record<string, FormItemRule | FormItemRule[]>> | undefined = {
  goodsId: [
    { required: true, message: '请输入商品编号', trigger: 'blur' },
    { type: 'number', message: '商品编号必须为数字' },
  ],
  goodsName: [
    { required: true, message: '请输入商品名称', trigger: 'blur' },
  ],
  goodsType: [
    { required: true, message: '请选择商品类型', trigger: 'change' }
  ],
  goodsPrice: [
    { required: true, message: '请输入单价', trigger: 'blur' },
    { type: 'number', message: '单价必须为数字' }
  ],
  goodsStock: [
    { required: true, message: '请输入剩余数量', trigger: 'blur' },
    { type: 'number', message: '剩余数量必须为数字' }
  ],
}
