package com.jz1501.chenhc.diploma.tfbook.serviceImpl;

import com.jz1501.chenhc.diploma.tfbook.dao.BookMapper;
import com.jz1501.chenhc.diploma.tfbook.entity.Book;
import com.jz1501.chenhc.diploma.tfbook.service.BookService;
import com.whalin.MemCached.MemCachedClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

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
            memCachedClient.add(key, books);
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
            memCachedClient.add(key, books);
        }
        return (List<Book>) books;
    }

    @Override
    public List<Book> editorRecommend() {
        String clazz = Thread.currentThread().getStackTrace()[1].getClassName();
        String method = Thread.currentThread().getStackTrace()[1].getMethodName();
        String key = clazz + ":" + method;
        Object books = memCachedClient.get(key);
        if (books == null) {
            books = bookMapper.selectBookByRecommend();
            memCachedClient.add(key, books);
        }
        return (List<Book>) books;
    }

    @Override
    public List<Book> sellHotBooks() {
        String clazz = Thread.currentThread().getStackTrace()[1].getClassName();
        String method = Thread.currentThread().getStackTrace()[1].getMethodName();
        String key = clazz + ":" + method;
        Object books = memCachedClient.get(key);
        if (books == null) {
            books = bookMapper.selectBooksBySaleCount();
            memCachedClient.add(key, books);
        }
        return (List<Book>) books;
    }

    @Override
    public List<Book> todaysPriceBooks() {
        String clazz = Thread.currentThread().getStackTrace()[1].getClassName();
        String method = Thread.currentThread().getStackTrace()[1].getMethodName();
        String key = clazz + ":" + method;
        Object books = memCachedClient.get(key);
        if (books == null) {
            books = bookMapper.selectBooksBySpecialPrice();
            memCachedClient.add(key, books);
        }
        return (List<Book>) books;
    }

    /**
     * 分页查 所有图书
     *
     * @param parSortId
     * @param sonSortId
     * @param granSortId
     * @param pageIndex
     * @param pageSize
     * @return
     */
    @Override
    public List<Book> queryAllBooksBySortId(Integer parSortId, Integer sonSortId, Integer granSortId, Integer pageIndex, Integer pageSize) {
        Integer curPage = (pageIndex - 1) * pageSize;
        String clazz = Thread.currentThread().getStackTrace()[1].getClassName();
        String method = Thread.currentThread().getStackTrace()[1].getMethodName();
        String key = clazz + ":" + method + ":parSortId:" + parSortId + ":sonSortId:" + sonSortId + ":granSortId:" + granSortId + ":pageIndex:" + pageIndex + ":pageSize:" + pageSize;
        Object books = memCachedClient.get(key);
        if (books == null) {
            books = bookMapper.selectSecondBooksById(parSortId, sonSortId, granSortId, curPage, pageSize);
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
     *
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
     *
     * @param bookId
     * @return
     */
    @Override
    public Book queryBookDetailsByBookId(String bookId) {
        String clazz = Thread.currentThread().getStackTrace()[1].getClassName();
        String method = Thread.currentThread().getStackTrace()[1].getMethodName();
        String key = clazz + ":" + method + ":bookId:" + bookId;
        Object book = memCachedClient.get(key);
        if (book == null) {
            book = bookMapper.selectBookDetailsByBookid(bookId);
            memCachedClient.add(key, book);
        }
        return (Book) book;
    }

    /**
     * 相似图书
     *
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
}
