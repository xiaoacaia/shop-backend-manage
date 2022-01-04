package com.zhang.goods_manage.controller;


import com.zhang.goods_manage.pojo.GoodsList;
import com.zhang.goods_manage.service.GoodsListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/goodsList")
public class GoodsListController {


    @Autowired
    GoodsListService goodsListService;

    @RequestMapping(value = "/getAllGoodsList", method = RequestMethod.GET)
    @ResponseBody
    public List<GoodsList> getAllGoodsList(){
        return goodsListService.getAllGoodsList();
    }

    @RequestMapping(value = "/getGoodsListById", method = RequestMethod.POST)
    @ResponseBody
    public List<GoodsList> getGoodsListById(@RequestBody GoodsList GoodsList){
        return goodsListService.getGoodsListById(GoodsList);
    }


    @RequestMapping(value = "/insertGoods", method = RequestMethod.POST)
    @ResponseBody
    public void insertGoods(@RequestBody GoodsList GoodsList){
        goodsListService.insertGoods(GoodsList);
    }

    @RequestMapping(value = "/deleteGoods", method = RequestMethod.POST)
    @ResponseBody
    public void deleteGoods(@RequestBody GoodsList GoodsList){
        goodsListService.deleteGoods(GoodsList);
    }

    @RequestMapping(value = "/updateGoods", method = RequestMethod.POST)
    @ResponseBody
    public void updateGoodsById(@RequestBody GoodsList GoodsList){
        goodsListService.updateGoodsById(GoodsList);
    }
    
}
