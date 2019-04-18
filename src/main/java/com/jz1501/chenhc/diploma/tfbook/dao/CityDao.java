package com.jz1501.chenhc.diploma.tfbook.dao;

import com.jz1501.chenhc.diploma.tfbook.entity.City;

import java.util.List;

public interface CityDao {
    /**
     * 查所有城市
     *
     * @return
     *
     */
    public List<City> selectAllCity(String provinceCode);

    public City selectCityNameByCode(String provCode);

}
