package com.jz1501.chenhc.diploma.tfbook.serviceImpl;

import com.jz1501.chenhc.diploma.tfbook.dao.BookMapper;
import com.jz1501.chenhc.diploma.tfbook.entity.Book;
import com.jz1501.chenhc.diploma.tfbook.service.BookService;
import com.jz1501.chenhc.diploma.tfbook.util.TimeFormatUtil;
import com.whalin.MemCached.MemCachedClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class BookServiceImpl implements BookService {

    @Autowired(required = false)
    private BookMapper bookMapper;
    @Autowired
    private MemCachedClient memCachedClient;

    @Override
    public List<Book> newBookShelves() {
        String clazz = Thread.currentThread().getStackTrace()[1].getClassName();
        String method = Thread.currentThread().getStackTrace()[1].getMethodName();
        String key = clazz + ":" + method;
        Object books = memCachedClient.get(key);
        if (books == null) {
            books = bookMapper.selectBookByPublishTime();
            memCachedClient.add(key, books, 60 * 60 * 24 * 7);
        }
        return (List<Book>) books;
    }

    @Override
    public List<Book> newBookShelvesTwo() {
        String clazz = Thread.currentThread().getStackTrace()[1].getClassName();
        String method = Thread.currentThread().getStackTrace()[1].getMethodName();
        String key = clazz + ":" + method;
        Object books = memCachedClient.get(key);
        if (books == null) {
            books = bookMapper.selectBookByPublishTimeTwo();
            memCachedClient.add(key, books, 60 * 60 * 24 * 7);
        }
        return (List<Book>) books;
    }

    @Override
    public List<Book> newBookShelvesBG() {
        return bookMapper.selectBookByPublishTimeBG();
    }

    @Override
    public List<Book> editorRecommend() {
        String clazz = Thread.currentThread().getStackTrace()[1].getClassName();
        String method = Thread.currentThread().getStackTrace()[1].getMethodName();
        String key = clazz + ":" + method;
        Object books = memCachedClient.get(key);
        if (books == null) {
            books = bookMapper.selectBookByRecommend();
            memCachedClient.add(key, books, 60 * 60 * 24 * 7);
        }
        return (List<Book>) books;
    }

    @Override
    public List<Book> editorRecommend_V2() {
        String clazz = Thread.currentThread().getStackTrace()[1].getClassName();
        String method = Thread.currentThread().getStackTrace()[1].getMethodName();
        String key = clazz + ":" + method;
        Object books = memCachedClient.get(key);
        if (books == null) {
            books = bookMapper.selectBookByRecommend();
            memCachedClient.add(key, books, 60 * 60 * 24 * 7);
        }
        return (List<Book>) books;
    }

    @Override
    public List<Book> sellHotBooks() {
     /*   String clazz = Thread.currentThread().getStackTrace()[1].getClassName();
        String method = Thread.currentThread().getStackTrace()[1].getMethodName();
        String key = clazz + ":" + method;
        Object books = memCachedClient.get(key);
        if (books == null) {
            books = bookMapper.selectBooksBySaleCount();
            memCachedClient.add(key, books);
        }
         return (List<Book>) books;
        */

        List<Book> books = bookMapper.selectBooksBySaleCount();
        return books;
    }

    @Override
    public List<Book> todaysPriceBooks() {
     /*   String clazz = Thread.currentThread().getStackTrace()[1].getClassName();
        String method = Thread.currentThread().getStackTrace()[1].getMethodName();
        String key = clazz + ":" + method;
        Object books = memCachedClient.get(key);
        if (books == null) {
            books = bookMapper.selectBooksBySpecialPrice();
            memCachedClient.add(key, books);
        }
        return (List<Book>) books;*/
        List<Book> books = bookMapper.selectBooksBySpecialPrice();
        return books;
    }

    /**
     * 分页查 所有图书
     * @param parSortId
     * @param sonSortId
     * @param granSortId
     * @param pageIndex
     * @param pageSize
     * @return
     */
    @Override
    public List<Book> queryAllBooksBySortId(Integer parSortId, Integer sonSortId, Integer granSortId, Integer pageIndex, Integer pageSize, String sortFlag) {
        Integer curPage = (pageIndex - 1) * pageSize;
        String clazz = Thread.currentThread().getStackTrace()[1].getClassName();
        String method = Thread.currentThread().getStackTrace()[1].getMethodName();
        String key = clazz + ":" + method + ":parSortId:" + parSortId + ":sonSortId:" + sonSortId + ":granSortId:" + granSortId + ":pageIndex:" + pageIndex + ":pageSize:" + pageSize + ":sortFlag" + sortFlag;
        Object books = memCachedClient.get(key);
        if (books == null) {
            books = bookMapper.selectSecondBooksById(parSortId, sonSortId, granSortId, curPage, pageSize, sortFlag);
            memCachedClient.add(key, books);
        }
        return (List<Book>) books;
    }

    /**
     * 计算总页数 totalPage
     *
     * @return
     */
    @Override
    public Integer queryTotalPages(Integer parSortId, Integer sonSortId, Integer granSortId, Integer pageSize) {
        //总页数
        Integer totalPage;
        String clazz = Thread.currentThread().getStackTrace()[1].getClassName();
        String method = Thread.currentThread().getStackTrace()[1].getMethodName();
        String key = clazz + ":" + method + ":parSortId:" + parSortId + ":sonSortId:" + sonSortId + ":granSortId:" + granSortId + ":pageSize:" + pageSize;

        totalPage = (Integer) memCachedClient.get(key);
        if (totalPage == null) {
            //总条数
            Integer allCount = bookMapper.selectAllCountBySortId(parSortId, sonSortId, granSortId);
            if (allCount % pageSize == 0) {
                totalPage = allCount / pageSize;
                memCachedClient.add(key, totalPage);
            } else {
                totalPage = allCount / pageSize + 1;
                memCachedClient.add(key, totalPage);
            }
        }
        return totalPage;
    }

    /**
     * 总条数
     * @param parSortId
     * @param sonSortId
     * @param granSortId
     * @return
     */
    @Override
    public Integer queryAllBooksCount(Integer parSortId, Integer sonSortId, Integer granSortId) {
        String clazz = Thread.currentThread().getStackTrace()[1].getClassName();
        String method = Thread.currentThread().getStackTrace()[1].getMethodName();
        String key = clazz + ":" + method + ":parSortId:" + parSortId + ":sonSortId:" + sonSortId + ":granSortId:" + granSortId;
        Integer allCount = (Integer) memCachedClient.get(key);

        if (allCount == null) {
            allCount = bookMapper.selectAllCountBySortId(parSortId, sonSortId, granSortId);
            memCachedClient.add(key, allCount);
        }
        return allCount;
    }

    /**
     * 图书详情
     * @param bookId
     * @return
     */
    @Override
    public Book queryBookDetailsByBookId(String bookId) {
       /* String clazz = Thread.currentThread().getStackTrace()[1].getClassName();
        String method = Thread.currentThread().getStackTrace()[1].getMethodName();
        String key = clazz + ":" + method + ":bookId:" + bookId;
        Object book = memCachedClient.get(key);
        if (book == null) {
            book = bookMapper.selectBookDetailsByBookid(bookId);
            memCachedClient.add(key, book);
        }
        return (Book) book;*/
        Book book = bookMapper.selectBookDetailsByBookid(bookId);
        return book;
    }

    /**
     * 相似图书
     * @param sortId
     * @return
     */
    @Override
    public List<Book> querySimilarityBooksBySortId(Integer sortId, String bookId) {
        String clazz = Thread.currentThread().getStackTrace()[1].getClassName();
        String method = Thread.currentThread().getStackTrace()[1].getMethodName();
        String key = clazz + ":" + method + ":sortId:" + sortId + ":bookId:" + bookId;
        Object books = memCachedClient.get(key);
        if (books == null) {
            books = bookMapper.selectSimilarityBooksById(sortId, bookId);
            memCachedClient.add(key, books);
        }
        return (List<Book>) books;
    }

    /**
     * 模糊查询
     * @param search
     * @return
     */
    @Override
    public List<Book> searchBooksFromRepertory(String search) {
        String searchSentence = "%" + search + "%";
        return bookMapper.selectBooksBySearch(searchSentence);
    }

    /**
     * 模糊搜索 首页 ——排序 ——分页
     * @param pageIndex
     * @param pageSize
     * @param search
     * @param sortFlag  : pop,new,discount,price
     * @return List<Book>
     */
    @Override
    public List<Book> searchBooksInHomePage(Integer pageIndex, Integer pageSize, String search, String sortFlag) {
        String searchSentence = "%" + search + "%";
        Integer curPage = (pageIndex - 1) * pageSize;
        return bookMapper.selectBooksInHomePage(curPage, pageSize, searchSentence, sortFlag);
    }

    /**
     * 首页搜索 总页数
     * @param pageSize
     * @param search
     * @return
     */
    @Override
    public Integer querySearchTotalPages(Integer pageSize, String search) {
        Integer totalPage;
        String searchSentence = "%" + search + "%";
        //总条数
        Integer allCount = bookMapper.selectSearchTotalCount(searchSentence);
        if (allCount % pageSize == 0) {
            totalPage = allCount / pageSize;
        } else {
            totalPage = allCount / pageSize + 1;
        }
        return totalPage;
    }

    /**
     * 首页搜索下 ：总条数
     * @param search
     * @return
     */
    @Override
    public Integer searchBooksTotalCount(String search) {
        String searchSentence = "%" + search + "%";
        return bookMapper.selectSearchTotalCount(searchSentence);
    }

    /**
     * 在分类中搜索 排序 分页
     * @param parSortId  在哪个分类栏里
     * @param sonSortId
     * @param granSortId
     * @param pageIndex  偏移量
     * @param pageSize   总条数
     * @param search     搜索条件
     * @param sortFlag   排序条件  pop new discount price
     * @return
     */
    @Override
    public List<Book> searchBooksInCategory(Integer parSortId, Integer sonSortId, Integer granSortId, Integer pageIndex, Integer pageSize, String search, String sortFlag) {
        String searchSentence = "%" + search + "%";
        Integer curPage = (pageIndex - 1) * pageSize;
        return bookMapper.selectBooksInCategoryBySortFlag(parSortId, sonSortId, granSortId, curPage, pageSize, search, sortFlag);
    }

    /**
     * 分类栏  总页数
     * @param parSortId
     * @param sonSortId
     * @param granSortId
     * @param pageSize
     * @param search
     * @return
     */
    @Override
    public Integer querySearchInCategoryTotalPages(Integer parSortId, Integer sonSortId, Integer granSortId, Integer pageSize, String search) {
        Integer totalPage;
        String searchSentence = "%" + search + "%";
        //总条数
        Integer allCount = bookMapper.selectSearchInCategoryTotalCount(parSortId, sonSortId, granSortId, searchSentence);
        if (allCount % pageSize == 0) {
            totalPage = allCount / pageSize;
        } else {
            totalPage = allCount / pageSize + 1;
        }
        return totalPage;
    }

    /**
     * 总条数
     * @param parSortId
     * @param sonSortId
     * @param granSortId
     * @param search
     * @return
     */
    @Override
    public Integer searchBooksInCategoryTotalCount(Integer parSortId, Integer sonSortId, Integer granSortId, String search) {
        String searchSentence = "%" + search + "%";
        return bookMapper.selectSearchInCategoryTotalCount(parSortId, sonSortId, granSortId, searchSentence);
    }

    //bg

    @Override
    public List<Book> queryAllBooksInfo(Integer row, Integer page, String bookName) {
        Integer index = (page - 1) * row;
        String searchFlag = null;
        if (bookName != null) {
            searchFlag = "%" + bookName + "%";
        }
        return bookMapper.selectAllBooksInfo(row, index, searchFlag);
    }

    @Override
    public Integer queryTotalCountBySearch(String bookName) {
        String searchFlag = "%" + bookName + "%";
        return bookMapper.selectTotalCountBySearch(searchFlag);
    }

    @Override
    public Integer queryTotalCount() {
        return bookMapper.selectTotalCount();
    }

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    @Override
    public void addNewBook(Book book) {
        String bookId = UUID.randomUUID().toString().replace("-", "");
        book.setBookId(bookId);
        bookMapper.addNewBook(book);
        memCachedClient.flushAll();
    }


    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public void updateBookInfo(Book book) {
        bookMapper.updateBook_DaoInfo(book);
        memCachedClient.flushAll();
    }

    /**
     * 图书下架
     * @param bookId
     */
    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public void updateBookStatus(String bookId, String status) {
        bookMapper.updateBookStatus_xia(bookId, status);
        memCachedClient.flushAll();
    }

    //所有图书信息  展示
    @Override
    public List<Book> queryAllBooksByPage(Integer rows, Integer page) {
        Integer curPage = (page - 1) * rows;
        return bookMapper.selectBooksByPage(rows, curPage);
    }

    @Override
    public Integer queryBookTotalPage(Integer rows) {
        Integer totalPage;
        //总条数
        Integer allCount = bookMapper.selectBookTotalCount();
        if (allCount % rows == 0) {
            totalPage = allCount / rows;
        } else {
            totalPage = allCount / rows + 1;
        }
        return totalPage;
    }

    @Override
    public List<Book> queryBgAllBooksBySearch(Integer rows, Integer page, String search, Date fromDate, Date toDate) {
        Integer index = (page - 1) * rows;
        String searchFlag = "%" + search + "%";
        return bookMapper.selectBgBooksBySearch(rows, index, searchFlag, (fromDate == null) ? null : TimeFormatUtil.toSqlDate(fromDate), (toDate == null) ? null : TimeFormatUtil.toSqlDate(toDate));
    }

    @Override
    public Integer queryTotalCountBySearchBg(Integer row, Integer page, String search, Date fromDate, Date toDate) {
        Integer index = (page - 1) * row;
        String searchFlag = "%" + search + "%";
        return bookMapper.selectBgBooksTotalCountBySearch(row, index, searchFlag, (fromDate == null) ? null : TimeFormatUtil.toSqlDate(fromDate), (toDate == null) ? null : TimeFormatUtil.toSqlDate(toDate));
    }

}


