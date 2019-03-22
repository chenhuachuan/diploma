<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>分类</title>
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
    <script type="text/javascript" src="js/megamenu.js"></script>
    <script>$(document).ready(function () {
        $(".megamenu").megamenu();
    });</script>
    <script src="js/menu_jquery.js"></script>
    <link rel="stylesheet" href="css/etalage.css">
    <script src="js/jquery.easydropdown.js"></script>
    <script src="js/jquery.etalage.min.js"></script>
    <script>
        jQuery(document).ready(function ($) {

            $('#etalage').etalage({
                thumb_image_width: 300,
                thumb_image_height: 400,
                source_image_width: 900,
                source_image_height: 1200,
                show_hint: true,
                click_callback: function (image_anchor, instance_id) {
                    alert('Callback example:\nYou clicked on an image with the anchor: "' + image_anchor + '"\n(in Etalage instance: "' + instance_id + '")');
                }
            });

        });
    </script>

    <script type="text/javascript" src="js/jquery.jscrollpane.min.js"></script>
    <script type="text/javascript" id="sourcecode">
        $(function () {
            $('.scroll-pane').jScrollPane();
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
<div class="head-bann" id="page_load_contrller_categr_div">
    <script type="text/javascript">
        //$("#page_load_contrller_categr_div").load('${pageContext.request.contextPath}/category/first_second_categoryName.do');
        $("#page_load_contrller_categr_div").load('${pageContext.request.contextPath}/category/all_category_name.do');
    </script>
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

<div class="banner1">
    <div class="container">


    </div>
</div>
<!-- header -->
<!-- content -->

<div class="container">
    <div class="women_main">
        <div class="col-md-3 span_1_of_right1">
            <section class="sky-form">
                <div class="product_right">
                    <h3 class="m_2">分类信息</h3>
                    <select class="dropdown" tabindex="10" data-settings='{"wrapperClass":"metro"}'>
                        <option value="0">Men's</option>
                        <option value="1">Tempor</option>
                        <option value="2">Congue</option>
                        <option value="3">Mazim</option>
                        <option value="4">Mutationem</option>
                        <option value="5">Hendrerit</option>
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

            <div class="sellers">
                <h3 class="m_2">热销图书</h3>
                <div class="best">
                    <div class="icon">
                        <img src="images/sh.jpg" class="img-responsive" alt=""/>
                    </div>
                    <div class="data">
                        <h4><a href="#">Sample Item Title Goes Here</a></h4>
                        <p>$120.00</p>
                        <h5>$120.00</h5>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="best">
                    <div class="icon">
                        <img src="images/sh.jpg" class="img-responsive" alt=""/>
                    </div>
                    <div class="data">
                        <h4><a href="#">Sample Item Title Goes Here</a></h4>
                        <p>$120.00</p>
                        <h5>$120.00</h5>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="best">
                    <div class="icon">
                        <img src="images/sh.jpg" class="img-responsive" alt=""/>
                    </div>
                    <div class="data">
                        <h4><a href="#">Sample Item Title Goes Here</a></h4>
                        <p>$120.00</p>
                        <h5>$120.00</h5>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>

            <div class="sellers">
                <h3 class="m_2">Tags</h3>
                <div class="tags">
                    <ul>
                        <li><a href="#">Tag,</a></li>
                        <li><a href="#">Tag,</a></li>
                        <li><a href="#">Tag,</a></li>
                        <li><a href="#">Tag,</a></li>
                        <li><a href="#">Tag,</a></li>
                        <li><a href="#">Tag,</a></li>
                        <li><a href="#">Tag,</a></li>
                        <li><a href="#">Tag,</a></li>
                        <li><a href="#">Tag,</a></li>
                        <li><a href="#">Tag,</a></li>
                        <li><a href="#">Tag,</a></li>
                        <li><a href="#">Tag,</a></li>
                        <li><a href="#">Tag,</a></li>
                        <li><a href="#">Tag,</a></li>
                        <li><a href="#">Tag,</a></li>
                        <li><a href="#">Tag,</a></li>
                        <li><a href="#">Tag,</a></li>
                        <li><a href="#">Tag,</a></li>
                        <li><a href="#">Tag,</a></li>
                        <li><a href="#">Tag,</a></li>
                    </ul>
                </div>
            </div>
            <section class="sky-form">
                <div class="sellers">
                    <h3 class="m_2">推荐</h3>
                    <section class="slider">
                        <div class="flexslider">
                            <ul class="slides">
                                <li>
                                    <div class="tittle">
                                        <img src="images/shoe.jpg" class="img-responsive" alt=""/>
                                        <h6>Item Title Here</h6>
                                        <p>Lorem ipsum dolor sit amet,</p>
                                        <p>Lorem ipsum dolor sit amet,</p>
                                        <p>Lorem ipsum dolor sit amet,</p>
                                        <a class="show1" href="#">SHOW ME MORE</a>
                                    </div>
                                </li>
                                <li>
                                    <div class="tittle">
                                        <img src="images/shoe.jpg" class="img-responsive" alt=""/>
                                        <h6>Item Title Here</h6>
                                        <p>Lorem ipsum dolor sit amet,</p>
                                        <p>Lorem ipsum dolor sit amet,</p>
                                        <p>Lorem ipsum dolor sit amet,</p>
                                        <a class="show1" href="#">SHOW ME MORE</a>
                                    </div>
                                </li>
                                <li>
                                    <div class="tittle">
                                        <img src="images/shoe.jpg" class="img-responsive" alt=""/>
                                        <h6>Item Title Here</h6>
                                        <p>Lorem ipsum dolor sit amet,</p>
                                        <p>Lorem ipsum dolor sit amet,</p>
                                        <p>Lorem ipsum dolor sit amet,</p>
                                        <a class="show1" href="#">SHOW ME MORE</a>
                                    </div>
                                </li>
                                <li>
                                    <div class="tittle">
                                        <img src="images/shoe.jpg" class="img-responsive" alt=""/>
                                        <h6>Item Title Here</h6>
                                        <p>Lorem ipsum dolor sit amet,</p>
                                        <p>Lorem ipsum dolor sit amet,</p>
                                        <p>Lorem ipsum dolor sit amet,</p>
                                        <a class="show1" href="#">SHOW ME MORE</a>
                                    </div>
                                </li>
                            </ul>
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


        <div class="col-md-9 w_content">
            <div class="women">
                <div style="padding-bottom: 5px;">
                    <ul class="breadcrumb">
                        您现在的位置:&nbsp;
                        <li><a href="${pageContext.request.contextPath }/pages/home.jsp">TF_Book首页</a></li>
                        <li class="active"><a href="#">小说</a></li>
                    </ul>
                </div>

                <a href="#"><h4>总共有 - <span>4449 本图书</span></h4></a>
                <%--根据用户选择排序--%>
                <ul class="w_nav">
                    <li>综合排序 :</li>
                    <li><a class="active" href="#">popular</a></li>
                    |
                    <li><a href="#">new </a></li>
                    |
                    <li><a href="#">discount</a></li>
                    |
                    <li><a href="#">price: Low High </a></li>
                    <div class="clear"></div>
                </ul>
                <div class="clearfix"></div>
            </div>

            <!-- grids_of_4 -->
            <div class="grids_of_4">
                <div class="grid1_of_4">
                    <div class="content_box">
                        <a href="details.jsp">
                            <div class="view view-fifth">
                                <img src="images/5.jpg" class="img-responsive" alt=""/>
                                <div class="mask">
                                    <div class="info">Quick View</div>
                                </div>
                        </a>
                    </div>
                    <h4><a href="details.jsp"> Duis autem</a></h4>
                    <p>It is a long established fact that a reader</p>
                    <span>$99.99</span>
                </div>
            </div>

            <div class="grid1_of_4">
                <div class="content_box"><a href="details.jsp">
                    <div class="view view-fifth">
                        <img src="images/6.jpg" class="img-responsive" alt=""/>
                        <div class="mask">
                            <div class="info">Quick View</div>
                        </div>
                </a>
                </div>
                <h4><a href="details.jsp"> Duis autem</a></h4>
                <p>It is a long established fact that a reader</p>
                <span>$99.99</span>
            </div>
        </div>
        <div class="grid1_of_4">
            <div class="content_box"><a href="details.jsp">
                <div class="view view-fifth">
                    <img src="images/7.jpg" class="img-responsive" alt=""/>
                    <div class="mask">
                        <div class="info">Quick View</div>
                    </div>
            </a>

            </div>
            <h4><a href="details.jsp"> Duis autem</a></h4>
            <p>It is a long established fact that a reader</p>
            <span>$99.99</span>
        </div>
    </div>


    <div class="grid1_of_4">
        <div class="content_box"><a href="details.jsp">
            <div class="view view-fifth">
                <img src="images/8.jpg" class="img-responsive" alt=""/>
                <div class="mask">
                    <div class="info">Quick View</div>
                </div>
        </a>
        </div>
        <h4><a href="details.jsp"> Duis autem</a></h4>
        <p>It is a long established fact that a reader</p>
        <span>$99.99</span>
    </div>
</div>
<div class="grid1_of_4">
    <div class="content_box"><a href="details.jsp">
        <div class="view view-fifth">
            <img src="images/9.jpg" class="img-responsive" alt=""/>
            <div class="mask">
                <div class="info">Quick View</div>
            </div>
    </a>
    </div>
    <h4><a href="details.jsp"> Duis autem</a></h4>
    <p>It is a long established fact that a reader</p>
    <span>$99.99</span>
</div>
</div>
<div class="grid1_of_4">
    <div class="content_box"><a href="details.jsp">
        <div class="view view-fifth">
            <img src="images/10.jpg" class="img-responsive" alt=""/>
            <div class="mask">
                <div class="info">Quick View</div>
            </div>
    </a>
    </div>
    <h4><a href="details.jsp"> Duis autem</a></h4>
    <p>It is a long established fact that a reader</p>
    <span>$99.99</span>
</div>
</div>


<div class="grid1_of_4">
    <div class="content_box"><a href="details.jsp">
        <div class="view view-fifth">
            <img src="images/11.jpg" class="img-responsive" alt=""/>
            <div class="mask">
                <div class="info">Quick View</div>
            </div>
    </a>
    </div>
    <h4><a href="details.jsp"> Duis autem</a></h4>
    <p>It is a long established fact that a reader</p>
    <span>$99.99</span>
</div>
</div>
<div class="grid1_of_4">
    <div class="content_box"><a href="details.jsp">
        <div class="view view-fifth">
            <img src="images/12.jpg" class="img-responsive" alt=""/>
            <div class="mask">
                <div class="info">Quick View</div>
            </div>
    </a>
    </div>
    <h4><a href="details.jsp"> Duis autem</a></h4>
    <p>It is a long established fact that a reader</p>
    <span>$99.99</span>
</div>
</div>
<div class="grid1_of_4">
    <div class="content_box"><a href="details.jsp">
        <div class="view view-fifth">
            <img src="images/13.jpg" class="img-responsive" alt=""/>
            <div class="mask">
                <div class="info">Quick View</div>
            </div>
    </a>
    </div>
    <h4><a href="details.jsp"> Duis autem</a></h4>
    <p>It is a long established fact that a reader</p>
    <span>$99.99</span>
</div>
</div>

<div class="clearfix"></div>
</div>
<!-- end grids_of_4 -->
</div>
<div class="clearfix"></div>
</div>
</div>
<!-- content -->
<!-- footer -->
<div class="footer">
    <div class="container">
        <p>Copyright &copy; 2019.chenhc All rights reserved !</p></div>
</div>
<!-- footer -->

</body>
</html>