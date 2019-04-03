<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Buy</title>
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
    <script src="../pages/js/jquery.min.js"></script>
    <script type="text/javascript" src="../pages/js/easing.js"></script>
    <link rel="stylesheet" href="../pages/css/flexslider.css" type="text/css" media="screen"/>
    <link href="../pages/css/megamenu.css" rel="stylesheet" type="text/css" media="all"/>
    <link rel="stylesheet" href="../pages/css/etalage.css">
    <script src="../pages/js/jquery.easydropdown.js"></script>
    <script src="../pages/js/menu_jquery.js"></script>
    <!-- etale -->
    <script src="../pages/js/jquery.etalage.min.js"></script>
    <script src="../pages/js/home.js"></script>
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
                    <a href="home.jsp"><img src="../pages/images/logo.png" alt=""/></a>
                </div>

                <%-- user login and regsit jsp--%>
                <%@include file="innerpage/login_regist.jsp" %>


                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>

<!-- megamenu -->
<script type="text/javascript" src="../pages/js/megamenu.js"></script>
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
<%--

	<div class="head-bann">
		<div class="container">
			<div class="head-nav">
				<span class="menu"> </span>
		<ul class="megamenu skyblue">
			<li><a class="color1" href="home.jsp">Home</a></li>
			<li class="grid"><a class="color2" href="#">Men's</a>
				<div class="megapanel">
					<div class="row">
						<div class="col1">
							<div class="h_nav">
								<h4>shop</h4>
								<ul>
									<li><a href="categories.jsp">new arrivals</a></li>
									<li><a href="categories.jsp">men</a></li>
									<li><a href="categories.jsp">women</a></li>
									<li><a href="categories.jsp">accessories</a></li>
									<li><a href="categories.jsp">kids</a></li>
									<li><a href="categories.jsp">brands</a></li>
								</ul>	
							</div>							
						</div>
						<div class="col1">
							<div class="h_nav">
								<h4>help</h4>
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
								<h4>my company</h4>
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
								<h4>account</h4>
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
						<div class="col1">
							<div class="h_nav">
								<h4>my company</h4>
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
								<h4>popular</h4>
								<ul>
									<li><a href="categories.jsp">new arrivals</a></li>
									<li><a href="categories.jsp">men</a></li>
									<li><a href="categories.jsp">women</a></li>
									<li><a href="categories.jsp">accessories</a></li>
									<li><a href="categories.jsp">kids</a></li>
									<li><a href="categories.jsp">style videos</a></li>
								</ul>	
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col2"></div>
						<div class="col1"></div>
						<div class="col1"></div>
						<div class="col1"></div>
						<div class="col1"></div>
					</div>
    				</div>
				</li>
			<li><a class="color4" href="#">Women's</a>
				<div class="megapanel">
					<div class="row">
						<div class="col1">
							<div class="h_nav">
								<h4>shop</h4>
								<ul>
									<li><a href="categories.jsp">new arrivals</a></li>
									<li><a href="categories.jsp">men</a></li>
									<li><a href="categories.jsp">women</a></li>
									<li><a href="categories.jsp">accessories</a></li>
									<li><a href="categories.jsp">kids</a></li>
									<li><a href="categories.jsp">brands</a></li>
								</ul>	
							</div>							
						</div>
						<div class="col1">
							<div class="h_nav">
								<h4>help</h4>
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
								<h4>my company</h4>
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
								<h4>account</h4>
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
						<div class="col1">
							<div class="h_nav">
								<h4>my company</h4>
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
								<h4>popular</h4>
								<ul>
									<li><a href="categories.jsp">new arrivals</a></li>
									<li><a href="categories.jsp">men</a></li>
									<li><a href="categories.jsp">women</a></li>
									<li><a href="categories.jsp">accessories</a></li>
									<li><a href="categories.jsp">kids</a></li>
									<li><a href="categories.jsp">style videos</a></li>
								</ul>	
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col2"></div>
						<div class="col1"></div>
						<div class="col1"></div>
						<div class="col1"></div>
						<div class="col1"></div>
					</div>
    				</div>
				</li>				
				<li><a class="color5" href="#">Kids</a>
				<div class="megapanel">
					<div class="row">
						<div class="col1">
							<div class="h_nav">
								<h4>shop</h4>
								<ul>
									<li><a href="categories.jsp">new arrivals</a></li>
									<li><a href="categories.jsp">men</a></li>
									<li><a href="categories.jsp">women</a></li>
									<li><a href="categories.jsp">accessories</a></li>
									<li><a href="categories.jsp">kids</a></li>
									<li><a href="categories.jsp">brands</a></li>
								</ul>	
							</div>							
						</div>
						<div class="col1">
							<div class="h_nav">
								<h4>help</h4>
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
								<h4>my company</h4>
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
								<h4>account</h4>
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
						<div class="col1">
							<div class="h_nav">
								<h4>my company</h4>
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
								<h4>popular</h4>
								<ul>
									<li><a href="categories.jsp">new arrivals</a></li>
									<li><a href="categories.jsp">men</a></li>
									<li><a href="categories.jsp">women</a></li>
									<li><a href="categories.jsp">accessories</a></li>
									<li><a href="categories.jsp">kids</a></li>
									<li><a href="categories.jsp">style videos</a></li>
								</ul>	
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col2"></div>
						<div class="col1"></div>
						<div class="col1"></div>
						<div class="col1"></div>
						<div class="col1"></div>
					</div>
    				</div>
				</li>
				<li><a class="color6" href="#">Sports</a>
				<div class="megapanel">
					<div class="row">
						<div class="col1">
							<div class="h_nav">
								<h4>shop</h4>
								<ul>
									<li><a href="categories.jsp">new arrivals</a></li>
									<li><a href="categories.jsp">men</a></li>
									<li><a href="categories.jsp">women</a></li>
									<li><a href="categories.jsp">accessories</a></li>
									<li><a href="categories.jsp">kids</a></li>
									<li><a href="categories.jsp">brands</a></li>
								</ul>	
							</div>							
						</div>
						<div class="col1">
							<div class="h_nav">
								<h4>help</h4>
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
								<h4>my company</h4>
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
								<h4>account</h4>
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
						<div class="col1">
							<div class="h_nav">
								<h4>my company</h4>
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
								<h4>popular</h4>
								<ul>
									<li><a href="categories.jsp">new arrivals</a></li>
									<li><a href="categories.jsp">men</a></li>
									<li><a href="categories.jsp">women</a></li>
									<li><a href="categories.jsp">accessories</a></li>
									<li><a href="categories.jsp">kids</a></li>
									<li><a href="categories.jsp">style videos</a></li>
								</ul>	
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col2"></div>
						<div class="col1"></div>
						<div class="col1"></div>
						<div class="col1"></div>
						<div class="col1"></div>
					</div>
    				</div>
				</li>
				<li><a class="color7" href="knowmore.jsp">Brands</a>
				</li>
				<li><a class="color8" href="#">Collections</a>
				<div class="megapanel">
					<div class="row">
						<div class="col1">
							<div class="h_nav">
								<h4>shop</h4>
								<ul>
									<li><a href="categories.jsp">new arrivals</a></li>
									<li><a href="categories.jsp">men</a></li>
									<li><a href="categories.jsp">women</a></li>
									<li><a href="categories.jsp">accessories</a></li>
									<li><a href="categories.jsp">kids</a></li>
									<li><a href="categories.jsp">brands</a></li>
								</ul>	
							</div>							
						</div>
						<div class="col1">
							<div class="h_nav">
								<h4>help</h4>
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
								<h4>my company</h4>
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
								<h4>account</h4>
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
						<div class="col1">
							<div class="h_nav">
								<h4>my company</h4>
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
								<h4>popular</h4>
								<ul>
									<li><a href="categories.jsp">new arrivals</a></li>
									<li><a href="categories.jsp">men</a></li>
									<li><a href="categories.jsp">women</a></li>
									<li><a href="categories.jsp">accessories</a></li>
									<li><a href="categories.jsp">kids</a></li>
									<li><a href="categories.jsp">style videos</a></li>
								</ul>	
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col2"></div>
						<div class="col1"></div>
						<div class="col1"></div>
						<div class="col1"></div>
						<div class="col1"></div>
					</div>
    			   </div>
				</li>
				<div class="clearfix"> </div>
		 </ul> 
			</div>
		</div>	
	</div>

--%>
<!-- header end -->



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
<div class="container">
    <div class="main">
        <div class="shoping_bag">
            <h4><img src="../pages/images/small.jpg">购物车： / <span>4</span></h4>
            <ul class="s_art">
                <li><img src="../pages/images/art1.png"></li>
                <li><span> 11 本</span></li>
            </ul>
            <div class="clearfix"></div>
        </div>
        <c:forEach items="${sessionScope.showCart}" var="map" varStatus="order_item">
            <c:set var="totalPurchaseCount" value="${totalPurchaseCount+map.value.count}"></c:set>
            <div class="shoping_bag1">
                <div class="shoping_left">
                    <div class="shoping1_of_1">
                        <img src="..${map.value.book.imgUrl}" class="img-responsive" alt=""/>
                    </div>
                    <div class="shoping1_of_2">
                        <h4><a href="#">${map.value.book.bookName}</a></h4>
                            <%--<span>购买数量: <b>xl</b>&nbsp;&nbsp; 数量 <b>${purCount}</b> | code :1175</span>--%>
                        <span>购买数量: <b>${map.value.count}</b>&nbsp;&nbsp; | 单价 : ${map.value.book.bookPrice}</span>
                        <ul class="s_icons">
                            <li><a href="#"><img src="../pages/images/s_icon1.png" alt=""></a></li>
                            <li><a href="#"><img src="../pages/images/s_icon2.png" alt=""></a></li>
                            <li><a href="#"><img src="../pages/images/s_icon3.png" alt=""></a></li>
                        </ul>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="shoping_right">
                    <p>优惠：￥${sessionScope.perMoney} &nbsp;<span> 小计:￥${map.value.littleCount}</span></p>
                </div>
                <div class="clearfix"></div>
            </div>
        </c:forEach>
        <input type="text" value="${totalPurchaseCount}" name="totalPurchaseCount" id="total_order_count"
               style="display: none;">
        <div class="shoping_bag1">
            <div class="shoping_left">
                <h2><a href="#"><img src="../pages/images/gift.jpg">服务</a> <span><%--￥. 25--%></span></h2>
            </div>
            <div class="shoping_right">
                <p>快递 &nbsp;<a href="#">free</a>&nbsp;<span> ￥ 0</span></p>
                <p>其他 &nbsp;<span> ￥ 0</span></p>
                <p>小计 &nbsp;<span> ￥ 0</span></p>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="shoping_bag1">
            <div class="shoping_left">
                <h2><a href="#"><img src="../pages/images/login.jpg">使用 </a> <span> 优惠券</span></h2>
            </div>
            <div class="shoping_right">
                <p>优惠券 &nbsp;<span class="color"> ￥ 0</span></p>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="shoping_bag2">
            <div class="shoping_left"><%--../pages/checkout.jsp--%>
                <a class="btn1" href="${pageContext.request.contextPath}/cart//purchase/checkOrder.do">结算</a>&nbsp;&nbsp;&nbsp;&nbsp;
                <a class="btn1" href="javascript:;" onClick="javascript:history.back(-1);">继续购物</a>&nbsp;&nbsp;&nbsp;&nbsp;
                <%-- <a class="btn1" href="${pageContext.request.contextPath}/book/queryAllBooksbyPage.do?parSortId=1">继续购物</a>--%>
            </div>
            <div class="shoping_right">
                <p class="tot">总计 &nbsp;<span class="color"> ￥ ${sessionScope.totalMoney}</span></p>
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

</body>
</html>
