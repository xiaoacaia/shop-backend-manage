package com.zhang.goods_manage.controller;

import com.zhang.goods_manage.mapper.OrderMapper;
import com.zhang.goods_manage.pojo.GoodsList;
import com.zhang.goods_manage.pojo.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/order")
public class OrderController {
    
    @Autowired
    OrderMapper orderMapper;

    @RequestMapping(value = "/getAllOrder", method = RequestMethod.POST)
    @ResponseBody
    public List<Order> getAllGoodsList(@RequestBody Order order){
        return orderMapper.getAllOrder(order);
    }

    @RequestMapping(value = "/insertOrder", method = RequestMethod.POST)
    @ResponseBody
    public void insertOrder(@RequestBody Order order){
        orderMapper.insertOrder(order);
    }

    @RequestMapping(value = "/deleteOrder", method = RequestMethod.POST)
    @ResponseBody
    public void deleteOrder(@RequestBody Order order){
        orderMapper.deleteOrder(order);
    }

    @RequestMapping(value = "/updateOrder", method = RequestMethod.POST)
    @ResponseBody
    public void updateOrderById(@RequestBody Order order){
        orderMapper.updateOrderById(order);
    }

}
