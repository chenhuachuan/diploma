package com.jz1501.chenhc.diploma.tfbook.entity;

import java.io.Serializable;
import java.util.List;

public class Sort implements Serializable {
    private Integer sortId;
    private String sortName;
    private Integer parentId;
    private Integer sortCount;
    //关系属性
    private List<Sort> sortList;//一级分类下的所有二级分类


    @Override
    public String toString() {
        return "Sort{" +
                "sortId='" + sortId + '\'' +
                ", sortName='" + sortName + '\'' +
                ", parentId='" + parentId + '\'' +
                ", sortCount=" + sortCount +
                ", sortList=" + sortList +
                '}';
    }

    public List<Sort> getSortList() {
        return sortList;
    }

    public void setSortList(List<Sort> sortList) {
        this.sortList = sortList;
    }


    public Sort() {
    }

    public Sort(Integer sortId, String sortName, Integer parentId, Integer sortCount, List<Sort> sortList) {
        this.sortId = sortId;
        this.sortName = sortName;
        this.parentId = parentId;
        this.sortCount = sortCount;
        this.sortList = sortList;
    }

    public Integer getSortId() {

        return sortId;
    }

    public void setSortId(Integer sortId) {
        this.sortId = sortId;
    }

    public String getSortName() {
        return sortName;
    }

    public void setSortName(String sortName) {
        this.sortName = sortName;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public Integer getSortCount() {
        return sortCount;
    }

    public void setSortCount(Integer sortCount) {
        this.sortCount = sortCount;
    }
}
