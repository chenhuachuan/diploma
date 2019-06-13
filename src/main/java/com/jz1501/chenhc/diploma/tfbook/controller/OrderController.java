package com.jz1501.chenhc.diploma.tfbook.controller;

import com.jz1501.chenhc.diploma.tfbook.entity.*;
import com.jz1501.chenhc.diploma.tfbook.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ProjectName:diploma
 * @Package:com.jz1501.chenhc.diploma.tfbook.controller
 * @description:ordersInfo
 * @author:chenhc
 * @create_time:2019-05-04
 * @version:v1.0.0$
 **/

@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderService orderService;
    @Autowired
    private BookService bookService;
    @Autowired
    private AddressService addressService;
    @Autowired
    private OrderFlowService orderFlowService;
    @Autowired
    private BorService borService;

    //bg
    @RequestMapping("/usersPurchaseRecord")
    @ResponseBody
    public Map<String, Object> usersPurchaseRecord(Integer rows, Integer page, String orderNumber) {
        Map<String, Object> map = new HashMap<String, Object>();
        Integer totalCount = 1;
        if (orderNumber == null) {
            totalCount = orderService.selectOrdersTotalCount();
        } else {
            totalCount = orderService.selectOrdersTotalCountBySearch(orderNumber);
        }
        List<Order> orders = orderService.queryAllOrdersByAdmin(rows, page, orderNumber);
        map.put("total", totalCount);
        map.put("rows", orders);
        return map;
    }

    //订单详情
    @RequestMapping("/orderDetailInfo")
    public String orderDetailInfo(String orderId, Model model) {
        /* Map<Order,Object> */
        //Map<Order,Object> map=new HashMap<Order,Object>();
        List<Book> books = new ArrayList<>();
        Order orderDetail = orderService.queryOneOrderDetail(orderId);
        String bookIds = orderDetail.getBookId();
        String[] bookStr = bookIds.split(",");
        for (String bookId : bookStr) {
            Book detailsByBook = bookService.queryBookDetailsByBookId(bookId);
            books.add(detailsByBook);
        }

        Address address = addressService.queryAddressById(orderDetail.getAddressId());
        //map.put(orderDetail,books);
        // return map;
        model.addAttribute("orderDetail", orderDetail);
        model.addAttribute("books", books);
        model.addAttribute("address", address);
        return "forward:/bgpages/pages/ordersDetailInfo.jsp";

    }

    //发货
    @RequestMapping("/deliverOrder")
    @ResponseBody
    public String merChantDeliver(String orderNumber) {
        try {
            orderService.adminDeliverOrder(orderNumber);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "fail";
        }
    }

    @RequestMapping("/deleteOrderInfo")
    @ResponseBody
    public String merChantDeleteOrder(String orderNumber) {
        try {
            orderService.adminDeleteOrderInfo(orderNumber);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "fail";
        }
    }

    @RequestMapping("/modifyOrderStauts")
    public String modifyOrderStatusA(String orderNumber, String flowNumber, HttpSession session) {
        System.out.println("------修改订单状态-----: " + orderNumber + "________flowNumber:" + flowNumber);
        try {
            //记录支付流水信息
            Order orderInfo = orderService.queryOrderInfoById(orderNumber);
            orderFlowService.addNewOrderFlowRecord(flowNumber, orderInfo);
            //修改订单为已付款   //10:代付款，20：已付款 30：用户删除订单  50:已发货
            orderService.modifyOrderStatus(orderNumber);
            System.out.println("------已修改 20：已付款 ------");
            return "redirect:/pages/success_orderdetail.jsp";
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("-----修改订单状态失败-----");
            return "redirect:/pages/success_orderdetail.jsp";
            // throw new RuntimeException("");
        }
    }

    @RequestMapping("/cancelOrder")
    public String cancalCurrentOrder(String orderNumber) {
        orderService.modifyOrderStatus_cancel(orderNumber);
        return "redirect:/pages/home.jsp";
    }


    //交易流水记录
    @RequestMapping("/payFlowListInfo")
    @ResponseBody
    public Map<String, Object> payFlowListInfo(Integer rows, Integer page, String orderNumber) {
        Map<String, Object> map = new HashMap<String, Object>();
        Integer totalCount = 1;
        if (orderNumber == null) {
            totalCount = orderFlowService.selectFLowsTotalCount();
        } else {
            totalCount = orderFlowService.selectFLowTotalCountBySearch(orderNumber);
        }
        List<OrderFlow> ordersFlow = orderFlowService.queryAllFlowByAdmin(rows, page, orderNumber);
        map.put("total", totalCount);
        map.put("rows", ordersFlow);
        return map;
    }


    //统计
    @RequestMapping("/queryMainStaties")
    @ResponseBody
    public String queryAllStatiesA(HttpSession session) {
        System.out.println("------------queryAllStatiesA-----------");
        //三图 统计
        Integer orderCount = borService.queryTotalOrders();
        Integer userCount = borService.queryTotalUsers();
        Integer recordCount = borService.queryTotalRecord();

        //订单信息统计
        Bor orderInfoStaties = borService.queryOrderStaties();
        //商品信息统计
        Bor booksInfoStaties = borService.queryBooksInfoStaties();
        //用户信息统计
        Bor userInfoStaties = borService.queryUsersStaties();
        //hot books
        List<Book> sellHotBooks = bookService.sellHotBooks();
        List<Book> newBookShelvesBG = bookService.newBookShelvesBG();

        session.setAttribute("bg_hotBooks1", sellHotBooks);
        session.setAttribute("newBookShelvesBG", newBookShelvesBG);
        session.setAttribute("orderCount", orderCount);
        session.setAttribute("userCount", userCount);
        session.setAttribute("recordCount", recordCount);
        session.setAttribute("orderInfoStaties", orderInfoStaties);
        session.setAttribute("booksInfoStaties", booksInfoStaties);
        session.setAttribute("userInfoStaties", userInfoStaties);
        return "success";
    }


}
