<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>分类</title>
    <link href="../pages/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
    <link href="../pages/css/style.css" rel="stylesheet" type="text/css" media="all"/>
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
    <script src="../js/jquery-1.10.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="../pages/js/easing.js"></script>
    <link rel="stylesheet" href="../pages/css/flexslider.css" type="text/css" media="screen"/>
    <link href="../pages/css/megamenu.css" rel="stylesheet" type="text/css" media="all"/>
    <script type="text/javascript" src="../pages/js/megamenu.js"></script>
    <script>$(document).ready(function () {
        $(".megamenu").megamenu();
    });</script>
    <script src="../pages/js/menu_jquery.js"></script>
    <link rel="stylesheet" href="../pages/css/etalage.css">
    <script src="../pages/js/jquery.easydropdown.js"></script>
    <script src="../pages/js/jquery.etalage.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="../pages/js/home.js"></script>
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

    <script type="text/javascript" src="../pages/js/jquery.jscrollpane.min.js"></script>
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
                    <a href="../pages/home.jsp"><img src="../image/lb/logo.png" alt=""/></a>
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
        //$("#page_load_contrller_categr_div").load('/category/first_second_categoryName.do');
        $("#page_load_contrller_categr_div").load('${pageContext.request.contextPath}/category/all_category_name.do');
    </script>
</div>
<%--搜索框--%>

<div style="padding: 20px 380px 5px 300px;">
    <form class="bs-example bs-example-form" role="form"
          action="${pageContext.request.contextPath}/book/searchBooksInHome.do">
        <div class="row">
            <div class="col-lg-8">
                <div class="input-group">
                    <input type="text" name="searchFlag" class="form-control" placeholder="Search">
                    <div class="input-group-btn">
                        <button type="submit" class="btn btn-default" style="width: 80px;">搜索</button>
                    </div><!-- /btn-group -->
                </div><!-- /input-group -->
            </div><!-- /.col-lg-6 -->
            <div class="col-lg-4">
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

        </div><!-- /.row -->
    </form>
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
        <%--左侧--%>
        <div class="col-md-3 span_1_of_right1">
            <section class="sky-form">
                <div class="product_right" style="background-color: rgba(208,247,255,0.87)">
                    <h3 class="m_2" style="background-color: rgba(255,111,18,0.87)">分类信息</h3>

                    <c:forEach items="${secondPage_sorts}" var="ssort">
                        <select class="dropdown" tabindex="10" data-settings='{"wrapperClass":"metro"}'>
                            <option value="">${ssort.sortName}</option>
                            <c:forEach items="${ssort.sortList}" var="grsort">
                                <option value="">${grsort.sortName}</option>
                            </c:forEach>
                        </select>
                        <%--<label class="wom"></label>--%>
                    </c:forEach>

                    <%--      <select class="dropdown" tabindex="50" data-settings='{"wrapperClass":"metro"}'>
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
                          --%>
                </div>

            </section>

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
                                <img src="..${book.imgUrl}" class="img-responsive" alt="" width="74px;" height="74px;"/>
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
                <%-- <div class="best">
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
                 --%>
            </div>


            <%--标签栏--%>
            <div class="sellers" style="display: none">
                <h3 class="m_2">Tags</h3>
                <div class="tags">
                    <ul>
                        <c:forEach items="${secondTags}" var="sort">
                            <li><a href="#">${sort.sortName}&nbsp;|&nbsp;</a></li>
                        </c:forEach>
                    </ul>
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

        </div>


        <%--右侧--%>
        <c:if test="${totalPages==0}">
            <div class="col-md-9 w_content">
                <div class="women">
                        <%--当前位置--%>
                    <div style="padding-bottom: 5px;">
                        <ul class="breadcrumb">
                            <img src="${pageContext.request.contextPath }/image/lb/loc.jpg" alt=""
                                 style="margin-right: 10px;">
                            <li><a href="${pageContext.request.contextPath }/pages/home.jsp">图书</a></li>
                            <c:forEach items="${locationSort}" var="sortA">
                                <li><a href="${pageContext.request.contextPath }/pages/home.jsp">
                                    <c:if test="${sortA.sortId==parSortId and sonSortId==null}">
                                        <font color="red">${sortA.sortName}</font>
                                    </c:if>
                                    <c:if test="${sortA.sortId==parSortId and sonSortId!=null}">
                                        ${sortA.sortName}
                                    </c:if>
                                </a></li>
                                <c:forEach items="${sortA.sortList}" var="sonA">
                                    <c:if test="${sonA.sortId==sonSortId}">
                                        <li><a href="${pageContext.request.contextPath }/pages/home.jsp">
                                            <c:if test="${granSortId==null}">
                                                <font color="red">${sonA.sortName}</font>
                                            </c:if>
                                            <c:if test="${granSortId!=null}">
                                                ${sonA.sortName}
                                            </c:if>
                                        </a></li>
                                    </c:if>
                                    <c:forEach items="${sonA.sortList}" var="sonB">
                                        <c:if test="${sonB.sortId==granSortId}">
                                            <li><a href="${pageContext.request.contextPath }/pages/home.jsp"><font
                                                    color="red">${sonB.sortName}</font></a></li>
                                        </c:if>
                                    </c:forEach>
                                </c:forEach>
                            </c:forEach>
                            <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;共: <span>${booksCount}本图书</span></li>
                            </li>
                        </ul>

                    </div>

                        <%--根据用户选择排序--%>
                    <ul class="w_nav" style="font-size: medium;display: none">
                        <li>综合排序 :</li>
                        <li><a class="active" href="#">销量</a></li>
                        |
                        <li><a href="#">最新</a></li>
                        |
                        <li><a href="#">优惠价</a></li>
                        |
                        <li><a href="#">价格</a></li>
                        <div class="clear"></div>
                    </ul>
                    <div class="clearfix"></div>
                </div>
                <br/>
                <img src="../image/beauty/bg12.jpg">
            </div>
        </c:if>

        <c:if test="${totalPages!=0}">
        <div class="col-md-9 w_content">

            <div class="women">
                    <%--当前位置--%>
                <div class="col-md-8">
                    <div style="padding-bottom: 5px;font-size: medium">
                        <ul class="breadcrumb">
                            <img src="${pageContext.request.contextPath }/image/lb/loc.jpg" alt=""
                                 style="margin-right: 10px;">
                            <li><a href="${pageContext.request.contextPath }/pages/home.jsp">图书</a></li>
                            <c:forEach items="${locationSort}" var="sortA">
                                <li><a href="${pageContext.request.contextPath }/pages/home.jsp">
                                    <c:if test="${sortA.sortId==parSortId and sonSortId==null}">
                                        <font color="red">${sortA.sortName}</font>
                                    </c:if>
                                    <c:if test="${sortA.sortId==parSortId and sonSortId!=null}">
                                        ${sortA.sortName}
                                    </c:if>
                                </a>
                                </li>
                                <c:forEach items="${sortA.sortList}" var="sonA">
                                    <c:if test="${sonA.sortId==sonSortId}">
                                        <li><a href="${pageContext.request.contextPath }/pages/home.jsp">
                                            <c:if test="${granSortId==null}">
                                                <font color="red">${sonA.sortName}</font>
                                            </c:if>
                                            <c:if test="${granSortId!=null}">
                                                ${sonA.sortName}
                                            </c:if>
                                        </a>
                                        </li>
                                    </c:if>
                                    <c:forEach items="${sonA.sortList}" var="sonB">
                                        <c:if test="${sonB.sortId==granSortId}">
                                            <li><a href="${pageContext.request.contextPath }/pages/home.jsp">
                                                <font color="red">${sonB.sortName}</font>
                                            </a>
                                            </li>
                                        </c:if>
                                    </c:forEach>
                                </c:forEach>
                            </c:forEach>
                            <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;共: <span>${booksCount}本图书</span></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-4">
                <%--根据用户选择排序--%>
                    <ul class="w_nav" style="font-size: medium">
                        <li>排序 :</li>
                        <li><a class="active"
                               href="${pageContext.request.contextPath}/book/queryAllBooksbyPage.do?parSortId=${parSortId}&sonSortId=${sonSortId}&granSortId=${granSortId}&sortFlag=pop">销量</a>
                        </li>
                        |
                        <li>
                            <a href="${pageContext.request.contextPath}/book/queryAllBooksbyPage.do?parSortId=${parSortId}&sonSortId=${sonSortId}&granSortId=${granSortId}&sortFlag=new">最新</a>
                        </li>
                        |
                        <li>
                            <a href="${pageContext.request.contextPath}/book/queryAllBooksbyPage.do?parSortId=${parSortId}&sonSortId=${sonSortId}&granSortId=${granSortId}&sortFlag=discount">优惠价</a>
                        </li>
                        |
                        <li>
                            <a href="${pageContext.request.contextPath}/book/queryAllBooksbyPage.do?parSortId=${parSortId}&sonSortId=${sonSortId}&granSortId=${granSortId}&sortFlag=price">价格</a>
                        </li>
                        <div class="clear"></div>
                    </ul>
                </div>
                <div class="clearfix"></div>
            </div>

            <!-- grids_of_4 --><%--图书展示--%>
            <div class="grids_of_4">
                <c:forEach items="${secondPage_books}" var="sbooks">
                    <div class="grid1_of_4">
                        <div class="content_box">
                            <a href="${pageContext.request.contextPath}/book/bookDetails.do?bookId=${sbooks.bookId}">
                                <div class="view view-fifth">
                                    <img src="..${sbooks.imgUrl}" class="img-responsive" alt=""/>
                                    <div class="mask">
                                        <div class="info">Quick View</div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <h4><a href="${pageContext.request.contextPath}/book/bookDetails.do?bookId=${sbooks.bookId}">&nbsp;&nbsp;${sbooks.bookName}</a>
                        </h4>
                        <p>&nbsp;&nbsp;${sbooks.author}</p>
                        <span><font color="red" size="3px;">现价：￥${sbooks.bookPrice}</font></span>
                        <span>&nbsp;&nbsp;&nbsp;原价：￥${sbooks.originalPrice}</span>
                    </div>
                </c:forEach>
                <div class="clearfix"></div>
                <div style="padding-top: 20px;text-align: center">
                    <ul class="pagination pagination-lg">
                            <%--上一页--%>
                        <c:if test="${currentPage<=1}">
                            <li class="disabled"><a href="#">&laquo;</a></li>
                        </c:if>
                        <c:if test="${currentPage>1}">
                            <li>
                                <a href="${pageContext.request.contextPath}/book/queryAllBooksbyPage.do?currentPage=${currentPage-1}&parSortId=${parSortId}&sonSortId=${sonSortId}&granSortId=${granSortId}&sortFlag=${sortFlag}">&laquo;</a>
                            </li>
                        </c:if>

                        <c:if test="${totalPages>2}">
                            <c:forEach begin="1" step="1" end="${totalPages-1}" varStatus="statusA">
                                <li
                                        <c:if test="${currentPage==statusA.index}">
                                            class="active"
                                        </c:if>
                                >
                                    <a href="${pageContext.request.contextPath}/book/queryAllBooksbyPage.do?currentPage=${statusA.index+1}&parSortId=${parSortId}&sonSortId=${sonSortId}&granSortId=${granSortId}&sortFlag=${sortFlag}">${statusA.index}</a>
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
                                    <a href="${pageContext.request.contextPath}/book/queryAllBooksbyPage.do?currentPage=${statusA.index}&parSortId=${parSortId}&sonSortId=${sonSortId}&granSortId=${granSortId}&sortFlag=${sortFlag}">${statusA.index}</a>
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
                            <a href="${pageContext.request.contextPath}/book/queryAllBooksbyPage.do?currentPage=${totalPages}&parSortId=${parSortId}&sonSortId=${sonSortId}&granSortId=${granSortId}&sortFlag=${sortFlag}">${totalPages}</a>
                        </li>

                            <%--下一页--%>
                        <c:if test="${currentPage<totalPages}">
                            <li>
                                <a href="${pageContext.request.contextPath}/book/queryAllBooksbyPage.do?currentPage=${currentPage+1}&parSortId=${parSortId}&sonSortId=${sonSortId}&granSortId=${granSortId}&sortFlag=${sortFlag}">&raquo;</a>
                            </li>
                        </c:if>
                        <c:if test="${currentPage==totalPages}">
                            <li class="disabled"><a>&raquo;</a></li>
                        </c:if>
                    </ul>
                </div>
                <div class="clearfix"></div>
            </div>
            <!-- end grids_of_4 -->

        </div>
        </c:if>
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
<%-- <div class="grid1_of_4">
                     <div class="content_box">
                         <a href="details.jsp">
                             <div class="view view-fifth">
                                 <img src="images/6.jpg" class="img-responsive" alt=""/>
                                 <div class="mask">
                                     <div class="info"></div>
                                 </div>
                             </div>
                         </a>
                     </div>
                     <h4><a href="details.jsp"> Duis autem</a></h4>
                     <p>It is a long established fact that a reader</p>
                     <span>$99.99</span>
             </div>

                 &lt;%&ndash;</div>&ndash;%&gt;
                 <div class="grid1_of_4">
             <div class="content_box"><a href="details.jsp">
                 <div class="view view-fifth">
                     <img src="images/7.jpg" class="img-responsive" alt=""/>
                     <div class="mask">
                         <div class="info">Quick View</div>
                     </div>
                 </div>
             </a>
             </div>
             <h4><a href="details.jsp"> Duis autem</a></h4>
             <p>It is a long established fact that a reader</p>
             <span>$99.99</span>
         </div>
 --%>
<%--

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
--%>


<%--
                            <li
                            <c:if test="${num.index+2<2}">
                                class="disabled"
                            </c:if>
                            ><a href="">2</a></li>

                            <li
                                <c:if test="${num.index+3<3}">
                                    class="disabled"
                                </c:if>
                            ><a href="#">3</a></li>
                            <li
                                <c:if test="${num.index+4<4}">
                                    class="disabled"
                                </c:if>
                            ><a href="#">4</a></li>
                            <li
                                <c:if test="${num.index+5<5}">
                                    class="disabled"
                                </c:if>
                            ><a href="#">5</a></li>--%>
