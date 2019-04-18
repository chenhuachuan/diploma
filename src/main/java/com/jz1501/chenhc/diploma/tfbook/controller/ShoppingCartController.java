package com.jz1501.chenhc.diploma.tfbook.controller;

import com.jz1501.chenhc.diploma.tfbook.entity.*;
import com.jz1501.chenhc.diploma.tfbook.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ProjectNam:tfbook
 * @Package:com.jz1501.chenhc.diploma.tfbook.controller
 * @Descrition:diploma
 * @Author:chenhc
 * @Create_time:2019/4/2
 * @Version:v1.0.0
 **/
@Controller
@RequestMapping("/cart")
public class ShoppingCartController {

    @Autowired
    private BookService bookService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private AddressService addressService;
    @Autowired
    private CascadingService cascadingService;
    @Autowired
    private OrderService orderService;

    /**
     * 加入购物车
     *
     * @param bookId
     * @param purCount
     * @param session
     * @return
     */
    @RequestMapping("/addToCart")
    public String addToCart(String bookId, Integer purCount, HttpSession session) {
        //获取购物车
        Map<String, OrderItem> showCartMap = (Map) session.getAttribute("showCart");
        //获取恢复区中的   订单项
        //Map<String, OrderItem> delCartMap = (Map) session.getAttribute("delCart");

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

    //移除购物车
    @RequestMapping("/removeFromCart")
    public String removeFromCart(String bookId, HttpSession session) {
        //获取购物车
        Map<String, OrderItem> showCartMap = (Map) session.getAttribute("showCart");
        //判断购物车是否包含该图书
        if (showCartMap.containsKey(bookId)) {
            showCartMap.remove(bookId);//从购物车移除
        } else {
            throw new RuntimeException("program error");
        }
        if (showCartMap.isEmpty()) {
            session.removeAttribute("showCart");
            //计算总金额
            calculateTotalMoney(session);
        } else {
            //存入session
            session.setAttribute("showCart", showCartMap);
            //计算总金额
            calculateTotalMoney(session);
        }

        return "redirect:/pages/buy.jsp";
    }


    /**
     * 确认订单
     * @param session
     * @return
     */
    @RequestMapping("/purchase/checkOrder")
    public String checkoutOrder(String bookId, Integer purCount, HttpSession session) {
        if (bookId != null && purCount != null) {
            OrderItem buynowItem = new OrderItem();
            Map<String, OrderItem> showCartMap = new HashMap<String, OrderItem>();
            Book dbBook = bookService.queryBookDetailsByBookId(bookId);
            buynowItem.setBook(dbBook);
            buynowItem.setCount(purCount);
            buynowItem.setLittleCount(purCount * dbBook.getBookPrice());
            Double totalMoney = dbBook.getBookPrice() * purCount;
            Double perMoney = (dbBook.getOriginalPrice() - dbBook.getBookPrice()) * purCount;

            showCartMap.put(dbBook.getBookId(), buynowItem);
            //存入session
            session.setAttribute("checkOrder", showCartMap);
            //总金额
            session.setAttribute("totalMoney", totalMoney);
            //优惠价
            session.setAttribute("perMoney", perMoney);
        } else {
            Map<String, OrderItem> showCartMap = (Map) session.getAttribute("showCart");
            //存入session
            session.setAttribute("checkOrder", showCartMap);
            //计算总金额
            calculateTotalMoney(session);
        }
        return "forward:/pages/checkout.jsp";
    }

    @RequestMapping("/purchase/fillReceiveAddress")
    public String fillInAddress(Model model) {
        String userId = "104bf543ff344dd2a2da7b2cffff0d54";
        // String nickAddrId="e561617d030148a7b233771311b5619d";
        //User currentUser = (User)session.getAttribute("CurrentUser");
        //List<Address> addresses = addressService.queryAddressById(currentUser.getUserId(), nickAddrId);
        List<Address> addresses = addressService.queryAddressByUserId(userId);
        model.addAttribute("UserAddress", addresses);
        return "forward:/pages/fillAddress.jsp";
    }


    @RequestMapping("/purchase/allAddrSort")
    public String queryAllCategoryAddress(Model model) {
        String userId = "104bf543ff344dd2a2da7b2cffff0d54";
        List<Address> categoryAddr = addressService.queryAddressByUserId(userId);
        model.addAttribute("allAddrSort", categoryAddr);
        return "forward:/pages/fillAddress.jsp";
    }


    @RequestMapping("/purchase/queryOneAddress")
    public String queryOneAddressByNickId(String nickAddrId, Model model) {
        String userId = "104bf543ff344dd2a2da7b2cffff0d54";
        Address addresses = addressService.queryAddressById(userId, nickAddrId);
        model.addAttribute("one_address", addresses);
        return "forward:/pages/fillAddress.jsp";
    }

    //点击确定后，判断：修改--入库；没修改--查询使用；新增--入库，使用
    @RequestMapping("/purchase/addAddressAndConfirmOrder")
    public String addAddressAndConfirmOrder(Address address, HttpSession session, Model model) {
        User currentUser = (User) session.getAttribute("CurrentUser");
        //根据这两个id查数据库，匹配各个字段是否和数据库一致
        Address completeAddress = getCompleteAddress(address);//去掉页面的其他符号
        Address dbAddress = addressService.queryAddressById(address.getUserId(), completeAddress.getNickAddrId());

        //判断地址是否是新地址
        if (completeAddress.getAddressId() == "" && "new".equals(completeAddress.getNickAddrId())) {
            //新地址  入库
            if (completeAddress.getNickAddrName() == "" || "".equals(completeAddress.getNickAddrName())) {
                completeAddress.setNickAddrName("地址:" + completeAddress.getProvNameAddr());//地址别名：
            }
            completeAddress.setNickAddrId("");
            completeAddress.setUserId(currentUser.getUserId());
            // addressService.addNewAddress(address);
            //获取订单信息
            Map<String, OrderItem> showCartMap = (Map) session.getAttribute("checkOrder");//showCart
            //将用户选择地址和订单回显到  confirmOrder.jsp页面 做最后展示
            model.addAttribute("OrderInfo", showCartMap);
            model.addAttribute("AddressInfo", completeAddress);
            return "forward:/pages/confirmOrder.jsp";
        } else if (!completeAddress.equals(dbAddress)) {
            //修改了地址  入库
            addressService.modifyAddress(address);

            //获取订单信息
            Map<String, OrderItem> showCartMap = (Map) session.getAttribute("checkOrder");//showCart
            //将用户选择地址和订单回显到  confirmOrder.jsp页面 做最后展示
            model.addAttribute("OrderInfo", showCartMap);
            model.addAttribute("AddressInfo", completeAddress);
            return "forward:/pages/confirmOrder.jsp";

        } else {
            //获取订单信息
            Map<String, OrderItem> showCartMap = (Map) session.getAttribute("checkOrder");//showCart
            //将用户选择地址和订单回显到  confirmOrder.jsp页面 做最后展示
            model.addAttribute("OrderInfo", showCartMap);
            model.addAttribute("AddressInfo", completeAddress);
            return "forward:/pages/confirmOrder.jsp";
        }
    }

    /**
     * 收集confirmOrder.jsp页面数据 提交
     * 提交订单  处理数据入库，地址入库，修改库存，清空购物车，清除缓存，生成订单
     * @return
     */
    @RequestMapping("/purchase/confirmOrder")
    public String confirmOrderNow(Model model) {
        //添加订单
        orderService.addNewOrder();//订单信息
        List<Book> books = bookService.editorRecommend();
        model.addAttribute("booksTJ", books);
        //相似推荐
        return "forward:/pages/success.jsp";
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
        int size = showCartMap.size();
        session.setAttribute("totalCartCount", size);
        //总金额
        session.setAttribute("totalMoney", totalMoney);
        //优惠价
        session.setAttribute("perMoney", perMoney);
    }

    //去掉地址中的,
    private Address getCompleteAddress(Address address) {
        String nickAddrId = "";
        String nickAddrs[] = address.getNickAddrId().split(",");
        if (nickAddrs.length > 0) {
            nickAddrId = nickAddrs[0] != "" ? nickAddrs[0] : nickAddrs[1];
        }

        address.setNickAddrId(nickAddrId);
        address.setNickAddrName(address.getNickAddrName().replace(",", ""));
        address.setProvNameAddr(address.getProvNameAddr().replace(",", ""));
        address.setCityNameAddr(address.getCityNameAddr().replace(",", ""));
        address.setAreaNameAddr(address.getAreaNameAddr().replace(",", ""));

        if (address.getAddressId() == "") {
            //旧地址
            Province province = cascadingService.queryProvNameByCode(address.getProvNameAddr());
            City city = cascadingService.queryCityNameByCode(address.getCityNameAddr());
            Area area = cascadingService.queryAreaNameByCode(address.getAreaNameAddr());

            address.setProvNameAddr(province.getProvName());
            address.setCityNameAddr(city.getCityName());
            address.setAreaNameAddr(area.getAreaName());
        }
        return address;
    }


}
