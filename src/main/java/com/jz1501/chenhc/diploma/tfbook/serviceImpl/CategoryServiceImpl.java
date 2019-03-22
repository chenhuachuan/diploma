package com.jz1501.chenhc.diploma.tfbook.serviceImpl;

import com.jz1501.chenhc.diploma.tfbook.dao.CategoryMapper;
import com.jz1501.chenhc.diploma.tfbook.entity.Sort;
import com.jz1501.chenhc.diploma.tfbook.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {

    @Autowired(required = false)
    private CategoryMapper categoryMapper;

    @Override
    public List<Sort> queryAllCategoryName() {
        return categoryMapper.selectAllCategoryName();
    }

    @Override
    public List<Sort> queryAllFirstLevelSortName() {
        return categoryMapper.selectParentLevel();
    }

    @Override
    public List<Sort> queryAllSecondLevelByParentId(Integer sparentId) {
        return categoryMapper.selectSecondLevelByParentId(sparentId);
    }

    @Override
    public List<Sort> queryFirstAndSecondLevel() {
        return categoryMapper.selectParentAndSonLevel();
    }

    @Override
    public List<Sort> queryAllGrandsonLevelBygspid(Integer gsparentId) {
        return categoryMapper.selectGrandsonLevelBySpid(gsparentId);
    }

    @Override
    public List<Sort> queryRandomTagsName() {
        return categoryMapper.selectGrandsonSortName();
    }
}
