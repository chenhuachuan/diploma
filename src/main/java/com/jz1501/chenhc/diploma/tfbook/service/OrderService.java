package com.jz1501.chenhc.diploma.tfbook.service;

import com.jz1501.chenhc.diploma.tfbook.entity.Order;
import com.jz1501.chenhc.diploma.tfbook.entity.OrderItem;

import java.util.List;
import java.util.Map;

/**
 * @ProjectName:diploma
 * @Package:com.jz1501.chenhc.diploma.tfbook.service
 * @description:${description}
 * @author:chenhc
 * @create_time:2019-04-06
 * @version:$version$
 **/
public interface OrderService {

    //新订单
    public void addNewOrder_to();
    public void addNewOrder();

    public Order getOrderInfoById(String orderId);

    public void modifyOrderStatus(String orderNumber);

    //查询所有订单信息
    public List<Order> queryUserAllOrderInfoByUserId(String userId);

    //删除该订单信息  软删除
    public void removeOrderInfoByOrderNumber(String orderNumber);

    //订单详情
    public Order queryOrderInfoById(String orderNumber);

    public Map<String, OrderItem> queryOrderDetailInfoByOrderNumber(String orderNumber);

}
