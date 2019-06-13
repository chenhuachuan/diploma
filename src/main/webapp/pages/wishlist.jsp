<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>wishlist</title>
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
    <c:if test="${wishCount !=0}">
        <div class="main">
        <div class="shoping_bag">
            <h3><img src="${pageContext.request.contextPath}/image/lb/collect_red.jpg" width="27">收藏:<span></span></h3>
            <div class="clearfix"></div>
        </div>
        <div class="shoping_bag1">
            <c:forEach items="${wishBooks}" var="wishlist">
                <div class="shoping_right">
                    <a class="show1"
                       href="${pageContext.request.contextPath}/cart/addToCart.do?bookId=${wishlist.bookId}">加入购物车</a>
                </div>

                <div class="shoping_left"><%--shoping_left--%>
                    <div class="shoping1_of_1">
                        <img src="${pageContext.request.contextPath}/${wishlist.book.imgUrl}" class="img-responsive"
                             alt=""/>
                    </div>
                    <div class="shoping1_of_2">
                        <span style="font-size: large;"><font
                                color="#3fc3ff">${wishlist.book.bookName}</font> &nbsp;<font
                                size="2px;">${wishlist.book.author}</font></span>
                        <span style="font-size: small">&nbsp;￥${wishlist.book.bookPrice}</span><br/>
                        <div style="width:750px;">
                            <span style="font-size: small">&nbsp;${wishlist.book.bookIntro}</span>
                        </div>
                    <ul class="s_icons">
                        <li><a href="javascript:void(0)" onclick="showDeleteModel()">
                            <img src="${pageContext.request.contextPath}/pages/images/s_icon3.png" alt=""></a></li>
                        <!-- 模态框（Modal） -->
                        <div class="modal fade" id="delWishBook" tabindex="-1" role="dialog"
                             aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                            &times;
                                        </button>
                                        <h4 class="modal-title" id="myModalLabel">
                                            从收藏栏移除
                                        </h4>
                                    </div>
                                    <div class="modal-body">
                                        确定移除收藏夹吗？移除后不可恢复！
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                        <button type="button" class="btn btn-primary"
                                                onclick="submitDeleteOrder('${wishlist.collectId}')">确定
                                        </button>
                                    </div>
                                </div><!-- /.modal-content -->
                            </div><!-- /.modal -->
                        </div>
                        <!-- end模态框（Modal） -->

                    </ul>
                </div>
                    <div class="clearfix"></div>
                </div>
                <div class="clearfix"></div>
                <br/>
            </c:forEach>
        </div>
            <div class="shoping_bag2">
                <div class="shoping_left">
                    <a class="btn1" href="${pageContext.request.contextPath}/pages/buy.jsp">购物车</a>&nbsp;&nbsp;&nbsp;&nbsp;
                    <a class="btn1"
                       href="${pageContext.request.contextPath}/pages/home.jsp">浏览商品</a>
            </div>
            <div class="clearfix"></div>
        </div>

        </div>
    </c:if>
    <c:if test="${wishCount ==0}">
        <div class="main">
            <div class="shoping_bag">
                <h3><img src="${pageContext.request.contextPath}/pages/images/icon-col.png"
                         width="24">您还没有收藏呢<span></span></h3>
                <div class="clearfix"></div>
            </div>

            <div class="shoping_bag2">
                <div class="shoping_left">
                    <a class="btn1"
                       href="${pageContext.request.contextPath}/pages/home.jsp">去添加</a>
                </div>
                <div class="clearfix"></div>
            </div>

        </div>
    </c:if>
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

    function showDeleteModel() {
        $('#delWishBook').modal();
    }

    function submitDeleteOrder(colId) {
        $.post(
            '${pageContext.request.contextPath}/user/person/removeWishBook.do',
            {collectId: colId}, function () {
                $('#delWishBook').modal('hide');
                window.location.href = "${pageContext.request.contextPath}/user/person/favoriteBooks.do";
            }
        )
    }
</script>
<!-- script-for-nav -->
</body>
</html>
