package com.jz1501.chenhc.diploma.tfbook.serviceImpl;

import com.jz1501.chenhc.diploma.tfbook.dao.OrderFlowDao;
import com.jz1501.chenhc.diploma.tfbook.entity.Order;
import com.jz1501.chenhc.diploma.tfbook.entity.OrderFlow;
import com.jz1501.chenhc.diploma.tfbook.service.OrderFlowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * @ProjectName:diploma
 * @Package:com.jz1501.chenhc.diploma.tfbook.serviceImpl
 * @description:订单流水信息
 * @author:chenhc
 * @create_time:2019-05-25
 * @version:1.0.0$
 **/
@Service
@Transactional
public class OrderFlowServiceImpl implements OrderFlowService {

    @Autowired
    private OrderFlowDao orderFlowDao;

    @Override
    public void addNewOrderFlowRecord(String flowNumber, Order order) {
        OrderFlow orderFlow = new OrderFlow();
        orderFlow.setFlowId(UUID.randomUUID().toString().replace("-", ""));
        orderFlow.setCreateTime(new Date());
        orderFlow.setPayMethod("支付宝在线支付");
        orderFlow.setBookId(order.getBookId());
        orderFlow.setBuyCount(order.getItemCount());
        orderFlow.setOrderNum(order.getOrderNumber());
        orderFlow.setPayAmount(order.getTotalPrice());//支付金额
        orderFlow.setFlowNum(flowNumber);
        orderFlowDao.addNewOrderFlow(orderFlow);
    }

    //支付流水信息
    @Override
    public List<OrderFlow> queryAllFlowByAdmin(Integer rows, Integer page, String orderNumber) {
        Integer index = (page - 1) * rows;
        return orderFlowDao.queryAllFlowByAdmin(rows, index, orderNumber);
    }

    @Override
    public Integer selectFLowTotalCountBySearch(String orderNumber) {
        return orderFlowDao.selectFLowTotalCountBySearch(orderNumber);
    }

    @Override
    public Integer selectFLowsTotalCount() {
        return orderFlowDao.selectFLowsTotalCount();
    }


}
