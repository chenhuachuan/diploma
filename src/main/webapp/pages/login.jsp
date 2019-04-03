<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Login</title>
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
                    //alert('Callback example:\nYou clicked on an image with the anchor: "'+image_anchor+'"\n(in Etalage instance: "'+instance_id+'")');
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
        $("#page_load_contrller_categr_div").load('${pageContext.request.contextPath}/category/all_category_name.do');
    </script>
</div>
<%--
	<div class="head-bann">
		<div class="container">
			<div class="head-nav">
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
        <!-- start registration -->
        <div class="registration">
            <div class="registration_left">
                <h2>用户登录</h2>
                <a href="#">
                    <div class="reg_fb"><img src="images/facebook.png" alt=""><i>填写登录信息</i>
                        <div class="clearfix"></div>
                    </div>
                </a>
                <div class="registration_form">
                    <!-- Form -->
                    <form id="regist_form" action="${pageContext.request.contextPath}/user/userLogin.do" method="post"
                          onsubmit="return checkFormLg()">
                        <div>
                            <label>
                                <input placeholder="邮箱:" type="email" id="lg_email" name="email"
                                       onblur="checkEmailExistsLg()" tabindex="5" required>
                            </label>
                        </div>
                        <div>
                            <label>
                                <input placeholder="密码" type="password" id="lg_password" name="password"
                                       onblur="checkPassLengthLg()" tabindex="6" required>
                            </label>
                        </div>
                        <div>
                            <input type="submit" value="登录" id="login-submit">
                        </div>
                        <div class="alert alert-danger" id="tipsDiv" style="text-align: center;display: none;"></div>
                        <c:if test="${sessionScope.loginErrorInfo!=null}">
                            <c:set var="login_error_info" value="${sessionScope.loginErrorInfo}"/>
                            <script>
                                alert("${login_error_info}");
                            </script>

                        </c:if>
                    </form>
                    <!-- /Form -->
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
        <!-- end registration -->
    </div>

</div>
<!-- footer -->
<div class="footer">
    <div class="container">
        <p>Copyright &copy; 2019.chenhc All rights reserved !</p>
    </div>
</div>
<!-- footer -->

<script>
    (function () {
        var inputs = document.createElement('input');
        var supports = {};
        supports.autofocus = 'autofocus' in inputs;
        supports.required = 'required' in inputs;
        supports.placeholder = 'placeholder' in inputs;
        if (!supports.autofocus) {
        }
        if (!supports.required) {
        }
        if (!supports.placeholder) {
        }
        var send = document.getElementById('login-submit');
        if (send) {
            send.onclick = function () {
                this.innerHTML = '${pageContext.request.contextPath}/user/userLogin.do';
            }
        }
    })();
</script>

<script type="text/javascript">
    $(function () {
        if (${sessionScope.forceLogin!=null}) {
            alert("请输入邮箱和密码登录");
        }
    })

    function checkPassLengthLg() {
        var textPassword = $("#lg_password").val();
        var textEmail = $("#lg_email").val();
        if (textEmail == "") {
            $("#tipsDiv").show().attr("class", "alert alert-danger").html("邮箱不能为空!");
            $("#lg_password").val("");
            return false;
        } else {
            if (textPassword.length < 6) {
                $("#tipsDiv").show().attr("class", "alert alert-danger").html("密码长度至少为6位");
                return false;
            } else {
                $("#tipsDiv").show().attr("class", "alert alert-success").html("密码长度合适");
                return true;
            }
        }

    }

    function checkEmailExistsLg() {
        var textEmail = $("#lg_email").val();
        var emailObj = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$");
        if (textEmail == "") {
            $("#tipsDiv").show().attr("class", "alert alert-danger").html("邮箱不能为空!");
            return false;
        } else if (emailObj.test(textEmail)) {
            //通过
            $("#tipsDiv").show().attr("class", "alert alert-success").empty().html("邮箱格式正确");
            return true;
        } else {
            //不通过
            $("#tipsDiv").show().attr("class", "alert alert-danger").html("邮箱格式不正确，请重新输入！");
            $("#lg_email").val("");
            return false;
        }
    }

    function checkFormLg() {
        if (checkEmailExistsLg() && checkPassLengthLg()) {
            return true;
        } else {
            $("#tipsDiv").show().attr("class", "alert alert-danger").empty().html("请检查输入信息...");
            return false;
        }
    }

</script>

</body>
</html>