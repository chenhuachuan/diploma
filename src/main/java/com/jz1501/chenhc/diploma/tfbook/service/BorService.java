package com.jz1501.chenhc.diploma.tfbook.service;

import com.jz1501.chenhc.diploma.tfbook.entity.Bor;

/**
 * @ProjectName:diploma
 * @Package:com.jz1501.chenhc.diploma.tfbook.service
 * @description:${description}
 * @author:chenhc
 * @create_time:2019-05-26
 * @version:$version$
 **/
public interface BorService {

    public Bor queryTotalUserOrderRecore();

    public Integer queryTotalUsers();

    public Integer queryTotalOrders();

    public Integer queryTotalRecord();


    //用户数统计
    public Bor queryUsersStaties();

    //交易信息统计
    public Bor queryDealInfoStaties();

    //订单信息统计
    public Bor queryOrderStaties();

    //图书信息统计
    public Bor queryBooksInfoStaties();

}
