<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Search</title>
    <link href="${pageContext.request.contextPath}/pages/css/bootstrap.css" rel="stylesheet" type="text/css"
          media="all">
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"
          media="all">
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet"
          type="text/css" media="all">
    <link href="${pageContext.request.contextPath}/pages/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <script src="${pageContext.request.contextPath}/pages/js/jquery-1.10.2.js" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/pages/js/easing.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/pages/css/flexslider.css" type="text/css"
          media="screen"/>
    <link href="${pageContext.request.contextPath}/pages/css/megamenu.css" rel="stylesheet" type="text/css"
          media="all"/>
    <link href="${pageContext.request.contextPath}/pages/css/form.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${pageContext.request.contextPath}/pages/css/slider.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/pages/css/font-awesome/css/font-awesome.css" rel="stylesheet"
          type="text/css"/>
    <link href="${pageContext.request.contextPath}/pages/css/font-awesome/css/font-awesome.min.css" rel="stylesheet"
          type="text/css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/pages/js/megamenu.js"></script>
    <script src="${pageContext.request.contextPath}/pages/js/menu_jquery.js"></script>
    <script src="${pageContext.request.contextPath}/pages/js/jquery.easydropdown.js"></script>
    <script src="${pageContext.request.contextPath}/pages/js/jquery.etalage.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/pages/js/jquery.flexisel.js"></script>
    <script defer src="${pageContext.request.contextPath}/pages/js/jquery.flexslider.js"></script>

    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    }
    </script>
    <script>
        $(document).ready(function () {
            $(".megamenu").megamenu();
        });
        jQuery(document).ready(function ($) {
            $('#etalage').etalage({
                thumb_image_width: 300,
                thumb_image_height: 400,
                source_image_width: 800,
                source_image_height: 1000,
                show_hint: true,
                click_callback: function (image_anchor, instance_id) {
                    alert('Callback example:\nYou clicked on an image with the anchor: "' + image_anchor + '"\n(in Etalage instance: "' + instance_id + '")');
                }
            });
        });
    </script>

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
                <%-- user login and regsit jsp--%>
                <%@include file="innerpage/login_regist.jsp" %>

                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>

<%--分类导航--%>
<div class="head-bann" id="page_load_contrller_data_div">
    <script type="text/javascript">
        $("#page_load_contrller_data_div").load('${pageContext.request.contextPath}/category/all_category_name.do');
    </script>

</div>

<%--搜索框--%>
<div style="padding: 20px 380px 5px 300px;">
    <form class="bs-example bs-example-form" role="form"
          action="${pageContext.request.contextPath}/book/searchBooksInHome.do">
        <div class="row">
            <div class="col-lg-8 pull-left">
                <div class="input-group">
                    <input type="text" name="searchFlag" class="form-control" placeholder="Search">
                    <div class="input-group-btn">
                        <button type="submit" class="btn btn-default" style="width: 80px;">搜索</button>
                    </div><!-- /btn-group -->
                </div><!-- /input-group -->
            </div><!-- /.col-lg-6 -->
            <div class="col-lg-4 pull-right">
                <span>
                    <a href="${pageContext.request.contextPath}/pages/buy.jsp" class="btn btn-danger"
                       style="width:110px;">
                        &nbsp;购物车 &nbsp;&nbsp;<span class="badge">0</span>
                    </a>
                    <a href="#" class="btn btn-danger" style="width:110px;text-align: center">
                        我的订单
                    </a>
                    <%--<button type="button" class="btn btn-danger" style="width:100px;">我的订单</button>--%>
                </span>
            </div>

        </div><!-- /.row -->
    </form>
</div>


<div class="featured">
    <div class="container">

        <div class="col-md-9 w_content">
            <div style="margin-top: 25px;">
                <span style="font-size: large">为您找到：${totalCount}&nbsp;本书</span>
            </div>
            <div>
                <%--根据用户选择排序--%>
                <c:if test="${totalCount!=0}">
                    <ul class="w_nav" style="font-size: medium">
                        <li>综合排序 :</li>
                        <li><a class="active"
                               href="${pageContext.request.contextPath}/book/searchBooksInHome.do?searchFlag=${searchFlag}&sortFlag=pop">销量</a>
                        </li>
                        |
                        <li>
                            <a href="${pageContext.request.contextPath}/book/searchBooksInHome.do?searchFlag=${searchFlag}&sortFlag=new">最新</a>
                        </li>
                        |
                        <li>
                            <a href="${pageContext.request.contextPath}/book/searchBooksInHome.do?searchFlag=${searchFlag}&sortFlag=discount">优惠价</a>
                        </li>
                        |
                        <li>
                            <a href="${pageContext.request.contextPath}/book/searchBooksInHome.do?searchFlag=${searchFlag}&sortFlag=price">价格</a>
                        </li>
                        <div class="clear"></div>
                    </ul>
                </c:if>
                <div class="clearfix"></div>
            </div>
            <%--搜索结果--%>
            <div class="grids_of_4">
                <c:forEach var="book" items="${searchBooks}">
                    <div class="grid1_of_4" style="padding: 15px;">
                        <div class="content_box">
                            <a href="${pageContext.request.contextPath}/book/bookDetails.do?bookId=${book.bookId}">
                                <div class="view view-fifth">
                                    <img src="${pageContext.request.contextPath}/${book.imgUrl}" class="img-responsive"
                                         alt=""/>
                                    <div class="mask">
                                        <div class="info">Quick View</div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <center>
                            <font size="4px;">
                                <a href="${pageContext.request.contextPath}/book/bookDetails.do?bookId=${book.bookId}">&nbsp;&nbsp;${book.bookName}</a>
                                <span style="font-size:x-small">
                                        ${book.author}
                                </span>
                            </font>

                            <div class="col-md-10" style="padding-top: 10px;">
                                <div class="col-md-3">
                                    <p><font color="red" size="3px;">￥${book.bookPrice}</font></p>
                                </div>
                                <div class="col-md-2"></div>
                                <div class="col-md-3">
                                    <img src="${pageContext.request.contextPath}/image/lb/car1.jpg" width="24px;"
                                         title="添加" class="show_img_cart1"
                                         onclick="window.location.href='${pageContext.request.contextPath}/cart/addToCart.do?bookId=${book.bookId}'"
                                         data-toggle="tooltip">&nbsp;&nbsp;
                                </div>
                                <div class="col-md-2">
                                    <img src="${pageContext.request.contextPath}/image/lb/collect_red.jpg" title="收藏"
                                         class="show_img_wish1"
                                         onclick="window.location.href='${pageContext.request.contextPath}/user/person/addWishBook.do?bookId=${book.bookId}'"
                                         data-toggle="tooltip" width="24px;">
                                </div>
                            </div>
                        </center>
                    </div>
                </c:forEach>
            </div>
            <%--分页信息--%>
            <c:if test="${totalCount!=0}">
                <div class="col-lg-12" style="padding-top: 30px;text-align: center;">
                    <ul class="pagination pagination-lg">
                            <%--上一页--%>
                        <c:if test="${currentPage<=1}">
                            <li class="disabled"><a href="#">&laquo;</a></li>
                        </c:if>
                        <c:if test="${currentPage>1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/book/searchBooksInHome.do?currentPage=${currentPage-1}&searchFlag=${searchFlag}&sortFlag=${sortFlag}">&laquo;</a>
                            </li>
                        </c:if>
                        <c:if test="${totalPages>2}">
                            <c:forEach begin="1" step="1" end="${totalPages-1}" varStatus="statusA">
                                <li
                                        <c:if test="${currentPage==statusA.index}">
                                            class="active"
                                        </c:if>
                                >
                                    <a href="${pageContext.request.contextPath}/book/searchBooksInHome.do?currentPage=${statusA.index}&searchFlag=${searchFlag}&sortFlag=${sortFlag}">${statusA.index}</a>
                                </li>
                            </c:forEach>
                        </c:if>

                        <c:if test="${totalPages<=2}">
                            <c:forEach begin="1" step="1" end="${totalPages}" varStatus="statusA">
                                <li
                                        <c:if test="${currentPage==statusA.index}">
                                            class="active"
                                        </c:if>
                                >
                                    <a href="${pageContext.request.contextPath}/book/searchBooksInHome.do?currentPage=${statusA.index+1}&&searchFlag=${searchFlag}&sortFlag=${sortFlag}">${statusA.index}</a>
                                </li>
                            </c:forEach>
                        </c:if>
                        <li class="disabled"><a>...</a></li>
                            <%--总页数--%>
                        <li
                                <c:if test="${currentPage==totalPages}">
                                    class="active"
                                </c:if>
                        >
                            <a href="${pageContext.request.contextPath}/book/searchBooksInHome.do?currentPage=${totalPages}&searchFlag=${searchFlag}&sortFlag=${sortFlag}">${totalPages}</a>
                        </li>

                            <%--下一页--%>
                        <c:if test="${currentPage<totalPages}">
                            <li>
                                <a href="${pageContext.request.contextPath}/book/searchBooksInHome.do?currentPage=${currentPage+1}&searchFlag=${searchFlag}&sortFlag=${sortFlag}">&raquo;</a>
                            </li>
                        </c:if>
                        <c:if test="${currentPage==totalPages}">
                            <li class="disabled"><a>&raquo;</a></li>
                        </c:if>
                        <c:if test="${totalPages==0}">
                            <li class="disabled"><a>&raquo;</a></li>
                        </c:if>
                    </ul>
                </div>
            </c:if>
            <div class="clearfix"></div>

        </div>
        <%--左侧 end--%>


        <%--右侧--%>
        <div class="col-md-3 span_1_of_right">

            <%--右侧热销图书--%>
            <div class="sellers" id="sell_hot_books_div"
                 style="margin-top: 80px; background-color: rgba(208,247,255,0.87)">
                <script type="text/javascript">
                    $("#sell_hot_books_div").load('${pageContext.request.contextPath}/book/sellhotBooks.do');
                </script>
            </div>
            <%--今日特价--%>
            <section class="sky-form">
                <div class="sellers">
                    <h3 class="m_2" style="background-color: rgba(255,111,18,0.87)">今日特价</h3>
                    <section class="slider">
                        <div class="flexslider">
                            <ul class="slides">
                                <c:forEach items="${tadaysBooks}" var="tbook">
                                    <li>
                                        <div class="tittle">
                                            <a href="${pageContext.request.contextPath}/book/bookDetails.do?bookId=${tbook.bookId}">
                                                <img src="${pageContext.request.contextPath}/${tbook.imgUrl}"
                                                     class="img-responsive" alt=""/>
                                            </a><br/>
                                            <center>
                                                <a href="${pageContext.request.contextPath}/book/bookDetails.do?bookId=${tbook.bookId}">
                                                    <h6>${tbook.bookName}</h6></a>
                                                <p>原价:￥${tbook.originalPrice}</p>
                                                <p style="font-size: 22px;"><font
                                                        color="red">现价:￥${tbook.bookPrice}</font></p>
                                                <p>立志读遍天下书！</p>
                                                <a class="show1"
                                                   href="${pageContext.request.contextPath}/cart/addToCart.do?bookId=${tbook.bookId}">ADD
                                                    TO CART</a>
                                            </center>
                                        </div>
                                    </li>
                                </c:forEach>

                            </ul>
                        </div>

                    </section>

                    <!-- FlexSlider -->
                    <script defer src="../pages/js/jquery.flexslider.js"></script>
                    <script type="text/javascript">
                        $(function () {
                            //SyntaxHighlighter.all();
                        });
                        $(window).load(function () {
                            $('.flexslider').flexslider({
                                animation: "slide",
                                start: function (slider) {
                                    $('body').removeClass('loading');
                                }
                            });
                        });
                    </script>
                    <!-- FlexSlider -->
                </div>
            </section>
        </div>
        <div class="clearfix"></div>

    </div>
</div>

<!-- testimonials 作家 -->
<div class="testimonials">
    <div class="container">
        <h3>作家介绍</h3>
        <div class="testimonials-grids">
            <ul id="flexiselDemo11">
                <li>
                    <div class="testimonials-grid">
                        <div class="col-xs-5 testimonials-grid-left">
                            <img src="${pageContext.request.contextPath}/image/author/liucx.jpg" alt=" "
                                 class="img-responsive"/>
                        </div>
                        <div class="col-xs-7 testimonials-grid-right">
                            <div class="rating">
                                <span>☆</span>
                                <span>☆</span>
                                <span>☆</span>
                                <span>☆</span>
                                <span>☆</span>
                            </div>
                            <p>Itaque earum rerum hic tenetur a sapiente delectus.<span>Laura</span></p>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </li>
                <li>
                    <div class="testimonials-grid">
                        <div class="col-xs-5 testimonials-grid-left">
                            <img src="${pageContext.request.contextPath}/image/author/yuh.jpg" alt=" "
                                 class="img-responsive"/>
                        </div>
                        <div class="col-xs-7 testimonials-grid-right">
                            <div class="rating">
                                <span>☆</span>
                                <span>☆</span>
                                <span>☆</span>
                                <span>☆</span>
                                <span>☆</span>
                            </div>
                            <p>Itaque earum rerum hic tenetur a sapiente delectus.<span>James</span></p>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </li>
                <li>
                    <div class="testimonials-grid">
                        <div class="col-xs-5 testimonials-grid-left">
                            <img src="${pageContext.request.contextPath}/image/author/luy.jpg" alt=" "
                                 class="img-responsive"/>
                        </div>
                        <div class="col-xs-7 testimonials-grid-right">
                            <div class="rating">
                                <span>☆</span>
                                <span>☆</span>
                                <span>☆</span>
                                <span>☆</span>
                                <span>☆</span>
                            </div>
                            <p>Itaque earum rerum hic tenetur a sapiente delectus.<span>路遥</span></p>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </li>
            </ul>
            <script type="text/javascript">
                $(window).load(function () {
                    $("#flexiselDemo11").flexisel({
                        visibleItems: 3,
                        animationSpeed: 1000,
                        autoPlay: true,
                        autoPlaySpeed: 3000,
                        pauseOnHover: true,
                        enableResponsiveBreakpoints: true,
                        responsiveBreakpoints: {
                            portrait: {
                                changePoint: 480,
                                visibleItems: 1
                            },
                            landscape: {
                                changePoint: 640,
                                visibleItems: 2
                            },
                            tablet: {
                                changePoint: 768,
                                visibleItems: 2
                            }
                        }
                    });

                });
            </script>

        </div>
    </div>
</div>
<!-- //testimonials -->

<!-- footer -->
<div class="footer">
    <div class="container">
        <p>Copyright &copy; 2019.chenhc All rights reserved !</p>
    </div>
</div>
<!-- footer -->

<!-- script-for-nav -->
<script>
    $(function () {
        $('.show_img_cart1').tooltip('show');
        $('.show_img_wish1').tooltip('show');
    });

    function GetQueryString(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]);
        return null;
    }

    $(function () {
    });

    $("span.menu").click(function () {
        $(".head-nav ul").slideToggle(300, function () {
            // Animation complete.
        });
    });
</script>
<!-- script-for-nav -->
</body>
</html>
