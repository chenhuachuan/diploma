package com.jz1501.chenhc.diploma.tfbook.service;

import com.jz1501.chenhc.diploma.tfbook.entity.Sort;

import java.util.List;

public interface CategoryService {

    public List<Sort> queryAllCategoryName();

    public List<Sort> queryAllFirstLevelSortName();

    public List<Sort> queryAllSecondLevelByParentId(Integer sparentId);

    //3
    public List<Sort> queryFirstAndSecondLevel();

    public List<Sort> queryAllGrandsonLevelBygspid(Integer gsparentId);

    //标签内子分类
    public List<Sort> queryRandomTagsName();
}
