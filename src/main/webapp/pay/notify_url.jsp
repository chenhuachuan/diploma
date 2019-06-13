<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ page import="com.alipay.api.internal.util.AlipaySignature" %>
<%@ page import="com.jz1501.chenhc.diploma.tfbook.util.AlipayConfig" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Map" %>
<%
    /* *
     * 功能：支付宝服务器异步通知页面
     * 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
     * 该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
     *************************页面功能说明*************************
     * 创建该页面文件时，请留心该页面文件中无任何HTML代码及空格。
     * 该页面不能在本机电脑测试，请到服务器上做测试。请确保外部可以访问该页面。
     * 如果没有收到该页面返回的 success
     * 建议该页面只做支付成功的业务逻辑处理，退款的处理请以调用退款查询接口的结果为准。
     */
    //获取支付宝POST过来反馈信息
    Map<String, String> params = new HashMap<String, String>();
    Map<String, String[]> requestParams = request.getParameterMap();
    for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext(); ) {
        String name = (String) iter.next();
        String[] values = (String[]) requestParams.get(name);
        String valueStr = "";
        for (int i = 0; i < values.length; i++) {
            valueStr = (i == values.length - 1) ? valueStr + values[i]
                    : valueStr + values[i] + ",";
        }
        //乱码解决，这段代码在出现乱码时使用
        valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
        params.put(name, valueStr);
    }
    System.out.println("--------------wo----------");

    boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); //调用SDK验证签名

    System.out.println(signVerified);

    if (signVerified) {//验证成功

        System.out.println("============notify=================验证成功");
        //商户订单号
        String orderNumber = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");

        //支付宝交易号
        String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");

        //交易状态
        String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"), "UTF-8");

        System.out.println("________________状态：" + trade_status + "________________");

        if (trade_status.equals("TRADE_FINISHED")) {
            System.out.println("---------------Notify_URL----TRADE_FINISHED----------");

            //response.sendRedirect(request.getContextPath() + "/order/modifyOrderStauts.do?orderNumber="+orderNumber+"&flowNumber="+trade_no);
        } else if (trade_status.equals("TRADE_SUCCESS")) {
            System.out.println("---------------Notify_URL----TRADE_SUCCESS----------");
            //修改订单状态
            // response.sendRedirect(request.getContextPath() + "/order/modifyOrderStauts.do?orderNumber="+orderNumber+"&flowNumber="+trade_no);
        }
        out.println("success");

    } else {//验证失败
        System.out.println("---------------Notify_URL----TRADE_FAIL----------");
        out.println("fail");
    }
%>