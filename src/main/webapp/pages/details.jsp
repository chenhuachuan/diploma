<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Book Detail</title>
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
    <script src="js/menu_jquery.js"></script>
    <link rel="stylesheet" href="css/etalage.css">
    <script src="js/jquery.easydropdown.js"></script>
    <!-- etale -->
    <script src="js/jquery.etalage.min.js"></script>
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
<div class="head-bann" id="page_load_contrller_detail_div">
    <script type="text/javascript">
        $("#page_load_contrller_detail_div").load('${pageContext.request.contextPath}/category/all_category_name.do');
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
            <div class="col-md-9">
                <div class="single_left">

                    <div class="grid images_3_of_2">
                        <ul id="etalage">
                            <li>
                                <a href="optionallink.html">
                                    <img class="etalage_thumb_image" src="images/d1.jpg" class="img-responsive"/>
                                    <img class="etalage_source_image" src="images/d1.jpg" class="img-responsive"
                                         title=""/>
                                </a>
                            </li>
                            <li>
                                <img class="etalage_thumb_image" src="images/d2.jpg" class="img-responsive"/>
                                <img class="etalage_source_image" src="images/d2.jpg" class="img-responsive" title=""/>
                            </li>
                            <li>
                                <img class="etalage_thumb_image" src="images/d3.jpg" class="img-responsive"/>
                                <img class="etalage_source_image" src="images/d3.jpg" class="img-responsive"/>
                            </li>
                            <li>
                                <img class="etalage_thumb_image" src="images/d4.jpg" class="img-responsive"/>
                                <img class="etalage_source_image" src="images/d4.jpg" class="img-responsive"/>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="desc1 span_3_of_2">
                        <h3>soluta nobis eleifend option</h3>
                        <p>Rs. 999 <a href="#">click for offer</a></p>
                        <div class="det_nav">
                            <h4>related styles :</h4>
                            <ul>
                                <li><a href="#"><img src="images/1.jpg" class="img-responsive" alt=""/></a></li>
                                <li><a href="#"><img src="images/12.jpg" class="img-responsive" alt=""/></a></li>
                                <li><a href="#"><img src="images/3.jpg" class="img-responsive" alt=""/></a></li>
                                <li><a href="#"><img src="images/ss2.jpg" class="img-responsive" alt=""/></a></li>
                            </ul>
                        </div>
                        <div class="det_nav1">
                            <h4>Select a size :</h4>
                            <div class=" sky-form col col-4">
                                <ul>
                                    <li><label class="checkbox"><input type="checkbox" name="checkbox"><i></i>L</label>
                                    </li>
                                    <li><label class="checkbox"><input type="checkbox" name="checkbox"><i></i>S</label>
                                    </li>
                                    <li><label class="checkbox"><input type="checkbox" name="checkbox"><i></i>M</label>
                                    </li>
                                    <li><label class="checkbox"><input type="checkbox" name="checkbox"><i></i>XL</label>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="btn_form">
                            <a href="buy.jsp">buy</a>
                        </div>
                        <a href="#"><span>login to save in wishlist </span></a>

                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="single-bottom1">
                    <h6>Details</h6>
                    <p class="prod-desc">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh
                        euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam,
                        quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo
                        consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie
                        consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio
                        dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla
                        facilisi. Nam liber tempor cum soluta nobis eleifend option</p>
                </div>
                <div class="single-bottom2">
                    <h6>Related Products</h6>
                    <div class="product">
                        <div class="product-desc">
                            <div class="product-img">
                                <img src="images/12.jpg" class="img-responsive " alt=""/>
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
                            <button class="button1"><span>Add to cart</span></button>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="product">
                        <div class="product-desc">
                            <div class="product-img">
                                <img src="images/9.jpg" class="img-responsive " alt=""/>
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
                            <button class="button1"><span>Add to cart</span></button>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="product">
                        <div class="product-desc">
                            <div class="product-img">
                                <img src="images/8.jpg" class="img-responsive " alt=""/>
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
                            <button class="button1"><span>Add to cart</span></button>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 span_1_of_right">
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
                <div class="sellers">
                    <h3 class="m_2">Best sellers</h3>
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
                                SyntaxHighlighter.all();
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
</div>
<!-- details -->
<!-- footer -->
<div class="footer">
    <div class="container">
        <p>Copyright &copy; 2015.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/"
                                                                                    target="_blank"
                                                                                    title="模板之家">模板之家</a> - Collect from
            <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
    </div>
</div>
<!-- footer -->

</body>
</html>