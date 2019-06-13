package com.jz1501.chenhc.diploma.tfbook.dao;

import com.jz1501.chenhc.diploma.tfbook.entity.Order;
import org.apache.ibatis.annotations.Param;

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

    //取消订单
    public void updateOrderStatus_cancel(String orderNumber);

    //bg
    public List<Order> selectAllOrdersByAdmin(@Param("row") Integer row, @Param("index") Integer index, @Param("orderNumber") String orderNumber);

    public Integer selectOrderInfoCount();

    public Integer selectOrderInfoCountBySearch(String orderNumber);

    public Order selectOneOrderByNumber(String orderId);

    //管理员删除
    public void updateStatusByAdmin(String orderNumber);

    public void updateStatusDeliver(String orderNumber);


}
