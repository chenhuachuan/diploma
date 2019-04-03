<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Regist</title>
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
                <h2>用户注册 <span> 创建TF-Book账户</span></h2>
                <a href="#">
                    <div class="reg_fb"><img src="images/facebook.png" alt=""><i>填写注册信息</i>
                        <div class="clearfix"></div>
                    </div>
                </a>

                <div class="registration_form">
                    <!-- Form -->
                    <form id="regist_form" action="${pageContext.request.contextPath}/user/userRegist.do" method="post"
                          onsubmit="return checkFormRg()">
                        <div>
                            <label>
                                <input placeholder="姓名:" type="text" name="userName" tabindex="1" required autofocus>
                            </label>
                        </div>
                        <div>
                            <label>
                                <input placeholder="昵称:" type="text" name="nickName" tabindex="2" required>
                            </label>
                        </div>
                        <div>
                            <label>
                                <input placeholder="电话:" type="text" id="rg_phone" name="phone"
                                       onblur="checkPhoneSize()" tabindex="4" required>
                            </label>
                        </div>
                        <div>
                            <label>
                                <input placeholder="邮箱:" type="email" id="rg_email" name="email"
                                       onblur="checkEmailExists()" tabindex="5" required>
                            </label>
                        </div>
                        <div>
                            <label>
                                <input placeholder="密码" type="password" id="rg_password" name="password"
                                       onblur="checkPassLength()" tabindex="6" required>
                            </label>
                        </div>
                        <div>
                            <label>
                                <input placeholder="确认密码" type="password" id="rg_repassword" onblur="checkRepassword()"
                                       tabindex="7" required>
                            </label>
                        </div>
                        <div class="sky-form">
                            <div class="sky_form1">
                                <ul>
                                    <li><label class="radio left"><input type="radio" name="sex" checked="true"
                                                                         value="m"><i></i>男</label></li>
                                    <li><label class="radio"><input type="radio" name="sex" value="f"><i></i>女</label>
                                    </li>
                                    <div class="clearfix"></div>
                                </ul>
                            </div>
                        </div>
                        <div>
                            <input type="submit" value="创建账户" id="regist-submit">
                        </div>
                        <div class="alert alert-danger" id="tipsDiv" style="text-align: center;display: none;"></div>

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
        /* var send = document.getElementById('regist-submit');
         if (send) {
             send.onclick = function () {
                 //this.innerHTML = '/user/userRegist.do';
             }
         }*/

    })();
</script>


<script type="text/javascript">

    function checkPassLength() {
        var textPassword = $("#rg_password").val();
        if (textPassword.length < 6) {
            $("#tipsDiv").show().attr("class", "alert alert-danger").html("密码长度至少为6位");
            return false;
        } else {
            $("#tipsDiv").show().attr("class", "alert alert-success").html("密码长度合适");
            return true;
        }
    }

    function checkRepassword() {
        var real_pass = $("#rg_password").val();
        var repeat_pass = $("#rg_repassword").val();
        if (repeat_pass == '') {
            $("#tipsDiv").show().attr("class", "alert alert-danger").html("请输入密码");
            return false;
        }
        if (real_pass == repeat_pass && real_pass != '') {
            $("#tipsDiv").show().attr("class", "alert alert-success").html("两次输入一致");
            return true;
        } else {
            $("#tipsDiv").show().attr("class", "alert alert-danger").html("请再次输入密码");
            $("#rg_repassword").val("");
            return false;
        }
    }

    function checkPhoneSize() {
        var textPhone = $("#rg_phone").val();
        var myreg = /^(((13[0-9]{1})|(14[0-9]{1})|(17[0]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-9]{1}))+\d{8})$/;
        if (textPhone.length > 11 || textPhone.length < 11) {
            $("#tipsDiv").show().attr("class", "alert alert-danger").html("电话号码长度为11");
            $("#rg_phone").val("");
            return false;
        } else if (!myreg.test(textPhone)) {
            $("#tipsDiv").show().attr("class", "alert alert-danger").html("请输入有效的手机号");
            $("#rg_phone").val("");
            return false;
        } else {
            $("#tipsDiv").hide();
            return true;
        }

    }

    function checkEmailExists() {
        var textEmail = $("#rg_email").val();
        var emailObj = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$");
        if (textEmail == "") {
            $("#tipsDiv").show().attr("class", "alert alert-danger").html("邮箱不能为空!");
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
                        $("#tipsDiv").show().attr("class", "alert alert-danger").empty().html("此邮箱已经被注册");
                    } else {
                        $("#tipsDiv").show().attr("class", "alert alert-success").empty().html("此邮箱可使用");
                    }
                }
            });
            return true;
        } else {
            //不通过
            $("#tipsDiv").show().html("邮箱格式不正确，请重新输入！");
            $("#rg_email").val("");
            return false;
        }
    }

    function checkFormRg() {
        if (checkEmailExists() && checkRepassword() && checkPassLength() && checkPhoneSize()) {
            return true;
        } else {
            $("#tipsDiv").show().attr("class", "alert alert-danger").empty().html("请检查输入信息...");
            return false;
        }
    }

</script>

<!-- script-for-nav -->
<script>
    $("span.menu").click(function () {
        $(".head-nav ul").slideToggle(300, function () {
            // Animation complete.
        });
    });
</script>
<!-- script-for-nav -->
</body>
</html>