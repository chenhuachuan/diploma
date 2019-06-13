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
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/pages/js/home.js"></script>

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
                        <img src="${pageContext.request.contextPath}/${map.value.book.imgUrl}" class="img-responsive"
                             alt=""/>
                    </div>
                    <div class="shoping1_of_2">
                        <h4><a href="#">${map.value.book.bookName}</a></h4>
                        <span style="font-size: medium;display: none;" id="update_checkbox_purchase_count_span_id">购买数量: &nbsp;
                            <input type="text" value="${map.value.count}" style="width:35px;">
                            &nbsp;&nbsp; | 单价 : ${map.value.book.bookPrice}</span>

                        <span style="font-size: medium"
                              id="checkout_purchase_count_span_id">购买数量: <b>${map.value.count}</b>
                            &nbsp;&nbsp; | 单价 : ${map.value.book.bookPrice}</span>
                        <ul class="s_icons">
                                <%--<li><a href="javascript:;"><img src="${pageContext.request.contextPath}/pages/images/s_icon1.png" onclick="checkout_update_purchaseCount()"
                                                     alt=""></a></li>
                                                     ${pageContext.request.contextPath}/cart/removeFromCart.do?bookId=${map.value.book.bookId}"
                                                     --%>
                            <li><a href="javascript:void(0)"><img
                                    src="${pageContext.request.contextPath}/pages/images/s_icon2.png"
                                                 alt=""></a></li>
                            <li><a href="javascript:void(0)" onclick="showRemoveModel()">
                                <img src="${pageContext.request.contextPath}/pages/images/s_icon3.png"
                                                 alt=""></a></li>
                            <!-- 模态框（Modal） -->
                            <div class="modal fade" id="delCartBook" tabindex="-1" role="dialog"
                                 aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                                &times;
                                            </button>
                                            <h4 class="modal-title" id="myModalLabel">
                                                从购物车移除
                                            </h4>
                                        </div>
                                        <div class="modal-body">
                                            确定删除该商品吗？亲三思哦！
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">算了
                                            </button>
                                            <button type="button" class="btn btn-primary"
                                                    onclick="submitRemoveCartBook('${map.value.book.bookId}')">忍心删除
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

    //点击修改购买数量
    function checkout_update_purchaseCount() {
        $("#update_checkbox_purchase_count_span_id").show();
        $("#checkout_purchase_count_span_id").hide();
    }

    //提示框
    function showRemoveModel() {
        $('#delCartBook').modal();
    }

    function submitRemoveCartBook(bookId) {
        $.post(
            '${pageContext.request.contextPath}/cart/removeFromCart.do',
            {bookId: bookId},
            function () {
                $('#delCartBook').modal('hide');
                window.location.href = "${pageContext.request.contextPath}/pages/buy.jsp";
            }
        );
    }

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
