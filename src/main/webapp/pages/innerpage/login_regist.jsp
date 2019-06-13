<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--登录注册--%>
<div class="top_right">
    <ul>
        <li><a href="${pageContext.request.contextPath}/pages/contact.jsp"><span
                class="label label-info">联系我们</span></a></li>
        |
        <c:if test="${sessionScope.CurrentUser!=null}">
            <c:set var="userNick_name" value="${sessionScope.CurrentUser.userName}"/>
            <li>&nbsp;&nbsp;&nbsp;&nbsp;<a href="">欢迎您：</a></li>
            <li><span class="label label-success">${userNick_name}</span></li>
            |
            <li><a href="${pageContext.request.contextPath}/user/logout.do"> <span class="label label-info">退出登录</span></a>
            </li>
            |
            <li><a href="${pageContext.request.contextPath}/user/person/personalCenter.do"><span
                    class="label label-info">个人中心</span></a></li>
            |
            <li><a href="${pageContext.request.contextPath}/user/person/favoriteBooks.do"><span
                    class="label label-info">我的收藏</span></a></li>

        </c:if>
        <c:if test="${sessionScope.CurrentUser==null}">
            <li><a href="../pages/regist.jsp"><span class="label label-info">注册 </span></a></li>
            |
            <li><a href="../pages/login.jsp"><span class="label label-info">登录 </span></a></li>
            |
            <li><a href="${pageContext.request.contextPath}/user/person/personalCenter.do"><span
                    class="label label-info">个人中心</span></a></li>
            |
            <li><a href="${pageContext.request.contextPath}/user/person/favoriteBooks.do"><span
                    class="label label-info">我的收藏</span></a></li>
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