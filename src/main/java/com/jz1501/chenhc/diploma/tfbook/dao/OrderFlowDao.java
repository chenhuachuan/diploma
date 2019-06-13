package com.jz1501.chenhc.diploma.tfbook.dao;

import com.jz1501.chenhc.diploma.tfbook.entity.OrderFlow;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @ProjectName:diploma
 * @Package:com.jz1501.chenhc.diploma.tfbook.dao
 * @description:${description}
 * @author:chenhc
 * @create_time:2019-05-25
 * @version:$version$
 **/
public interface OrderFlowDao {

    public void addNewOrderFlow(OrderFlow orderFlow);


    public List<OrderFlow> queryAllFlowByAdmin(@Param("row") Integer row, @Param("index") Integer index, @Param("orderNumber") String orderNumber);

    public Integer selectFLowTotalCountBySearch(String orderNumber);

    public Integer selectFLowsTotalCount();

}
