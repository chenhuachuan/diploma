package com.jz1501.chenhc.diploma.tfbook.dao;

import com.jz1501.chenhc.diploma.tfbook.entity.Book;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookMapper {

    //新书上架
    public List<Book> selectBookByPublishTime();

    public List<Book> selectBookByPublishTimeTwo();

    //编辑推荐啊
    public List<Book> selectBookByRecommend();

    //热销图书
    public List<Book> selectBooksBySaleCount();

    //今日特价
    public List<Book> selectBooksBySpecialPrice();

    //二级目录  一级、二级、三级、排序
    public List<Book> selectSecondBooksById(@Param("parSortId") Integer parSortId, @Param("sonSortId") Integer sonSortId, @Param("granSortId") Integer granSortId, @Param("pageIndex") Integer pageIndex, @Param("pageSize") Integer pageSize);

    //计算分类下的总条数
    public Integer selectAllCountBySortId(@Param("parSortId") Integer parSortId, @Param("sonSortId") Integer sonSortId, @Param("granSortId") Integer granSortId);

    //三级页面
    public Book selectBookDetailsByBookid(String bookId);

}
