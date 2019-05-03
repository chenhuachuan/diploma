<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row clearfix">

    <c:forEach items="${address}" var="addr">
        <div class="col-sm-12 column">
            <div class="col-sm-12">
                <table>
                    <tr>
                        <td><h5><font color="#e75d52">收货人：</font></h5></td>
                        <td>${addr.receiveName}</td>
                    </tr>
                    <tr>
                        <td><h5><font color="#e75d52">地址名称：</font></h5></td>
                        <td>${addr.nickAddrName}</td>
                    </tr>
                    <tr>
                        <td><h5><font color="#e75d52">收货电话：</font></h5></td>
                        <td>${addr.receiveTel}</td>
                    </tr>
                    <tr>
                        <td><h5><font color="#e75d52">收货地址：</font></h5>
                        </td>
                        <td>${addr.provNameAddr} &nbsp;&nbsp;${addr.cityNameAddr}&nbsp;&nbsp;${addr.areaNameAddr}
                                ${addr.addrName}
                        </td>
                    </tr>
                    <tr>
                        <td><h5><font color="#e75d52">邮编：</font></h5></td>
                        <td>${addr.zipCode}</td>
                    </tr>
                    <tr>
                        <hr/>
                    </tr>
                </table>


                <span>



            </span>
            </div>
        </div>
    </c:forEach>
</div>


<%--
<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<div class="row clearfix">
    <div class="col-sm-12 column">
        <form id="user_addr_form"  method="post" role="form" data-options="novalidate:true" class="form-horizontal" style="margin-top: 10px">
            <div class="form-group-separator"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">收货人</label>
                <div class="col-sm-5">
                    <input class="easyui-textbox" type="text" name="receiveName" style="width: 260px;" data-options="required:true" />
                </div>
            </div>
            <div class="form-group-separator"></div>
            <div class="form-group" id="password_div_user">
                <label class="col-sm-3 control-label">收货电话</label>
                <div class="col-sm-5">
                    <input class="easyui-textbox" type="text" name="receiveTel"  style="width: 260px;"  data-options="required:true" />
                </div>
            </div>
            <div class="form-group-separator"></div>
            <div class="form-group" >
                <label class="col-sm-3 control-label">邮编</label>
                <div class="col-sm-5">
                    <input id="rpwd" name="zipcode" type="password" style="width: 260px;height: 30px" class="easyui-validatebox"required="required" validType="equals['#password']" />
                </div>
            </div>
            <div class="form-group-separator"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">地址名称</label>
                <div class="col-sm-5">
                    <input class="easyui-textbox" type="text" name="nickAddrName" style="width: 260px;" data-options="required:true" />
                </div>
            </div>
            <div class="form-group-separator"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">省</label>
                <div class="col-sm-5">
                    <input class="easyui-textbox" type="text" name="provNameAddr" style="width: 260px;" data-options="required:true" />
                </div>
            </div>
            <div class="form-group-separator"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">市</label>
                <div class="col-sm-5">
                    <input class="easyui-textbox" type="text" name="cityNameAddr" style="width: 260px;" data-options="required:true" />
                </div>
            </div>
            <div class="form-group-separator"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">县</label>
                <div class="col-sm-5">
                    <input class="easyui-textbox" type="text" name="areaNameAddr" style="width: 260px;"  data-options="required:true" />
                </div>
            </div>
            <div class="form-group-separator"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">详细地址</label>
                <div class="col-sm-5">
                    <input class="easyui-textbox" type="text" name="addrName" style="width: 260px;"  data-options="required:true" />
                </div>
            </div>
        </form>

    </div>
</div>
<script>
    var type = "<%=request.getParameter("type").toString()%>";
    if(type=="edit"){
        //加载数据
        $("#user_addr_form").form('load',{
            userName:userAddressInfoData.userName,
            nickName:userAddressInfoData.nickName,
            status:selectRowUserData.status
        });
    }
</script>--%>
