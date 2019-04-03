package com.jz1501.chenhc.diploma.tfbook.serviceImpl;

import com.jz1501.chenhc.diploma.tfbook.dao.AreaDao;
import com.jz1501.chenhc.diploma.tfbook.dao.CityDao;
import com.jz1501.chenhc.diploma.tfbook.dao.ProvinceDao;
import com.jz1501.chenhc.diploma.tfbook.entity.Area;
import com.jz1501.chenhc.diploma.tfbook.entity.City;
import com.jz1501.chenhc.diploma.tfbook.entity.Province;
import com.jz1501.chenhc.diploma.tfbook.service.CascadingService;
import com.whalin.MemCached.MemCachedClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CascadingServiceImpl implements CascadingService {

    @Autowired(required = false)
    private AreaDao areaDao;
    @Autowired(required = false)
    private CityDao cityDao;
    @Autowired(required = false)
    private ProvinceDao provinceDao;
    @Autowired
    private MemCachedClient memCachedClient;

    /**
     * 查询所有省
     *
     * @return
     */
    @Override
    public List<Province> queryAllProvinces() {
        String clazz = Thread.currentThread().getStackTrace()[1].getClassName();
        String method = Thread.currentThread().getStackTrace()[1].getMethodName();
        String key = clazz + ":" + method;
        Object provinces = memCachedClient.get(key);
        if (provinces == null) {
            provinces = provinceDao.selectAllProvince();
            memCachedClient.add(key, provinces);
        }
        return (List<Province>) provinces;
    }

    /**
     * 查询所有市
     *
     * @param provinceCode
     * @return
     */
    @Override
    public List<City> queryAllCities(String provinceCode) {
        String clazz = Thread.currentThread().getStackTrace()[1].getClassName();
        String method = Thread.currentThread().getStackTrace()[1].getMethodName();
        String key = clazz + ":" + method + ":provinceCode:" + provinceCode;
        Object cities = memCachedClient.get(key);
        if (cities == null) {
            cities = cityDao.selectAllCity(provinceCode);
            memCachedClient.add(key, cities);
        }
        return (List<City>) cities;
    }

    /**
     * 查询所有县
     *
     * @return
     */
    @Override
    public List<Area> queryAllAreas(String cityCode) {
        String clazz = Thread.currentThread().getStackTrace()[1].getClassName();
        String method = Thread.currentThread().getStackTrace()[1].getMethodName();
        String key = clazz + ":" + method + ":cityCode" + cityCode;

        Object areas = memCachedClient.get(key);
        if (areas == null) {
            areas = areaDao.selectAllArea(cityCode);
            memCachedClient.add(key, areas);
        }
        return (List<Area>) areas;
    }
}
