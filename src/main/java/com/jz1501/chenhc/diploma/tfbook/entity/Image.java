package com.jz1501.chenhc.diploma.tfbook.entity;

import java.io.Serializable;
import java.util.Date;

public class Image implements Serializable {
    private String imageId;
    private String imageDesc;
    private String imageSize;
    private String imageUrl;
    private Date replaceTime;
    private String status;//1:启用，0：未启用,禁用,2:删除
    private String type;//1：轮播，0：小图

    @Override
    public String toString() {
        return "Image{" +
                "imageId='" + imageId + '\'' +
                ", imageDesc='" + imageDesc + '\'' +
                ", imageSize='" + imageSize + '\'' +
                ", imageUrl='" + imageUrl + '\'' +
                ", replaceTime=" + replaceTime +
                ", status='" + status + '\'' +
                ", type='" + type + '\'' +
                '}';
    }

    public String getImageDesc() {
        return imageDesc;
    }

    public void setImageDesc(String imageDesc) {
        this.imageDesc = imageDesc;
    }

    public String getImageSize() {
        return imageSize;
    }

    public void setImageSize(String imageSize) {
        this.imageSize = imageSize;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public Date getReplaceTime() {
        return replaceTime;
    }

    public void setReplaceTime(Date replaceTime) {
        this.replaceTime = replaceTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Image() {

    }

    public String getImageId() {

        return imageId;
    }

    public void setImageId(String imageId) {
        this.imageId = imageId;
    }
}
