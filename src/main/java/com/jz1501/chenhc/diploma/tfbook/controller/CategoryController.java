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

    @RequestMapping("/all_category_name_json1")
    @ResponseBody
    public List<Sort> queryAllCategoryNameJson1() {
        List<Sort> sorts = categoryService.queryAllSort();
        return sorts;
    }

    @RequestMapping("/all_category_name_json")
    @ResponseBody
    public List<Sort> queryAllCategoryNameJson() {
        List<Sort> sorts = categoryService.queryAllParentSort();
        return sorts;
    }

    @RequestMapping("/second_category_name_json")
    @ResponseBody
    public List<Sort> querySecondCategoryNameJson(Integer sortId) {
        List<Sort> sorts = categoryService.queryAllSonSortByParentId(sortId);
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

    @RequestMapping("/add_newSort_CNG_001")
    @ResponseBody
    public String addNewSortCNG001(String sortName, Integer sortOne, Integer sortTwo, Integer sortThree) {
        System.out.println("add____：\t" + sortName + "sortONE: \t" + sortOne + "__sortTWO:\t" + sortTwo + "__sortTHREE:\t" + sortThree);
        Integer sortPkNumber = categoryService.getSortPkNumber();
        Sort sortInfo = new Sort();
        sortInfo.setSortId(sortPkNumber + 1);
        sortInfo.setSortName(sortName);
        sortInfo.setSortCount(0);

        if (sortOne != null && sortTwo != null && sortThree != null) {
            sortInfo.setParentId(sortThree);
        }
        if (sortTwo != null && sortThree == null && sortOne != null) {
            sortInfo.setParentId(sortTwo);
        }
        if (sortOne != null && sortTwo == null && sortThree == null) {
            sortInfo.setParentId(sortOne);
        }
        if (sortOne == null && sortTwo == null && sortThree == null) {
            throw new RuntimeException("chuanzhi error");
        }
        try {
            categoryService.addNewSort_CNG_Ser(sortInfo);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "fail";
        }
    }

    @RequestMapping("/deleteOneSort_CNG_001")
    @ResponseBody
    public String addNewSortCNG001(Integer sortId) {
        System.out.println("del___:" + sortId);

        try {
            categoryService.deleteOneSortInfo_CNG_Ser(sortId);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("删除分类失败");
        }

    }

    @RequestMapping("/modifydOneSort_CNG_001")
    @ResponseBody
    public String modiftONtSortCNG001(Integer sortId, Integer parentId, String sortName, Integer sortTwo, Integer sortOne, Integer sortDB) {
        System.out.println("update___:\t" + sortName + "sortONE:\t" + sortOne + "__sortTWO:\t" + sortTwo + "__parentId:\t" + parentId + "\t__sortDB:\t" + sortDB);
        Sort sortInfo = new Sort();
        sortInfo.setSortId(sortId);
        sortInfo.setSortName(sortName);
        sortInfo.setSortCount(null);

        if (sortTwo != null && sortOne != null && parentId != null) {
            sortInfo.setParentId(sortTwo);
        }
        if (sortTwo == null && sortOne != null && parentId != null) {
            sortInfo.setParentId(sortOne);
        }
        if (sortTwo == null && sortOne == null && parentId != null && sortDB == null) {
            sortInfo.setParentId(parentId);
        }
        if (sortOne == null && parentId != null && sortTwo == null && sortDB != null) {
            sortInfo.setParentId(sortDB);
        }

        try {
            categoryService.updateOneSortInfo_CNG_Ser(sortInfo);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("修改分类失败");
        }

    }












}
