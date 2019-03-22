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
}
