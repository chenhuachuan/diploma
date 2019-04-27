<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>orderlist</title>
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
    <c:if test="${orderListInfo !=null}">
        <div class="main">
            <div class="shoping_bag">
                <h3><img src="${pageContext.request.contextPath}/image/lb/collect_red.jpg" width="27">我的订单:<span></span>
                </h3>
                <div class="clearfix"></div>
            </div>
            <span>历史订单：</span>
            <div class="shoping_bag1">

                <c:forEach items="${orderListInfo}" var="order">
                    <div class="shoping_right" style="width: 240px;">
                        <div class="col-md-6">
                            <a class="show2" style="width: 100px;" onclick="showOrderInfoModel('${order.orderNumber}')"
                               href="#">查看详情</a>
                        </div>
                        <div class="col-md-6">
                            <a class="show1" style="width: 100px;" onclick="showDeleteModel()"
                               href="javascript:void(0)">删除订单</a>
                        </div>
                            <%--<iframe src="../pages/innerpage/orderInfo.jsp" style="width: 50%;height: 500px;"></iframe>--%>

                            <%--  <div class="modal fade" id="delOrderInfo_2" tabindex="-1" role="dialog"
                                   aria-labelledby="myModalLabel" aria-hidden="true">
                                  <div class="modal-dialog modal-lg">
                                      <div class="modal-content">
                                          <div class="modal-header">
                                              <button type="button" class="close" data-dismiss="modal"
                                                      aria-hidden="true">
                                                  &times;
                                              </button>
                                              <h4 class="modal-title" id="myModalLabel_2">订单详情</h4>
                                          </div>
                                              <div class="modal-body">
                                                  <c:forEach items="${orderDetailInfo}" var="orderInfo">
                                                      <c:set var="OI" value='${orderInfo.value}' />
                                                      <div class="col-md-12">
                                                          <div class="col-md-3">
                                                              <img src="..${OI.book.imgUrl}">
                                                          </div>
                                                          <div class="col-md-9">
                                                              <span>订单号：${OI.orderId}  <br/>
                                                                    购买时间：<fmt:formatDate value="${orderINFO.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/> <br/>
                                                                    书名:${OI.book.bookName}  作者：${OI.book.author} 价格：${OI.book.bookPrice}  购买数量：x${OI.count}
                                                                  <p>图书介绍：${OI.book.bookIntro}</p>
                                                              </span>
                                                              <span>
                                                                 总计：${orderINFO.totalPrice}
                                                              </span>
                                                          </div>
                                                      </div>
                                                  </c:forEach>
                                              </div>
                                          <div class="modal-footer">
                                              <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                          </div>
                                      </div><!-- /.modal-content -->
                                  </div><!-- /.modal -->
                              </div>--%>
                        <!-- end模态框（Modal） -->
                        <!-- 模态框（Modal） -->
                        <div class="modal fade" id="delOrderInfo_1" tabindex="-1" role="dialog"
                             aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"
                                                aria-hidden="true">
                                            &times;
                                        </button>
                                        <h4 class="modal-title" id="myModalLabel">
                                            删除订单
                                        </h4>
                                    </div>
                                    <div class="modal-body">
                                        确定删除该订单信息吗？
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">取消
                                        </button>
                                        <button type="button" class="btn btn-primary"
                                                onclick="removeOrderInfo('${order.orderNumber}')">确定
                                        </button>
                                    </div>
                                </div><!-- /.modal-content -->
                            </div><!-- /.modal -->
                        </div>
                        <!-- end模态框（Modal） -->

                    </div>
                    <div class="shoping_left">
                        <div class="shoping1_of_1">
                                <%--   <img src="${pageContext.request.contextPath}/${order.book.imgUrl}" class="img-responsive" alt=""/>--%>
                        </div>
                        <div class="shoping1_of_2">
                        <span style="font-size: large;"><font
                                color="#3fc3ff">${order.bookName}</font> &nbsp;<font
                                size="2px;"></font></span>
                            <span style="font-size: small"><br/>合计：&nbsp;￥${order.totalPrice} 元&nbsp;&nbsp;&nbsp;
                            购买时间:&nbsp;&nbsp;<fmt:formatDate value="${order.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                               </span><br/>
                            <div style="width:750px;">
                                <span style="font-size: small">&nbsp;${order.itemCount}</span>
                            </div>


                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="clearfix"></div>
                    <br/>
                    <hr/>
                </c:forEach>
            </div>
            <div class="shoping_bag2">
                <div class="shoping_left">
                    <a class="btn1" href="${pageContext.request.contextPath}/pages/buy.jsp">购物车</a>&nbsp;&nbsp;&nbsp;&nbsp;
                    <a class="btn_scan"
                       href="${pageContext.request.contextPath}/pages/home.jsp">浏览商品</a>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </c:if>
    <c:if test="${orderListInfo ==null}">
        <div class="main">
            <div class="shoping_bag">
                <h3><img src="${pageContext.request.contextPath}/pages/images/icon-col.png"
                         width="24">您还没有订单呢<span></span></h3>
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

    //订单详情
    function showOrderInfoModel(orderNumber) {
        window.location.href = "${pageContext.request.contextPath}/cart/purchase/orderDetailInfo.do?orderNumber=" + orderNumber;
    }


    //提示框
    function showDeleteModel() {
        $('#delOrderInfo_1').modal();
    }

    function removeOrderInfo(orderNumber) {
        $.post(
            '${pageContext.request.contextPath}/cart/purchase/removeOrder.do',
            {orderNumber: orderNumber}, function () {
                $('#delOrderInfo_1').modal('hide');
                window.location.href = "${pageContext.request.contextPath}/cart/purchase/userOrderListInfo.do";
            }
        )
    }
</script>
<!-- script-for-nav -->
</body>
</html>
