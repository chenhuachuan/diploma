package com.jz1501.chenhc.diploma.tfbook.entity;

import java.io.Serializable;

public class Address implements Serializable {
    private String addressId;
    private String addrName;
    private String receiveName;
    private Integer zipCode;
    private String receiveTel;
    private String userId;

    public Address() {
    }

    public Address(String addressId, String addrName, String receiveName, Integer zipCode, String receiveTel, String userId) {

        this.addressId = addressId;
        this.addrName = addrName;
        this.receiveName = receiveName;
        this.zipCode = zipCode;
        this.receiveTel = receiveTel;
        this.userId = userId;
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
                '}';
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

    public Integer getZipCode() {
        return zipCode;
    }

    public void setZipCode(Integer zipCode) {
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
