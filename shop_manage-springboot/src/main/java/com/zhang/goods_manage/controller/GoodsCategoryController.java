package com.zhang.goods_manage.controller;


import com.zhang.goods_manage.pojo.GoodsCategory;
import com.zhang.goods_manage.pojo.GoodsCategoryLevel2;
import com.zhang.goods_manage.service.GoodsCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/goodsCategory")
public class GoodsCategoryController {

    @Autowired
    GoodsCategoryService goodsCategoryService;

    @RequestMapping(value = "/getAllGoodsCategoryList", method = RequestMethod.GET)
    @ResponseBody
    public List<GoodsCategory> getAllGoodsCategoryList(){
        return goodsCategoryService.getAllGoodsCategoryList();
    }

    @RequestMapping(value = "/getGoodsCategory2List", method = RequestMethod.GET)
    @ResponseBody
    public List<GoodsCategoryLevel2> getGoodsCategory2List(){
        return goodsCategoryService.getGoodsCategory2List();
    }

    @RequestMapping(value = "/insertGoodsCategoryLevel1", method = RequestMethod.POST)
    @ResponseBody
    public void insertGoodsCategoryLevel1(@RequestBody GoodsCategory goodsCategory){
        goodsCategoryService.insertGoodsCategoryLevel1(goodsCategory);
    }

    @RequestMapping(value = "/insertGoodsCategoryLevel2", method = RequestMethod.POST)
    @ResponseBody
    public void insertGoodsCategoryLevel2(@RequestBody GoodsCategory goodsCategory){
        goodsCategoryService.insertGoodsCategoryLevel2(goodsCategory);
    }

    @RequestMapping(value = "/deleteGoodsCategory", method = RequestMethod.POST)
    @ResponseBody
    public void deleteGoodsCategory(@RequestBody GoodsCategory goodsCategory){
        goodsCategoryService.deleteGoodsCategory(goodsCategory);
    }

    @RequestMapping(value = "/updateGoodsCategoryById", method = RequestMethod.POST)
    @ResponseBody
    public void updateGoodsCategoryById(@RequestBody GoodsCategory goodsCategory){
        goodsCategoryService.updateGoodsCategoryById(goodsCategory);
    }
}
