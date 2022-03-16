import axios from '@/libs/axios'
import Api from '@/api/base/api-config'

const baseApi = Api.goodsBack.order

export const getAllOrder = (params) => {
  const url = baseApi.concat('/getAllOrder')
  return axios.req({
    method: 'post',
    data: params,
    url: url
  })
}

export const insertOrder = (params: any) => {
  const url = baseApi.concat('/insertOrder')
  return axios.req({
    method: 'post',
    data: params,
    url: url
  })
}

export const deleteOrder = (params: any) => {
  const url = baseApi.concat('/deleteOrder')
  return axios.req({
    method: 'post',
    data: params,
    url: url
  })
}

export const updateOrder = (params: any) => {
  const url = baseApi.concat('/updateOrder')
  return axios.req({
    method: 'post',
    data: params,
    url: url
  })
}
