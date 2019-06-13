<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>pay</title>
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
                    <a href="home.jsp"><img src="${pageContext.request.contextPath}/image/lb/logo_v3.jpg" alt=""/></a>
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

<div class="banner1">
    <div class="container">

    </div>
</div>

<!-- header -->
<div class="container">
    <div class="main">
        <div>
            <jsp:include page="../pay/paynow.jsp"/>
        </div>
        <div class="shoping_bag2" style="display: none;">
            <div class="shoping_left" style="display: none">
                <a class="btn1" href="${pageContext.request.contextPath}/pages/home.jsp">返回首页</a>&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="details">
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
                                        <img src="${pageContext.request.contextPath}/${book.imgUrl}"
                                             class="img-responsive"
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
