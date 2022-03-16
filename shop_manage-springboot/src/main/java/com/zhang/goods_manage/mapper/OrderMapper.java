package com.zhang.goods_manage.mapper;

import com.zhang.goods_manage.pojo.Order;
import org.springframework.stereotype.Repository;
import java.util.List;
@Repository
public interface OrderMapper {
    List<Order> getAllOrder(Order order);
    void insertOrder(Order order);
    void deleteOrder(Order order);
    void updateOrderById(Order order);
}
