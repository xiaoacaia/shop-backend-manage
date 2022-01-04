import axios from '@/libs/axios'
import Api from '@/api/base/api-config'

const baseApi = Api.goodsBack.goodsList

export const getAllGoodsList = () => {
  const url = baseApi.concat('/getAllGoodsList')
  return axios.req({
    method: 'get',
    url: url
  })
}

export const getGoodsListById = (params) => {
  const url = baseApi.concat('/getGoodsListById')
  return axios.req({
    method: 'post',
    data: params,
    url: url
  })
}

export const insertGoodsList = (params) => {
  const url = baseApi.concat('/insertGoods')
  return axios.req({
    method: 'post',
    data: params,
    url: url
  })
}

export const deleteGoodsList = (params) => {
  const url = baseApi.concat('/deleteGoods')
  return axios.req({
    method: 'post',
    data: params,
    url: url
  })
}

export const updateGoodsList = (params) => {
  const url = baseApi.concat('/updateGoods')
  return axios.req({
    method: 'post',
    data: params,
    url: url
  })
}
