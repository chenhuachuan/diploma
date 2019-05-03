package com.jz1501.chenhc.diploma.tfbook.controller;

import com.jz1501.chenhc.diploma.tfbook.entity.Sort;
import com.jz1501.chenhc.diploma.tfbook.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/category")
public class CategoryController {
    @Autowired
    private CategoryService categoryService;

    @RequestMapping("/all_category_name")
    public String queryAllCategoryName(Model model) {
        List<Sort> sorts = categoryService.queryAllCategoryName();
        model.addAttribute("sortsList", sorts);
        return "forward:/pages/innerpage/category_navigation.jsp";
    }

    @RequestMapping("/all_category_name_json")
    @ResponseBody
    public List<Sort> queryAllCategoryNameJson() {
        List<Sort> sorts = categoryService.queryAllSort();
        return sorts;
    }

    @RequestMapping("/first_categroy_name")
    public String queryFirstLevel(Model model) {
        List<Sort> sorts = categoryService.queryAllFirstLevelSortName();
        model.addAttribute("p_Sorts", sorts);
        return "forward:/pages/innerpage/category_navigation.jsp";
    }

    @RequestMapping("/second_cateName_spid")
    public String queryAllSecondLevelbySpid(Integer sparentId, Model model) {
        List<Sort> sorts = categoryService.queryAllSecondLevelByParentId(sparentId);
        model.addAttribute("second_Sorts", sorts);
        return "forward:/pages/innerpage/category_navigation.jsp";
    }

    //plan 3
    @RequestMapping("/first_second_categoryName")
    public String queryCategoryName(Model model) {
        List<Sort> sorts = categoryService.queryFirstAndSecondLevel();
        model.addAttribute("first_second_sorts", sorts);
        return "forward:/pages/innerpage/category_navigation.jsp";
    }

    @RequestMapping("/grandson_level_name")
    public String queryGrandsonLevelbySpid(Integer sparentId, Model model) {
        List<Sort> sorts = categoryService.queryAllGrandsonLevelBygspid(sparentId);
        model.addAttribute("grandson_Sorts", sorts);
        return "forward:/pages/innerpage/category_navigation.jsp";
    }

    /**
     * 首页标签 分类名称
     * @param model
     * @return
     */
    @RequestMapping("/recommendSortTags")
    public String queryRandomTags(Model model) {
        List<Sort> sorts = categoryService.queryRandomTagsName();
        model.addAttribute("tagsName", sorts);
        return "forward:/pages/innerpage/tags_sort.jsp";
    }

}
