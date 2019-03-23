package com.jz1501.chenhc.diploma.tfbook.controller;

import com.jz1501.chenhc.diploma.tfbook.entity.Book;
import com.jz1501.chenhc.diploma.tfbook.entity.Sort;
import com.jz1501.chenhc.diploma.tfbook.service.BookService;
import com.jz1501.chenhc.diploma.tfbook.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/book")
public class BookController {

    @Autowired
    private BookService bookService;
    @Autowired
    private CategoryService categoryService;

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

    /**
     * 新书热卖
     *
     * @param model
     * @return
     */
    @RequestMapping("/newBookShelvesTwo")
    public String newBooksShelvesTwo(Model model) {
        List<Book> books = bookService.newBookShelvesTwo();
        model.addAttribute("newbooks2", books);
        return "forward:/pages/innerpage/newbooks_shelves2.jsp";
    }

    /**
     * 编辑推荐
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
     * @param model
     * @return
     */
    @RequestMapping("/todaysSpecialPrice")
    public String todaysSpecialOffer(Model model) {
        List<Book> books = bookService.todaysPriceBooks();
        model.addAttribute("lowPriceBooks", books);
        return "forward:/pages/innerpage/todays_price.jsp";
    }

    //二级页面
    @RequestMapping("/queryAllBooksbyPage")
    public String queryAllSecondBooksByPage(@RequestParam(defaultValue = "") Integer parSortId,
                                            @RequestParam(defaultValue = "") Integer sonSortId,
                                            @RequestParam(defaultValue = "") Integer granSortId,
                                            @RequestParam(defaultValue = "12") Integer pageSize,//每页条数
                                            @RequestParam(defaultValue = "1") Integer currentPage,//当前页
                                            Model model) {
        //总页数
        Integer totalPages = bookService.queryTotalPages(parSortId, sonSortId, granSortId, pageSize);
        //总条数
        Integer booksCount = bookService.queryAllBooksCount(parSortId, sonSortId, granSortId);
        //图书信息
        List<Book> books = bookService.queryAllBooksBySortId(parSortId, sonSortId, granSortId, currentPage, pageSize);
        //热销图书
        List<Book> sellHotBooks = bookService.sellHotBooks();
        //Tags
        List<Sort> secondTags = categoryService.querySecondPageTags(parSortId);
        //今日特价
        List<Book> tadaysBooks = bookService.todaysPriceBooks();

        if (parSortId != null) {
            //左侧分类信息
            List<Sort> sorts = categoryService.queryAllSecondLevelByParentId(parSortId);
            model.addAttribute("secondPage_sorts", sorts);
        }

        model.addAttribute("sellHotBooks", sellHotBooks);
        model.addAttribute("secondTags", secondTags);
        model.addAttribute("tadaysBooks", tadaysBooks);
        model.addAttribute("booksCount", booksCount);
        model.addAttribute("secondPage_books", books);
        model.addAttribute("currentPage", currentPage);//当前页
        model.addAttribute("totalPages", totalPages);//总页数
        model.addAttribute("parSortId", parSortId);//分类ID
        return "forward:/pages/categories.jsp";
    }


    //三级页面

    /**
     * 查询图书详情
     *
     * @param bookId
     * @param model
     * @return
     */
    @RequestMapping("/bookDetails")
    public String queryOneBookDetailByBookId(String bookId, Model model) {
        Book book = bookService.queryBookDetailsByBookId(bookId);
        //热销图书
        List<Book> sellHotBooks = bookService.sellHotBooks();
        //Tags
        List<Sort> sorts = categoryService.queryRandomTagsName();
        //今日特价
        List<Book> tadaysBooks = bookService.todaysPriceBooks();

        //图书信息
        model.addAttribute("bookDetails", book);
        model.addAttribute("sellHotBooks", sellHotBooks);
        model.addAttribute("tadaysBooks", tadaysBooks);
        model.addAttribute("randomSortNames", sorts);

        return "forward:/pages/details.jsp";
    }


}
