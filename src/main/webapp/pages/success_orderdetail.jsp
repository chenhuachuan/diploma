<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Success</title>
    <link href="${pageContext.request.contextPath}/pages/css/bootstrap.css" rel="stylesheet" type="text/css"
          media="all">
    <link href="${pageContext.request.contextPath}/pages/css/style.css" rel="stylesheet" type="text/css" media="all"/>
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
    <script src="${pageContext.request.contextPath}/pages/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/pages/js/easing.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/pages/css/flexslider.css" type="text/css"
          media="screen"/>
    <link href="${pageContext.request.contextPath}/pages/css/megamenu.css" rel="stylesheet" type="text/css"
          media="all"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/pages/css/etalage.css">
    <script src="${pageContext.request.contextPath}/pages/js/jquery.easydropdown.js"></script>
    <script src="${pageContext.request.contextPath}/pages/js/menu_jquery.js"></script>
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
                <%-- 登录注册 jsp--%>
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
<div class="container">
    <div class="main">
        <div style="width:100%;height: auto;">
            <h3><img src="${pageContext.request.contextPath}/image/lb/success1.jpg">购买成功！</h3><br/>
        </div>
        <div class="shoping_bag1">
            <div class="shoping_left">
                <h2><a href="#"><img src="${pageContext.request.contextPath}/pages/images/gift.jpg">地址</a></h2>
            </div>
            <div class="shoping_left">
                <div style="padding-left: 75px;">
                    <div class="shoping1_of_2">
                        <span style="font-size: medium"><b>收货人：</b>  &nbsp;${sessionScope.UserOrderInfo.receiveName}</span><br/>
                        <span style="font-size: medium"><b>电话：</b>  &nbsp;${sessionScope.UserOrderInfo.receiveTel}</span><br/>
                        <span style="font-size: medium"><b>地址：</b>  &nbsp;${sessionScope.UserOrderInfo.addrName}</span><br/>
                    </div>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="shoping_bag1">
            <div class="shoping_left">
                <h2><a href="#"><img src="${pageContext.request.contextPath}/pages/images/gift.jpg">订单详情</a></h2>
            </div>
            <div class="shoping_left" style="padding-left: 75px;">
                <div class="shoping1_of_1">
                </div>
                <div class="shoping1_of_2">
                    <span style="font-size: large"><b>${sessionScope.UserOrderInfo.bookName}</b> &nbsp;</span>
                    <span>|&nbsp;&nbsp;购买数量: <b>${sessionScope.UserOrderInfo.itemCount}</b>&nbsp;&nbsp; </span>
                    <%--<span>|&nbsp;&nbsp;优惠：￥1 &nbsp;| 小计:￥23</span>--%>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="shoping_right">
                <span style="color: red;font-family: 宋体">总价：￥${sessionScope.UserOrderInfo.totalPrice}</span>
            </div>
        </div>
        <div class="clearfix"></div>

        <div class="shoping_bag1">
            <div class="shoping_left">
                <h2><a href="#"><img src="${pageContext.request.contextPath}/pages/images/gift.jpg">交易信息</a></h2>
            </div>
            <div class="shoping_left">
                <div style="padding-left: 75px;">
                    <div class="shoping1_of_2">
                        <span style="font-size: medium"><b>订单编号：</b> ${sessionScope.UserOrderInfo.orderNumber} &nbsp;</span><br/>
                        <%--<span style="font-size: medium"><b>交易流水号：</b> 54214201241121212312 &nbsp;</span><br/>
                        <span style="font-size: medium"><b>支付编号：</b> 54214201241121212312 &nbsp;</span><br/>--%>
                        <span style="font-size: medium"><b>创建时间：</b><fmt:formatDate
                                value="${sessionScope.UserOrderInfo.createTime}"
                                pattern="yyyy-MM-dd"/> &nbsp;</span><br/>
                        <%-- <span style="font-size: medium"><b>付款时间：</b>  2019-04-04 15:02:20 &nbsp;</span><br/>
                         <span style="font-size: medium"><b>发货时间：</b>  2019-04-04 15:02:20 &nbsp;</span><br/>--%>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>

        </div>
        <div class="clearfix"></div>
        <div class="shoping_bag2">
            <div class="shoping_left">
                <a class="btn1" href="${pageContext.request.contextPath}/pages/home.jsp">返回首页</a>&nbsp;&nbsp;&nbsp;&nbsp;
                <a class="btn1"
                   href="${pageContext.request.contextPath}/order/cancelOrder.do?orderNumber=${sessionScope.UserOrderInfo.orderNumber}">取消购买</a>&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            <div class="clearfix"></div>
        </div>
        <%--
                <div class="details">
                    <div class="container">--%>
        <div class="details" style="display:none">
            <div style="width:100%;height: auto;">
                <h3><img src="${pageContext.request.contextPath}/image/lb/success1.jpg">为您推荐</h3><br/>
            </div>
            <div class="col-md-12">
                <div class="single-bottom2">
                    <c:forEach items="${booksTJ}" var="book">
                        <div class="product">
                            <div class="product-desc">
                                <div class="product-img">
                                    <a href="">
                                        <img src="../${book.imgUrl}" class="img-responsive"
                                             style="width: 130px;height: 130px;" alt=""/></a>
                                </div>
                                <div class="prod1-desc">
                                    <h5><a class="product_link" href="">${book.bookName}-<font
                                            size="2px;">${book.author}</font></a></h5>
                                    <span class="price-access">￥${book.bookPrice}</span>
                                    <p class="product_descr" style="text-indent:2em;">${book.bookIntro}</p>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="product_price">
                                <button class="button1"><span>加入购物车</span></button>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
    <%--
            </div>
        </div>
    --%>

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
