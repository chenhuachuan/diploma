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
                    <a href="home.jsp"><img src="../image/lb/logo.png" alt=""/></a>
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

<script>
    $("span.menu").click(function () {
        $(".head-nav ul").slideToggle(300, function () {
        });
    });
</script>

<div class="banner1">
    <div class="container">
    </div>
</div>

<!-- header -->
<!-- content -->
<div class="container"
     style="background-color: rgba(210,206,231,0.63)/*background-image: url('../image/beauty/bg8.jpg');background-repeat: no-repeat;*/">
    <div class="main">
        <div class="contact">
            <div class="contact_info">
                <h2>感谢使用，我们在努力中......</h2>
                <div class="map">
                    <%--  <img src="../image/beauty/bg15.jpg" width="100%" >
                      <iframe width="100%" height="750px;" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"
                              src="../image/beauty/bg15.jpg"></iframe>
                      <br>--%>
                </div>
            </div>
            <div class="col-md-6 pull-left">
                <div class="contact-form" style="background-color: rgba(191,231,222,0.63);">
                    <h2 class="col-md-offset-1">请邮箱联系我</h2>
                <form method="post" action="contact-post.html">
                    <div class="col-md-offset-1">
                        <span><label>姓名</label></span>
                        <span><input name="userName" type="text" style="width: 400px;" class="textbox"></span>
                    </div>
                    <div class="col-md-offset-1">
                        <span><label>E-mail</label></span>
                        <span><input name="userEmail" type="text" style="width: 400px;" class="textbox"></span>
                    </div>
                    <div class="col-md-offset-1">
                        <span><label>电话</label></span>
                        <span><input name="userPhone" type="text" style="width: 400px;" class="textbox"></span>
                    </div>
                    <div class="col-md-offset-1">
                        <span><label>描述您的问题</label></span>
                        <span><textarea name="userMsg" style="width: 400px;"> </textarea></span>
                    </div>
                    <div class="col-md-offset-2">
                        <span><input type="submit" class="" value="提交"></span>
                    </div>
                </form>
            </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-6 pull-right">
                <img src="../image/lb/11.jpg" height="520px;" width="500px;" alt="">
            </div>
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