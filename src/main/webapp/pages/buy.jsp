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
    <link rel="stylesheet" href="../pages/css/font-awesome/css/font-awesome.css">
    <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <script src="${pageContext.request.contextPath}/pages/js/jquery-1.10.2.js" type="text/javascript"></script>
    <script type="text/javascript" src="../pages/js/easing.js"></script>
    <link rel="stylesheet" href="../pages/css/flexslider.css" type="text/css" media="screen"/>
    <link href="../pages/css/megamenu.css" rel="stylesheet" type="text/css" media="all"/>
    <link rel="stylesheet" href="../pages/css/etalage.css">
    <link rel="stylesheet" href="../pages/css/common.css">
    <script src="../pages/js/jquery.easydropdown.js"></script>
    <script src="../pages/js/menu_jquery.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>
    <!-- etale -->
    <script src="../pages/js/jquery.etalage.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
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
                    <a href="home.jsp"><img src="../image/lb/logo.png" alt=""/></a>
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
            <h3><img src="../image/lb/car2.jpg">&nbsp;&nbsp;购物车：&nbsp;&nbsp;<span>${sessionScope.totalCartCount}</span>
            </h3>
            <ul class="s_art" style="display: none">
                <li><img src="../pages/images/art1.png"></li>
                <li><span> 11 本</span></li>
            </ul>
            <div class="clearfix"></div>
        </div>
        <c:if test="${sessionScope.showCart==null}">
            <span style="font-size: medium;color: #0da3e2; margin-left: 10px;">购物车居然是空的！</span>
        </c:if>

        <c:if test="${sessionScope.showCart!=null}">
            <c:forEach items="${sessionScope.showCart}" var="map" varStatus="order_item">
                <c:set var="totalPurchaseCount" value="${totalPurchaseCount+map.value.count}"></c:set>
                <div class="shoping_bag1">
                    <div class="shoping_left">
                        <div class="shoping1_of_1">
                            <img src="..${map.value.book.imgUrl}" class="img-responsive" alt=""/>
                        </div>
                        <div class="shoping1_of_2">
                            <h4><a href="#">${map.value.book.bookName}</a></h4>
                            <span style="font-size: medium;display: none;" id="update_purchase_count_span_id">购买数量: &nbsp;
                                <input type="text" value="${map.value.count}" style="width:35px;">
                                &nbsp;&nbsp; | 单价 : ${map.value.book.bookPrice}</span>


                            <div class="row">
                                <span class="col-md-2" style="font-size: medium;" id="purchase_count_span_id">数量:</span>
                                <div class="col-md-push-1">
                                    <div class="input-group col-md-1">
                                                 <span class="input-group-btn">
                                                   <button class="btn btn-default"
                                                           onclick="delBuyCountInBuyPage('${map.value.book.bookId}')"
                                                           style="width:18px;height: 23px;padding: 5%"
                                                           type="button">-</button>
                                                 </span>
                                        <input type="text" id="modify_input_count" style="width:55px;height: 23px;"
                                               value="${map.value.count}"
                                               onblur="setPurchaseCountValue('${map.value.book.bookId}')"
                                               class="form-control" placeholder="0">
                                        <span class="input-group-btn">
                                                   <button class="btn btn-default"
                                                           onclick="addBuyCountInBuyPage('${map.value.book.bookId}')"
                                                           style="width:18px;height: 23px; padding: 5%"
                                                           type="button">+</button>
                                                 </span>
                                    </div>
                                </div>
                                <span class="col-md-4" style="font-size: medium;"
                                      id="">单价 : &nbsp;&nbsp;<b>${map.value.book.bookPrice} </b>元</span>
                            </div>

                            <ul class="s_icons">
                                    <%--<li><a href="javascript:;"><img src="../pages/images/s_icon1.png" onclick="updatePurchaseCount()" alt=""></a></li>
                                    ${pageContext.request.contextPath}/cart/removeFromCart.do?bookId=${map.value.book.bookId}
                                    --%>
                                <li><a href="javascript:void(0)">
                                    <img src="../pages/images/s_icon2.png"
                                         onclick="window.location.href='${pageContext.request.contextPath}/user/person/addWishBook.do?bookId=${map.value.book.bookId}'"
                                         alt=""></a></li>
                                <li><a href="javascript:void(0)" onclick="showRemoveBuyModel()">
                                    <img src="../pages/images/s_icon3.png" alt=""></a></li>
                                <!-- 模态框（Modal） -->
                                <div class="modal fade" id="delBuyBook" tabindex="-1" role="dialog"
                                     aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-hidden="true">
                                                    &times;
                                                </button>
                                                <h4 class="modal-title" id="myModalLabel">
                                                    从购物车移除
                                                </h4>
                                            </div>
                                            <div class="modal-body">
                                                确定删除该商品吗？亲三思哦！
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">算了
                                                </button>
                                                <button type="button" class="btn btn-primary"
                                                        onclick="submitRemoveBuyBook('${map.value.book.bookId}')">忍心删除
                                                </button>
                                            </div>
                                        </div><!-- /.modal-content -->
                                    </div><!-- /.modal -->
                                </div>
                                <!-- end模态框（Modal） -->

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
        </c:if>

        <div class="shoping_bag2">
            <div class="shoping_left"><%--../pages/checkout.jsp--%>
                <c:if test="${sessionScope.showCart!=null}">
                    <a class="btn1" href="${pageContext.request.contextPath}/cart/purchase/checkOrder.do">结算</a>&nbsp;&nbsp;&nbsp;&nbsp;
                    <a class="btn_scan" href="${pageContext.request.contextPath}/pages/home.jsp">继续购物</a>&nbsp;&nbsp;&nbsp;&nbsp;
                </c:if>
                <c:if test="${sessionScope.showCart==null}">
                    <a class="btn1" href="${pageContext.request.contextPath}/pages/home.jsp">去购物</a>&nbsp;&nbsp;&nbsp;&nbsp;
                </c:if>
                <%-- <a class="btn1" href="${pageContext.request.contextPath}/book/queryAllBooksbyPage.do?parSortId=1">继续购物</a>--%>
            </div>
            <c:if test="${sessionScope.showCart!=null}">
                <div class="shoping_right">
                    <p class="tot">总计 &nbsp;<span class="color"> ￥ ${sessionScope.totalMoney}</span></p>
                </div>
            </c:if>
            <div class="clearfix"></div>
        </div>

    </div>
</div>
<script type="text/javascript">

    //修改购买数量
    function setPurchaseCountValue(bookId) {
        var inv = $('#modify_input_count').val();
        var re = /^[0-9]+.?[0-9]*$/; //判断字符串是否为数字 //判断正整数 /^[1-9]+[0-9]*]*$/
        if (!re.test(inv)) {
            //$('#modify_input_count').val(1);
            window.location.href = "${pageContext.request.contextPath}/pages/buy.jsp";

            /* $.post('/cart/modifyBuyPagePurchaseCount.do',
                     {mcount:0,bookId:bookId}

                 );*/
            return false;
        } else {
            var buyCount = $("#modify_input_count").val();
            window.location.href = '${pageContext.request.contextPath}/cart/modifyBuyPagePurchaseCount.do?mcount=' + buyCount + '&bookId=' + bookId;
            /* $.post('/cart/modifyBuyPagePurchaseCount.do',
                 {mcount:buyCount,bookId:bookId}
             );*/
        }
    }

    //购买减一
    function delBuyCountInBuyPage(bid) {
        window.location.href = "${pageContext.request.contextPath}/cart/modifyBuyPagePurchaseCount.do?sbflag=subOne&bookId=" + bid;
        /* $.post('/cart/modifyBuyPagePurchaseCount.do',
             {sbflag:'subOne',bookId:bookId}
         );*/
    }

    //购买加一
    function addBuyCountInBuyPage(bookId) {
        window.location.href = "${pageContext.request.contextPath}/cart/modifyBuyPagePurchaseCount.do?sbflag=addOne&bookId=" + bookId;
    }

    /*
    *点击修改购买数量 old version kill
    * */
    function updatePurchaseCount() {
        $("#purchase_count_span_id").hide();
        $("#update_purchase_count_span_id").show();
    }

    //提示框
    function showRemoveBuyModel() {
        $('#delBuyBook').modal();
    }

    function submitRemoveBuyBook(bookId) {
        $.post(
            '${pageContext.request.contextPath}/cart/removeFromCart.do',
            {bookId: bookId},
            function () {
                $('#delBuyBook').modal('hide');
                window.location.href = "${pageContext.request.contextPath}/pages/buy.jsp";
            }
        );
    }

</script>

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
