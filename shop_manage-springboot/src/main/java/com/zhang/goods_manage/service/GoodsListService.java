package com.zhang.goods_manage.service;


import com.zhang.goods_manage.mapper.GoodsListMapper;
import com.zhang.goods_manage.pojo.GoodsList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodsListService {

    @Autowired
    GoodsListMapper goodsListMapper;

    public List<GoodsList> getAllGoodsList() {
        return goodsListMapper.getAllGoodsList();
    }

    public List<GoodsList> getGoodsListById(GoodsList goodsList) {
        return goodsListMapper.getGoodsListById(goodsList);
    }

    public List<GoodsList> getSelectConditionData(GoodsList goodsList) {
        return goodsListMapper.getSelectConditionData(goodsList);
    }

    public void insertGoods(GoodsList GoodsList) {
        goodsListMapper.insertGoods(GoodsList);
    }

    public void deleteGoods(GoodsList GoodsList) {
        goodsListMapper.deleteGoods(GoodsList);
    }

    public void updateGoodsById(GoodsList GoodsList) {
        goodsListMapper.updateGoodsById(GoodsList);
    }

}
