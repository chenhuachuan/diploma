package com.jz1501.chenhc.diploma.tfbook.service;

import com.jz1501.chenhc.diploma.tfbook.entity.WishList;

import java.util.List;

/**
 * @ProjectName:diploma
 * @Package:com.jz1501.chenhc.diploma.tfbook.service
 * @description:${description}
 * @author:chenhc
 * @create_time:2019-04-10
 * @version:$version$
 **/
public interface WishListService {

    /**
     * 根据用户查询收藏
     *
     * @param userId
     * @return
     */
    public List<WishList> queryAllWishListByUserId(String userId);

    /**
     * 添加收藏
     *
     * @param wishList
     */
    public void addNewBookWishList(WishList wishList);

    /**
     * 移除收藏
     *
     * @param collectId
     * @param userId
     */
    public void removeWishBookById(String collectId, String userId);


    public WishList queryWishBookByBookId(String bookId);

}
