package com.jz1501.chenhc.diploma.tfbook.dao;

import com.jz1501.chenhc.diploma.tfbook.entity.Sort;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CategoryMapper {

    public List<Sort> selectAllCategoryName();

    public List<Sort> selectParentLevel();

    public List<Sort> selectSecondLevelByParentId_V2(@Param("parSortId") Integer parSortId,
                                                     @Param("sonSortId") Integer sonSortId,
                                                     @Param("granSortId") Integer granSortId);

    public List<Sort> selectSecondLevelByParentId(Integer parSortId);


    //3
    public List<Sort> selectParentAndSonLevel();

    public List<Sort> selectGrandsonLevelBySpid(Integer gsParentId);

    //public List<Sort> selectSonLevel();

    //public List<Sort> selectGrandsonLevel();

    //标签子分类
    public List<Sort> selectGrandsonSortName();

    //二级

    public List<Sort> selectSecondSortNameById(Integer parSortId);

    //tags
    public List<Sort> selectSecondPageTags(Integer parSortId);

    //修改分类名


    public List<Sort> selectAllSort();







}
