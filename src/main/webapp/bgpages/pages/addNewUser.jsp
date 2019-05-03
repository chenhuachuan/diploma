<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<div class="row clearfix">
    <div class="col-sm-12 column">
        <form id="addUser_form" method="post" role="form" data-options="novalidate:true" class="form-horizontal"
              style="margin-top: 10px">
            <div class="form-group-separator"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">用户名</label>
                <div class="col-sm-5">
                    <input class="easyui-textbox" type="text" name="userName" style="width: 260px;"
                           data-options="required:true"/>
                </div>
            </div>
            <div class="form-group-separator"></div>
            <div class="form-group" id="password_div_user">
                <label class="col-sm-3 control-label">密码</label>
                <div class="col-sm-5">
                    <input class="easyui-passwordbox" type="text" name="password" id="password" style="width: 260px;"
                           data-options="required:true"/>
                </div>
            </div>
            <div class="form-group-separator"></div>
            <div class="form-group" id="repwd_div_user">
                <label class="col-sm-3 control-label">确认密码</label>
                <div class="col-sm-5">
                    <input id="rpwd" name="repassword" type="password" style="width: 260px;height: 30px"
                           class="easyui-validatebox" required="required" validType="equals['#password']"/>
                </div>
            </div>
            <div class="form-group-separator"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">昵称</label>
                <div class="col-sm-5">
                    <input class="easyui-textbox" type="text" name="nickName" style="width: 260px;"
                           data-options="required:true"/>
                </div>
            </div>
            <div class="form-group-separator"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">生日</label>
                <div class="col-sm-5">
                    <input class="easyui-datetimebox" name="birthdate"
                           data-options="required:true,showSeconds:true" value="" style="width:260px">
                </div>
            </div>
            <div class="form-group-separator"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">性别</label>
                <div class="col-sm-5">
                    <input id="sex" class="easyui-combobox" name="sex" style="width: 260px;"
                           data-options="valueField:'value',textField:'text',required:true,
                           data:[{'value':'m','text':'男','selected':true},{'value':'f','text':'女'}]"/>
                </div>
            </div>
            <div class="form-group-separator"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">电话</label>
                <div class="col-sm-5">
                    <input class="easyui-textbox" type="text" name="phone" style="width: 260px;"
                           data-options="required:true"/>
                </div>
            </div>
            <div class="form-group-separator"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">邮箱</label>
                <div class="col-sm-5">
                    <input id="vv" class="easyui-validatebox" name="email" style="width: 260px;height: 30px"
                           data-options="required:true,validType:'email'"/>

                    <%--  <input class="easyui-textbox" type="text" name="email" style="width: 260px;" data-options="required:true" />--%>
                </div>
            </div>
            <div class="form-group-separator"></div>
            <div class="alert alert-success alert-dismissable" id="" style="margin-top: 5px">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <strong>提示：</strong>
                <span id="add_span_tips">
                        1.两次密码不一致时，输入框为黄色.<br/>
                        2.邮箱格式不正确时，输入框为黄色.<br/>
                    </span>
                <span style="display: none" id="edit_userInfo_tips">
                        1.请填写修改信息<br/>
                    </span>
            </div>
        </form>

    </div>
</div>
<script>
    var type = "<%=request.getParameter("type").toString()%>";
    if (type == "edit") {
        $("#edit_userInfo_tips").css("display", "");
        $("#password_div_user").css("display", "none");
        $("#add_span_tips").css("display", "none");
        $("#repwd_div_user").css("display", "none");

        //加载数据
        $("#addUser_form").form('load', {
            userName: selectRowUserData.userName,
            nickName: selectRowUserData.nickName,
            sex: selectRowUserData.sex,
            birthdate: selectRowUserData.birthdate,
            phone: selectRowUserData.phone,
            email: selectRowUserData.email,
            status: selectRowUserData.status
        });
    }
    $.extend($.fn.validatebox.defaults.rules, {
        equals: {
            validator: function (value, param) {
                return value == $(param[0]).val();
            },
            message: 'Field do not match.'
        }
    });
</script>