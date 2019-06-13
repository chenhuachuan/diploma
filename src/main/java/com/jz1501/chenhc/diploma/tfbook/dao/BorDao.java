package com.jz1501.chenhc.diploma.tfbook.dao;

import com.jz1501.chenhc.diploma.tfbook.entity.Bor;

/**
 * @ProjectName:diploma
 * @Package:com.jz1501.chenhc.diploma.tfbook.dao
 * @description:${description}
 * @author:chenhc
 * @create_time:2019-05-12
 * @version:$version$
 **/
public interface BorDao {

    public Bor selectTotalUserOrderRecore();

    public Integer selectTotalUsers();

    public Integer selectTotalOrders();

    public Integer selectTotalRecord();

    //订单信息统计
    public Bor selectOrderStaties();

    //图书信息统计
    public Bor selectBooksInfoStaties();

    //用户数统计
    public Bor selectUsersStaties();

    //++++++++++++++++++++++++
    //交易信息统计
    public Bor selectDealInfoStaties();


}
