<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>checkout</title>
    <link href="${pageContext.request.contextPath}/pages/css/bootstrap.css" rel="stylesheet" type="text/css"
          media="all">
    <link href="${pageContext.request.contextPath}/pages/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <script src="${pageContext.request.contextPath}/pages/js/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/pages/js/easing.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/pages/css/flexslider.css" type="text/css"
          media="screen"/>
    <link href="${pageContext.request.contextPath}/pages/css/megamenu.css" rel="stylesheet" type="text/css"
          media="all"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/pages/css/etalage.css">
    <script src="${pageContext.request.contextPath}/pages/js/jquery.easydropdown.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/pages/js/megamenu.js"></script>
    <script src="${pageContext.request.contextPath}/pages/js/menu_jquery.js"></script>
    <script src="${pageContext.request.contextPath}/pages/js/jquery.etalage.min.js"></script>
    <script src="${pageContext.request.contextPath}/pages/js/home.js"></script>

</head>
<body>

<!-- header -->
<div class="header">
    <div class="top_bg">
        <div class="container">
            <div class="header_top">
                <div class="logo">
                    <a href="home.jsp"><img src="${pageContext.request.contextPath}/pages/images/logo.png" alt=""/></a>
                </div>
                <%-- 登录注册--%>
                <%@include file="innerpage/login_regist.jsp" %>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>

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
            <h3><img src="${pageContext.request.contextPath}/pages/images/icon_check.jpg">确认订单:<span></span></h3>
            <div class="clearfix"></div>
        </div>

        <c:forEach items="${sessionScope.checkOrder}" var="map" varStatus="order_item">
            <div class="shoping_bag1">
                <div class="shoping_left">
                    <div class="shoping1_of_1">
                        <img src="${pageContext.request.contextPath}${map.value.book.imgUrl}" class="img-responsive"
                             alt=""/>
                    </div>
                    <div class="shoping1_of_2">
                        <h4><a href="#">${map.value.book.bookName}</a></h4>
                        <span style="font-size: medium">购买数量: <b>&nbsp;<input type="text" value="${map.value.count}"
                                                                              style="width:35px;">
                    </b>&nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;单价 : ${map.value.book.bookPrice}</span>
                        <ul class="s_icons">
                            <li><a href="#"><img src="${pageContext.request.contextPath}/pages/images/s_icon1.png"
                                                 alt=""></a></li>
                            <li><a href="#"><img src="${pageContext.request.contextPath}/pages/images/s_icon2.png"
                                                 alt=""></a></li>
                            <li><a href="#"><img src="${pageContext.request.contextPath}/pages/images/s_icon3.png"
                                                 alt=""></a></li>
                        </ul>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="shoping_right">
                    <p style="font-size: medium">
                        优惠：￥ ${sessionScope.perMoney}&nbsp;<span> 小计:￥${map.value.littleCount}</span></p>
                </div>
                <div class="clearfix"></div>
            </div>
        </c:forEach>
        <div>
            <div class="shoping_right">
                <p class="tot">总计 &nbsp;<span class="color"> ￥${sessionScope.totalMoney}</span></p>
            </div>
            <div class="clearfix"></div>
        </div>

        <%--    <div class="shoping_bag1">
                <div class="shoping_left">
                    <h2><a href="#"><img src="../pages/images/gift.jpg">服务</a> <span>&lt;%&ndash;￥. 25&ndash;%&gt;</span></h2>
                </div>
                <div class="shoping_right">
                    <p>快递 &nbsp;<a href="#">free</a>&nbsp;<span> ￥ 0</span></p>
                    <p>其他 &nbsp;<span> ￥ 0</span></p>
                    <p>小计 &nbsp;<span> ￥ 0</span></p>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="shoping_bag1">
                <div class="shoping_left">
                    <h2><a href="#"><img src="../pages/images/login.jpg">使用 </a> <span> 优惠券</span></h2>
                </div>
                <div class="shoping_right">
                    <p>优惠券 &nbsp;<span class="color"> ￥ 0</span></p>
                </div>
                <div class="clearfix"></div>
            </div>
            --%>
        <div class="shoping_bag2">
            <div class="shoping_left">
                <%-- <a class="btn1" href="${pageContext.request.contextPath}/cart/purchase/fillReceiveAddress.do">确认订单</a>&nbsp;&nbsp;&nbsp;&nbsp;--%>
                <a class="btn1" href="${pageContext.request.contextPath}/cart/purchase/allAddrSort.do">确认订单</a>&nbsp;&nbsp;&nbsp;&nbsp;
                <a class="btn1"
                   href="${pageContext.request.contextPath}/book/queryAllBooksbyPage.do?parSortId=1">继续购物</a>
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

<script type="application/x-javascript"> addEventListener("load", function () {
    setTimeout(hideURLbar, 0);
}, false);

function hideURLbar() {
    window.scrollTo(0, 1);
} </script>
<!-- megamenu -->
<script>
    $(document).ready(function () {
        $(".megamenu").megamenu();
    });
</script>
<!-- megamenu -->
<!-- script-for-nav -->
<script>
    $("span.menu").click(function () {
        $(".head-nav ul").slideToggle(300, function () {
            // Animation complete.
        });
    });
</script>
<!-- script-for-nav -->
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
</body>
</html>
