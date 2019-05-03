package com.jz1501.chenhc.diploma.tfbook.service;

import com.jz1501.chenhc.diploma.tfbook.entity.Sort;

import java.util.List;

public interface CategoryService {

    public List<Sort> queryAllCategoryName();

    public List<Sort> queryAllFirstLevelSortName();

    //查询分类信息
    public List<Sort> queryAllSecondLevelByParentId_V2(Integer parSortId, Integer sonSortId, Integer granSortId);

    public List<Sort> queryAllSecondLevelByParentId(Integer parSortId);

    //3
    public List<Sort> queryFirstAndSecondLevel();

    public List<Sort> queryAllGrandsonLevelBygspid(Integer gsparentId);

    //标签内子分类
    public List<Sort> queryRandomTagsName();

    //二级分类信息

    public List<Sort> queryAllSecondSortNameByparSortId(Integer parSortId);

    public List<Sort> querySecondPageTags(Integer parSortId);


    public List<Sort> queryAllSort();


}
