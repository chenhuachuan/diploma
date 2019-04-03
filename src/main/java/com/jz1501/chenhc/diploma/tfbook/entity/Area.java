package com.jz1501.chenhc.diploma.tfbook.entity;

import java.io.Serializable;

public class Area implements Serializable {
    private String areaId;
    private String areaCode;
    private String areaName;
    private String cityCode;

    public Area() {
    }

    public Area(String areaId, String areaCode, String areaName, String cityCode) {

        this.areaId = areaId;
        this.areaCode = areaCode;
        this.areaName = areaName;
        this.cityCode = cityCode;
    }

    @Override
    public String toString() {
        return "Area{" +
                "areaId='" + areaId + '\'' +
                ", areaCode='" + areaCode + '\'' +
                ", areaName='" + areaName + '\'' +
                ", cityCode='" + cityCode + '\'' +
                '}';
    }

    public String getAreaId() {
        return areaId;
    }

    public void setAreaId(String areaId) {
        this.areaId = areaId;
    }

    public String getAreaCode() {
        return areaCode;
    }

    public void setAreaCode(String areaCode) {
        this.areaCode = areaCode;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public String getCityCode() {
        return cityCode;
    }

    public void setCityCode(String cityCode) {
        this.cityCode = cityCode;
    }
}
