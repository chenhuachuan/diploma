package com.jz1501.chenhc.diploma.tfbook.dao;

import com.jz1501.chenhc.diploma.tfbook.entity.Book;

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
}
