<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>个人信息</title>
    <link href="${pageContext.request.contextPath}/pages/css/bootstrap.css" rel="stylesheet" type="text/css"
          media="all">
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/pages/css/style.css" rel="stylesheet" type="text/css" media="all"/>
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/pages/js/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/pages/js/easing.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/pages/css/flexslider.css" type="text/css"
          media="screen"/>
    <link href="${pageContext.request.contextPath}/pages/css/megamenu.css" rel="stylesheet" type="text/css"
          media="all"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/pages/css/etalage.css">
    <script src="${pageContext.request.contextPath}/pages/js/jquery.easydropdown.js"></script>
    <script src="${pageContext.request.contextPath}/pages/js/menu_jquery.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
    <!-- etale -->
    <script src="${pageContext.request.contextPath}/pages/js/jquery.etalage.min.js"></script>
    <script src="${pageContext.request.contextPath}/pages/js/home.js"></script>
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

    <script type="text/javascript" src="${pageContext.request.contextPath}/pages/js/jquery.jscrollpane.min.js"></script>
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
                    <a href="home.jsp"><img src="${pageContext.request.contextPath}/image/lb/logo_v3.jpg" alt=""/></a>
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
<!-- header -->
<div class="container">
    <div class="main" style="background-color: rgba(210,206,231,0.63);">
        <!-- start registration -->
        <div class="registration" style="text-align: center">
            <div class="registration_left" style="background-color: rgba(170,207,255,0.87);width:500px;">
                <h3 style="margin-top: 5px;">个人信息</h3>
                <div class="registration_form">
                    <!-- Form -->
                    <form id="user_info_form" action="${pageContext.request.contextPath}/user/updateUserInfo.do"
                          method="post"
                          onsubmit="return checkFormUser()">
                        <div class="col-md-offset-2">
                            <label>
                                <input placeholder="姓名:" class="form-control" type="text" name="userName"
                                       id="userName_info" value="${userInfo_p.userName}" tabindex="1"
                                       style="width: 320px;"
                                       required readonly autofocus>
                            </label>
                        </div>
                        <div class="col-md-offset-2">
                            <label>
                                <input placeholder="昵称:" class="form-control" type="text" name="nickName"
                                       id="nickName_info" value="${userInfo_p.nickName}" tabindex="2"
                                       style="width: 320px;"
                                       required readonly>
                            </label>
                        </div>
                        <div class="col-md-offset-2">
                            <label>
                                <input placeholder="电话:" class="form-control" type="text" id="phone_info" name="phone"
                                       value="${userInfo_p.phone}" style="width: 320px;"
                                       onblur="checkPhoneSize_user()" tabindex="4" required readonly>
                            </label>
                        </div>
                        <div class="col-md-offset-2">
                            <label>
                                <input placeholder="邮箱:" class="form-control" type="email" id="email_info" name="email"
                                       value="${userInfo_p.email}" style="width: 320px;"
                                       onblur="checkEmailExistsLg()" tabindex="5" readonly required>
                            </label>
                        </div>
                        <div class="col-md-offset-2" style="display: none;">
                            <label>
                                <input placeholder="生日" class="form-control" type="text" id="birthdate_info"
                                       name="birthdate" value="${userInfo_p.birthdate}"
                                       style="width: 320px;" readonly required>
                            </label>
                        </div>
                        <div class="sky-form col-md-offset-2">
                            <div class="sky_form1">
                                <ul>
                                    <c:if test="${userInfo_p.sex=='m'}">
                                        <li>
                                            <label class="radio left"><input type="radio" name="sex" checked="true"
                                                                             value="m"><i></i>男</label>
                                        </li>
                                        <li><label class="radio"><input type="radio" name="sex"
                                                                        value="f"><i></i>女</label>
                                        </li>
                                    </c:if>
                                    <c:if test="${userInfo_p.sex=='f'}">
                                        <li>
                                            <label class="radio left"><input type="radio" name="sex"
                                                                             value="m"><i></i>男</label>
                                        </li>
                                        <li><label class="radio"><input type="radio" name="sex" checked="true"
                                                                        value="f"><i></i>女</label>
                                        </li>
                                    </c:if>
                                    <div class="clearfix"></div>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-3"></div>
                        <div class="col-md-5">
                            <div class="shoping_left">
                                <a class="btn1" href="javascript:;" id="open_update1"
                                   onclick="openQueDingUpdate()">修改</a>
                                <a class="btn1" href="javascript:;" id="queding_update2" style="display: none;"
                                   onclick="showUpdateUserInfoModel()">确定修改</a>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="alert alert-danger" id="tipsDiv"
                                 style="text-align: center;display: none; "></div>
                        </div>
                    </form>
                    <!-- /Form -->
                </div>
            </div>

            <!-- 模态框（Modal） -->
            <div class="modal fade" id="updateUserInfo_modal" tabindex="-1" role="dialog"
                 aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                            <h4 class="modal-title" id="myModalLabel">
                                修改用户信息
                            </h4>
                        </div>
                        <div class="modal-body">
                            确定修改？
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary"
                                    onclick="updateCurrentUserInfo()">确定
                            </button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>
            <!-- end模态框（Modal） -->


            <div class="registration_right" style="background-color: rgba(170,207,255,0.87);width:500px;">
                <h3 style="margin-top: 5px;">地址管理</h3>
                <div class="registration_form">
                    <form id="address_form"
                          action="${pageContext.request.contextPath}/user/person/showOrUpdateAddress.do"
                          method="post" onsubmit="">
                        <table class="table table-hover" style="text-align: center">
                            <thead>
                            <tr>
                                <th style="text-align: center">
                                    <div class="dropdown">
                                        <div class="btn-group dropdown" style="width:110px;" id="dropdown">
                                            <select class="form-control" name="nickAddrId"
                                                    onchange="checkSelectDefalutName()" id="default_address_select">

                                                <c:forEach var="addr" items="${allAddrSort}">
                                                    <option value="${addr.nickAddrId}">${addr.nickAddrName}</option>
                                                </c:forEach>
                                                <option value="new">新增</option>
                                            </select>
                                        </div>
                                    </div>
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr style="text-align: center">
                                <td style="text-align: right">收货人姓名 :</td>
                                <td>
                                    <input type="hidden" name="nickAddrId" id="hidden_nickAddrId_inputId">
                                    <input type="hidden" name="userId" id="hidden_userId_inputId">
                                    <input type="hidden" name="nickAddrName" id="hidden_nickAddrName_inputId">
                                    <input type="hidden" name="addressId" id="hidden_addressId_inputId">
                                    <input type="text" name="receiveName" id="receiveName"
                                           value="" class="form-control" placeholder="必填"
                                           tabindex="1" required autofocus readonly style="width: 350px;">
                                </td>
                            </tr>
                            <tr style="text-align: center" id="query_update_prov">
                                <td style="text-align: right">省 :</td>
                                <td>
                                    <input type="text" name="provNameAddr" id="provName_addr"
                                           value="<%--${addr.provNameAddr}--%>" class="form-control" placeholder="必填"
                                           tabindex="1" required readonly style="width: 350px;">
                                </td>
                            </tr>
                            <tr style="text-align: center" id="query_update_city">
                                <td style="text-align: right">市 :</td>
                                <td>
                                    <input type="text" name="cityNameAddr" id="cityName_addr"
                                           value="<%--${addr.cityNameAddr}--%>" class="form-control" placeholder="必填"
                                           tabindex="1" required readonly autofocus style="width: 350px;">
                                </td>
                            </tr>
                            <tr style="text-align: center" id="query_update_area">
                                <td style="text-align: right">县 :</td>
                                <td>
                                    <input type="text" name="areaNameAddr" id="areaName_addr"
                                           value="<%--${addr.areaNameAddr}--%>" class="form-control" placeholder="必填"
                                           tabindex="1" required readonly autofocus style="width: 350px;">
                                </td>
                            </tr>

                            <tr style="text-align: center;" id="new_addr_select_id">
                                <td style="text-align: right; width:120px;">收货地址:</td>
                                <td>
                                    <div class="dropdown col-lg-3">
                                        <div class="btn-group dropdown" id="dropdown1">
                                            <select class="form-control" onchange="queryAllCityOfProvince()"
                                                    id="prov_select">
                                                <option value="0">请选择</option>
                                            </select>
                                            <input type="hidden" name="provNameAddr" id="this_hidden_provNameAddr"/>
                                        </div>
                                    </div>
                                    <div class="dropdown col-lg-3">
                                        <div class="btn-group dropdown" id="dropdown2">
                                            <select class="form-control" onchange="queryAllAreasOfCity()"
                                                    id="city_select">
                                                <option value="0">请选择</option>
                                            </select>
                                            <input type="hidden" name="cityNameAddr" id="this_hidden_cityNameAddr"/>
                                        </div>
                                    </div>
                                    <div class="dropdown col-lg-3">
                                        <div class="btn-group dropdown" id="dropdown3">
                                            <select class="form-control" id="area_select">
                                                <option value="0">请选择</option>
                                            </select>
                                            <input type="hidden" name="areaNameAddr" id="this_hidden_areaNameAddr"/>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr style="text-align: center">
                                <td style="text-align: right">详细地址 :</td>
                                <td>
                                    <input type="text" name="addrName" value="<%--${addr.addrName}--%>"
                                           id="addrName_addr"
                                           class="form-control" required readonly style="width: 350px;"
                                           placeholder="必填">
                                </td>
                            </tr>
                            <tr style="text-align: center">
                                <td style="text-align: right">手机号码 :</td>
                                <td>
                                    <input type="text" name="receiveTel" value="<%--${addr.receiveTel}--%>"
                                           id="receiveTel_addr" onblur="checkPhoneSize()" class="form-control" required
                                           placeholder="必填" readonly style="width: 350px;">
                                </td>
                            </tr>
                            <tr style="text-align: center">
                                <td style="text-align: right">邮政编码 :</td>
                                <td>
                                    <input type="text" name="zipCode" id="zipCode_addr" value="<%--${addr.zipCode}--%>"
                                           onblur="checkZipCodeSize()" class="form-control" required readonly
                                           placeholder="必填"
                                           style="width: 350px;">
                                </td>
                            </tr>
                            <tr style="text-align: center;display: none;" id="addr_name_new_id">
                                <td style="text-align: right">地址名称 :</td>
                                <td>
                                    <input type="text" name="nickAddrName" id="nickAddr_addr" class="form-control"
                                           style="width: 350px;" placeholder="家、学校、公司......">
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <div class="shoping_bag2">
                            <div class="shoping_left">
                                <a class="btn1" href="javascript:;" style="display: none;" id="add_new"
                                   onclick="submitFormByAdd('add')">添加新地址</a>
                                <a class="btn1" href="javascript:;" id="open_update"
                                   onclick="updateCurrentAddr()">修改</a>
                                <a class="btn1" href="javascript:;" style="display: none;" id="queding_update"
                                   onclick="showUpdateAddrInfoModel()">确定修改</a>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </form>
                    <div class="col-md-12">
                        <div class="alert alert-danger" id="tipsDiv_addr"
                             style="text-align: center;display: none; "></div>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
        <!-- end registration -->
    </div>
    <!-- 模态框（Modal） -->
    <div class="modal fade" id="updateAddrInfo_modal" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel2" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel2">
                        修改收货地址
                    </h4>
                </div>
                <div class="modal-body">
                    确定修改？
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary"
                            onclick="submitFormByAdd('update')">确定
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
    <!-- end模态框（Modal） -->

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

    //展开修改用户信息
    function openQueDingUpdate() {
        $("#open_update1").css("display", "none");
        $("#queding_update2").css("display", "");
        //取消只读
        $("#userName_info").removeAttr("readonly");
        $("#nickName_info").removeAttr("readonly");
        $("#phone_info").removeAttr("readonly");
        $("#email_info").removeAttr("readonly");
        $("#birthdate_info").removeAttr("readonly");
    }

    //弹出提示框
    function showUpdateUserInfoModel() {
        var adde = checkFormUser();
        var userName_info = $("#userName_info").val();
        var nickName_info = $("#nickName_info").val();
        var phone_info = $("#phone_info").val();
        var email_info = $("#email_info").val();
        var birthdate_info = $("#birthdate_info").val();
        if (adde && userName_info != '' && nickName_info != '' && phone_info != '' && email_info != '') {
            $('#updateUserInfo_modal').modal();
        } else {
            $("#tipsDiv").show().attr("class", "alert alert-danger").empty().html("请检查输入信息...");
        }
    }

    //弹出提示框  地址信息  return checkFormAddr()
    function showUpdateAddrInfoModel() {
        var adde = checkFormAddr();
        if (adde) {
            $('#updateAddrInfo_modal').modal();
        } else {
            $("#tipsDiv_addr").show().attr("class", "alert alert-danger").empty().html("请检查输入信息...");
        }

    }

    //确定修改用户信息
    function updateCurrentUserInfo() {
        $('#updateUserInfo_modal').modal('hide');
        var send = document.getElementById('user_info_form');
        send.onclick = function () {
            this.submit();
        }
    }

    function checkEmailExistsLg() {
        var textEmail = $("#email_info").val();
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
            $("#email_info").val("");
            return false;
        }
    }


    function checkPhoneSize_user() {
        var textPhone = $("#receiveTel_addr").val();
        var myreg = /^(((13[0-9]{1})|(14[0-9]{1})|(17[0]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-9]{1}))+\d{8})$/;
        if (textPhone.length > 11 || textPhone.length < 11) {
            $("#tipsDiv").show().attr("class", "alert alert-danger").html("电话号码长度为11");
            $("#receiveTel_addr").val("");
            return false;
        } else if (!myreg.test(textPhone)) {
            $("#tipsDiv").show().attr("class", "alert alert-danger").html("请输入有效的手机号");
            $("#receiveTel_addr").val("");
            return false;
        } else {
            $("#tipsDiv").hide();
            return true;
        }
    }

    function checkFormUser() {
        if (checkEmailExistsLg()) {
            return true;
        } else {
            $("#tipsDiv").show().attr("class", "alert alert-danger").empty().html("请检查输入信息...");
            return false;
        }
    }


    //address info
    //点击是否修改
    function updateCurrentAddr() {
        $("#queding_update").css("display", "");
        $("#open_update").css("display", "none");
        //表单内只读
        $("#receiveName").removeAttr("readonly");
        $("#provName_addr").removeAttr("readonly");
        $("#cityName_addr").removeAttr("readonly");
        $("#areaName_addr").removeAttr("readonly");
        $("#addrName_addr").removeAttr("readonly");
        $("#receiveTel_addr").removeAttr("readonly");
        $("#zipCode_addr").removeAttr("readonly");

    }

    function submitFormByAdd(data) {
        $('#updateAddrInfo_modal').modal('hide');
        if (checkFormAddr() == true) {
            var addr_select_name = $("#default_address_select").val();
            if (addr_select_name == "new") {
                //地址赋值
                var provNameh = $("#prov_select").val();
                var cityNameh = $("#city_select").val();
                var areaNameh = $("#area_select").val();
                $("#this_hidden_provNameAddr").val(provNameh);
                $("#this_hidden_cityNameAddr").val(cityNameh);
                $("#this_hidden_areaNameAddr").val(areaNameh);
            }

            var send = document.getElementById('address_form');
            if (data == 'add') {
                send.onclick = function () {
                    this.submit();
                }
            } else if (data == 'update') {
                send.onclick = function () {
                    this.submit();
                }
            }
        } else {
            $("#tipsDiv_addr").show().attr("class", "alert alert-danger").html("请填写完整地址信息");
        }
    }

    //提交form表单检查 addr
    function checkFormAddr() {
        var receName = $("#receiveName").val();
        var recePhone = $("#receiveTel_addr").val();
        var detailAddr = $("#addrName_addr").val();

        if (checkZipCodeSize() && checkPhoneSize() && receName != "" && recePhone != "" && detailAddr != "") {
            return true;
        } else {
            return false;
        }
    }

    function checkPhoneSize() {
        var textPhone = $("#receiveTel_addr").val();
        var myreg = /^(((13[0-9]{1})|(14[0-9]{1})|(17[0]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-9]{1}))+\d{8})$/;
        if (textPhone.length > 11 || textPhone.length < 11) {
            $("#tipsDiv_addr").show().attr("class", "alert alert-danger").html("电话号码长度为11");
            $("#receiveTel_addr").val("");
            return false;
        } else if (!myreg.test(textPhone)) {
            $("#tipsDiv_addr").show().attr("class", "alert alert-danger").html("请输入有效的手机号");
            $("#receiveTel_addr").val("");
            return false;
        } else {
            $("#tipsDiv_addr").hide();
            return true;
        }
    }

    function checkZipCodeSize() {
        var zipCode_addr = $("#zipCode_addr").val();
        var zipINdd = /^[0-9]{6}$/;
        if (zipCode_addr.length != 6) {
            $("#tipsDiv_addr").show().attr("class", "alert alert-danger").html("邮政编码长度为6");
            $("#zipCode_addr").val("");
            return false;
        } else if (!zipINdd.test(zipCode_addr)) {
            $("#tipsDiv_addr").show().attr("class", "alert alert-danger").html("请输入有效的邮箱");
            $("#zipCode_addr").val("");
            return false;
        } else {
            $("#tipsDiv_addr").hide();
            return true;
        }
    }


    //收货地址 省市县
    $(function () {
        //省·
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/cascade/allProvinces.do",
            dataType: 'json',
            cache: false,
            success: function (data) {
                $("#city_select").empty().append("<option value=''>" + '请选择' + "</option>");
                $("#area_select").empty().append("<option value=''>" + '请选择' + "</option>");
                $.each(data, function (k, v) {
                    var son_option = "<option value='" + v.provCode + "'>" + v.provName + "</option>";
                    $("#prov_select").append(son_option);
                });
            }
        });
    })

    //市
    function queryAllCityOfProvince() {
        $("#city_select").empty().append("<option value=''>" + '请选择' + "</option>");
        $("#area_select").empty().append("<option value=''>" + '请选择' + "</option>");
        var provCode = $("#prov_select").val();
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/cascade/allCities.do',
            data: {provCode: provCode},
            dataType: 'json',
            cache: false,
            success: function (data) {
                $.each(data, function (k, v) {
                    var son_option = "<option value='" + v.cityCode + "'>" + v.cityName + "</option>";
                    $("#city_select").append(son_option);
                });
            }
        });
    }

    //县,区
    function queryAllAreasOfCity() {
        $("#area_select").empty().append("<option value=''>" + '请选择' + "</option>");
        var cityCode = $("#city_select").val();
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/cascade/allAreas.do',
            data: {cityCode: cityCode},
            dataType: 'json',
            cache: false,
            success: function (data) {
                $.each(data, function (k, v) {
                    var son_option = "<option value='" + v.areaCode + "'>" + v.areaName + "</option>";
                    $("#area_select").append(son_option);
                });
            }
        });
    }

    $(function () {
        checkSelectDefalutName();
    });

    //默认地址
    function checkSelectDefalutName() {
        var addr_select_name = $("#default_address_select").val();
        if (addr_select_name == "new") {//新增
            $("#query_update_prov").hide();
            $("#query_update_city").hide();
            $("#query_update_area").hide();
            $("#new_addr_select_id").show();
            $("#addr_name_new_id").show();
            //清空所有收货信息
            $("#hidden_addressId_inputId").val("");
            $("#receiveName").val("");

            $("#provName_addr").val("");
            $("#cityName_addr").val("");
            $("#areaName_addr").val("");

            $("#receiveTel_addr").val("");
            $("#zipCode_addr").val("");
            $("#addrName_addr").val("");
            $("#nickAddr_addr").val("");
            $("#hidden_nickAddrId_inputId").val("");
            $("#hidden_nickAddrName_inputId").val("");
            $("#hidden_userId_inputId").val("");

            //去掉表单内只读
            $("#receiveName").removeAttr("readonly");
            $("#addrName_addr").removeAttr("readonly");
            $("#receiveTel_addr").removeAttr("readonly");
            $("#zipCode_addr").removeAttr("readonly");
            $("#open_update").css("display", "none");
            $("#queding_update").css("display", "none");
            $("#add_new").css("display", "");
        } else {
            //选择旧地址
            $("#query_update_prov").show();
            $("#query_update_city").show();
            $("#query_update_area").show();
            $("#new_addr_select_id").hide();
            $("#addr_name_new_id").hide();
            var nickAddressId = $("#default_address_select option:selected").val();
            var nickAddressName = $("#default_address_select option:selected").text();

            //表单内只读
            $("#receiveName").attr("readonly", "readonly");
            $("#provName_addr").attr("readonly", "readonly");
            $("#cityName_addr").attr("readonly", "readonly");
            $("#areaName_addr").attr("readonly", "readonly");
            $("#addrName_addr").attr("readonly", "readonly");
            $("#receiveTel_addr").attr("readonly", "readonly");
            $("#zipCode_addr").attr("readonly", "readonly");
            $("#open_update").css("display", "");
            $("#queding_update").css("display", "none");
            $("#add_new").css("display", "none");
            if (nickAddressId != "new" || nickAddressId != "0") {

                $.ajax({
                    type: 'post',
                    url: '${pageContext.request.contextPath}/user/queryOneAddress.do',
                    data: {nickAddrId: nickAddressId},
                    dataType: 'json',
                    cache: false,
                    success: function (data) {
                        $("#hidden_addressId_inputId").val(data.addressId);
                        $("#hidden_nickAddrId_inputId").val(data.nickAddrId);
                        $("#hidden_nickAddrName_inputId").val(nickAddressName);
                        //收货人姓名
                        $("#receiveName").val(data.receiveName);
                        $("#hidden_userId_inputId").val(data.userId);
                        $("#provName_addr").val(data.provNameAddr);
                        $("#cityName_addr").val(data.cityNameAddr);
                        $("#areaName_addr").val(data.areaNameAddr);
                        $("#addrName_addr").val(data.addrName);
                        $("#receiveTel_addr").val(data.receiveTel);
                        $("#zipCode_addr").val(data.zipCode);
                    }
                });
            }


        }
    }

    $("span.menu").click(function () {
        $(".head-nav ul").slideToggle(300, function () {
            // Animation complete.
        });
    });
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
        var send = document.getElementById('address-submit');
        if (send) {
            send.onclick = function () {
                //this.innerHTML = '/user/userRegist.do';
            }
        }

    })();


</script>

</body>
</html>