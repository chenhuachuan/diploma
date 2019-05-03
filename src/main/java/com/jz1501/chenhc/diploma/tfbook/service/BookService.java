package com.jz1501.chenhc.diploma.tfbook.service;

import com.jz1501.chenhc.diploma.tfbook.entity.Book;

import java.util.Date;
import java.util.List;

public interface BookService {
    //新书上架
    public List<Book> newBookShelves();

    public List<Book> newBookShelvesTwo();

    //编辑推荐
    public List<Book> editorRecommend();

    public List<Book> editorRecommend_V2();

    //热销图书
    public List<Book> sellHotBooks();

    //今日特价
    public List<Book> todaysPriceBooks();

    //二级目录
    //所有图书
    public List<Book> queryAllBooksBySortId(Integer parSortId, Integer sonSortId, Integer granSortId, Integer pageIndex, Integer pageSize, String sortFlag);

    //总页数
    public Integer queryTotalPages(Integer parSortId, Integer sonSortId, Integer granSortId, Integer pageSize);

    //总条数
    public Integer queryAllBooksCount(Integer parSortId, Integer sonSortId, Integer granSortId);

    //三级--图书详情
    public Book queryBookDetailsByBookId(String bookId);

    //相似推荐
    public List<Book> querySimilarityBooksBySortId(Integer sortId, String bookId);

    //图书搜索v1.0
    public List<Book> searchBooksFromRepertory(String search);


    /**
     * 搜索 + 排序 + 分页 v2.0
     *
     * @param pageIndex
     * @param pageSize
     * @param search
     * @param sortFlag  : pop,new,discount,price
     * @return
     */
    public List<Book> searchBooksInHomePage(Integer pageIndex, Integer pageSize, String search, String sortFlag);

    //总条数
    public Integer searchBooksTotalCount(String search);

    /**
     * 搜索下的总页数
     *
     * @param pageSize
     * @param search
     * @return
     */
    public Integer querySearchTotalPages(Integer pageSize, String search);

    /**
     * 在分类栏里 搜索 排序 分页
     *
     * @param parSortId  在哪个分类栏里
     * @param sonSortId
     * @param granSortId
     * @param pageIndex  偏移量
     * @param pageSize   总条数
     * @param search     搜索条件
     * @param sortFlag   排序条件  pop new discount price
     * @return
     */
    public List<Book> searchBooksInCategory(Integer parSortId, Integer sonSortId,
                                            Integer granSortId, Integer pageIndex,
                                            Integer pageSize, String search, String sortFlag);

    /**
     * 分类栏 总页数
     *
     * @param parSortId
     * @param sonSortId
     * @param granSortId
     * @param pageSize
     * @param search
     * @return
     */
    public Integer querySearchInCategoryTotalPages(Integer parSortId, Integer sonSortId, Integer granSortId,
                                                   Integer pageSize, String search);

    //总条数
    public Integer searchBooksInCategoryTotalCount(Integer parSortId, Integer sonSortId, Integer granSortId, String search);

    //bg

    public List<Book> queryAllBooksInfo(Integer row, Integer page);

    public Integer queryTotalCount();

    public void addNewBook(Book book);

    public void updateBookInfo(Book book);

    public void updateBookStatus(String bookId);

    //每页多少条，第几页
    public List<Book> queryAllBooksByPage(Integer rows, Integer page);

    //总页数
    public Integer queryBookTotalPage(Integer rows);

    public List<Book> queryBgAllBooksBySearch(Integer rows, Integer page, String search, Date fromDate, Date toDate);

    public Integer queryTotalCountBySearchBg(Integer rows, Integer page, String search, Date fromDate, Date toDate);

}
