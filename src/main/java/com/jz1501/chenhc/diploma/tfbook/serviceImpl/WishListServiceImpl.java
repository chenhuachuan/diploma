package com.jz1501.chenhc.diploma.tfbook.serviceImpl;

import com.jz1501.chenhc.diploma.tfbook.dao.WishListDao;
import com.jz1501.chenhc.diploma.tfbook.entity.WishList;
import com.jz1501.chenhc.diploma.tfbook.service.WishListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @ProjectName:diploma
 * @Package:com.jz1501.chenhc.diploma.tfbook.serviceImpl
 * @description:收藏
 * @author:chenhc
 * @create_time:2019-04-10
 * @version:v1.0.0$
 **/
@Service
@Transactional
public class WishListServiceImpl implements WishListService {
    @Autowired
    private WishListDao wishListDao;

    @Override
    public List<WishList> queryAllWishListByUserId(String userId) {
        return wishListDao.selectAllWishListByUserId(userId);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public void addNewBookWishList(WishList wishList) {
        wishListDao.insertWishList(wishList);
    }

    @Override
    public void removeWishBookById(String collectId, String userId) {
        wishListDao.deleteWishList(collectId, userId);
    }

    @Override
    public WishList queryWishBookByBookId(String bookId) {
        return wishListDao.selectWishBookByBookId(bookId);
    }
}
