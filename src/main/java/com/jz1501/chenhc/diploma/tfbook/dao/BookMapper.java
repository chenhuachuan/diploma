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
    public List<Book> selectSecondBooksById(@Param("parSortId") Integer parSortId, @Param("sonSortId") Integer sonSortId, @Param("granSortId") Integer granSortId, @Param("pageIndex") Integer pageIndex, @Param("pageSize") Integer pageSize, @Param("sortFlag") String sortFlag);

    //计算分类下的总条数
    public Integer selectAllCountBySortId(@Param("parSortId") Integer parSortId, @Param("sonSortId") Integer sonSortId, @Param("granSortId") Integer granSortId);

    //三级页面
    public Book selectBookDetailsByBookid(String bookId);

    //相似图书
    public List<Book> selectSimilarityBooksById(@Param("sortId") Integer sortId, @Param("bookId") String bookId);


    //修改图书数量
    public void updateBookCountBeforePurchase(@Param("totalCount") Integer totalCount, @Param("bookId") String bookId);

    public void updateBookSaleCountBeforePurchase(@Param("saleCount") Integer saleCount, @Param("bookId") String bookId);

    //图书搜索 v1.0
    public List<Book> selectBooksBySearch(String search);


    /**
     * 在首页搜索--全局搜索 并排序：销量、新书、优惠、高低价 v2.0
     *
     * @param pageIndex
     * @param pageSize
     * @param search
     * @param sortFlag  pop,new,discount,price
     * @return
     */
    public List<Book> selectBooksInHomePage(@Param("pageIndex") Integer pageIndex, @Param("pageSize") Integer pageSize,
                                            @Param("search") String search, @Param("sortFlag") String sortFlag);

    /**
     * 在首页搜索 总条数
     *
     * @param search
     * @return
     */
    public Integer selectSearchTotalCount(String search);


    /**
     * 在当前分类下搜索
     *
     * @param parSortId  父级分类ID
     * @param sonSortId  子类分类ID
     * @param granSortId 第三级ID
     * @param pageIndex  偏移量
     * @param pageSize   每页条数
     * @param sortFlag   排序依据： 销量、新书、优惠、高低价
     * @param search     搜索条件
     * @return List<Book>
     */
    public List<Book> selectBooksInCategoryBySortFlag(@Param("parSortId") Integer parSortId, @Param("sonSortId") Integer sonSortId,
                                                      @Param("granSortId") Integer granSortId, @Param("pageIndex") Integer pageIndex,
                                                      @Param("pageSize") Integer pageSize, @Param("search") String search, @Param("sortFlag") String sortFlag);


    /**
     * 在分类栏下 搜索 总条数
     *
     * @param parSortId
     * @param sonSortId
     * @param granSortId
     * @param search
     * @return
     */
    public Integer selectSearchInCategoryTotalCount(@Param("parSortId") Integer parSortId, @Param("sonSortId") Integer sonSortId,
                                                    @Param("granSortId") Integer granSortId, @Param("search") String search);


    //bg
    public List<Book> selectAllBooksInfo(@Param("row") Integer row, @Param("index") Integer index);

    public Integer selectTotalCount();

    public void addNewBook(Book book);

    public void updateBookInfo(Book book);

    public void updateBookStatus(String bookId);

    public Integer selectBookTotalCount();

    public List<Book> selectBooksByPage(@Param("row") Integer row, @Param("index") Integer index);

    public List<Book> selectBgBooksBySearch(@Param("row") Integer row, @Param("index") Integer index,
                                            @Param("search") String search, @Param("fromDate") java.sql.Date fromDate,
                                            @Param("toDate") java.sql.Date toDate);

    public Integer selectBgBooksTotalCountBySearch(@Param("row") Integer row, @Param("index") Integer index,
                                                   @Param("search") String search, @Param("fromDate") java.sql.Date fromDate,
                                                   @Param("toDate") java.sql.Date toDate);

}
