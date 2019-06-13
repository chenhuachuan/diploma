package com.jz1501.chenhc.diploma.tfbook.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class Order implements Serializable {
    private String orderId;
    private String orderNumber;//订单号
    private Double totalPrice;
    private String addrName;//详细地址
    private String receiveName;//收货人
    private String receiveTel;//电话
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    private String status; //10:代付款，20：已付款 30：用户删除订单 40：发货  50:已发货  60：取消订单
    private String itemCount;//每本数量
    private String bookName;//图书名
    private String bookPrice;//图书价格
    private String itemLittlePrice;//每种书的小计
    private String userId;
    private String addressId;
    private String bookId;

   /* private List<Book> booklist;//图书

    public List<Book> getBooklist() {
        return booklist;
    }

    public void setBooklist(List<Book> booklist) {
        this.booklist = booklist;
    }*/

    public String getBookId() {
        return bookId;
    }

    public void setBookId(String bookId) {
        this.bookId = bookId;
    }

    public Order() {
    }

    public String getBookPrice() {
        return bookPrice;
    }

    public void setBookPrice(String bookPrice) {
        this.bookPrice = bookPrice;
    }

    public String getItemCount() {
        return itemCount;
    }

    public void setItemCount(String itemCount) {
        this.itemCount = itemCount;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getItemLittlePrice() {
        return itemLittlePrice;
    }

    public void setItemLittlePrice(String itemLittlePrice) {
        this.itemLittlePrice = itemLittlePrice;
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
                ", itemCount='" + itemCount + '\'' +
                ", bookName='" + bookName + '\'' +
                ", bookPrice='" + bookPrice + '\'' +
                ", itemLittlePrice='" + itemLittlePrice + '\'' +
                ", userId='" + userId + '\'' +
                ", addressId='" + addressId + '\'' +
                '}';
    }
}
