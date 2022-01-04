package com.zhang.goods_manage.service;


import com.zhang.goods_manage.mapper.GoodsCategoryMapper;
import com.zhang.goods_manage.pojo.GoodsCategory;
import com.zhang.goods_manage.pojo.GoodsCategoryLevel2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodsCategoryService {

    @Autowired
    GoodsCategoryMapper goodsCategoryMapper;

    public List<GoodsCategory> getAllGoodsCategoryList() {
        return goodsCategoryMapper.getAllGoodsCategoryList();
    }

    public List<GoodsCategoryLevel2> getGoodsCategory2List() {
        return goodsCategoryMapper.getGoodsCategory2List();
    }

    public void  insertGoodsCategoryLevel1(GoodsCategory goodsCategory){
        goodsCategoryMapper.insertGoodsCategoryLevel1(goodsCategory);
    }

    public void  insertGoodsCategoryLevel2(GoodsCategory goodsCategory){
        goodsCategoryMapper.insertGoodsCategoryLevel2(goodsCategory);
    }

    public void  deleteGoodsCategory(GoodsCategory goodsCategory){
        goodsCategoryMapper.deleteGoodsCategory(goodsCategory);
    }

    public void updateGoodsCategoryById(GoodsCategory goodsCategory){
        goodsCategoryMapper.updateGoodsCategoryById(goodsCategory);
    }

}
