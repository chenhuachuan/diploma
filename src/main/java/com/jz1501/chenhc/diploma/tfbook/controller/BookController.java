package com.jz1501.chenhc.diploma.tfbook.controller;

import com.jz1501.chenhc.diploma.tfbook.entity.Book;
import com.jz1501.chenhc.diploma.tfbook.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/book")
public class BookController {

    @Autowired
    private BookService bookService;

    /**
     * 新书热卖
     *
     * @param model
     * @return
     */
    @RequestMapping("/newBookShelves")
    public String newBooksShelves(Model model) {
        List<Book> books = bookService.newBookShelves();
        model.addAttribute("newbooks", books);
        return "forward:/pages/innerpage/newbooks_shelves.jsp";
    }

    @RequestMapping("/newBookShelvesTwo")
    public String newBooksShelvesTwo(Model model) {
        List<Book> books = bookService.newBookShelvesTwo();
        model.addAttribute("newbooks2", books);
        return "forward:/pages/innerpage/newbooks_shelves2.jsp";
    }

    /**
     * 编辑推荐
     *
     * @param model
     * @return
     */
    @RequestMapping("/editorRecommend")
    public String editorRecommend(Model model) {
        List<Book> books = bookService.editorRecommend();
        model.addAttribute("editor_books", books);
        return "forward:/pages/innerpage/editor_recommend.jsp";
    }

    @RequestMapping("/editorRecommend2")
    public String editorRecommend2(Model model) {
        List<Book> books = bookService.editorRecommend();
        model.addAttribute("editor_books", books);
        return "forward:/pages/innerpage/editor_recommend2.jsp";
    }

    /**
     * 热销图书
     *
     * @param model
     * @return
     */
    @RequestMapping("/sellhotBooks")
    public String sellhotBooks(Model model) {
        List<Book> books = bookService.sellHotBooks();
        model.addAttribute("hotbooks", books);
        return "forward:/pages/innerpage/sellhot_books.jsp";
    }

    /**
     * 今日特价
     *
     * @param model
     * @return
     */
    @RequestMapping("/todaysSpecialPrice")
    public String todaysSpecialOffer(Model model) {
        List<Book> books = bookService.todaysPriceBooks();
        model.addAttribute("lowPriceBooks", books);
        return "forward:/pages/innerpage/todays_price.jsp";
    }


}
