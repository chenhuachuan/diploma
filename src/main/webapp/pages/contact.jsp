<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Contact Us</title>
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
    <script type="text/javascript" src="js/megamenu.js"></script>
    <script>$(document).ready(function () {
        $(".megamenu").megamenu();
    });</script>
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
                    alert("error");
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

                <%-- 登录注册--%>
                <%@include file="innerpage/login_regist.jsp" %>
                <div class="clearfix"></div>

            </div>
        </div>
    </div>
</div>

<%--分类导航--%>
<div class="head-bann" id="page_load_contrller_contact_div">
    <script type="text/javascript">
        $("#page_load_contrller_contact_div").load('${pageContext.request.contextPath}/category/all_category_name.do');
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
<!-- content -->
<div class="container">
    <div class="main">
        <div class="contact">
            <div class="contact_info">
                <h2>get in touch</h2>
                <div class="map">
                    <iframe width="100%" height="250" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"
                            src="https://maps.google.co.in/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Lighthouse+Point,+FL,+United+States&amp;aq=4&amp;oq=light&amp;sll=26.275636,-80.087265&amp;sspn=0.04941,0.104628&amp;ie=UTF8&amp;hq=&amp;hnear=Lighthouse+Point,+Broward,+Florida,+United+States&amp;t=m&amp;z=14&amp;ll=26.275636,-80.087265&amp;output=embed"></iframe>
                    <br>
                    <small><a
                            href="https://maps.google.co.in/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Lighthouse+Point,+FL,+United+States&amp;aq=4&amp;oq=light&amp;sll=26.275636,-80.087265&amp;sspn=0.04941,0.104628&amp;ie=UTF8&amp;hq=&amp;hnear=Lighthouse+Point,+Broward,+Florida,+United+States&amp;t=m&amp;z=14&amp;ll=26.275636,-80.087265"
                            style="color:#777777;text-align:left;font-size:13px;">View Larger Map</a></small>
                </div>
            </div>
            <div class="contact-form">
                <h2>Contact Us</h2>
                <form method="post" action="contact-post.html">
                    <div>
                        <span><label>Name</label></span>
                        <span><input name="userName" type="text" class="textbox"></span>
                    </div>
                    <div>
                        <span><label>E-mail</label></span>
                        <span><input name="userEmail" type="text" class="textbox"></span>
                    </div>
                    <div>
                        <span><label>Mobile</label></span>
                        <span><input name="userPhone" type="text" class="textbox"></span>
                    </div>
                    <div>
                        <span><label>Subject</label></span>
                        <span><textarea name="userMsg"> </textarea></span>
                    </div>
                    <div>
                        <span><input type="submit" class="" value="Submit us"></span>
                    </div>
                </form>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
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