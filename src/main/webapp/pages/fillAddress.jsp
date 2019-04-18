<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" isErrorPage="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>address</title>
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
    <!-- etale -->
    <script src="${pageContext.request.contextPath}/pages/js/jquery.etalage.min.js"></script>
    <script src="${pageContext.request.contextPath}/pages/js/home.js"></script>
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
                    <a href="home.jsp"><img src="${pageContext.request.contextPath}/image/lb/logo.png" alt=""/></a>
                </div>
                <%-- user login and regsit jsp--%>
                <%@include file="innerpage/login_regist.jsp" %>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>

<!-- megamenu -->
<script type="text/javascript" src="${pageContext.request.contextPath}/pages/js/megamenu.js"></script>
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
<!-- header end -->

<div class="banner1">
    <div class="container">
    </div>
</div>

<!-- header -->
<div class="container">
    <div class="main">
        <div class="shoping_bag">
            <h3><img src="${pageContext.request.contextPath}/pages/images/icon_addr.jpg">填写地址：<span></span></h3>
        </div>
        <div class="clearfix"></div>
        <%--尽情展示你的才华--%>
        <div class="col-lg-8">
            <div class="registration_form">

                <%--  <c:forEach items="${UserAddress}" var="addr">--%>

                <form id="address_form"
                      action="${pageContext.request.contextPath}/cart/purchase/addAddressAndConfirmOrder.do"
                      method="post" onsubmit="return checkFormAddr()">
                    <table class="table table-hover" style="text-align: center">
                        <thead>
                        <tr>
                            <th style="text-align: center">
                                <div class="dropdown">
                                    <div class="btn-group dropdown" style="width:110px;" id="dropdown">
                                        <select class="form-control" name="nickAddrId"
                                                onchange="checkSelectDefalutName()" id="default_address_select">
                                            <option value="new">新增-Add</option>
                                            <c:forEach var="addr" items="${allAddrSort}">
                                                <option value="${addr.nickAddrId}">${addr.nickAddrName}</option>
                                            </c:forEach>
                                            <%-- <option value="${addr.nickAddrId}">&lt;%&ndash;${addr.nickAddrName}&ndash;%&gt;</option>--%>
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
                                       value="<%--${addr.receiveName}--%>" class="form-control" placeholder="必填"
                                       tabindex="1" required autofocus style="width: 415px;">
                            </td>
                        </tr>
                        <tr style="text-align: center" id="query_update_prov">
                            <td style="text-align: right">省 :</td>
                            <td>
                                <input type="text" name="provNameAddr" id="provName_addr"
                                       value="<%--${addr.provNameAddr}--%>" class="form-control" placeholder="必填"
                                       tabindex="1" required style="width: 415px;">
                            </td>
                        </tr>
                        <tr style="text-align: center" id="query_update_city">
                            <td style="text-align: right">市 :</td>
                            <td>
                                <input type="text" name="cityNameAddr" id="cityName_addr"
                                       value="<%--${addr.cityNameAddr}--%>" class="form-control" placeholder="必填"
                                       tabindex="1" required autofocus style="width: 415px;">
                            </td>
                        </tr>
                        <tr style="text-align: center" id="query_update_area">
                            <td style="text-align: right">县 :</td>
                            <td>
                                <input type="text" name="areaNameAddr" id="areaName_addr"
                                       value="<%--${addr.areaNameAddr}--%>" class="form-control" placeholder="必填"
                                       tabindex="1" required autofocus style="width: 415px;">
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
                                        <select class="form-control" onchange="queryAllAreasOfCity()" id="city_select">
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
                                <input type="text" name="addrName" value="<%--${addr.addrName}--%>" id="addrName_addr"
                                       class="form-control" required style="width: 415px;" placeholder="必填">
                            </td>
                        </tr>
                        <tr style="text-align: center">
                            <td style="text-align: right">手机号码 :</td>
                            <td>
                                <input type="text" name="receiveTel" value="<%--${addr.receiveTel}--%>"
                                       id="receiveTel_addr" onblur="checkPhoneSize()" class="form-control" required
                                       placeholder="必填" style="width: 415px;">
                            </td>
                        </tr>
                        <tr style="text-align: center">
                            <td style="text-align: right">邮政编码 :</td>
                            <td>
                                <input type="text" name="zipCode" id="zipCode_addr" value="<%--${addr.zipCode}--%>"
                                       onblur="checkZipCodeSize()" class="form-control" required placeholder="必填"
                                       style="width: 415px;">
                            </td>
                        </tr>
                        <tr style="text-align: center;display: none;" id="addr_name_new_id">
                            <td style="text-align: right">地址名称 :</td>
                            <td>
                                <input type="text" name="nickAddrName" id="nickAddr_addr" class="form-control"
                                       style="width: 415px;" placeholder="家、学校、公司......">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="alert alert-danger col-lg-8" id="tipsDiv"
                         style="text-align: center;display: none;"></div>
                    <div>

                    </div>
                    <div class="shoping_bag2">

                        <div class="shoping_left">
                            <%--<input type="submit" value="确定" id="address-submit">
                            <input type="submit" value="修改" id="addressu-submit">--%>
                            <a class="btn1" href="javascript:;" onclick="submitFormByAdd('add')">确定</a>&nbsp;&nbsp;&nbsp;&nbsp;
                            <a class="btn1" href="javascript:;" onclick="submitFormByAdd('update')">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;
                            <a class="btn1" href="javascript:;" onClick="javascript:history.back(-1);">查看订单</a>&nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </form>
                <%--   </c:forEach>--%>
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

<!-- script-for-nav -->
<script>
    function submitFormByAdd(data) {
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
            $("#tipsDiv").show().attr("class", "alert alert-danger").html("请填写完整地址信息");
        }
    }

    //document.getElementById('address_form').submit();return false


    //提交form表单检查
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

    function checkZipCodeSize() {
        var zipCode_addr = $("#zipCode_addr").val();
        var zipINdd = /^[0-9]{6}$/;
        if (zipCode_addr.length != 6) {
            $("#tipsDiv").show().attr("class", "alert alert-danger").html("邮政编码长度为6");
            $("#zipCode_addr").val("");
            return false;
        } else if (!zipINdd.test(zipCode_addr)) {
            $("#tipsDiv").show().attr("class", "alert alert-danger").html("请输入有效的邮箱");
            $("#zipCode_addr").val("");
            return false;
        } else {
            $("#tipsDiv").hide();
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
        } else {
            //选择旧地址
            $("#query_update_prov").show();
            $("#query_update_city").show();
            $("#query_update_area").show();
            $("#new_addr_select_id").hide();
            $("#addr_name_new_id").hide();
            var nickAddressId = $("#default_address_select option:selected").val();
            var nickAddressName = $("#default_address_select option:selected").text();

            if (nickAddressId != "new" || nickAddressId != "0") {
                $.ajax({
                    type: 'post',
                    url: '${pageContext.request.contextPath}/addr/queryOneAddress.do',
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
</script>
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
        var send = document.getElementById('address-submit');
        if (send) {
            send.onclick = function () {
                //this.innerHTML = '/user/userRegist.do';
            }
        }

    })();
</script>
<!-- script-for-nav -->
</body>
</html>
