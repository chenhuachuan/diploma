package com.jz1501.chenhc.diploma.tfbook.serviceImpl;

import com.jz1501.chenhc.diploma.tfbook.entity.Book;
import com.jz1501.chenhc.diploma.tfbook.service.BookService;
import com.whalin.MemCached.MemCachedClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ShoppingCartServiceImpl {

    @Autowired
    private BookService bookService;
    @Autowired
    private MemCachedClient memCachedClient;

    public Object addToCart(String bookId, Integer purCount) {

        Book bookInfo = bookService.queryBookDetailsByBookId(bookId);
        //计算图书的小计 bookPrice*count
        //计算 多本图书的总计
        //总价计算=图书总价+快递费-优惠券
        // Map<String,OrderItem>
        return null;
    }


}
