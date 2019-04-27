<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>电脑网站支付return_url</title>
</head>
<%@ page import="com.alipay.api.internal.util.AlipaySignature" %>
<%@ page import="com.jz1501.chenhc.diploma.tfbook.util.AlipayConfig" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Map" %>
<%
    //获取支付宝GET过来反馈信息
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

    boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); //调用SDK验证签名

    //——请在这里编写您的程序（以下代码仅作参考）——
    if (signVerified) {
        //商户订单号
        String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");

        //支付宝交易号
        String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");

        //付款金额
        String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"), "UTF-8");

        out.println("trade_no:" + trade_no + "<br/>out_trade_no:" + out_trade_no + "<br/>total_amount:" + total_amount);
    } else {
        out.println("验签失败");
    }
    //——请在这里编写您的程序（以上代码仅作参考）——
%>
<body>
</body>
</html>