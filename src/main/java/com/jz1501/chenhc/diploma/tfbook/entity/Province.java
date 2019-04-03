package com.jz1501.chenhc.diploma.tfbook.entity;

import java.io.Serializable;

public class Province implements Serializable {
    private String provId;
    private String provName;
    private String provCode;

    @Override
    public String toString() {
        return "Province{" +
                "provId='" + provId + '\'' +
                ", provName='" + provName + '\'' +
                ", provCode='" + provCode + '\'' +
                '}';
    }

    public String getProvId() {
        return provId;
    }

    public void setProvId(String provId) {
        this.provId = provId;
    }

    public String getProvName() {
        return provName;
    }

    public void setProvName(String provName) {
        this.provName = provName;
    }

    public String getProvCode() {
        return provCode;
    }

    public void setProvCode(String provCode) {
        this.provCode = provCode;
    }

    public Province() {

    }

    public Province(String provId, String provName, String provCode) {

        this.provId = provId;
        this.provName = provName;
        this.provCode = provCode;
    }
}
