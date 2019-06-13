<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Home</title>
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

</head>
<body>
<!-- header -->
<div class="header">
    <div class="top_bg">
        <div class="container">
            <div class="header_top">
                <div class="logo">
                    <a href="../pages/home.jsp"><img src="${pageContext.request.contextPath}/image/lb/logo_v3.jpg"
                                                     alt="" width="250" height="54"/></a>
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
                    </div>
                </div>
            </div>
            <div class="col-lg-4 pull-right">
                <span>
                    <a href="${pageContext.request.contextPath}/pages/buy.jsp" class="btn btn-danger"
                       style="width:110px;">
                        &nbsp;购物车 &nbsp;&nbsp;<span class="badge">${sessionScope.totalCartCount}</span>
                    </a>
                    <a href="${pageContext.request.contextPath}/cart/purchase/userOrderListInfo.do"
                       class="btn btn-danger" style="width:110px;text-align: center">
                        我的订单
                    </a>
                    <%--<button type="button" class="btn btn-danger" style="width:100px;">我的订单</button>--%>
                </span>
            </div>

        </div>
    </form>
</div>

<!-- BEGIN 轮播图 -->
<div class="page-slider margin-bottom-35" id="banner_image_cng_chc">
    <script>
        $("#banner_image_cng_chc").load('${pageContext.request.contextPath}/image/queryAllBannerImage_CNG_CHC.do');
    </script>
</div>
<!-- END 轮播图 -->


<!-- header -->
<%-- 两张广告图片--%>
<div class="instock">
    <div class="container">
        <div class="col-md-6 chuk">
            <div class="blanc-info">
                <h3>2019 销量图书</h3>
                <h4>现在仅售 $24.99</h4>
                <a class="show" href="#">了解更多</a>
            </div>
        </div>
        <div class="col-md-6 blanc">
            <div class="blanc-info">
                <h3 style="color: rgba(255,4,21,0.87)">2019 影视畅销本</h3>
                <h4 style="color: rgba(255,4,21,0.87)">现在仅售 $99.99</h4>
                <a class="show" href="#">了解更多</a>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!-- instock -->
<div class="featured">
    <div class="container">

        <div class="col-md-9">

            <%--新书上架--%>
            <div class="biseller-info" id="new_books_shelves_div">
                <script type="text/javascript">
                    $("#new_books_shelves_div").load('${pageContext.request.contextPath}/book/newBookShelves.do');
                </script>
            </div>

            <div class="biseller-info" id="new_books_shelves_div2">
                <script type="text/javascript">
                    $("#new_books_shelves_div2").load('${pageContext.request.contextPath}/book/newBookShelvesTwo.do');
                </script>
            </div>
            <script type="text/javascript">
                $(window).load(function () {
                    $("#flexiselDemo3").flexisel({
                        visibleItems: 3,
                        animationSpeed: 1000,
                        autoPlay: false,
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
                                visibleItems: 3
                            }
                        }
                    });
                    $("#flexiselDemo3-1").flexisel({
                        visibleItems: 3,
                        animationSpeed: 1000,
                        autoPlay: false,
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
                                visibleItems: 3
                            }
                        }
                    });

                });
            </script>

            <%--end  新书上架--%>


            <%--编辑推荐--%>
            <div class="best-seller">
                <%--第一个轮播--%>
                <div class="biseller-info" id="editor_recommend_books_div">
                    <script type="text/javascript">
                        $("#editor_recommend_books_div").load('${pageContext.request.contextPath}/book/editorRecommend.do');
                    </script>
                </div>
                <%--第二个轮播--%>
                <div class="best-seller" id="editor_recommend_books_div2">
                    <script type="text/javascript">
                        $("#editor_recommend_books_div2").load('${pageContext.request.contextPath}/book/editorRecommend2.do');
                    </script>
                </div>
                <div class="clearfix"></div>

            </div>
        </div>
        <%--左侧 end--%>

        <%--右侧--%>
        <div class="col-md-3 span_1_of_right">

            <%--右侧热销图书--%>
            <div class="sellers" id="sell_hot_books_div" style="background-color: rgba(208,247,255,0.87)">
                <script type="text/javascript">
                    $("#sell_hot_books_div").load('${pageContext.request.contextPath}/book/sellhotBooks.do');
                </script>
            </div>
            <%--标签--%>
            <div class="sellers">
                <h3 class="m_2" style="background-color: rgba(255,111,18,0.87)">标签</h3>
                <div class="tags" id="tags_sort_name_div" style="background-color:rgba(95,255,105,0.87)">
                    <script type="text/javascript">
                        $("#tags_sort_name_div").load('${pageContext.request.contextPath}/category/recommendSortTags.do');
                    </script>
                </div>
            </div>
            <%--今日特价--%>
            <section class="sky-form">
                <div class="sellers">
                    <h3 class="m_2" style="background-color: rgba(255,111,18,0.87)">今日特价</h3>
                    <section class="slider">
                        <div class="flexslider" id="todays_special_offer_div">
                            <script type="text/javascript">
                                $("#todays_special_offer_div").load('${pageContext.request.contextPath}/book/todaysSpecialPrice.do');
                            </script>
                        </div>
                    </section>

                    <!-- FlexSlider -->
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
<div class="testimonials" style="display: none;">
    <div class="container">
        <h3 style="background-color: rgba(255,111,18,0.87);width: 100%;height: 47px;vertical-align: center;font-weight: bolder;font-family: 黑体">
            作家介绍</h3>
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
                            <p>中国科幻作家，中国作家协会会员、第九届全委会委员,代表作品《三体》......<span>刘慈欣</span></p>
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
                            <p>当代作家。中国作家协会第九届全国委员会委员,代表作《活着》......<span>余华</span></p>
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
                            <p>中国当代作家，代表作有长篇小说《平凡的世界》、《人生》......<span>路遥</span></p>
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

<script type="text/javascript">
    $(window).load(function () {
        $("#flexiselDemo1").flexisel({
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
                    visibleItems: 3
                }
            }
        });

    });
</script>
<script type="text/javascript">
    $(window).load(function () {
        $("#flexiselDemo5").flexisel({
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
                    visibleItems: 3
                }
            }
        });

    });
</script>


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
