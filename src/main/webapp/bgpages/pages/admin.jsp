<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<div class="row clearfix">
    <div class="col-sm-12 column">
        <form id="admin_form_login" method="post" role="form" data-options="novalidate:true" class="form-horizontal"
              style="margin-top: 10px">
            <div class="form-group-separator"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">用户名</label>
                <div class="col-sm-5">
                    <input class="easyui-textbox" id="adminName" type="text" name="adminName" style="width: 260px;"
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
            <div class="form-group">
                <label class="col-sm-2 control-label"></label>
                <button type="button" id="login_btn" onclick="submitAdminLogin()" style="width: 200px"
                        class="btn btn-primary btn-sm">登录
                </button>
            </div>
        </form>

        <%--regist form--%>
        <form id="admin_form_regist" method="post" role="form" data-options="novalidate:true" class="form-horizontal"
              style="margin-top: 10px">
            <div class="form-group-separator"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">用户名</label>
                <div class="col-sm-5">
                    <input class="easyui-textbox" type="text" id="rg_adminName" name="adminName" style="width: 260px;"
                           data-options="required:true"/>
                </div>
            </div>
            <div class="form-group-separator"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">密码</label>
                <div class="col-sm-5">
                    <input class="easyui-passwordbox" type="text" id="rg_password" name="password" style="width: 260px;"
                           data-options="required:true"/>
                </div>
            </div>
            <div class="form-group-separator"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">确认密码</label>
                <div class="col-sm-5">
                    <input id="rpwd" name="repassword" type="password" style="width: 260px;height: 30px"
                           class="easyui-validatebox" required="required" validType="equals['#rg_password']"/>
                </div>
            </div>
            <div class="form-group-separator"></div>
            <div class="form-group" id="email_div_sys">
                <label class="col-sm-3 control-label">邮箱</label>
                <div class="col-sm-5">
                    <input id="rg_email" class="easyui-validatebox" name="email" style="width: 260px;height: 30px"
                           data-options="required:true,validType:'email'"/>
                </div>
            </div>
            <div class="form-group-separator"></div>
            <div class="form-group">
                <label class="col-sm-2 control-label"></label>
                <button type="button" id="regist_btn" onclick="submitAdminRegist()" style="width: 200px"
                        class="btn btn-primary btn-sm">点击注册
                </button>
            </div>
            <div class="form-group-separator"></div>
            <div class="alert alert-success alert-dismissable" id="tips_sys" style="margin-top: 5px">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <strong>提示：</strong>
                <span id="add_span_tips">
                        忘记密码可以通过邮箱找回.
                </span>
                <span>
                    存在未完成项或两次密码不一致时，输入框为红色。
                </span>
            </div>
        </form>
    </div>
</div>
<script>
    var stype = "<%=request.getParameter("stype").toString()%>";
    if (stype == "add") {
        $("#admin_form_regist").css("display", "none");
    } else {
        $("#admin_form_login").css("display", "none");
    }

    // action=""

    function submitAdminLogin() {
        if ($("#adminName").val() != "" && $("#password").val() != "") {
            $.ajax({
                url: '${pageContext.request.contextPath}/user/adminLogin.do',
                type: 'post',
                data: {
                    adminName: $("#adminName").val(),
                    password: $("#password").val()
                },
                dataType: 'text',
                success: function (data) {
                    if (data == 'login_success') {
                        $("#sysman_login_regist_dialog").dialog("close");
                        $.messager.show({
                            title: '我的消息',
                            msg: '登录成功，欢迎您 ' + '${sessionScope.CurrentAdmin.nickName}',
                            timeout: 2000,
                            showType: 'show'
                        });
                        setTimeout(function () {  //使用  setTimeout（）方法设定定时2000毫秒
                            window.location.reload();//页面刷新
                        }, 1500);
                    } else if (data == 'login_fail') {
                        $("#sysman_login_regist_dialog").dialog("close");
                        $.messager.show({
                            title: '我的消息',
                            msg: '登录失败，请重新登录',
                            timeout: 2000,
                            showType: 'show'
                        });
                    }
                },
                error: function (data) {
                    alert(data);
                }
            });
        } else {
            $.messager.alert('我的消息', '   请填写完整！', 'info');
        }
    }

    function submitAdminRegist() {
        var valid = $("#admin_form_regist").form('validate');
        if (valid) {
            //提交
            $.ajax({
                url: '${pageContext.request.contextPath}/user/adminRegist.do',
                type: 'post',
                data: {
                    adminName: $("#rg_adminName").val(),
                    password: $("#rg_password").val(),
                    email: $("#rg_email").val()
                },
                dataType: 'text',
                success: function (data) {
                    if (data == 'regist_success') {
                        $("#sysman_login_regist_dialog").dialog("close");
                        $.messager.show({
                            title: '我的消息',
                            msg: '注册成功 ',
                            timeout: 2000,
                            showType: 'show'
                        });
                        setTimeout(function () {  //使用  setTimeout（）方法设定定时2000毫秒
                            window.location.reload();//页面刷新
                        }, 1500);
                    } else if (data == 'regist_fail') {
                        $("#sysman_login_regist_dialog").dialog("close");
                        $.messager.show({
                            title: '我的消息',
                            msg: '注册失败，请联系管理员或重新注册',
                            timeout: 2000,
                            showType: 'show'
                        });
                    }
                },
                error: function (data) {
                    alert(data);
                }
            });
        } else {
            $.messager.alert('我的消息', '存在未完成项，请检查！', 'warning');
        }


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