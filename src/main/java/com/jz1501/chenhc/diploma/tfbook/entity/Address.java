package com.jz1501.chenhc.diploma.tfbook.entity;

import java.io.Serializable;

public class Address implements Serializable {
    private String addressId;
    private String addrName;
    private String receiveName;
    private String zipCode;
    private String receiveTel;
    private String userId;
    private String nickAddrName;//地址别名
    private String nickAddrId;//别名ID
    //省市县
    private String provNameAddr;
    private String cityNameAddr;
    private String areaNameAddr;

    public Address() {
    }

    @Override
    public String toString() {
        return "Address{" +
                "addressId='" + addressId + '\'' +
                ", addrName='" + addrName + '\'' +
                ", receiveName='" + receiveName + '\'' +
                ", zipCode=" + zipCode +
                ", receiveTel='" + receiveTel + '\'' +
                ", userId='" + userId + '\'' +
                ", nickAddrName='" + nickAddrName + '\'' +
                ", nickAddrId='" + nickAddrId + '\'' +
                ", provNameAddr='" + provNameAddr + '\'' +
                ", cityNameAddr='" + cityNameAddr + '\'' +
                ", areaNameAddr='" + areaNameAddr + '\'' +
                '}';
    }

    public String getNickAddrName() {
        return nickAddrName;
    }

    public void setNickAddrName(String nickAddrName) {
        this.nickAddrName = nickAddrName;
    }

    public String getNickAddrId() {
        return nickAddrId;
    }

    public void setNickAddrId(String nickAddrId) {
        this.nickAddrId = nickAddrId;
    }

    public String getProvNameAddr() {
        return provNameAddr;
    }

    public void setProvNameAddr(String provNameAddr) {
        this.provNameAddr = provNameAddr;
    }

    public String getCityNameAddr() {
        return cityNameAddr;
    }

    public void setCityNameAddr(String cityNameAddr) {
        this.cityNameAddr = cityNameAddr;
    }

    public String getAreaNameAddr() {
        return areaNameAddr;
    }

    public void setAreaNameAddr(String areaNameAddr) {
        this.areaNameAddr = areaNameAddr;
    }

    public Address(String addressId, String addrName, String receiveName, String zipCode, String receiveTel, String userId, String nickAddrName, String nickAddrId, String provNameAddr, String cityNameAddr, String areaNameAddr) {

        this.addressId = addressId;
        this.addrName = addrName;
        this.receiveName = receiveName;
        this.zipCode = zipCode;
        this.receiveTel = receiveTel;
        this.userId = userId;
        this.nickAddrName = nickAddrName;
        this.nickAddrId = nickAddrId;
        this.provNameAddr = provNameAddr;
        this.cityNameAddr = cityNameAddr;
        this.areaNameAddr = areaNameAddr;
    }

    public String getAddressId() {
        return addressId;
    }

    public void setAddressId(String addressId) {
        this.addressId = addressId;
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

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public String getReceiveTel() {
        return receiveTel;
    }

    public void setReceiveTel(String receiveTel) {
        this.receiveTel = receiveTel;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
}
