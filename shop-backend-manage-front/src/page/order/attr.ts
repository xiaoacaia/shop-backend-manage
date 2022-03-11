import { FormItemRule } from "element-plus/es/components/form/src/form.type"


type operationType = {
  operate: string
  prop: "goodsId" | "orderId" | "createTime"
  label: string
  type?: string
  width?: string
}


export const operation: Array<operationType> = [
  { operate: 'input', prop: 'orderId', label: '订单号', type: 'number' },
  { operate: 'input', prop: 'goodsId', label: '商品编号', type: 'number' },
  { operate: 'date', prop: 'createTime', label: '创建时间' },
]


/**
 * 校验规则
 */
 export const formRules: Partial<Record<string, FormItemRule | FormItemRule[]>> | undefined = {
  goodsId: [
    { required: true, message: '请输入订单号', trigger: 'blur' },
    { type: 'number', message: '订单号必须为数字' },
  ],
  orderId: [
    { required: true, message: '请输入商品编号', trigger: 'blur' },
    { type: 'number', message: '商品编号必须为数字' },
  ],
  createTime: [
    { required: true, message: '请选择创建时间', trigger: 'blur' }
  ],
}
