package com.jz1501.chenhc.diploma.tfbook.controller;

import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.jz1501.chenhc.diploma.tfbook.entity.Order;
import com.jz1501.chenhc.diploma.tfbook.service.OrderService;
import com.jz1501.chenhc.diploma.tfbook.util.AlipayConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @ProjectName:diploma
 * @Package:com.jz1501.chenhc.diploma.tfbook.controller
 * @description:支付宝支付
 * @author:chenhc
 * @create_time:2019-04-15
 * @version:v1.0.0
 **/
@Controller
@RequestMapping("/alipay")
public class AlipayController {

    @Autowired
    private OrderService orderService;

    /**
     * 支付宝快捷支付接口 沙箱版
     * @return
     * @throws Exception
     */
    @RequestMapping("/goAlipay")
    @ResponseBody
    public String goAlipay(String orderId, HttpServletRequest request, HttpServletRequest response) throws Exception {
        System.out.println("------------goAlipay---------------");
        Order orderInfo = orderService.getOrderInfoById(orderId);
        System.out.println("------------" + orderInfo + "------------");
        //获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);

        //设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);

        //商户订单号，商户网站订单系统中唯一订单号，必填
        String out_trade_no = orderId;
        //付款金额，必填
        String total_amount = orderInfo.getTotalPrice() + "";
        //订单名称，必填
        String subject = orderInfo.getBookName();
        //商品描述，可空
        String body = "用户订购商品个数：" + orderInfo.getItemCount();


        // 该笔订单允许的最晚付款时间，逾期将关闭交易。取值范围：1m～15d。m-分钟，h-小时，d-天，1c-当天（1c-当天的情况下，无论交易何时创建，都在0点关闭）。 该参数数值不接受小数点， 如 1.5h，可转换为 90m。
        String timeout_express = "1c";

        alipayRequest.setBizContent("{\"out_trade_no\":\"" + out_trade_no + "\","
                + "\"total_amount\":\"" + total_amount + "\","
                + "\"subject\":\"" + subject + "\","
                + "\"body\":\"" + body + "\","
                + "\"timeout_express\":\"" + timeout_express + "\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

        //请求
        String result = alipayClient.pageExecute(alipayRequest).getBody();

        AlipayConfig.logResult(result);// 记录支付日志
        return result;
    }

    @RequestMapping("/alipayOrder")
    public Object alipayIumpSum(Model model, String payables, String subject, String body, HttpServletResponse response)
            throws Exception {
        System.out.println("----------------alipayOrder-------------------------");
        // 获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id,
                AlipayConfig.merchant_private_key, "json", AlipayConfig.charset,
                AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
        // 设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        // 商户订单号，商户网站订单系统中唯一订单号，必填
        String out_trade_no = sdf.format(new Date());
        // 付款金额，必填
        String total_amount = payables.replace(",", "");
        alipayRequest.setBizContent("{\"out_trade_no\":\"" + out_trade_no + "\"," + "\"total_amount\":\"" + total_amount
                + "\"," + "\"subject\":\"" + subject + "\"," + "\"body\":\"" + body + "\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
        // 请求
        String result = alipayClient.pageExecute(alipayRequest).getBody();
        // System.out.println(result);
        AlipayConfig.logResult(result);// 记录支付日志
        response.setContentType("text/html; charset=gbk");
        PrintWriter out = response.getWriter();
        out.print(result);
        return null;
    }

    /**
     * p2p后台返回的操作
     * @param response，request
     * @return void
     * @throws Exception
     */
    @RequestMapping("notify_url")
    public void Notify(HttpServletResponse response, HttpServletRequest request) throws Exception {
        System.out.println("----------------------------notify_url------------------------");
        // 商户订单号  ISO-8859-1  GBK
        String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "utf-8");
        // 付款金额
        String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"), "utf-8");
        // 支付宝交易号
        String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "utf-8");
        // 交易说明
        String cus = new String(request.getParameter("body").getBytes("ISO-8859-1"), "utf-8");
        // 交易状态
        String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"), "utf-8");
        if (trade_status.equals("TRADE_SUCCESS")) {//支付成功商家操作

            response.sendRedirect(request.getContextPath() + "/pages/success.jsp");
        } else if (trade_status.equals("TRADE_HAS_SUCCESS")) {
            response.sendRedirect(request.getContextPath() + "/pages/success.jsp");
        }
    }

    /**
     * 同步通知的页面的Controller
     *
     * @throws InterruptedException
     */
    @RequestMapping("return_url")
    public String Return_url() throws InterruptedException {
        return "alipayexit";
    }

}
