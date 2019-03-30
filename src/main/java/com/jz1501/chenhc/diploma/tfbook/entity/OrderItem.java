package com.jz1501.chenhc.diploma.tfbook.entity;

import java.io.Serializable;

public class OrderItem implements Serializable {
    private String itemId;
    private String bookId;
    private String orderId;
    private Integer count;
    private Double littleCount;

    //关系属性
    private Book book;

    public OrderItem() {
    }

    public OrderItem(String itemId, String bookId, String orderId, Integer count, Double littleCount) {

        this.itemId = itemId;
        this.bookId = bookId;
        this.orderId = orderId;
        this.count = count;
        this.littleCount = littleCount;
    }

    public OrderItem(String itemId, String bookId, String orderId, Integer count, Double littleCount, Book book) {
        this.itemId = itemId;
        this.bookId = bookId;
        this.orderId = orderId;
        this.count = count;
        this.littleCount = littleCount;
        this.book = book;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    @Override
    public String toString() {
        return "OrderItem{" +
                "itemId='" + itemId + '\'' +
                ", bookId='" + bookId + '\'' +
                ", orderId='" + orderId + '\'' +
                ", count=" + count +
                ", littleCount=" + littleCount +
                '}';
    }

    public String getItemId() {
        return itemId;
    }

    public void setItemId(String itemId) {
        this.itemId = itemId;
    }

    public String getBookId() {
        return bookId;
    }

    public void setBookId(String bookId) {
        this.bookId = bookId;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Double getLittleCount() {
        return littleCount;
    }

    public void setLittleCount(Double littleCount) {
        this.littleCount = littleCount;
    }
}
