package com.jz1501.chenhc.diploma.tfbook.service;

import com.jz1501.chenhc.diploma.tfbook.entity.Order;
import com.jz1501.chenhc.diploma.tfbook.entity.OrderFlow;

import java.util.List;

/**
 * @ProjectName:diploma
 * @Package:com.jz1501.chenhc.diploma.tfbook.service
 * @description:${description}
 * @author:chenhc
 * @create_time:2019-05-25
 * @version:$version$
 **/
public interface OrderFlowService {

    void addNewOrderFlowRecord(String flowNumber, Order order);

    //支付流水
    public List<OrderFlow> queryAllFlowByAdmin(Integer rows, Integer page, String orderNumber);

    public Integer selectFLowTotalCountBySearch(String orderNumber);

    public Integer selectFLowsTotalCount();


}
