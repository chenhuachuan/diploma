<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Confirm Order</title>
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

<div class="banner1">
    <div class="container">

    </div>
</div>

<!-- header -->
<div class="container">
    <div class="main">
        <%--确认订单--%>

        <%--   <div class="shoping_bag1">
               <h3><img src="${pageContext.request.contextPath}/pages/images/small.jpg">确认订单</h3><br/>
               <div class="shoping_left">
                   <div style="margin-left: 120px;">
                       <address style="font-size:large">
                           <strong>收货人：风清扬 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>18754219658<br>
                           <strong>收货地址：北京市北京通州马驹桥xxx街道七号楼3层</strong><br>
                           <br>
                       </address>
                   </div>
               </div>
               <div class="clearfix"></div>
           </div>--%>
        <div style="width:100%;height: 140px;">
            <h3><img src="${pageContext.request.contextPath}/pages/images/small.jpg">确认订单及地址</h3><br/>

            <div class="shoping_bag1">
                <div class="shoping_left">
                    <h2><a href="#"><img src="${pageContext.request.contextPath}/pages/images/gift.jpg">地址</a></h2>
                </div>
                <div class="shoping_left">
                    <div style="padding-left: 120px;">
                    <table style="font-size: large">
                        <tr>
                            <td><strong>收货人：</strong></td>
                            <td>${AddressInfo.receiveName}</td>
                        </tr>
                        <tr>
                            <td><strong>电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话:</strong></td>
                            <td>${AddressInfo.receiveTel}</td>
                        </tr>
                        <tr>
                            <td><strong>收货地址:</strong></td>
                            <td>${AddressInfo.provNameAddr}${AddressInfo.cityNameAddr}${AddressInfo.areaNameAddr}${AddressInfo.addrName}</td>
                        </tr>
                    </table>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="shoping_bag1">
            <div class="shoping_left">
                <h2><a href="#"><img src="${pageContext.request.contextPath}/pages/images/gift.jpg">图书</a></h2>
            </div>
            <c:forEach items="${sessionScope.checkOrder}" var="map" varStatus="order_item">
                <c:set var="totalPurchaseCount" value="${totalPurchaseCount+map.value.count}"></c:set>
                <div class="shoping_left">
                    <div class="shoping1_of_1">
                        <img src="${pageContext.request.contextPath}${map.value.book.imgUrl}" class="img-responsive"
                             alt=""/>
                    </div>
                    <div class="shoping1_of_2">
                        <h4><a href="#">${map.value.book.bookName}</a></h4>
                        <span>作者: ${map.value.book.author} &nbsp;|&nbsp;&nbsp;</span>
                        <span>购买数量: <b>${map.value.count}</b>&nbsp;&nbsp; | 单价 : ${map.value.book.bookPrice}</span>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="shoping_right">
                    <p>优惠：￥${sessionScope.perMoney} &nbsp;<span> 小计:￥${map.value.littleCount}</span></p>
                </div>
                <div class="clearfix"></div>
                <br/>
            </c:forEach>
        </div>

        <input type="text" value="${totalPurchaseCount}" name="totalPurchaseCount" id="total_order_count"
               style="display: none;">
        <div class="shoping_bag1">
            <div class="shoping_left">
                <h2><a href="#"><img src="${pageContext.request.contextPath}/pages/images/gift.jpg">服务</a>
                    <span><%--￥. 25--%></span></h2>
            </div>
            <div class="shoping_right">
                <p>快递 &nbsp;<a href="#">free</a>&nbsp;<span> ￥ 0</span></p>
                <p>其他 &nbsp;<span> ￥ 0</span></p>
                <p>小计 &nbsp;<span> ￥ 0</span></p>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="shoping_bag2">
            <div class="shoping_right">
                <p class="tot">总计 &nbsp;<span class="color"> ￥ ${sessionScope.totalMoney}</span></p>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="shoping_bag2">
            <div class="shoping_left"><%--../pages/checkout.jsp--%>
                <a class="btn1" href="${pageContext.request.contextPath}/cart/purchase/confirmOrder.do">提交订单</a>&nbsp;&nbsp;&nbsp;&nbsp;
                <a class="btn1" href="${pageContext.request.contextPath}/cart/purchase/allAddrSort.do">返回</a>&nbsp;&nbsp;&nbsp;&nbsp;
                <%--<a class="btn1" href="${pageContext.request.contextPath}/book/queryAllBooksbyPage.do?parSortId=1">继续购物</a>--%>
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
