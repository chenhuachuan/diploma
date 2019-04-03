package com.jz1501.chenhc.diploma.tfbook.service;

import com.jz1501.chenhc.diploma.tfbook.entity.Area;
import com.jz1501.chenhc.diploma.tfbook.entity.City;
import com.jz1501.chenhc.diploma.tfbook.entity.Province;

import java.util.List;

public interface CascadingService {

    /**
     * 查所有省
     *
     * @return
     */
    public List<Province> queryAllProvinces();

    /**
     * 查所有的城市
     *
     * @param provinceCode
     * @return
     */
    public List<City> queryAllCities(String provinceCode);

    /**
     * 查询所有地区
     *
     * @param cityCode
     * @return
     */
    public List<Area> queryAllAreas(String cityCode);

}
