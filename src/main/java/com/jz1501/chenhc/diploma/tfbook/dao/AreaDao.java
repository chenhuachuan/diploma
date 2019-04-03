package com.jz1501.chenhc.diploma.tfbook.dao;

import com.jz1501.chenhc.diploma.tfbook.entity.Area;

import java.util.List;

public interface AreaDao {
    public List<Area> selectAllArea(String cityCode);
}
