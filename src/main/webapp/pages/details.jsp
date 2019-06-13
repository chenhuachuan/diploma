<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Book Detail</title>
    <link href="../pages/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
    <link href="../pages/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link rel="stylesheet" href="../pages/css/font-awesome/css/font-awesome.css">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <script src="../js/jquery-1.10.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="../pages/js/easing.js"></script>
    <link rel="stylesheet" href="../pages/css/flexslider.css" type="text/css" media="screen"/>
    <link href="../pages/css/megamenu.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="../pages/css/num_input.css" rel="stylesheet" type="text/css"/>
    <script src="../pages/js/menu_jquery.js"></script>
    <link rel="stylesheet" href="../pages/css/etalage.css">
    <script src="../pages/js/jquery.easydropdown.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>
    <!-- etale -->
    <script src="../pages/js/jquery.etalage.min.js"></script>
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
    <!-- etale -->

</head>
<body>
<!-- header -->
<div class="header">
    <div class="top_bg">
        <div class="container">
            <div class="header_top">
                <div class="logo">
                    <a href="home.jsp"><img src="../image/lb/logo_v3.jpg" alt=""/></a>
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
        //var jspType="detail";
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
<!-- details -->
<div class="details">
    <div class="container">
        <div class="row single">

            <%--当前位置--%>
            <div style="padding-bottom: 5px;">
                <ul class="breadcrumb">
                    您现在的位置:&nbsp;
                    <li><a href="${pageContext.request.contextPath }/pages/home.jsp">图书</a></li>
                    <li class="active"><a href="#">小说</a></li>
                    <li class="active"><a href="#">图书详情</a></li>
                </ul>
            </div>
            <%--图书详情--%>
            <div class="col-md-9">
                <div class="single_left">
                    <div class="grid images_3_of_2">
                        <ul id="etalage">
                            <li>
                                <a href="optionallink.html">
                                    <img class="etalage_thumb_image" src="..${bookDetails.imgUrl}"
                                         class="img-responsive"/>
                                    <img class="etalage_source_image" src="..${bookDetails.imgUrl}"
                                         class="img-responsive"
                                         title=""/>
                                </a>
                            </li>
                            <li>
                                <img class="etalage_thumb_image" src="..${bookDetails.imgUrl}" class="img-responsive"/>
                                <img class="etalage_source_image" src="..${bookDetails.imgUrl}" class="img-responsive"
                                     title=""/>
                            </li>
                            <li>
                                <img class="etalage_thumb_image" src="..${bookDetails.imgUrl}" class="img-responsive"/>
                                <img class="etalage_source_image" src="..${bookDetails.imgUrl}" class="img-responsive"/>
                            </li>
                            <li>
                                <img class="etalage_thumb_image" src="..${bookDetails.imgUrl}" class="img-responsive"/>
                                <img class="etalage_source_image" src="..${bookDetails.imgUrl}" class="img-responsive"/>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>

                    <div class="desc1 span_3_of_2">
                        <h3>${bookDetails.bookName}</h3>
                        <span>作者：${bookDetails.author}著&nbsp;&nbsp;&nbsp;&nbsp;出版社:${bookDetails.publishCompany}
                            &nbsp;&nbsp;&nbsp;&nbsp;上架时间：
                             <fmt:formatDate value="${bookDetails.publishTime}" pattern="yyyy-MM-dd"/><br/>
                           ISBN: ${bookDetails.isbn}&nbsp;&nbsp;&nbsp;&nbsp;
                            开本：${bookDetails.kaiBen}
                        </span>

                        <p>￥.${bookDetails.bookPrice} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <font color="gray" size="4px;">￥.${bookDetails.originalPrice}</font>
                            &nbsp;&nbsp;</p>
                        <div class="det_nav">
                            <h4>详情:</h4>
                            <ul>
                                <li><a href="#"><img src="..${bookDetails.imgUrl}" class="img-responsive" alt=""/></a>
                                </li>
                                <li><a href="#"><img src="..${bookDetails.imgUrl}" class="img-responsive" alt=""/></a>
                                </li>
                                <li><a href="#"><img src="..${bookDetails.imgUrl}" class="img-responsive" alt=""/></a>
                                </li>
                                <li><a href="#"><img src="..${bookDetails.imgUrl}" class="img-responsive" alt=""/></a>
                                </li>
                            </ul>
                        </div>
                        <form id="add_tocart_formid" method="post"
                              action="${pageContext.request.contextPath}/cart/addToCart.do" role="form">
                            <div class="det_nav1">
                                <h4>购买数量:</h4>
                                <div class=" sky-form col col-4">
                                    <div class="input-group spinner">
                                        <input type="text" class="form-control" name="purCount" value="1"
                                               id="purchase_count_input" onblur="setInputDefaultValue()"/>
                                        <input type="text" name="bookId" value="${bookDetails.bookId}" id="bookId_input"
                                               style="display: none;"/>
                                        <div class="input-group-btn-vertical">
                                            <button class="btn btn-default" type="button"><i class="fa fa-caret-up"></i>
                                            </button>
                                            <button class="btn btn-default" type="button"><i
                                                    class="fa fa-caret-down"></i></button>
                                        </div>
                                    </div>

                                    <script type="text/javascript">
                                        (function ($) {
                                            $('.spinner .btn:first-of-type').on('click', function () {
                                                $('#purchase_count_input').val(parseInt($('#purchase_count_input').val(), 10) + 1);
                                            });
                                            $('.spinner .btn:last-of-type').on('click', function () {
                                                var inv = $('#purchase_count_input').val();
                                                if (inv == 'NaN' || inv == '') {
                                                    $('#purchase_count_input').text(1);
                                                    $('#purchase_count_input').val(1);
                                                }
                                                if (inv > 1) {
                                                    $('#purchase_count_input').val(parseInt($('#purchase_count_input').val(), 10) - 1);
                                                }
                                            });
                                        })(jQuery);

                                        function setInputDefaultValue() {
                                            var inv = $('#purchase_count_input').val();
                                            var re = /^[0-9]+.?[0-9]*$/; //判断字符串是否为数字 //判断正整数 /^[1-9]+[0-9]*]*$/
                                            if (!re.test(inv)) {
                                                $('#purchase_count_input').val(1);
                                                return false;
                                            }
                                        }
                                    </script>
                                    <%--<ul>
                                        <li><label class="checkbox"><input type="checkbox" name="checkbox"><i></i>1</label>
                                        </li>
                                        <li><label class="checkbox"><input type="checkbox" name="checkbox"><i></i>2</label>
                                        </li>
                                        <li><label class="checkbox"><input type="checkbox" name="checkbox"><i></i>3</label>
                                        </li>
                                        <li><label class="checkbox"><input type="checkbox" name="checkbox"><i></i>4</label>
                                        </li>
                                    </ul>--%>
                                </div>
                            </div>
                            <div class="btn_form">
                                <%--<button type="submit" class="btn btn-info">加入购物车</button>--%>
                                <a href="javascript:void(0)" onclick="add_tocart_formid.submit();">加入购物车</a>
                                <a href="javascript:void(0)" onclick="buyNow()">立即购买</a>
                            </div>
                        </form>
                        <script>
                            function buyNow() {
                                var buyCount = $("#purchase_count_input").val();
                                window.location.href = "${pageContext.request.contextPath}/cart/purchase/checkOrder.do?bookId=${bookDetails.bookId}&purCount=" + buyCount;
                            }
                        </script>

                        <div class="col-md-6">
                            <div class="col-md-1">
                                <img src="${pageContext.request.contextPath}/image/lb/collect_red.jpg" width="20px;">
                            </div>
                            <div class="col-md-5">
                                <span style="font-size:16px;">
                                    <a href="${pageContext.request.contextPath}/user/person/addWishBook.do?bookId=${bookDetails.bookId}">
                                        加入收藏 </a>
                                </span>
                            </div>
                        </div>
                        <div class="col-md-4"></div>

                    </div>

                    <div class="clearfix"></div>
                </div>
                <div class="single-bottom1">
                    <button class="btn btn-info">图书介绍</button>
                    <p class="prod-desc" style="text-indent:2em;">
                        ${bookDetails.bookIntro}
                    </p><br/>
                    <button class="btn btn-info">编辑推荐</button>
                    <p class="prod-desc" style="text-indent:2em;">
                        ${bookDetails.commend}
                    </p>
                </div>
                <div class="single-bottom2" style="margin-top: 5px;">
                    <button class="btn btn-info">相关图书</button>
                    <c:forEach items="${similarityBooks}" var="sim_books">
                        <div class="product">
                            <div class="product-desc">
                                <div class="product-img">
                                    <a href="${pageContext.request.contextPath}/book/bookDetails.do?bookId=${sim_books.bookId}">
                                        <img src="..${sim_books.imgUrl}" class="img-responsive " alt=""/></a>
                                </div>
                                <div class="prod1-desc">
                                    <h5><a class="product_link"
                                           href="${pageContext.request.contextPath}/book/bookDetails.do?bookId=${sim_books.bookId}">${sim_books.bookName}-<font
                                            size="2px;">${sim_books.author}</font></a></h5>
                                    <p class="product_descr" style="text-indent:2em;">${sim_books.bookIntro}</p>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="product_price">
                                <span class="price-access">￥.${sim_books.bookPrice}</span>
                                <a class="show" style="width: 100px; font-size: x-small"
                                   href="${pageContext.request.contextPath}/cart/addToCart.do?bookId=${sim_books.bookId}">加入购物车</a>
                                    <%--<button class="button1"><span>加入购物车</span></button>--%>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </c:forEach>
                    <%--
                                        <div class="product">
                                            <div class="product-desc">
                                                <div class="product-img">
                                                    <img src="../pages/images/9.jpg" class="img-responsive " alt=""/>
                                                </div>
                                                <div class="prod1-desc">
                                                    <h5><a class="product_link" href="#">Excepteur sint</a></h5>
                                                    <p class="product_descr"> Vivamus ante lorem, eleifend nec interdum non, ullamcorper et
                                                        arcu. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per
                                                        inceptos himenaeos. </p>
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>
                                            <div class="product_price">
                                                <span class="price-access">$597.51</span>
                                                <button class="button1"><span>加入购物车</span></button>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="product">
                                            <div class="product-desc">
                                                <div class="product-img">
                                                    <img src="../pages/images/8.jpg" class="img-responsive " alt=""/>
                                                </div>
                                                <div class="prod1-desc">
                                                    <h5><a class="product_link" href="#">Excepteur sint</a></h5>
                                                    <p class="product_descr"> Vivamus ante lorem, eleifend nec interdum non, ullamcorper et
                                                        arcu. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per
                                                        inceptos himenaeos. </p>
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>
                                            <div class="product_price">
                                                <span class="price-access">$597.51</span>
                                                <button class="button1"><span>加入购物车</span></button>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                        --%>
                </div>
            </div>

            <%--右侧--%>
            <div class="col-md-3 span_1_of_right">
                <%--Tags--%>
                <%--
                <section class="sky-form">
                    <div class="product_right">
                        <h3 class="m_2">Categories</h3>
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
                 --%>

                <%--热销图书--%>
                <div class="sellers">
                    <h3 class="m_2" style="background-color: rgba(255,111,18,0.87)">热销图书</h3>
                    <div class="best" style="background-color: rgba(208,247,255,0.87)">
                        <c:forEach items="${sellHotBooks}" var="book" varStatus="num">
                            <c:if test="${num.index+1<=3}">
                                <div>
                                    <h4><font color="red">${num.index+1}.</font></h4>
                                </div>
                            </c:if>
                            <c:if test="${num.index+1>3}">
                                <div>
                                    <h4>${num.index+1}.</h4>
                                </div>
                            </c:if>
                            <div class="icon">
                                <a href="${pageContext.request.contextPath}/book/bookDetails.do?bookId=${book.bookId}">
                                    <img src="..${book.imgUrl}" class="img-responsive" alt="" width="74px;"
                                         height="74px;"/>
                                </a>
                            </div>
                            <div class="data">
                                <h4><a href="#">${book.bookName}</a></h4>
                                <p>原价：￥${book.originalPrice}</p>
                                <h5>现价：￥${book.bookPrice}</h5>
                            </div>
                        </c:forEach>
                        <div class="clearfix"></div>
                    </div>
                </div>

                    <div class="sellers" style="background-color: rgba(95,255,105,0.87)">
                        <h3 class="m_2" style="background-color: rgba(255,111,18,0.87)">标签</h3>
                    <div class="tags" id="tags_book_detail_div">
                        <script type="text/javascript">
                            $("#tags_book_detail_div").load('${pageContext.request.contextPath}/category/recommendSortTags.do');
                        </script>
                    </div>
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
                                                    <img src="..${tbook.imgUrl}" class="img-responsive" alt=""/>
                                                </a><br/>
                                                <center>
                                                    <a href="${pageContext.request.contextPath}/book/bookDetails.do?bookId=${tbook.bookId}">
                                                        <h6>${tbook.bookName}-<font size="1px;"
                                                                                    color="#000000">${tbook.author}</font>
                                                        </h6></a>
                                                    <p>原价:￥${tbook.originalPrice}</p>
                                                    <p style="font-size: 22px;"><font
                                                            color="red">现价:￥${tbook.bookPrice}</font></p>
                                                    <p>立志读遍天下书！</p>
                                                    <a class="show1"
                                                       href="${pageContext.request.contextPath}/cart/addToCart.do?bookId=${tbook.bookId}">加入购物车</a>
                                                </center>
                                            </div>
                                        </li>
                                    </c:forEach>

                                    <%-- <li>
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
                                     </li>--%>
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
                <%--
                 <section class="sky-form">
                     <div class="sellers">
                         <h3 class="m_2">Special Offers</h3>
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
 --%>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!-- details -->
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
</body>
</html>