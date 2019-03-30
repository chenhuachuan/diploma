package com.jz1501.chenhc.diploma.tfbook.controller;

import com.jz1501.chenhc.diploma.tfbook.entity.Book;
import com.jz1501.chenhc.diploma.tfbook.entity.OrderItem;
import com.jz1501.chenhc.diploma.tfbook.service.BookService;
import com.jz1501.chenhc.diploma.tfbook.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/cart")
public class ShoppingCartController {

    @Autowired
    private BookService bookService;
    @Autowired
    private CategoryService categoryService;

    @RequestMapping("/addToCart")
    public String addToCart(String bookId, Integer purCount, HttpSession session) {
        //获取购物车
        Map<String, OrderItem> showCartMap = (Map) session.getAttribute("showCart");
        //获取恢复区中的   订单项
        Map<String, OrderItem> delCartMap = (Map) session.getAttribute("delCart");

        if (showCartMap == null) {
            showCartMap = new HashMap<String, OrderItem>();
        }
        //判断购物车是否包含该图书
        if (showCartMap.containsKey(bookId)) {
            OrderItem orderItem = showCartMap.get(bookId);
            if (purCount == null) {
                //订单数量+1
                orderItem.setCount(orderItem.getCount() + 1);
            } else {
                //订单数量+purCount
                orderItem.setCount(orderItem.getCount() + purCount);
            }
        } else {
            //新图书
            OrderItem newOrderItem = new OrderItem();
            Book dbBook = bookService.queryBookDetailsByBookId(bookId);
            newOrderItem.setBook(dbBook);
            if (purCount == null) {
                //订单数量+1
                newOrderItem.setCount(1);
            } else {
                //订单数量+purCount
                newOrderItem.setCount(purCount);
            }
            //将新购买图书加入Map
            showCartMap.put(dbBook.getBookId(), newOrderItem);
        }
        //存入session
        session.setAttribute("showCart", showCartMap);
        //计算总金额
        calculateTotalMoney(session);
        return "forward:/pages/buy.jsp";
    }

    //计算总金额
    private void calculateTotalMoney(HttpSession session) {
        Map<String, OrderItem> showCartMap = (Map) session.getAttribute("showCart");
        if (showCartMap == null) {
            showCartMap = new HashMap<String, OrderItem>();
        }
        Double totalMoney = 0.0;
        Double perMoney = 0.0;
        for (String bookId : showCartMap.keySet()) {
            OrderItem orderItem = showCartMap.get(bookId);
            totalMoney += orderItem.getBook().getBookPrice() * orderItem.getCount();
            //计算一类图书小计
            Double littleMoney = 0.0;
            littleMoney = orderItem.getBook().getBookPrice() * orderItem.getCount();
            orderItem.setLittleCount(littleMoney);
            //计算优惠价格
            perMoney = (orderItem.getBook().getOriginalPrice() - orderItem.getBook().getBookPrice()) * orderItem.getCount();
        }
        //总金额
        session.setAttribute("totalMoney", totalMoney);
        //优惠价
        session.setAttribute("perMoney", perMoney);
    }


}
