package com.jz1501.chenhc.diploma.tfbook.service;

import com.jz1501.chenhc.diploma.tfbook.entity.Book;

import java.util.List;

public interface BookService {
    //新书上架
    public List<Book> newBookShelves();

    public List<Book> newBookShelvesTwo();

    //编辑推荐
    public List<Book> editorRecommend();

    //热销图书
    public List<Book> sellHotBooks();

    //今日特价
    public List<Book> todaysPriceBooks();
}
