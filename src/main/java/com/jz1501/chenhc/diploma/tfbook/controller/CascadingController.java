package com.jz1501.chenhc.diploma.tfbook.controller;

import com.jz1501.chenhc.diploma.tfbook.entity.Area;
import com.jz1501.chenhc.diploma.tfbook.entity.City;
import com.jz1501.chenhc.diploma.tfbook.entity.Province;
import com.jz1501.chenhc.diploma.tfbook.service.CascadingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/cascade")
public class CascadingController {

    @Autowired
    private CascadingService cascadingService;

    /**
     * 所有省
     *
     * @param model
     * @return
     */
    @RequestMapping("/allProvinces")
    @ResponseBody
    public List<Province> allProvince(Model model) {
        List<Province> provinces = cascadingService.queryAllProvinces();
        model.addAttribute("provinces", provinces);
        return provinces;
    }

    /**
     * 所有市
     *
     * @param model
     * @param provCode
     * @return
     */
    @RequestMapping("/allCities")
    @ResponseBody
    public List<City> allCities(Model model, String provCode) {
        List<City> cities = cascadingService.queryAllCities(provCode);
        model.addAttribute("cities", cities);
        return cities;
    }

    /**
     * 所有县
     *
     * @param model
     * @param cityCode
     * @return
     */
    @RequestMapping("/allAreas")
    @ResponseBody
    public List<Area> allAreas(Model model, String cityCode) {
        List<Area> areas = cascadingService.queryAllAreas(cityCode);
        model.addAttribute("areas", areas);
        return areas;
    }


}
