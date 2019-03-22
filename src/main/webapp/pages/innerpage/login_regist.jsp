<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--登录注册--%>
<div class="top_right">
    <ul>
        <li><a href="../pages/contact.jsp"><span class="label label-info">联系我们</span></a></li>
        |
        <c:if test="${sessionScope.CurrentUser!=null}">
            <c:set var="userNick_name" value="${sessionScope.CurrentUser.nickName}"/>
            <li><span class="label label-success">${userNick_name}</span></li>
            <li>&nbsp;&nbsp;&nbsp;&nbsp;<a href="">欢迎光临TF-Book网上书城</a></li>
            |
            <li><a href="${pageContext.request.contextPath}/user/logout.do"> <span class="label label-info">退出登录</span></a>
            </li>
        </c:if>
        <c:if test="${sessionScope.CurrentUser==null}">
            <li><a href="../pages/regist.jsp"><span class="label label-info">注册 </span></a></li>
            |
            <li class="login">
                <div id="loginContainer"><a href="#" id="loginButton"><span class="label label-info">登录</span></a>

                    <div id="loginBox">
                        <form id="loginForm" method="post" action="${pageContext.request.contextPath}/user/userLogin.do"
                              onsubmit="return checkForm()">
                            <fieldset id="body">
                                <fieldset>
                                    <label for="email">邮箱</label>
                                    <input type="text" name="email" id="email" onblur="checkEmail()">
                                </fieldset>
                                <fieldset>
                                    <label for="password">密码</label>
                                    <input type="password" name="password" id="password" onblur="checkPassword()">
                                </fieldset>
                                <input type="submit" id="login" value="登录">

                                    <%--  <label for="checkbox"><input type="checkbox" id="checkbox"> <i>记住密码</i></label>--%>
                            </fieldset>
                            <span><a href="#">忘记密码?</a></span>
                            <div class="alert alert-danger" id="emailInfo"
                                 style="text-align: center;display: none;"></div>

                            <div class="alert alert-danger" id="emailInfo_error"
                                 style="text-align: center;display: none;">
                                <c:if test="${sessionScope.loginErrorInfo!=null}">
                                    <c:set var="login_error_info" value="${sessionScope.loginErrorInfo}"/>
                                    <script>
                                        $("#emailInfo_error").show();
                                        alert("${login_error_info}");
                                    </script>

                                </c:if>
                            </div>
                        </form>
                    </div>

                </div>
            </li>
        </c:if>
    </ul>
</div>


<script type="text/javascript">
    function checkEmail() {
        var textEmail = $("#email").val();
        var emailObj = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$");
        if (textEmail == "") {
            $("#emailInfo").show().html("邮箱不能为空!");
            return false;
        } else if (emailObj.test(textEmail)) {
            //通过
            $("#emailInfo").attr("class", "alert alert-success").html("邮箱格式正确");
            return true;
        } else {
            //不通过
            $("#emailInfo").show().html("邮箱格式不正确，请重新输入！");
            return false;
        }
    }

    function checkPassword() {
        var textPsw = $("#password").val();
        if (textPsw == "") {
            $("#emailInfo").show().attr("class", "alert alert-danger").empty().html("密码不能为空");
            return false;
        } else if (textPsw.length < 6) {
            $("#emailInfo").show().attr("class", "alert alert-danger").empty().html("密码长度不足6位");
            return false;
        } else {
            //正确
            $("#emailInfo").hide();
            return true;
        }
    }

    function checkForm() {
        if (checkEmail() && checkPassword()) {
            return true;
        } else {
            $("#emailInfo").show().attr("class", "alert alert-danger").empty().html("请填写邮箱和密码后再登录...");
            return false;
        }
    }


</script>