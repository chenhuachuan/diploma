package com.jz1501.chenhc.diploma.tfbook.dao;

import com.jz1501.chenhc.diploma.tfbook.entity.WishList;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @ProjectName:diploma
 * @Package:com.jz1501.chenhc.diploma.tfbook.entity
 * @description:${description}
 * @author:chenhc
 * @create_time:2019-04-10
 * @version:$version$
 **/
public interface WishListDao {

    //新建收藏
    public void insertWishList(WishList wishList);

    public List<WishList> selectAllWishListByUserId(String userId);

    //取消收藏
    public void deleteWishList(@Param("collectId") String collectId, @Param("userId") String userId);

    public WishList selectWishBookByBookId(String bookId);

}
