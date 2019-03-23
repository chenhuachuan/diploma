<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Home</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
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
    <script src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/easing.js"></script>
    <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen"/>
    <link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="css/form.css" rel="stylesheet" type="text/css" media="all"/>
    <script type="text/javascript" src="js/megamenu.js"></script>
    <script>$(document).ready(function () {
        $(".megamenu").megamenu();
    });</script>
    <script src="js/menu_jquery.js"></script>
    <script src="js/jquery.easydropdown.js"></script>
    <script src="js/jquery.etalage.min.js"></script>
    <%--    <script type="text/javascript" src="js/home.js"></script>--%>
    <script>
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
                    <a href="home.jsp"><img src="images/logo.png" alt=""/></a>
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

<div class="container-fluid" id="search_div_all"
     style="width: 350px; height: 49px;position: absolute;margin-left: 900px">
    <div>
        <form class="navbar-form navbar-right" role="search" style="position: relative;">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Search">
            </div>
            <button type="submit" class="btn btn-default">搜索</button>
        </form>
    </div>
</div>

<!-- script-for-nav -->
<script>
    $("span.menu").click(function () {
        $(".head-nav ul").slideToggle(300, function () {
            // Animation complete.
        });
    });
</script>
<!-- script-for-nav -->


<div class="banner">
    <div class="container">
        <div class="col-md-6">
        </div>
        <div class="col-md-6 banner-info">
            <h1>TF-Book 在线书城</h1>
            <p>这是一段浪漫的故事......</p>
            <a class="show-more" href="#">SHOW ME MORE</a>
        </div>
        <div class="clearfix"></div>
    </div>
</div>


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
                <h3>2018 影视畅销本</h3>
                <h4>现在仅售 $99.99</h4>
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
            <script type="text/javascript" src="js/jquery.flexisel.js"></script>
            <%--end  新书上架--%>


            <%--编辑推荐--%>
            <div class="best-seller">
                <%--第一个轮播--%>
                <div class="biseller-info" id="editor_recommend_books_div">
                    <script type="text/javascript">
                        $("#editor_recommend_books_div").load('${pageContext.request.contextPath}/book/editorRecommend.do');
                    </script>
                </div>

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

                <%--第二个轮播--%>
                <div class="best-seller" id="editor_recommend_books_div2">
                    <script type="text/javascript">
                        $("#editor_recommend_books_div2").load('${pageContext.request.contextPath}/book/editorRecommend2.do');
                    </script>
                    <%-- <div class="biseller-info">
                             <ul id="flexiselDemo5">
                             <li>
                                 <div class="biseller-column1">
                                     <img src="images/ss3.jpg" class="img-responsive" alt="">
                                     <a href="#"><i class="new"></i></a>
                                     <div class="biseller-name">
                                         <h4>文档的</h4>
                                         <p>$99.99</p>
                                     </div>
                                 </div>
                             </li>
                             <li>
                                 <div class="biseller-column1">
                                     <img src="images/ss1.jpg" class="img-responsive" alt="">
                                     <a href="#"><i class="new"></i></a>
                                     <div class="biseller-name">
                                         <h4>Sample Item Title</h4>
                                         <p>$99.99</p>
                                     </div>

                                 </div>
                             </li>
                             <li>
                                 <div class="biseller-column1">
                                 <img src="images/ss2.jpg" class="img-responsive" alt="">
                                 <a href="#"><i class="new"></i></a>
                                     <div class="biseller-name">
                             <h4>Sample Item Title</h4>
                             <p>$99.99</p>
                         </div>

                                 </div>
                             </li>

                         </ul>
                         </div>
 --%>
                </div>
                <script type="text/javascript" src="js/jquery.flexisel.js"></script>
                <div class="clearfix"></div>

            </div>
        </div>
        <%--左侧 end--%>

        <%--右侧--%>
        <div class="col-md-3 span_1_of_right">

            <%-- <section  class="sky-form">
                   <div class="product_right">
                <h3 class="m_2">图书分类</h3>
                    <select class="dropdown" tabindex="10" data-settings='{"wrapperClass":"metro"}'>
                        <option value="0">Men's</option>
                        <option value="1">Tempor</option>
                        <option value="2">Congue</option>
                        <option value="3">Mazim </option>
                        <option value="4">Mutationem</option>
                        <option value="5">Hendrerit </option>
                   </select>
                   <label class="me"></label>
                   <select class="dropdown" tabindex="50" data-settings='{"wrapperClass":"metro"}'>
                        <option value="1">Women's</option>
                        <option value="2">Sub Category1</option>
                        <option value="3">Sub Category2</option>
                        <option value="4">Sub Category3</option>
                   </select>
                    <label class="wom"></label>
                   <select class="dropdown" tabindex="8" data-settings='{"wrapperClass":"metro"}'>
                        <option value="1">Kids</option>
                        <option value="2">Sub Category1</option>
                        <option value="3">Sub Category2</option>
                        <option value="4">Sub Category3</option>
                   </select>
                    <label class="kid"></label>
                   <select class="dropdown" tabindex="8" data-settings='{"wrapperClass":"metro"}'>
                        <option value="1">Sports</option>
                        <option value="2">Sub Category1</option>
                        <option value="3">Sub Category2</option>
                        <option value="4">Sub Category3</option>
                   </select>
                    <label class="spo"></label>
</div>

                </section>
                --%>
            <%--右侧热销图书--%>
            <div class="sellers" id="sell_hot_books_div">
                <script type="text/javascript">
                    $("#sell_hot_books_div").load('${pageContext.request.contextPath}/book/sellhotBooks.do');
                </script>
            </div>
            <%--标签--%>
            <div class="sellers">
                <h3 class="m_2">标签</h3>
                <div class="tags" id="tags_sort_name_div">
                    <script type="text/javascript">
                        $("#tags_sort_name_div").load('${pageContext.request.contextPath}/category/recommendSortTags.do');
                    </script>
                </div>
            </div>
            <%--今日特价--%>
            <section class="sky-form">
                <div class="sellers">
                    <h3 class="m_2">今日特价</h3>
                    <section class="slider">
                        <div class="flexslider" id="todays_special_offer_div">
                            <script type="text/javascript">
                                $("#todays_special_offer_div").load('${pageContext.request.contextPath}/book/todaysSpecialPrice.do');
                            </script>
                        </div>
                    </section>

                    <!-- FlexSlider -->
                    <script defer src="js/jquery.flexslider.js"></script>
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
                            <img src="../image/author/liucx.jpg" alt=" " class="img-responsive"/>
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
                            <img src="../image/author/yuh.jpg" alt=" " class="img-responsive"/>
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
                            <img src="../image/author/luy.jpg" alt=" " class="img-responsive"/>
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
            <script type="text/javascript" src="js/jquery.flexisel.js"></script>
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

</body>
</html>
