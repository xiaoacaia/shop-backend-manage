import { reactive } from "vue"

type tableColumnsType = {
  prop: string,
  label: string,
  width?: string
}

export const tableColumns: Array<tableColumnsType> = [
  { prop: 'label', label: '分类名称' }
]

export const formRules = reactive({
  categoryName: [
    {
      required: true,
      message: '请输入分类名称',
      trigger: 'blur',
    },
  ]
})
