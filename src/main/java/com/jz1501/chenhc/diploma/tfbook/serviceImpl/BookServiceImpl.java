package com.jz1501.chenhc.diploma.tfbook.serviceImpl;

import com.jz1501.chenhc.diploma.tfbook.dao.BookMapper;
import com.jz1501.chenhc.diploma.tfbook.entity.Book;
import com.jz1501.chenhc.diploma.tfbook.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class BookServiceImpl implements BookService {

    @Autowired(required = false)
    private BookMapper bookMapper;

    @Override
    public List<Book> newBookShelves() {
        return bookMapper.selectBookByPublishTime();
    }

    @Override
    public List<Book> newBookShelvesTwo() {
        return bookMapper.selectBookByPublishTimeTwo();
    }

    @Override
    public List<Book> editorRecommend() {
        return bookMapper.selectBookByRecommend();
    }

    @Override
    public List<Book> sellHotBooks() {
        return bookMapper.selectBooksBySaleCount();
    }

    @Override
    public List<Book> todaysPriceBooks() {
        return bookMapper.selectBooksBySpecialPrice();
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
        return bookMapper.selectSecondBooksById(parSortId, sonSortId, granSortId, curPage, pageSize);
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
        //总条数
        Integer allCount = bookMapper.selectAllCountBySortId(parSortId, sonSortId, granSortId);
        if (allCount % pageSize == 0) {
            totalPage = allCount / pageSize;
        } else {
            totalPage = allCount / pageSize + 1;
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
        return bookMapper.selectAllCountBySortId(parSortId, sonSortId, granSortId);
    }

    /**
     * 图书详情
     *
     * @param bookId
     * @return
     */
    @Override
    public Book queryBookDetailsByBookId(String bookId) {
        return bookMapper.selectBookDetailsByBookid(bookId);
    }
}
