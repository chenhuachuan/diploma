package com.jz1501.chenhc.diploma.tfbook.serviceImpl;

import com.jz1501.chenhc.diploma.tfbook.dao.BookMapper;
import com.jz1501.chenhc.diploma.tfbook.dao.OrderDao;
import com.jz1501.chenhc.diploma.tfbook.entity.*;
import com.jz1501.chenhc.diploma.tfbook.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * /**
 *
 * @program:diploma
 * @description:插入订单
 * @author:chenhc
 * @create_time:2019-04-06
 * @version:v1.0.0$
 **/
@Service
@Transactional
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDao orderDao;
    @Autowired
    private BookMapper bookMapper;
    @Autowired
    private HttpSession session;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public void addNewOrder_to() {
        //获取当前用户
        //HttpSession session = ServletActionContext.getRequest().getSession(true);
        User curUser = (User) session.getAttribute("CurrentUser");
        //获得购物车信息
        Map<String, OrderItem> showCartMap = (Map) session.getAttribute("OrderInfo");
        Address addressInfo = (Address) session.getAttribute("AddressInfo");//地址信息
        Double totalMoney = (Double) session.getAttribute("totalMoney");

        //购买信息
        String booksItemCount = "", bookNames = "", booksLittlePrice = "", booksPrice = "";
        for (String key : showCartMap.keySet()) {
            OrderItem OI = showCartMap.get(key);//  itemId,bookId,orderId,count,littleCount.
            booksItemCount = OI.getCount() + "";
            bookNames = OI.getBook().getBookName();
            booksLittlePrice = OI.getLittleCount() + "";
            booksPrice = OI.getBook().getBookPrice() + "";
//            booksItemCount += OI.getBook().getBookName() + ": " + OI.getCount() + "本  ";
//            bookNames += OI.getBook().getBookName() + "  ";
//            booksLittlePrice += OI.getBook().getBookName() + "_小计:" + OI.getLittleCount() + "元  ";
//            booksPrice += OI.getBook().getBookName() + ": " + OI.getBook().getBookPrice() + "元  ";

            //查询库存
            Book book = bookMapper.selectBookDetailsByBookid(OI.getBookId());
            //修改库存
            if (book.getRepertory() >= OI.getCount()) {
                bookMapper.updateBookCountBeforePurchase((book.getRepertory() - OI.getCount()), book.getBookId());
                bookMapper.updateBookSaleCountBeforePurchase((book.getSaleCount() + OI.getCount()), book.getBookId());
                //插入订单项表： 未完成
            } else {
                throw new RuntimeException("repertory is not enough!");
            }
        }
        Order order = new Order();
        order.setOrderId(UUID.randomUUID().toString().replace("-", ""));//主键
        order.setOrderNumber(getRandomUniqueId());//订单号
        order.setTotalPrice(totalMoney);//"总价格"
        order.setAddrName(addressInfo.getProvNameAddr() + addressInfo.getCityNameAddr() + addressInfo.getAreaNameAddr() + addressInfo.getAddrName());//详细地址
        order.setReceiveName(addressInfo.getReceiveName());//收货人姓名
        order.setReceiveTel(addressInfo.getReceiveTel());//收货人电话
        order.setCreateTime(new Date());//创建时间
        order.setStatus("10");//状态 (10:代付款，20：已付款)
        order.setItemCount(booksItemCount);//每种书数量
        order.setBookName(bookNames);//书名
        order.setItemLittlePrice(booksLittlePrice);//每种书小计
        order.setBookPrice(booksPrice);//每本书价格
        order.setUserId(curUser.getUserId());
        order.setAddressId(addressInfo.getAddressId());


        //添加订单
        orderDao.insertNewOrder(order);

        //清空购物车，清除缓存
        session.removeAttribute("OrderInfo");
        session.removeAttribute("checkOrder");
        session.removeAttribute("showCart");
        session.removeAttribute("AddressInfo");
        session.removeAttribute("totalMoney");
        session.removeAttribute("perMoney");
        session.removeAttribute("totalCartCount");
        //生成订单
        session.setAttribute("UserOrderInfo", order);

    }


    //            booksItemCount=OI.getCount()+"";
//            bookNames= OI.getBook().getBookName();
//            booksLittlePrice=OI.getLittleCount()+"";
//            booksPrice=OI.getBook().getBookPrice()+"";
    //获取当前用户
    //HttpSession session = ServletActionContext.getRequest().getSession(true);
    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public void addNewOrder() {
        User curUser = (User) session.getAttribute("CurrentUser");
        //获得购物车信息
        Map<String, OrderItem> showCartMap = (Map) session.getAttribute("OrderInfo");
        Address addressInfo = (Address) session.getAttribute("AddressInfo");//地址信息
        Double totalMoney = (Double) session.getAttribute("totalMoney");
        //购买信息
        String booksItemCount = "", bookNames = "", booksLittlePrice = "", booksPrice = "", bookIds = "";
        for (String key : showCartMap.keySet()) {
            OrderItem OI = showCartMap.get(key);
            booksItemCount += OI.getBook().getBookName() + ":" + OI.getCount() + "本  ";
            bookNames += OI.getBook().getBookName() + "  ";
            booksLittlePrice += OI.getBook().getBookName() + "_小计:" + OI.getLittleCount() + "元  ";
            booksPrice += OI.getBook().getBookName() + ":" + OI.getBook().getBookPrice() + "元  ";
            bookIds += OI.getBookId() + ",";
            //查询库存
            Book book = bookMapper.selectBookDetailsByBookid(OI.getBookId());
            //修改库存
            if (book.getRepertory() >= OI.getCount()) {
                bookMapper.updateBookCountBeforePurchase((book.getRepertory() - OI.getCount()), book.getBookId());
                //修改销售量
                bookMapper.updateBookSaleCountBeforePurchase((book.getSaleCount() + OI.getCount()), book.getBookId());
                //插入订单项表： 未完成
            } else {
                throw new RuntimeException("repertory is not enough!");
            }

        }
        Order order = new Order();
        order.setOrderId(UUID.randomUUID().toString().replace("-", ""));//主键
        order.setOrderNumber(getRandomUniqueId());//订单号
        order.setTotalPrice(totalMoney);//"总价格"
        order.setAddrName(addressInfo.getProvNameAddr() + addressInfo.getCityNameAddr() + addressInfo.getAreaNameAddr() + addressInfo.getAddrName());//详细地址
        order.setReceiveName(addressInfo.getReceiveName());//收货人姓名
        order.setReceiveTel(addressInfo.getReceiveTel());//收货人电话
        order.setCreateTime(new Date());//创建时间
        order.setStatus("10");//状态 (10:代付款，20：已付款)
        order.setItemCount(booksItemCount);//每种书数量
        order.setBookName(bookNames);//书名
        order.setItemLittlePrice(booksLittlePrice);//每种书小计
        order.setBookPrice(booksPrice);//每本书价格
        order.setUserId(curUser.getUserId());
        order.setAddressId(addressInfo.getAddressId());
        order.setBookId(bookIds);

        //添加订单
        orderDao.insertNewOrder(order);

        //清空购物车，清除缓存
        session.removeAttribute("OrderInfo");
        session.removeAttribute("checkOrder");
        session.removeAttribute("showCart");
        session.removeAttribute("AddressInfo");
        session.removeAttribute("totalMoney");
        session.removeAttribute("perMoney");
        session.removeAttribute("totalCartCount");
        //生成订单
        session.setAttribute("UserOrderInfo", order);

    }

    @Override
    public Order getOrderInfoById(String orderId) {
        return orderDao.selectOrderById(orderId);
    }

    private static String getRandomUniqueId() {
        String uniqueId = "";
        long now = System.currentTimeMillis();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
        //获取时间戳
        String time = dateFormat.format(now);
        Random random = new Random();
        String as = "";
        for (int i = 0; i < 3; i++) {
            int nextInt = random.nextInt(10);
            as += nextInt + "";
        }
        long n = System.nanoTime();
        uniqueId = time + n + as;
        return uniqueId;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public void modifyOrderStatus(String orderNumber) {
        orderDao.updateOrderStatus(orderNumber);
    }

    @Override
    public List<Order> queryUserAllOrderInfoByUserId(String userId) {
        return orderDao.selectUserAllOrderByUserId(userId);
    }


    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public void removeOrderInfoByOrderNumber(String orderNumber) {
        orderDao.deleteOrderInfoByOrderNumber(orderNumber);
    }

    /**
     * 订单详情
     * @param orderNumber
     * @return
     */
    @Override
    public Map<String, OrderItem> queryOrderDetailInfoByOrderNumber(String orderNumber) {
        Map<String, OrderItem> orderInfoMap = new HashMap<String, OrderItem>();
        Order order = orderDao.selectOrderInfoByOrderNumber(orderNumber);
        String bookIds = order.getBookId();
        String itemCount = order.getItemCount();
        String[] bookIdStr = bookIds.split(",");
        String[] item = itemCount.split("  ");
        for (int i = 0; i < bookIdStr.length; i++) {
            String bookId = bookIdStr[i];
            OrderItem orderItem = new OrderItem();
            Book book = bookMapper.selectBookDetailsByBookid(bookId);
            orderItem.setBookId(bookId);
            orderItem.setBook(book);
            String countStr = item[i].split(":")[1].replace("本", "");
            orderItem.setCount(Integer.valueOf(countStr));//购买数量
            orderItem.setLittleCount((Integer.valueOf(countStr)) * book.getBookPrice());//每本书的小计
            orderItem.setOrderId(order.getOrderId());//同一个 订单号
            orderInfoMap.put(book.getBookId(), orderItem);
        }
        return orderInfoMap;
    }

    @Override
    public Order queryOrderInfoById(String orderNumber) {
        return orderDao.selectOrderInfoByOrderNumber(orderNumber);
    }

    //bg
    @Override
    public List<Order> queryAllOrdersByAdmin(Integer rows, Integer page, String orderNumber) {
        Integer index = (page - 1) * rows;
        return orderDao.selectAllOrdersByAdmin(rows, index, orderNumber);
    }

    @Override
    public Integer selectOrdersTotalCount() {
        return orderDao.selectOrderInfoCount();
    }

    @Override
    public Integer selectOrdersTotalCountBySearch(String orderNumber) {
        return orderDao.selectOrderInfoCountBySearch(orderNumber);
    }


    @Override
    public Order queryOneOrderDetail(String orderId) {
        Order order = orderDao.selectOneOrderByNumber(orderId);
        return order;
    }

    @Override
    public void adminDeleteOrderInfo(String orderNumber) {
        orderDao.updateStatusByAdmin(orderNumber);
    }

    @Override
    public void adminDeliverOrder(String orderNumber) {
        orderDao.updateStatusDeliver(orderNumber);
    }

    //取消订单
    @Override
    public void modifyOrderStatus_cancel(String orderNumber) {
        orderDao.updateOrderStatus_cancel(orderNumber);
    }
}
