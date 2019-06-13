<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row clearfix">
    <div class="col-md-12 column">
        <form class="navbar-form navbar-left" role="search">
            <div class="form-group">
                用户名称：<input type="text" id="user_list_search" class="form-control" style="width:240px"/>
            </div>
            <button type="button" onclick="selectUsersBySearchInUserInfoList()" class="btn btn-default">查询</button>
            <button type="button" onclick="czSearchData()" class="btn btn-default" style="height: 30px">重置</button>
        </form>
        <table class="easyui-datagrid" id="users_info_grid" style="width:1230px;height:480px;"
               data-options="url:'${pageContext.request.contextPath}/user/queryUsersBySearch_bg.do',
               fitColumns:false,singleSelect:true,loadMsg:'正在加载...',
               rownumbers:true,
               pagination:true,
               pageNumber:0,
               pageSize:10,
               pageList:[10,15,20,25],
               sortName:'',
               sortOrder:'desc',
               remoteSort:false
              ">
            <thead>
            </thead>
        </table>
    </div>
</div>

<%--新图书--%>
<div id="userInfo_list_dialogid" style="display: none;text-align: center;"></div>
<div id="user_addr_info_dialogid" style="display: none;text-align: center;"></div>

<script>
    var selectRowUserData, userAddressInfoData;
    $('#users_info_grid').datagrid({
        columns: [[
            {title: 'ID', field: 'userId', width: 60, align: 'center', hidden: 'true'},
            {title: '用户名', field: 'userName', width: 120, align: 'center'},
            {
                title: '昵称', field: 'nickName', width: 120, align: 'center',
                formatter: function (value, row, index) {
                    if (row.nickName == '' || row.nickName == null) {
                        return "无"
                    } else {
                        return row.nickName;
                    }
                }
            },
            {
                title: '性别', field: 'sex', width: 60, align: 'center',
                formatter: function (value, row, index) {
                    if (row.sex == 'm') {
                        return "男"
                    } else if (row.sex == 'f') {
                        return "女";
                    } else {
                        return row.sex;
                    }
                }
            },
            {
                title: '生日', field: 'birthdate', width: 160, align: 'center',
                formatter: function (value, row, index) {
                    if (row.birthdate == '' || row.birthdate == 'undefined') {
                        return "空"
                    } else {
                        function add0(m) {
                            return m < 10 ? '0' + m : m
                        }

                        function format(shijianchuo) {
                            var time = new Date(shijianchuo);
                            var y = time.getFullYear();
                            var m = time.getMonth() + 1;
                            var d = time.getDate();
                            var h = time.getHours();
                            var mm = time.getMinutes();
                            var s = time.getSeconds();
                            return y + '-' + add0(m) + '-' + add0(d) + ' ' + add0(h) + ':' + add0(mm) + ':' + add0(s);
                        }

                        return format(row.birthdate);
                        /* var unixTimestamp = new Date(row.birthdate);
                         return unixTimestamp.toLocaleString();*/
                    }
                }
            },
            {title: '电话', field: 'phone', width: 120, align: 'center'},
            {title: '邮箱', field: 'email', width: 130, align: 'center'},
            /*
            {title:'收货人',field:'receiveName',width:130,align:'center',
                formatter:function (value,row,index) {
                    if(row.address.receiveName=='' || row.address.receiveName==null){
                        return "无";
                    }else{
                        return row.address.receiveName;
                    }
                }
            },
            {title:'收货电话',field:'receiveTel',width:130,align:'center',
                formatter:function (value,row,index) {
                    if(row.address.receiveTel==''||row.address.receiveTel==null){
                        return "无";
                    }else{
                        return row.address.receiveTel;
                    }
                }
            },
            {title:'地址类型',field:'addressNickName',width:130,align:'center',
                formatter:function (value,row,index) {
                    if(row.address.addressNickName==""||row.address.addressNickName==null){
                        return "无";
                    }else{
                        return row.address.addressNickName;
                    }
                }
            },
            {title:'省',field:'province',width:100,align:'center',
                formatter:function (value,row,index) {
                    if(row.address.province=="" || row.address.province==null){
                        return "无";
                    }else{
                        return row.address.province;
                    }
                }
            },
            {title:'市',field:'city',width:100,align:'center',
                formatter:function (value,row,index) {
                    return row.address.city;
                   /!* if(row.address.city=="" || row.address.city==null){
                        return "无";
                    }else{
                        return row.address.city;
                    }*!/
                }
            },
            {title:'县',field:'area',width:100,align:'center',
                formatter:function (value,row,index) {
                    if(row.address.area=="" || row.address.area==null){
                        return "无";
                    }else{
                        return row.address.area;
                    }
                }
            },
            {title:'详细地址',field:'addressName',width:180,align:'center',
                formaAtter:function (value,row,index) {
                    if(row.address.addressName=="" || row.address.addressName==null){
                        return "无";
                    }else{
                        return row.address.addressName;
                    }
                }
            },
            {title:'邮编',field:'zipcode',width:100,align:'center',
                formaAtter:function (value,row,index) {
                    if(row.address.zipcode=='' || row.address.zipcode==null){
                        return "无";
                    }else{
                        return row.address.zipcode;
                    }
                }
            },*/
            {
                title: '状态', field: 'status', width: 80, align: 'center',
                formatter: function (value, row, index) {
                    if (row.status == '1') {
                        return "已启用"
                    } else {
                        return "禁用";
                    }
                }
            },
            {
                title: '注册日期', field: 'registTime', width: 160, align: 'center',
                formatter: function (value, row, index) {
                    function add0(m) {
                        return m < 10 ? '0' + m : m
                    }

                    function format(shijianchuo) {
                        var time = new Date(shijianchuo);
                        var y = time.getFullYear();
                        var m = time.getMonth() + 1;
                        var d = time.getDate();
                        var h = time.getHours();
                        var mm = time.getMinutes();
                        var s = time.getSeconds();
                        return y + '-' + add0(m) + '-' + add0(d) + ' ' + add0(h) + ':' + add0(mm) + ':' + add0(s);
                    }

                    return format(row.registTime);
                    /*var unixTimestamp = new Date(row.registTime);
                    return unixTimestamp.toLocaleString();*/
                }
            }, {
                title: '操作', field: 'action_dd', width: 180, align: 'center',
                formatter: function (value, row, index) {
                    var btn1 = '<button type="button" class="btn btn-warning btn-xs"><a href="javascript:void(0)" rel="external nofollow" name="opera1" onclick="forbiddenBtn()"  class="easyui-linkbutton" >禁用</a></button>' +
                        '&nbsp;&nbsp;&nbsp;' +
                        '<button type="button" class="btn btn-warning btn-xs"><a href="javascript:void(0)" rel="external nofollow" onclick="toShowUserAddress()" name="opera2" class="easyui-linkbutton" >收货地址</a></button>'
                    ;
                    var btn2 = '<button type="button" class="btn btn-warning btn-xs"><a href="javascript:void(0)" rel="external nofollow" name="opera2" onclick="forbiddenBtn2()"  class="easyui-linkbutton" >解除</a></button>' +
                        '&nbsp;&nbsp;&nbsp;' +
                        '<button type="button" class="btn btn-warning btn-xs"><a href="javascript:void(0)" rel="external nofollow" onclick="toShowUserAddress()" name="opera2" class="easyui-linkbutton" >收货地址</a></button>'
                    ;
                    if (row.status == '0') {
                        return btn2;
                    } else {
                        return btn1;
                    }

                }
            }

        ]]
    });

    function addUserDialog() {
        $("#userInfo_list_dialogid").dialog({
            title: '新用户',
            width: 450,
            height: 540,
            closed: false,
            cache: false,
            modal: true,
            href: '../bgpages/pages/addNewUser.jsp?type=add',
            buttons: [{
                text: '确定',
                width: 70,
                height: 30,
                iconCls: 'icon-save',
                handler: function () {
                    $("#addUser_form").form('submit', {
                        url: '',
                        onSubmit: function () {
                            var valid = $("#addUser_form").form('validate');
                            if (valid) {
                                //提交
                                alert("提交");
                            } else {
                                $.messager.alert('我的消息', '存在未完成项，请检查！', 'warning');
                            }
                        },
                        success: function (data) {
                            alert(data)
                        }
                    });
                }
            }, {
                text: '取消',
                width: 70,
                height: 30,
                iconCls: 'icon-cancel',
                handler: function () {
                    $("#userInfo_list_dialogid").dialog('close');
                }
            }],
            onDestroy: function () {
                $('#users_info_grid').datagrid('reload');
            },
            onClose: function () {
                $('#users_info_grid').datagrid('reload');
            }
        });
    }

    //重置
    function czSearchData() {
        $("#user_list_search").val("");
    }
    function editUserDialog() {
        var rowUser = $("#users_info_grid").datagrid('getSelected');
        if (rowUser == null) {
            $.messager.alert('提示', '请选中一条数据！', 'info');
        } else {
            selectRowUserData = rowUser;
            $("#userInfo_list_dialogid").dialog({
                title: '编辑',
                width: 450,
                height: 490,
                closed: false,
                cache: false,
                modal: true,
                href: '../bgpages/pages/addNewUser.jsp?type=edit',
                buttons: [{
                    text: '确定',
                    width: 70,
                    height: 30,
                    iconCls: 'icon-save',
                    handler: function () {

                    }
                }, {
                    text: '取消',
                    width: 70,
                    height: 30,
                    iconCls: 'icon-cancel',
                    handler: function () {
                        $("#userInfo_list_dialogid").dialog('close');
                    }
                }],
                onDestroy: function () {
                    $('#users_info_grid').datagrid('reload');
                },
                onClose: function () {
                    $('#users_info_grid').datagrid('reload');
                }
            });
        }
    }

    function deleteUserDialog() {
        var row = $("#users_info_grid").datagrid('getSelected');
        if (row == null) {
            $.messager.alert('提示', '请选中一条数据！', 'info');
        } else {
            $.messager.confirm('提示', '确定删除？', function (r) {
                if (r) {
                    $.ajax({
                        url: '',
                        type: 'post',
                        dataType: 'json',
                        success: function (data) {
                            $.messager.alert('我的消息', '已删除！', 'info');
                        }
                    });
                }
            });
        }
    }

    //禁用
    function forbiddenBtn() {
        var row = $("#users_info_grid").datagrid('getSelected');
        if (row == "" || row == null) {
            $.messager.alert('我的消息', '请选中一行！', 'error');
            return;
        }
        $.messager.confirm('提示', '确定禁用？', function (r) {
            if (r) {
                $.ajax({
                    url: '${pageContext.request.contextPath}/user/forbidCurrentUser.do',
                    type: 'post',
                    data: {
                        userId: row.userId,
                        status: "0"
                    },
                    dataType: 'text',
                    success: function (data) {
                        if (data == "success") {
                            $.messager.alert('我的消息', '已禁用！', 'info');
                            $("#users_info_grid").datagrid('reload', {
                                row: 10,
                                page: 1
                            });
                        }
                    }
                });
            }
        });
    }

    function forbiddenBtn2() {
        var row = $("#users_info_grid").datagrid('getSelected');
        if (row == "" || row == null) {
            $.messager.alert('我的消息', '请选中一行！', 'error');
            return;
        }
        $.messager.confirm('提示', '确定解除？', function (r) {
            if (r) {
                $.ajax({
                    url: '${pageContext.request.contextPath}/user/forbidCurrentUser.do',
                    type: 'post',
                    data: {
                        userId: row.userId,
                        status: "1"
                    },
                    dataType: 'text',
                    success: function (data) {
                        if (data == "success") {
                            $.messager.alert('我的消息', '已完成！', 'info');
                            $("#users_info_grid").datagrid('reload');
                        }
                    }
                });
            }
        });
    }
    //展示地址
    function toShowUserAddress() {
        var cur_rowData = $("#users_info_grid").datagrid('getSelected');
        userAddressInfoData = cur_rowData;
        $("#user_addr_info_dialogid").dialog({
            title: '用户地址详情',
            width: 420,
            height: 540,
            closed: false,
            cache: false,
            modal: true,
            href: '${pageContext.request.contextPath}/addr/usersAllAddress.do?userId=' + cur_rowData.userId,
            //href: '../bgpages/pages/userAddressInfo.jsp?type=edit',
            buttons: [{
                text: '确定',
                width: 70,
                height: 30,
                iconCls: 'icon-save',
                handler: function () {

                }
            }, {
                text: '取消',
                width: 70,
                height: 30,
                iconCls: 'icon-cancel',
                handler: function () {
                    $("#user_addr_info_dialogid").dialog('close');
                }
            }],
            onDestroy: function () {
                $('#users_info_grid').datagrid('reload');
            },
            onClose: function () {
                $('#users_info_grid').datagrid('reload');
            }
        });
    }

    //查询
    function selectUsersBySearchInUserInfoList() {
        var search = $("#user_list_search").val();
        if (search == "") {
            $('#users_info_grid').datagrid('load', {
                row: 10,
                page: 1
            });
        } else {
            $("#users_info_grid").datagrid('load', {
                search: $("#user_list_search").val(),
                row: 10,
                    page: 1
            });
        }
    }


</script>


