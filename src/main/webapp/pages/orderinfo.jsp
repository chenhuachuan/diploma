<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>orderdetail</title>
    <link href="${pageContext.request.contextPath}/pages/css/bootstrap.css" rel="stylesheet" type="text/css"
          media="all">
    <link href="${pageContext.request.contextPath}/pages/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <script src="${pageContext.request.contextPath}/pages/js/jquery-1.10.2.js" type="text/javascript"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <script type="text/javascript" src="${pageContext.request.contextPath}/pages/js/easing.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/pages/css/flexslider.css" type="text/css"
          media="screen"/>
    <link href="${pageContext.request.contextPath}/pages/css/megamenu.css" rel="stylesheet" type="text/css"
          media="all"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/pages/css/etalage.css">
    <script src="${pageContext.request.contextPath}/pages/js/jquery.easydropdown.js"></script>
    <script src="${pageContext.request.contextPath}/pages/js/menu_jquery.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
    <!-- etale -->
    <script src="${pageContext.request.contextPath}/pages/js/jquery.etalage.min.js"></script>
    <script src="${pageContext.request.contextPath}/pages/js/home.js"></script>
    <script>
        jQuery(document).ready(function ($) {
            $('#etalage').etalage({
                thumb_image_width: 300,
                thumb_image_height: 400,
                source_image_width: 800,
                source_image_height: 1000,
                show_hint: true,
                click_callback: function (image_anchor, instance_id) {
                    //alert('Callback example:\nYou clicked on an image with the anchor: "' + image_anchor + '"\n(in Etalage instance: "' + instance_id + '")');
                }
            });
        });
    </script>
    <!-- etale -->
</head>
<body>

<!-- header -->
<div class="header">
    <div class="top_bg">
        <div class="container">
            <div class="header_top">
                <div class="logo">
                    <a href="home.jsp"><img src="${pageContext.request.contextPath}/image/lb/logo.png" alt=""/></a>
                </div>
                <%-- 登录注册--%>
                <%@include file="innerpage/login_regist.jsp" %>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>

<!-- megamenu -->
<script type="text/javascript" src="${pageContext.request.contextPath}/pages/js/megamenu.js"></script>
<script>
    $(document).ready(function () {
        $(".megamenu").megamenu();
    });
</script>
<!-- megamenu -->

<%--分类导航--%>
<div class="head-bann" id="page_load_contrller_buy_div">
    <script type="text/javascript">
        $("#page_load_contrller_buy_div").load('${pageContext.request.contextPath}/category/all_category_name.do');
    </script>
</div>
<!-- header end -->

<div class="banner1">
    <div class="container">
    </div>
</div>

<!-- header -->
<div class="container">
    <div class="main">
        <div class="shoping_bag">
            <h3><img src="${pageContext.request.contextPath}/image/lb/collect_red.jpg" width="27">订单详情:<span></span>
            </h3>
            <div class="clearfix"></div>
        </div>
        <div class="shoping_bag1">
            <c:forEach items="${orderDetailInfo}" var="orderInfo">
                <c:set var="OI" value='${orderInfo.value}'/>
                <div class="shoping_left">
                    <div class="shoping1_of_1">
                        <img src="${pageContext.request.contextPath}/${OI.book.imgUrl}" class="img-responsive" alt=""/>
                    </div>
                    <div class="shoping1_of_2">
                        <span style="font-size: large;">
                            订单号：<font color="#3fc3ff">${OI.orderId}</font> &nbsp;<br/>
                            <font size="2.5px;">购买时间：</font><font size="2px;"><fmt:formatDate
                                value="${orderINFO.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </font></span>
                        <span style="font-size: small"><br/>书名:${OI.book.bookName}  作者：${OI.book.author} 价格：${OI.book.bookPrice}  购买数量：x${OI.count}&nbsp;&nbsp;&nbsp;
                               </span>

                        <br/>
                        <div style="width:1050px;">
                            <span style="font-size: small">&nbsp;
                                 <p><font size="2.5px;">图书介绍：</font>
                                <font size="2px;">${OI.book.bookIntro}</font></p>
                            </span>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="clearfix"></div>
                <br/>
                <hr/>
            </c:forEach>
            <span>
                <font size="5px;">总计：${orderINFO.totalPrice}元</font>
            </span>
        </div>
        <div class="shoping_bag2">
            <div class="shoping_left">
                <a class="btn_scan"
                   href="${pageContext.request.contextPath}/cart/purchase/userOrderListInfo.do">返回我的订单</a>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!-- footer -->
<div class="footer">
    <div class="container">
        <p>Copyright &copy; 2019.chenhc All rights reserved !</p>
    </div>
</div>
<!-- footer -->
<!-- script-for-nav -->
<script>
    $("span.menu").click(function () {
        $(".head-nav ul").slideToggle(300, function () {
            // Animation complete.
        });
    });
</script>
<!-- script-for-nav -->
</body>
</html>
