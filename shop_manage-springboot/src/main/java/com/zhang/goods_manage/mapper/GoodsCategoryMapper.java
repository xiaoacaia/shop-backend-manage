package com.zhang.goods_manage.mapper;

import com.zhang.goods_manage.pojo.GoodsCategory;
import com.zhang.goods_manage.pojo.GoodsCategoryLevel2;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GoodsCategoryMapper {

    List<GoodsCategory> getAllGoodsCategoryList();

    List<GoodsCategoryLevel2> getGoodsCategory2List();

    void insertGoodsCategoryLevel1(GoodsCategory goodsCategory1);

    void insertGoodsCategoryLevel2(GoodsCategory goodsCategory1);

    void deleteGoodsCategory(GoodsCategory goodsCategory1);

    void updateGoodsCategoryById(GoodsCategory goodsCategory1);

}
