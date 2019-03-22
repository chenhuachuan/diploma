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
    <link rel="stylesheet" href="css/etalage.css">
    <script src="js/jquery.easydropdown.js"></script>
    <script src="js/menu_jquery.js"></script>
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

<!-- megamenu -->
<script type="text/javascript" src="js/megamenu.js"></script>
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
            <h4><img src="images/small.jpg">my shopping shoe / <span> 11 item</span></h4>
            <ul class="s_art">
                <li><img src="images/art1.png"></li>
                <li><span> 11 item</span></li>
            </ul>
            <div class="clearfix"></div>
        </div>
        <div class="shoping_bag1">
            <div class="shoping_left">
                <div class="shoping1_of_1">
                    <img src="images/7.jpg" class="img-responsive" alt=""/>
                </div>
                <div class="shoping1_of_2">
                    <h4><a href="#">men runnig shoe</a></h4>
                    <span>size <b>xl</b>&nbsp;&nbsp; qty <b>1</b> | code :1175</span>
                    <ul class="s_icons">
                        <li><a href="#"><img src="images/s_icon1.png" alt=""></a></li>
                        <li><a href="#"><img src="images/s_icon2.png" alt=""></a></li>
                        <li><a href="#"><img src="images/s_icon3.png" alt=""></a></li>
                    </ul>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="shoping_right">
                <p>35% off &nbsp;<span> Rs. 1,899</span></p>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="shoping_bag1">
            <div class="shoping_left">
                <h2><a href="#"><img src="images/gift.jpg">gift wrap </a> <span> for rs. 25</span></h2>
            </div>
            <div class="shoping_right">
                <p>sub total &nbsp;<span> Rs. 1,899</span></p>
                <p>vat collected &nbsp;<span> Rs. 91</span></p>
                <p>delivery &nbsp;<a href="#">free</a>&nbsp;<span> Rs. 0</span></p>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="shoping_bag1">
            <div class="shoping_left">
                <h2><a href="#"><img src="images/login.jpg">login </a> <span> to apply coupons</span></h2>
            </div>
            <div class="shoping_right">
                <p>coupon discount &nbsp;<span class="color"> Rs. 0</span></p>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="shoping_bag2">
            <div class="shoping_left">
                <a class="btn1" href="details.jsp">place order</a>
            </div>
            <div class="shoping_right">
                <p class="tot">total &nbsp;<span class="color"> Rs. 2,109</span></p>
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
