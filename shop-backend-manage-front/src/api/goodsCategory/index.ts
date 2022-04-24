import axios from '@/libs/axios'
import Api from '@/api/base/api-config'
const baseApi = Api.goodsBack.goodsCategory
export const getAllGoodsCategoryListApi = () => {
  const url = baseApi.concat('/getAllGoodsCategoryList')
  return axios.req({
    method: 'get',
    url: url
  })
}

export const GoodsCategoryLevel2Api = () => {
  const url = baseApi.concat('/getGoodsCategory2List')
  return axios.req({
    method: 'get',
    url: url
  })
}

export const insertGoodsCategoryLevel1Api = (params: any) => {
  const url = baseApi.concat('/insertGoodsCategoryLevel1')
  return axios.req({
    method: 'post',
    data: params,
    url: url
  })
}

export const insertGoodsCategoryLevel2Api = (params: any) => {
  const url = baseApi.concat('/insertGoodsCategoryLevel2')
  return axios.req({
    method: 'post',
    data: params,
    url: url
  })
}

export const deleteGoodsCategoryApi = (params: any) => {
  const url = baseApi.concat('/deleteGoodsCategory')
  return axios.req({
    method: 'post',
    data: params,
    url: url
  })
}

export const updateGoodsCategoryByIdApi = (params: any) => {
  const url = baseApi.concat('/updateGoodsCategoryById')
  return axios.req({
    method: 'post',
    data: params,
    url: url
  })
}
