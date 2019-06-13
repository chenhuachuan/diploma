<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Login</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${pageContext.request.contextPath}/pages/css/bootstrap.css" rel="stylesheet" type="text/css"
          media="all">
    <script src="${pageContext.request.contextPath}/bgpages/js/jquery-3.2.1.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-1.10.1.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/pages/js/menu_jquery.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>

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
                }
            });

        });
    </script>
    <script>$(document).ready(function () {
        $(".megamenu").megamenu();
    });</script>
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
<div class="container">
    <div class="main" style="background-color: rgba(210,206,231,0.63);">
        <!-- start registration -->
        <div class="registration" style="text-align: center" id="user_login_div">
            <div class="registration_left" style="background-color: rgba(170,207,255,0.87);">
                <h2 style="color: rgba(255,100,34,0.87);font-weight: bolder">用户登录</h2>
                <a href="#">
                    <div class="reg_fb"><i>填写登录信息</i>
                        <div class="clearfix"></div>
                    </div>
                </a>
                <div class="registration_form">
                    <!-- Form -->
                    <form id="login_form" action="${pageContext.request.contextPath}/user/userLogin.do" method="post"
                          onsubmit="return checkFormLg()">
                        <div class="col-md-offset-2">
                            <label>
                                <input placeholder="邮箱:" type="email" id="lg_email" name="email" style="width: 320px;"
                                       onblur="checkEmailExistsLg()" tabindex="5" required>
                            </label>
                        </div>
                        <div class="col-md-offset-2">
                            <label>
                                <input placeholder="密码" type="password" id="lg_password" name="password"
                                       style="width: 320px;"
                                       onblur="checkPassLengthLg()" tabindex="6" required>
                            </label>
                        </div>
                        <div class="col-md-3"></div>
                        <div class="col-md-3">
                            <input class="col-sm-8" type="submit" value="登录">
                        </div>
                        <div class="col-md-6">
                            <a class="col-sm-4 sbton" href="../pages/regist.jsp">注册</a>
                        </div>
                        <span>
                            <a id="forget_password" onclick="forgetMyPassword()" href="javascript:void(0)">忘记密码？</a>
                        </span>
                        <div class="col-md-12">
                            <div class="alert alert-danger" id="tipsDiv"
                                 style="text-align: center;display: none; "></div>
                        </div>

                        <%
                            Object flat24 = session.getAttribute("loginErrorInfo");         // 获取错误属性
                            if (flat24 != null) {
                        %>
                        <script type="text/javascript" language="javascript">
                            alert("<%=flat24%>");                                            // 弹出错误信息
                            //window.location='userlogin.html' ;                            // 跳转到登录界面
                        </script>
                        <%
                            }
                            session.removeAttribute("loginErrorInfo");
                        %>

                    </form>
                    <!-- /Form -->
                </div>
            </div>
            <div class="registration_right">
                <img src="../image/lb/11.jpg" height="310px;" width="500px;" alt="">
            </div>
            <div class="clearfix"></div>
        </div>
        <!-- end registration -->

        <!-- start find password -->
        <div class="registration" style="text-align: center;display:none" id="find_pwd_div">
            <div class="registration_left" style="background-color: rgba(170,207,255,0.87);">
                <h2 style="color: rgba(255,100,34,0.87);font-weight: bolder">找回密码</h2>
                <a href="#">
                    <div class="reg_fb"><i>填写信息</i>
                        <div class="clearfix"></div>
                    </div>
                </a>
                <div class="registration_form">
                    <!-- Form -->
                    <form id="find_pwd_form" action="${pageContext.request.contextPath}/user/findUserPdw.do"
                          method="post"
                          onsubmit="return checkFormLg2()">
                        <div class="col-md-offset-2">
                            <label>
                                <input placeholder="邮箱:" type="email" id="find_email" name="email" style="width: 320px;"
                                       onblur="checkEmailExistsLg2()" tabindex="1" required>
                            </label>
                        </div>
                        <div class="col-md-offset-2">
                            <label>
                                <input placeholder="新密码" type="password" id="old_password" name="password"
                                       style="width: 320px;"
                                       onblur="checkPassLengthLg2()" tabindex="2" required>
                            </label>
                        </div>
                        <div class="col-md-offset-2">
                            <label>
                                <input placeholder="确认密码" type="password" id="qr_password" name="rpassword"
                                       style="width: 320px;"
                                       onblur="checkRepasswordIsRight()" tabindex="3" required>
                            </label>
                        </div>
                        <div class="col-md-3"></div>
                        <div class="col-md-3">
                            <input class="col-sm-8" type="submit" value="确定修改">
                        </div>
                        <div class="col-md-6">
                            <a class="col-sm-4 sbton" href="../pages/login.jsp">返回</a>
                        </div>
                        <div class="col-md-12">
                            <div class="alert alert-danger" id="tipsDiv_forget"
                                 style="text-align: center;display: none; "></div>
                        </div>
                        <%
                            Object flat = session.getAttribute("findPwdStatus");         // 获取错误属性
                            if (flat == "success") {
                        %>
                        <script type="text/javascript" language="javascript">
                            alert("<%="修改成功，请重新登录"%>");                                            // 弹出错误信息
                            //window.location='userlogin.html' ;                            // 跳转到登录界面
                        </script>
                        <%
                            }
                            session.removeAttribute("findPwdStatus");
                        %>
                        <%
                            Object flat2 = session.getAttribute("findPwdStatus");         // 获取错误属性
                            if (flat2 == "fail") {
                        %>
                        <script type="text/javascript" language="javascript">
                            alert("<%="系统维护中，请稍后重试"%>");                                            // 弹出错误信息
                            //window.location='userlogin.html' ;                            // 跳转到登录界面
                        </script>
                        <%
                            }
                            session.removeAttribute("findPwdStatus");
                        %>
                    </form>
                    <!-- /Form -->
                </div>
            </div>
            <div class="registration_right">
                <img src="../image/lb/11.jpg" height="370px;" width="500px;" alt="">
            </div>
            <div class="clearfix"></div>
        </div>
        <!-- end find password -->


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

<%
    Object flat5 = session.getAttribute("forceLogin");         // 获取错误属性
    if (flat5 != null) {
%>
<script type="text/javascript" language="javascript">
    alert("<%="请输入邮箱和密码登录"%>");                                            // 弹出错误信息
    //window.location='userlogin.html' ;                            // 跳转到登录界面
</script>
<%
    }
    //session.removeAttribute("forceLogin");
%>


<script type="text/javascript">
    //忘记密码
    function forgetMyPassword() {
        $("#user_login_div").css("display", "none");
        $("#find_pwd_div").css("display", "");
    }

    function checkRepasswordIsRight() {
        var oldPass = $("#old_password").val();
        var newPass = $("#qr_password").val();
        if (oldPass != newPass) {
            $("#tipsDiv_forget").show().attr("class", "alert alert-danger").html("两次密码不一致，请重新输入!");
            $("#qr_password").val("");
        } else {
            $("#tipsDiv_forget").hide();
        }
    }

    function checkEmailExistsLg2() {
        var textEmail = $("#find_email").val();
        var emailObj = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$");
        if (textEmail == "") {
            $("#tipsDiv_forget").show().attr("class", "alert alert-danger").html("邮箱不能为空!");
            return false;
        } else if (emailObj.test(textEmail)) {
            //通过
            $.ajax({
                type: 'post',
                url: '${pageContext.request.contextPath}/user/emailExists.do',
                data: 'email=' + textEmail,
                dataType: 'text',
                success: function (result) {
                    if (result == "yes") {
                        $("#tipsDiv_forget").show().attr("class", "alert alert-success").empty().html("OK");
                    } else {
                        $("#tipsDiv_forget").show().attr("class", "alert alert-danger").empty().html("该邮箱未注册,请重新输入");
                        $("#find_email").val("");
                    }
                }
            });
            return true;
        } else {
            //不通过
            $("#tipsDiv_forget").show().attr("class", "alert alert-danger").html("邮箱格式不正确，请重新输入！");
            $("#find_email").val("");
            return false;
        }
    }


    function checkPassLengthLg2() {
        var textPassword = $("#old_password").val();
        var textEmail = $("#find_email").val();
        if (textEmail == "") {
            $("#tipsDiv_forget").show().attr("class", "alert alert-danger").html("邮箱不能为空!");
            $("#old_password").val("");
            return false;
        } else {
            if (textPassword.length < 6) {
                $("#tipsDiv_forget").show().attr("class", "alert alert-danger").html("密码长度至少为6位");
                $("#old_password").val("");
                return false;
            } else {
                $("#tipsDiv_forget").show().attr("class", "alert alert-success").html("密码长度合适");
                return true;
            }
        }

    }

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

    function checkFormLg2() {
        if (checkEmailExistsLg2() && checkPassLengthLg2()) {
            return true;
        } else {
            $("#tipsDiv_forget").show().attr("class", "alert alert-danger").empty().html("请检查输入信息...");
            return false;
        }
    }

</script>

</body>
</html>