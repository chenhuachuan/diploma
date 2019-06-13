package com.jz1501.chenhc.diploma.tfbook.entity;

import java.io.Serializable;

/**
 * @ProjectName:diploma
 * @Package:com.jz1501.chenhc.diploma.tfbook.entity
 * @description:test
 * @author:chenhc
 * @create_time:2019-05-12
 * @version:v1.0.0$
 **/
public class Bor implements Serializable {
    private Integer totalUser;
    private Integer totalOrder;
    private Integer totalRecord;
    private Integer totalAdmin;

    //交易信息统计
    private Double dealMoney;
    private Integer orderCount;
    private Integer dealSuccess;
    private Integer dealFail;
    private Double tkMoney;

    //订单信息统计
    private Integer wcl;
    private Integer dfh;
    private Integer dfk;
    private Integer ycj;
    private Integer ysc;
    //商品信息统计
    private Integer tuzs;
    private Integer sjts;
    private Integer xjts;
    private Integer rxts;
    private Integer jjts;


    public Integer getWcl() {
        return wcl;
    }

    public void setWcl(Integer wcl) {
        this.wcl = wcl;
    }

    public Integer getDfh() {
        return dfh;
    }

    public void setDfh(Integer dfh) {
        this.dfh = dfh;
    }

    public Integer getDfk() {
        return dfk;
    }

    public void setDfk(Integer dfk) {
        this.dfk = dfk;
    }

    public Integer getYcj() {
        return ycj;
    }

    public void setYcj(Integer ycj) {
        this.ycj = ycj;
    }

    public Integer getYsc() {
        return ysc;
    }

    public void setYsc(Integer ysc) {
        this.ysc = ysc;
    }

    public Integer getTuzs() {
        return tuzs;
    }

    public void setTuzs(Integer tuzs) {
        this.tuzs = tuzs;
    }

    public Integer getSjts() {
        return sjts;
    }

    public void setSjts(Integer sjts) {
        this.sjts = sjts;
    }

    public Integer getXjts() {
        return xjts;
    }

    public void setXjts(Integer xjts) {
        this.xjts = xjts;
    }

    public Integer getRxts() {
        return rxts;
    }

    public void setRxts(Integer rxts) {
        this.rxts = rxts;
    }

    public Integer getJjts() {
        return jjts;
    }

    public void setJjts(Integer jjts) {
        this.jjts = jjts;
    }

    @Override
    public String toString() {
        return "Bor{" +
                "totalUser=" + totalUser +
                ", totalOrder=" + totalOrder +
                ", totalRecord=" + totalRecord +
                ", totalAdmin=" + totalAdmin +
                ", dealMoney=" + dealMoney +
                ", orderCount=" + orderCount +
                ", dealSuccess=" + dealSuccess +
                ", dealFail=" + dealFail +
                ", tkMoney=" + tkMoney +
                '}';
    }

    public Double getDealMoney() {
        return dealMoney;
    }

    public void setDealMoney(Double dealMoney) {
        this.dealMoney = dealMoney;
    }

    public Integer getOrderCount() {
        return orderCount;
    }

    public void setOrderCount(Integer orderCount) {
        this.orderCount = orderCount;
    }

    public Integer getDealSuccess() {
        return dealSuccess;
    }

    public void setDealSuccess(Integer dealSuccess) {
        this.dealSuccess = dealSuccess;
    }

    public Integer getDealFail() {
        return dealFail;
    }

    public void setDealFail(Integer dealFail) {
        this.dealFail = dealFail;
    }

    public Double getTkMoney() {
        return tkMoney;
    }

    public void setTkMoney(Double tkMoney) {
        this.tkMoney = tkMoney;
    }

    public Integer getTotalAdmin() {
        return totalAdmin;
    }

    public void setTotalAdmin(Integer totalAdmin) {
        this.totalAdmin = totalAdmin;
    }

    public Bor() {
    }

    public Integer getTotalUser() {
        return totalUser;
    }

    public void setTotalUser(Integer totalUser) {
        this.totalUser = totalUser;
    }

    public Integer getTotalOrder() {
        return totalOrder;
    }

    public void setTotalOrder(Integer totalOrder) {
        this.totalOrder = totalOrder;
    }

    public Integer getTotalRecord() {
        return totalRecord;
    }

    public void setTotalRecord(Integer totalRecord) {

        this.totalRecord = totalRecord;
    }
}
