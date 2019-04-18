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
        List<Book> books = bookService.editorRecommend_V2();
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

    //首页搜索
    @RequestMapping("/searchBooksInHome")
    public String searchBooksInHome(Model model, String searchFlag,
                                    @RequestParam(defaultValue = "") String sortFlag,
                                    @RequestParam(defaultValue = "9") Integer pageSize,//每页条数
                                    @RequestParam(defaultValue = "1") Integer currentPage) {
        //总页数
        Integer totalPages = bookService.querySearchTotalPages(pageSize, searchFlag);
        //总条数
        Integer totalCount = bookService.searchBooksTotalCount(searchFlag);
        //搜索结果
        List<Book> searchBooks = bookService.searchBooksInHomePage(currentPage, pageSize, searchFlag, sortFlag);
        //今日特价
        List<Book> tadaysBooks = bookService.todaysPriceBooks();
        model.addAttribute("searchBooks", searchBooks);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("currentPage", currentPage);//当前页
        model.addAttribute("totalPages", totalPages);//总页数
        model.addAttribute("searchFlag", searchFlag);
        model.addAttribute("sortFlag", sortFlag);
        model.addAttribute("tadaysBooks", tadaysBooks);
        return "forward:/pages/searchInHome.jsp";
    }

    //分类专栏搜索
    @RequestMapping("/searchBooksInCategory")
    public String searchBooksInCategory(Model model, String searchFlag,
                                        @RequestParam(defaultValue = "") Integer parSortId,
                                        @RequestParam(defaultValue = "") Integer sonSortId,
                                        @RequestParam(defaultValue = "") Integer granSortId,
                                        @RequestParam(defaultValue = "") String sortFlag,
                                        @RequestParam(defaultValue = "6") Integer pageSize,//每页条数
                                        @RequestParam(defaultValue = "1") Integer currentPage) {
        //总页数
        Integer totalPages = bookService.querySearchInCategoryTotalPages(parSortId, sonSortId, granSortId, pageSize, searchFlag);
        //总条数
        Integer totalCount = bookService.searchBooksInCategoryTotalCount(parSortId, sonSortId, granSortId, searchFlag);
        //搜索结果
        List<Book> searchBooks = bookService.searchBooksInCategory(parSortId, sonSortId, granSortId, currentPage, pageSize, searchFlag, sortFlag);
        //今日特价
        List<Book> tadaysBooks = bookService.todaysPriceBooks();
        model.addAttribute("searchBooks", searchBooks);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("currentPage", currentPage);//当前页
        model.addAttribute("totalPages", totalPages);//总页数
        model.addAttribute("searchFlag", searchFlag);
        model.addAttribute("sortFlag", sortFlag);
        model.addAttribute("tadaysBooks", tadaysBooks);
        return "forward:/pages/searchInHome.jsp";
    }













    //二级页面
    @RequestMapping("/queryAllBooksbyPage")
    public String queryAllSecondBooksByPage(@RequestParam(defaultValue = "") Integer parSortId,
                                            @RequestParam(defaultValue = "") Integer sonSortId,
                                            @RequestParam(defaultValue = "") Integer granSortId,
                                            @RequestParam(defaultValue = "12") Integer pageSize,//每页条数
                                            @RequestParam(defaultValue = "1") Integer currentPage,//当前页
                                            @RequestParam(defaultValue = "") String sortFlag,
                                            Model model) {
        //热销图书
        List<Book> sellHotBooks = bookService.sellHotBooks();
        //Tags
        List<Sort> secondTags = categoryService.querySecondPageTags(parSortId);
        //今日特价
        List<Book> tadaysBooks = bookService.todaysPriceBooks();

        //总页数
        Integer totalPages = bookService.queryTotalPages(parSortId, sonSortId, granSortId, pageSize);
        //总条数
        Integer booksCount = bookService.queryAllBooksCount(parSortId, sonSortId, granSortId);
        //图书信息
        List<Book> books = bookService.queryAllBooksBySortId(parSortId, sonSortId, granSortId, currentPage, pageSize, sortFlag);
        if (parSortId != null) {
            //左侧分类信息
            List<Sort> sorts = categoryService.queryAllSecondLevelByParentId(parSortId);
            model.addAttribute("secondPage_sorts", sorts);
        }
        List<Sort> currentLocation = categoryService.queryAllSecondLevelByParentId_V2(parSortId, sonSortId, granSortId);
        model.addAttribute("locationSort", currentLocation);
        model.addAttribute("sellHotBooks", sellHotBooks);
        model.addAttribute("secondTags", secondTags);
        model.addAttribute("tadaysBooks", tadaysBooks);
        model.addAttribute("booksCount", booksCount);
        model.addAttribute("secondPage_books", books);
        model.addAttribute("currentPage", currentPage);//当前页
        model.addAttribute("totalPages", totalPages);//总页数
        model.addAttribute("parSortId", parSortId);//分类ID
        model.addAttribute("sonSortId", sonSortId);//分类ID
        model.addAttribute("granSortId", granSortId);//分类ID
        model.addAttribute("sortFlag", sortFlag);//分类ID
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
        //相似推荐
        List<Book> similarityBooks = bookService.querySimilarityBooksBySortId(book.getSortId(), bookId);

        //图书信息
        model.addAttribute("bookDetails", book);
        model.addAttribute("sellHotBooks", sellHotBooks);
        model.addAttribute("tadaysBooks", tadaysBooks);
        model.addAttribute("randomSortNames", sorts);
        model.addAttribute("similarityBooks", similarityBooks);

        return "forward:/pages/details.jsp";
    }


}
