package com.zhang.goods_manage.mapper;

import com.zhang.goods_manage.pojo.GoodsList;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GoodsListMapper {

    List<GoodsList> getAllGoodsList();

    List<GoodsList> getGoodsListById(GoodsList goodsList);

    List<GoodsList> getSelectConditionData(GoodsList goodsList);

    void insertGoods(GoodsList GoodsList);

    void deleteGoods(GoodsList GoodsList);

    void updateGoodsById(GoodsList GoodsList);

    void updateGoodsStockByid(@Param("id") int id);
}
