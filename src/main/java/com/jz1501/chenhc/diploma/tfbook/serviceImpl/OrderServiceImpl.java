package com.jz1501.chenhc.diploma.tfbook.serviceImpl;

import com.jz1501.chenhc.diploma.tfbook.dao.BookMapper;
import com.jz1501.chenhc.diploma.tfbook.dao.OrderDao;
import com.jz1501.chenhc.diploma.tfbook.entity.*;
import com.jz1501.chenhc.diploma.tfbook.service.OrderService;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

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

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public void addNewOrder() {
        //获取当前用户
        HttpSession session = ServletActionContext.getRequest().getSession(true);
        User curUser = (User) session.getAttribute("CurrentUser");
        //获得购物车信息
        Map<String, OrderItem> showCartMap = (Map) session.getAttribute("OrderInfo");
        Address addressInfo = (Address) session.getAttribute("AddressInfo");//地址信息
        Double totalMoney = (Double) session.getAttribute("totalMoney");

        //购买信息
        String booksItemCount = "", bookNames = "", booksLittlePrice = "", booksPrice = "";
        for (String key : showCartMap.keySet()) {
            OrderItem OI = showCartMap.get(key);//  itemId,bookId,orderId,count,littleCount.
            booksItemCount += OI.getBook().getBookName() + ": " + OI.getCount() + "本,";
            bookNames += OI.getBook().getBookName() + ",";
            booksLittlePrice += OI.getBook().getBookName() + "_小计：" + OI.getLittleCount() + "元,";
            booksPrice += OI.getBook().getBookName() + ": " + OI.getBook().getBookPrice() + "元,";

            //查询库存
            Book book = bookMapper.selectBookDetailsByBookid(OI.getBookId());
            //修改库存
            if (book.getRepertory() >= OI.getCount()) {
                bookMapper.updateBookCountBeforePurchase(book.getRepertory() - OI.getCount());
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
        order.setStatus("1");//状态
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
        session.removeAttribute("AddressInfo");
        session.removeAttribute("totalMoney");
        //生成订单
        session.setAttribute("UserOrderInfo", order);

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


}
