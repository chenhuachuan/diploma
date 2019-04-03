<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>wishlist</title>
    <link href="../pages/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
    <link href="../pages/css/style.css" rel="stylesheet" type="text/css" media="all"/>
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
    <script src="../pages/js/jquery.min.js"></script>
    <script type="text/javascript" src="../pages/js/easing.js"></script>
    <link rel="stylesheet" href="../pages/css/flexslider.css" type="text/css" media="screen"/>
    <link href="../pages/css/megamenu.css" rel="stylesheet" type="text/css" media="all"/>
    <link rel="stylesheet" href="../pages/css/etalage.css">
    <script src="../pages/js/jquery.easydropdown.js"></script>
    <script src="../pages/js/menu_jquery.js"></script>
    <!-- etale -->
    <script src="../pages/js/jquery.etalage.min.js"></script>
    <script src="../pages/js/home.js"></script>
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
                    <a href="home.jsp"><img src="../pages/images/logo.png" alt=""/></a>
                </div>
                <%-- 登录注册--%>
                <%@include file="innerpage/login_regist.jsp" %>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>

<!-- megamenu -->
<script type="text/javascript" src="../pages/js/megamenu.js"></script>
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
            <h3><img src="../pages/images/icon-col.png" width="24">收藏:<span></span></h3>
            <div class="clearfix"></div>
        </div>
        <div class="shoping_bag1">
            <div class="shoping_left">
                <div class="shoping1_of_1">
                    <img src="" class="img-responsive" alt=""/>
                </div>
                <div class="shoping1_of_2">
                    <h4><a href="#">书名</a></h4>
                    <span style="font-size: medium">&nbsp;单价 : </span><br/>
                    <span style="font-size: medium">&nbsp;描述 : 这是一本好书，特别推荐，买的特别火，销量号来到了快点减肥；嘎计算 就；就撒</span>
                    <ul class="s_icons">
                        <%--  <li><a href="#"><img src="../pages/images/s_icon1.png" alt=""></a></li>--%>
                        <li><a href="#"><img src="../pages/images/s_icon2.png" alt=""></a></li>
                        <li><a href="#"><img src="../pages/images/s_icon3.png" alt=""></a></li>
                    </ul>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="shoping_right">
                <%--<p style="font-size: medium">加入购物车</p>
                <a href="#"><span style="font-size:medium">加入购物车 </span></a>
                --%>
                <button type="submit" class="btn btn-info">加入购物车</button>
            </div>
            <div class="clearfix"></div>
        </div>
        <div style="display: none;">
            <div class="shoping_right">
                <p class="tot">总计 &nbsp;<span class="color"> ￥189 </span></p>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="shoping_bag2">
            <div class="shoping_left">
                <a class="btn1" href="#">购物车</a>&nbsp;&nbsp;&nbsp;&nbsp;
                <a class="btn1"
                   href="${pageContext.request.contextPath}/book/queryAllBooksbyPage.do?parSortId=1">浏览商品</a>
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
