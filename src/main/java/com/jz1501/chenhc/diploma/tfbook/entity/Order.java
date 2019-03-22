package com.jz1501.chenhc.diploma.tfbook.entity;

import java.io.Serializable;
import java.util.Date;

public class Order implements Serializable {
    private String orderId;
    private String orderNumber;//订单号
    private Double totalPrice;
    private String addrName;
    private String receiveName;
    private String receiveTel;
    private Date createTime;
    private String status;
    private String userId;
    private String addressId;

    public Order() {
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderId='" + orderId + '\'' +
                ", orderNumber='" + orderNumber + '\'' +
                ", totalPrice=" + totalPrice +
                ", addrName='" + addrName + '\'' +
                ", receiveName='" + receiveName + '\'' +
                ", receiveTel='" + receiveTel + '\'' +
                ", createTime=" + createTime +
                ", status='" + status + '\'' +
                ", userId='" + userId + '\'' +
                ", addressId='" + addressId + '\'' +
                '}';
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getAddrName() {
        return addrName;
    }

    public void setAddrName(String addrName) {
        this.addrName = addrName;
    }

    public String getReceiveName() {
        return receiveName;
    }

    public void setReceiveName(String receiveName) {
        this.receiveName = receiveName;
    }

    public String getReceiveTel() {
        return receiveTel;
    }

    public void setReceiveTel(String receiveTel) {
        this.receiveTel = receiveTel;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getAddressId() {
        return addressId;
    }

    public void setAddressId(String addressId) {
        this.addressId = addressId;
    }

    public Order(String orderId, String orderNumber, Double totalPrice, String addrName, String receiveName, String receiveTel, Date createTime, String status, String userId, String addressId) {

        this.orderId = orderId;
        this.orderNumber = orderNumber;
        this.totalPrice = totalPrice;
        this.addrName = addrName;
        this.receiveName = receiveName;
        this.receiveTel = receiveTel;
        this.createTime = createTime;
        this.status = status;
        this.userId = userId;
        this.addressId = addressId;
    }
}
