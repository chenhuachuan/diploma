package com.jz1501.chenhc.diploma.tfbook.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @ProjectName:diploma
 * @Package:com.jz1501.chenhc.diploma.tfbook.entity
 * @description:
 * @author:chenhc
 * @create_time:2019-04-24
 * @version:$
 **/
public class OrderFlow implements Serializable {
    private String flowId;
    private String flowNum;//流水号
    private String orderNum;//订单号
    private String bookId;
    private Double payAmount;//支付金额
    private String payMethod;//方式
    private Integer buyCount;//购买数量
    private Date createTime;//创建时间

    public String getFlowId() {
        return flowId;
    }

    public void setFlowId(String flowId) {
        this.flowId = flowId;
    }

    public String getFlowNum() {
        return flowNum;
    }

    public void setFlowNum(String flowNum) {
        this.flowNum = flowNum;
    }

    public String getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(String orderNum) {
        this.orderNum = orderNum;
    }

    public String getBookId() {
        return bookId;
    }

    public void setBookId(String bookId) {
        this.bookId = bookId;
    }

    public Double getPayAmount() {
        return payAmount;
    }

    public void setPayAmount(Double payAmount) {
        this.payAmount = payAmount;
    }

    public String getPayMethod() {
        return payMethod;
    }

    public void setPayMethod(String payMethod) {
        this.payMethod = payMethod;
    }

    public Integer getBuyCount() {
        return buyCount;
    }

    public void setBuyCount(Integer buyCount) {
        this.buyCount = buyCount;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public OrderFlow() {

    }
}
