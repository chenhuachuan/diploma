package com.jz1501.chenhc.diploma.tfbook.entity;

import java.io.Serializable;

public class City implements Serializable {
    private String cityId;
    private String cityCode;
    private String cityName;
    private String provinceCode;

    public City() {
    }

    public City(String cityId, String cityCode, String cityName, String provinceCode) {

        this.cityId = cityId;
        this.cityCode = cityCode;
        this.cityName = cityName;
        this.provinceCode = provinceCode;
    }

    @Override
    public String toString() {
        return "City{" +
                "cityId='" + cityId + '\'' +
                ", cityCode='" + cityCode + '\'' +
                ", cityName='" + cityName + '\'' +
                ", provinceCode='" + provinceCode + '\'' +
                '}';
    }

    public String getCityId() {
        return cityId;
    }

    public void setCityId(String cityId) {
        this.cityId = cityId;
    }

    public String getCityCode() {
        return cityCode;
    }

    public void setCityCode(String cityCode) {
        this.cityCode = cityCode;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public String getProvinceCode() {
        return provinceCode;
    }

    public void setProvinceCode(String provinceCode) {
        this.provinceCode = provinceCode;
    }
}
