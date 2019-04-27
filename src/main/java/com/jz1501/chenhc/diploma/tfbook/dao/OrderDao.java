package com.jz1501.chenhc.diploma.tfbook.dao;

import com.jz1501.chenhc.diploma.tfbook.entity.Order;

import java.util.List;

/**
 * @ProjectName:diploma
 * @Package:com.jz1501.chenhc.diploma.tfbook.dao
 * @description:${description}
 * @author:chenhc
 * @create_time:2019-04-06
 * @version:v1.0.0
 **/
public interface OrderDao {

    public void insertNewOrder(Order order);

    public Order selectOrderById(String orderId);

    public void updateOrderStatus(String orderNumber);

    public List<Order> selectUserAllOrderByUserId(String userId);

    public void deleteOrderInfoByOrderNumber(String orderNumber);

    public Order selectOrderInfoByOrderNumber(String orderNumber);
}
