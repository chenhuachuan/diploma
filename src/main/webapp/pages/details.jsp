<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Book Detail</title>
    <link href="../pages/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
    <link href="../pages/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
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
                    <a href="home.jsp"><img src="../pages/images/logo.png" alt=""/></a>
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
<%--<div class="container">
    <div class="head-nav">
    <!-- megamenu -->
    <script type="text/javascript" src="js/megamenu.js"></script>
        <script>
        $(document).ready(function()
        {$(".megamenu").megamenu();});
        </script>
    <!-- megamenu -->
        <span class="menu"> </span>
            <ul class="megamenu skyblue">
    <li><a class="color1" href="home.jsp">Home</a></li>
                <!--小说-->
                <li class="grid"><a class="color2" href="categories.jsp">小说</a>
                    <div class="megapanel">
                        <div class="row">
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>中国当代小说</h4>
                                    <ul>
                                        <li><a href="categories.jsp">玄幻</a></li>
                                        <li><a href="categories.jsp">情感</a></li>
                                        <li><a href="categories.jsp">科幻</a></li>
                                        <li><a href="categories.jsp">历史</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>中国近现代小说</h4>
                                    <ul>
                                        <li><a href="categories.jsp">武侠</a></li>
                                        <li><a href="categories.jsp">社会</a></li>
                                        <li><a href="categories.jsp">职场</a></li>
                                        <li><a href="categories.jsp">军事</a></li>
                                        <li><a href="categories.jsp">爱情</a></li>
                                        <li><a href="categories.jsp">校园</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>中国古典小说</h4>
                                    <ul>
                                        <li><a href="categories.jsp">武侠</a></li>
                                        <li><a href="categories.jsp">官场</a></li>
                                        <li><a href="categories.jsp">历史</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>四大名著</h4>
                                    <ul>
                                        <li><a href="categories.jsp">西游记</a></li>
                                        <li><a href="categories.jsp">三国演义</a></li>
                                        <li><a href="categories.jsp">红楼梦</a></li>
                                        <li><a href="categories.jsp">水浒传</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>外国小说</h4>
                                    <ul>
                                        <li><a href="categories.jsp">社会</a></li>
                                        <li><a href="categories.jsp">财经</a></li>
                                        <li><a href="categories.jsp">恐怖</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>世界名著 </h4>
                                    <ul>
                                        <li><a href="categories.jsp">军事</a></li>
                                        <li><a href="categories.jsp">人文</a></li>
                                        <li><a href="categories.jsp">纪实</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <!--人文社科-->
                <li><a class="color4" href="#">人文社科</a>
                    <div class="megapanel">
                        <div class="row">
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>历史</h4>
                                    <ul>
                                        <li><a href="categories.jsp">中国史</a></li>
                                        <li><a href="categories.jsp">世界史</a></li>
                                        <li><a href="categories.jsp">史家名著</a></li>
                                        <li><a href="categories.jsp">文物考古</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>文化</h4>
                                    <ul>
                                        <li><a href="categories.jsp">传统文化</a></li>
                                        <li><a href="categories.jsp">文化评述</a></li>
                                        <li><a href="categories.jsp">文化随笔</a></li>
                                        <li><a href="categories.jsp">各国文化</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>古籍</h4>
                                    <ul>
                                        <li><a href="categories.jsp">经部</a></li>
                                        <li><a href="categories.jsp">史类</a></li>
                                        <li><a href="categories.jsp">古籍工具书</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>心理学</h4>
                                    <ul>
                                        <li><a href="categories.jsp">心理学百科</a></li>
                                        <li><a href="categories.jsp">心理学著作</a></li>
                                        <li><a href="categories.jsp">社会心理学</a></li>
                                        <li><a href="categories.jsp">人文心理学</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <!--经典名著-->
                <li><a class="color5" href="#">经典名著</a>
                    <div class="megapanel">
                        <div class="row">
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>国内经典</h4>
                                    <ul>
                                        <li><a href="categories.jsp">men</a></li>
                                        <li><a href="categories.jsp">women</a></li>
                                        <li><a href="categories.jsp">kids</a></li>
                                        <li><a href="categories.jsp">sports</a></li>
                                        <li><a href="categories.jsp">brands</a></li>
                                        <li><a href="categories.jsp">collections</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>国外经典</h4>
                                    <ul>
                                        <li><a href="categories.jsp">trends</a></li>
                                        <li><a href="categories.jsp">sale</a></li>
                                        <li><a href="categories.jsp">style videos</a></li>
                                        <li><a href="categories.jsp">accessories</a></li>
                                        <li><a href="categories.jsp">kids</a></li>
                                        <li><a href="categories.jsp">style videos</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>世界经典</h4>
                                    <ul>
                                        <li><a href="categories.jsp">men</a></li>
                                        <li><a href="categories.jsp">women</a></li>
                                        <li><a href="categories.jsp">kids</a></li>
                                        <li><a href="categories.jsp">sports</a></li>
                                        <li><a href="categories.jsp">brands</a></li>
                                        <li><a href="categories.jsp">collections</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <!--科技文学-->
                <li><a class="color5" href="#">科技文学</a>
                    <div class="megapanel">
                        <div class="row">
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>科普读物</h4>
                                    <ul>
                                        <li><a href="categories.jsp">宇宙知识</a></li>
                                        <li><a href="categories.jsp">人类故事</a></li>
                                        <li><a href="categories.jsp">生态环境</a></li>
                                        <li><a href="categories.jsp">动物世界</a></li>
                                        <li><a href="categories.jsp">科学世界</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>计算机/网络</h4>
                                    <ul>
                                        <li><a href="categories.jsp">计算机理论</a></li>
                                        <li><a href="categories.jsp">数据库</a></li>
                                        <li><a href="categories.jsp">软件开发</a></li>
                                        <li><a href="categories.jsp">人工智能</a></li>
                                        <li><a href="categories.jsp">物联网技术</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>自然科学</h4>
                                    <ul>
                                        <li><a href="categories.jsp">数学</a></li>
                                        <li><a href="categories.jsp">化学</a></li>
                                        <li><a href="categories.jsp">物理学</a></li>
                                        <li><a href="categories.jsp">地球科学</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>工业技术</h4>
                                    <ul>
                                        <li><a href="categories.jsp">电工</a></li>
                                        <li><a href="categories.jsp">机械</a></li>
                                        <li><a href="categories.jsp">电子</a></li>
                                        <li><a href="categories.jsp">水利</a></li>
                                        <li><a href="categories.jsp">矿业</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <!--教育-->
                <li><a class="color5" href="#">教育</a>
                    <div class="megapanel">
                        <div class="row">
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>教材</h4>
                                    <ul>
                                        <li><a href="categories.jsp">本科/研究生/专科教材</a></li>
                                        <li><a href="categories.jsp">高职教材</a></li>
                                        <li><a href="categories.jsp">中职教材</a></li>
                                        <li><a href="categories.jsp">成人教育教材</a></li>
                                        <li><a href="categories.jsp">更多</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>外语</h4>
                                    <ul>
                                        <li><a href="categories.jsp">英语</a></li>
                                        <li><a href="categories.jsp">法语</a></li>
                                        <li><a href="categories.jsp">俄语</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>考试</h4>
                                    <ul>
                                        <li><a href="categories.jsp">计算机</a></li>
                                        <li><a href="categories.jsp">会计师</a></li>
                                        <li><a href="categories.jsp">建筑师</a></li>
                                        <li><a href="categories.jsp">公务员</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>工具书</h4>
                                    <ul>
                                        <li><a href="categories.jsp">login</a></li>
                                        <li><a href="categories.jsp">create an account</a></li>
                                        <li><a href="categories.jsp">create wishlist</a></li>
                                        <li><a href="categories.jsp">my shopping bag</a></li>
                                        <li><a href="categories.jsp">brands</a></li>
                                        <li><a href="categories.jsp">create wishlist</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <!--青春文学-->
                <li><a class="color6" href="#">青春文学</a>
                    <div class="megapanel">
                        <div class="row">
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>青春文学</h4>
                                    <ul>
                                        <li><a href="categories.jsp">校园</a></li>
                                        <li><a href="categories.jsp">爱情</a></li>
                                        <li><a href="categories.jsp">叛逆/成长</a></li>
                                        <li><a href="categories.jsp">娱乐/偶像</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>动漫/幽默</h4>
                                    <ul>
                                        <li><a href="categories.jsp">大陆动漫</a></li>
                                        <li><a href="categories.jsp">港台动漫</a></li>
                                        <li><a href="categories.jsp">日韩动漫</a></li>
                                        <li><a href="categories.jsp">世界经典动漫集</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <!--成功励志-->
                <li><a class="color8" href="#">成功/励志</a>
                    <div class="megapanel">
                        <div class="row">
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>成功/励志</h4>
                                    <ul>
                                        <li><a href="categories.jsp">人生哲学</a></li>
                                        <li><a href="categories.jsp">成功/激励</a></li>
                                        <li><a href="categories.jsp">智商/智谋</a></li>
                                        <li><a href="categories.jsp">人际交往</a></li>
                                        <li><a href="categories.jsp">口才/演讲</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <!--更多-->
                <li>
                    <a class="color7" href="knowmore.jsp">商标</a>
                </li>


        <div class="clearfix"> </div>
 </ul>
    </div>
</div>
--%>


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
                            &nbsp;&nbsp;&nbsp;&nbsp;出版时间：
                             <fmt:formatDate value="${bookDetails.publishTime}" pattern="yyyy-MM-dd"/><br/>
                           ISBN: ${bookDetails.isbn}&nbsp;&nbsp;&nbsp;&nbsp;
                            开本：${bookDetails.kaiBen}
                        </span>

                        <p>￥.${bookDetails.bookPrice} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <font color="gray" size="4px;">￥.${bookDetails.originalPrice}</font>
                            &nbsp;&nbsp;<a href="#">click for offer</a></p>
                        <div class="det_nav">
                            <h4>related styles :</h4>
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
                                <button type="submit" class="btn btn-info">加入购物车</button>
                                <%-- <a href="">加入购物车</a>--%>
                                <a href="../pages/buy.jsp">立即购买</a>
                            </div>
                        </form>
                        <a href="#"><span style="font-size:medium">加入收藏 </span></a>
                    </div>

                    <div class="clearfix"></div>
                </div>
                <div class="single-bottom1">
                    <h6>图书介绍</h6>
                    <p class="prod-desc" style="text-indent:2em;">
                        ${bookDetails.bookIntro}
                    </p>
                    <h6 style="padding-top: 15px;">编辑推荐</h6>
                    <p class="prod-desc" style="text-indent:2em;">
                        ${bookDetails.commend}
                    </p>
                </div>
                <div class="single-bottom2">
                    <h6>相关图书</h6>
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
                                <button class="button1"><span>加入购物车</span></button>
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
                    <h3 class="m_2">热销图书</h3>
                    <div class="best">
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

                <div class="sellers">
                    <h3 class="m_2">Tags</h3>
                    <div class="tags" id="tags_book_detail_div">
                        <script type="text/javascript">
                            $("#tags_book_detail_div").load('${pageContext.request.contextPath}/category/recommendSortTags.do');
                        </script>
                    </div>
                </div>

                <%--今日特价--%>
                <section class="sky-form">
                    <div class="sellers">
                        <h3 class="m_2">今日特价</h3>
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
                                                    <a class="show1" href="#">加入购物车</a>
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

</body>
</html>