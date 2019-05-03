package com.jz1501.chenhc.diploma.tfbook.serviceImpl;

import com.jz1501.chenhc.diploma.tfbook.dao.CategoryMapper;
import com.jz1501.chenhc.diploma.tfbook.entity.Sort;
import com.jz1501.chenhc.diploma.tfbook.service.CategoryService;
import com.whalin.MemCached.MemCachedClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {

    @Autowired(required = false)
    private CategoryMapper categoryMapper;
    @Autowired
    private MemCachedClient memCachedClient;

    @Override
    //@ReadThroughAssignCache(assignedKey = "com.jz1501.chenhc.diploma.tfbook.serviceImpl.CategoryServiceImpl.queryAllCategoryName", namespace = "category", expiration = 0)
    public List<Sort> queryAllCategoryName() {
        String clazz = Thread.currentThread().getStackTrace()[1].getClassName();
        String method = Thread.currentThread().getStackTrace()[1].getMethodName();
        Object sorts = memCachedClient.get(clazz + ":" + method);
        if (sorts == null) {
            sorts = categoryMapper.selectAllCategoryName();
            memCachedClient.add(clazz + ":" + method, sorts);
        }
        return (List<Sort>) sorts;
    }

    @Override
    //@ReadThroughAssignCache(assignedKey = "com.jz1501.chenhc.diploma.tfbook.serviceImpl.CategoryServiceImpl.queryAllFirstLevelSortName",namespace = "category")
    public List<Sort> queryAllFirstLevelSortName() {
        String clazz = Thread.currentThread().getStackTrace()[1].getClassName();
        String method = Thread.currentThread().getStackTrace()[1].getMethodName();
        Object sorts = memCachedClient.get(clazz + ":" + method);
        if (sorts == null) {
            sorts = categoryMapper.selectParentLevel();
            memCachedClient.add(clazz + ":" + method, sorts);
        }
        return (List<Sort>) sorts;
    }

    @Override
    // @ReadThroughAssignCache(assignedKey = "com.jz1501.chenhc.diploma.tfbook.serviceImpl.CategoryServiceImpl.queryAllSecondLevelByParentId:Integer sparentId",namespace = "category")
    public List<Sort> queryAllSecondLevelByParentId_V2(Integer parSortId, Integer sonSortId, Integer granSortId) {
        String clazz = Thread.currentThread().getStackTrace()[1].getClassName();
        String method = Thread.currentThread().getStackTrace()[1].getMethodName();
        String key = clazz + ":" + method + ":parSortId" + parSortId + ":sonSortId" + sonSortId + ":granSortId" + granSortId;
        Object sorts = memCachedClient.get(key);
        if (sorts == null) {
            sorts = categoryMapper.selectSecondLevelByParentId_V2(parSortId, sonSortId, granSortId);
            memCachedClient.add(key, sorts);
        }
        return (List<Sort>) sorts;
    }

    @Override
    // @ReadThroughAssignCache(assignedKey = "com.jz1501.chenhc.diploma.tfbook.serviceImpl.CategoryServiceImpl.queryAllSecondLevelByParentId:Integer sparentId",namespace = "category")
    public List<Sort> queryAllSecondLevelByParentId(Integer parSortId) {
        String clazz = Thread.currentThread().getStackTrace()[1].getClassName();
        String method = Thread.currentThread().getStackTrace()[1].getMethodName();
        String key = clazz + ":" + method + ":parSortId" + parSortId;
        Object sorts = memCachedClient.get(key);
        if (sorts == null) {
            sorts = categoryMapper.selectSecondLevelByParentId(parSortId);
            memCachedClient.add(key, sorts);
        }
        return (List<Sort>) sorts;
    }

    @Override
    //@ReadThroughAssignCache(assignedKey = "com.jz1501.chenhc.diploma.tfbook.serviceImpl.CategoryServiceImpl.queryFirstAndSecondLevel",namespace = "category")
    public List<Sort> queryFirstAndSecondLevel() {
        String clazz = Thread.currentThread().getStackTrace()[1].getClassName();
        String method = Thread.currentThread().getStackTrace()[1].getMethodName();
        String key = clazz + ":" + method;
        Object sorts = memCachedClient.get(key);
        if (sorts == null) {
            sorts = categoryMapper.selectParentAndSonLevel();
            memCachedClient.add(key, sorts);
        }
        return (List<Sort>) sorts;
    }

    @Override
    //@ReadThroughAssignCache(assignedKey = "com.jz1501.chenhc.diploma.tfbook.serviceImpl.CategoryServiceImpl.queryAllGrandsonLevelBygspid:Integer gsparentId",namespace = "category")
    public List<Sort> queryAllGrandsonLevelBygspid(Integer gsparentId) {
        String clazz = Thread.currentThread().getStackTrace()[1].getClassName();
        String method = Thread.currentThread().getStackTrace()[1].getMethodName();
        String key = clazz + ":" + method + ":Integer" + gsparentId;
        Object sorts = memCachedClient.get(key);
        if (sorts == null) {
            sorts = categoryMapper.selectGrandsonLevelBySpid(gsparentId);
            memCachedClient.add(key, sorts);
        }
        return (List<Sort>) sorts;
    }

    @Override
    //@ReadThroughAssignCache(assignedKey = "com.jz1501.chenhc.diploma.tfbook.serviceImpl.CategoryServiceImpl.queryRandomTagsName",namespace = "category")
    public List<Sort> queryRandomTagsName() {
        String clazz = Thread.currentThread().getStackTrace()[1].getClassName();
        String method = Thread.currentThread().getStackTrace()[1].getMethodName();
        String key = clazz + ":" + method;
        Object sorts = memCachedClient.get(key);
        if (sorts == null) {
            sorts = categoryMapper.selectGrandsonSortName();
            memCachedClient.add(key, sorts);
        }
        return (List<Sort>) sorts;
    }

    @Override
    //@ReadThroughAssignCache(assignedKey = "com.jz1501.chenhc.diploma.tfbook.serviceImpl.CategoryServiceImpl.queryAllSecondSortNameByparSortId:Integer parSortId",namespace = "category")
    public List<Sort> queryAllSecondSortNameByparSortId(Integer parSortId) {
        String clazz = Thread.currentThread().getStackTrace()[1].getClassName();
        String method = Thread.currentThread().getStackTrace()[1].getMethodName();
        String key = clazz + ":" + method + ":Integer" + parSortId;
        Object sorts = memCachedClient.get(key);
        if (sorts == null) {
            sorts = categoryMapper.selectSecondSortNameById(parSortId);
            memCachedClient.add(key, sorts);
        }
        return (List<Sort>) sorts;
    }

    @Override
    //@ReadThroughAssignCache(assignedKey = "com.jz1501.chenhc.diploma.tfbook.serviceImpl.CategoryServiceImpl.querySecondPageTags:Integer parSortId",namespace = "cateogry")
    public List<Sort> querySecondPageTags(Integer parSortId) {
        String clazz = Thread.currentThread().getStackTrace()[1].getClassName();
        String method = Thread.currentThread().getStackTrace()[1].getMethodName();
        String key = clazz + ":" + method + ":Integer" + parSortId;
        Object sorts = memCachedClient.get(key);
        if (sorts == null) {
            sorts = categoryMapper.selectSecondPageTags(parSortId);
            memCachedClient.add(key, sorts);
        }
        return (List<Sort>) sorts;
    }

    @Override
    public List<Sort> queryAllSort() {
        String clazz = Thread.currentThread().getStackTrace()[1].getClassName();
        String method = Thread.currentThread().getStackTrace()[1].getMethodName();
        String key = clazz + ":" + method;
        Object sorts = memCachedClient.get(key);
        if (sorts == null) {
            sorts = categoryMapper.selectAllSort();
            memCachedClient.add(key, sorts);
        }
        return (List<Sort>) sorts;
    }
}
