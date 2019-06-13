<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="row clearfix">
                <div class="alert alert-success alert-dismissable">
                    <h4>首页轮播管理</h4>
                </div>
                <div class="col-md-12 column" style="display:none">
                    <div class="carousel slide" id="carousel-935012">
                        <ol class="carousel-indicators">
                            <li data-slide-to="0" data-target="#carousel-935012">
                            </li>
                            <li data-slide-to="1" data-target="#carousel-935012" class="active">
                            </li>
                            <li data-slide-to="2" data-target="#carousel-935012">
                            </li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="item">
                                <img alt="" src="../image/bannerImage/banner1.jpg"/>
                                <div class="carousel-caption">
                                    <h4>
                                        人不能像走兽那样活着，应该追求知识和美德。
                                    </h4>
                                    <p>
                                        人是活的，书是死的。活人读死书，可以把书读活。
                                        死书读活人，可以把人读死。
                                    </p>
                                </div>
                            </div>
                            <div class="item active">
                                <img alt="" src="../image/bannerImage/banner2.jpg"/>
                                <div class="carousel-caption">
                                    <h4>
                                        为乐趣而读书。
                                    </h4>
                                    <p>
                                        书籍把我们引入最美好的社会&amp; 使我们认识各个时代的伟大智者。
                                    </p>
                                </div>
                            </div>
                            <div class="item">
                                <img alt="" src="../image/bannerImage/banner3.jpg"/>
                                <div class="carousel-caption">
                                    <h4>
                                        书籍把我们引入最美好的社会&amp; 使我们认识各个时代的伟大智者。--史美尔斯
                                    </h4>
                                    <p>
                                        每一次飞行都始于坠落。
                                    </p>
                                </div>
                            </div>
                        </div>
                        <a class="left carousel-control" href="#carousel-935012" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                        </a>
                        <a class="right carousel-control" href="#carousel-935012" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                        </a>
                    </div>
                </div>
            </div>
        </div>


        <div class="col-md-12 column">
            <h4 style="color: rgba(255,85,77,1);">所有图片信息</h4>
            <table class="easyui-datagrid" id="images_info_grid" style="width:1200px;height:430px"
                   data-options="url:'${pageContext.request.contextPath}/image/queryAllImagesByCNG_CHC.do',
               fitColumns:false,singleSelect:true,loadMsg:'正在加载...',
               rownumbers:true,
               pagination:true,
               pageNumber:0,
               pageSize:10,
               pageList:[10,15,20,25],
               sortName:'',
               sortOrder:'desc',
               remoteSort:false,
               toolbar: [{
                            iconCls: 'icon-add ',
                            text:'添加',
                            width:100,
                            height:30,
                            handler: addOneImageDialog
                        },{
                            iconCls: 'icon-edit',
                            text:'修改',
                            width:100,
                            height:30,
                            handler: editImageInfoDialog
                        }]
                ">
            </table>
            </div>

        <%-- <div class="col-md-12 column">
             <table class="table">
                 <thead>
                 <tr>
                     <th>
                         编号
                     </th>
                     <th>
                         图片描述
                     </th>
                     <th>
                         尺寸
                     </th>
                     <th>
                         图片路径
                     </th>
                     <th>
                         更换时间
                     </th>
                     <th>
                         状态
                     </th>
                     <th>
                         操作
                     </th>
                 </tr>
                 </thead>
                 <tbody>
                 <tr class="success">
                     <td>
                         1
                     </td>
                     <td>
                         TB - Monthly
                     </td>
                     <td>
                         128*128
                     </td>
                     <td>
                         ../pages/images/shop-slider/slide1/banner2.jpg
                     </td>
                     <td>
                         2015-02-01
                     </td>
                     <td>
                         启用
                     </td>
                     <td>
                         <button type="button" class="btn btn-default">禁用</button>
                         <button type="button" class="btn btn-default">编辑</button>
                         <button type="button" class="btn btn-default">删除</button>
                     </td>

                 </tr>
                 </tbody>
             </table>
         </div>--%>
    </div>
</div>

<%--新图--%>
<div id="add_new_Image_dialogid" style="display: none;text-align: center;"></div>

<script>
    $('#images_info_grid').datagrid({
        columns: [[
            {title: '图片描述', field: 'imageDesc', width: 260, align: 'center'},
            {title: '尺寸', field: 'imageSize', width: 120, align: 'center'},
            {field: 'imageUrl', title: '路径', width: 220, align: 'center'},
            {
                title: '更换时间', field: 'replaceTime', width: 150, align: 'center',
                formatter: function (value, row, index) {
                    var unixTimestamp = new Date(row.replaceTime);
                    return unixTimestamp.toLocaleString();
                }
            },
            {
                title: '状态', field: 'status', width: 80, align: 'center',
                formatter: function (value, row, index) {
                    if (row.status == "1") {
                        return "启用";
                    }
                    if (row.status == "0") {
                        return "禁用";
                    }
                    if (row.status == '2') {
                        return "已删除";
                    }
                }
            },
            {
                title: '位置', field: 'type', width: 80, align: 'center',
                formatter: function (value, row, index) {
                    if (row.type == "1") {
                        return "首页轮播";
                    }
                    if (row.type == "0") {
                        return "营销图";
                    }
                }
            },
            {
                title: '操作', field: 'action', width: 250, align: 'center',
                formatter: function (value, row, index) {
                    var btn1 = '<button type="button" class="btn btn-effcts btn-xs"><a href="javascript:void(0)" rel="external nofollow" name="opera1" onclick="forbidThisImageBtn()"  class="easyui-linkbutton" >禁用</a></button>' +
                        '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
                        '<button type="button" class="btn btn-danger btn-xs"><a href="javascript:void(0)" rel="external nofollow" onclick="deleteThisImageBtn()" name="opera2" class="easyui-linkbutton" style="color: rgba(245,255,199,1)">删除</a></button>' +
                        '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
                        '<button type="button" class="btn btn-info btn-xs"><a href="javascript:void(0)" rel="external nofollow" onclick="imageDetailInfoBtn()" name="opera3" class="easyui-linkbutton" style="color: rgba(227,221,255,1)">详情</a></button>'
                    ;
                    var btn2 = '<button type="button" class="btn btn-success btn-xs"><a href="javascript:void(0)" rel="external nofollow" name="opera4" onclick="qiyongThisImageBtn()"  class="easyui-linkbutton" >启用</a></button>' +
                        '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
                        '<button type="button" class="btn btn-danger btn-xs"><a href="javascript:void(0)" rel="external nofollow" onclick="deleteThisImageBtn()" name="opera2" class="easyui-linkbutton" >删除</a></button>' +
                        '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
                        '<button type="button" class="btn btn-info btn-xs"><a href="javascript:void(0)" rel="external nofollow" onclick="imageDetailInfoBtn()" name="opera3" class="easyui-linkbutton" style="color: rgba(227,221,255,1)">详情</a></button>'
                    ;
                    var btn3 = '<button type="button" class="btn btn-success btn-xs"><a href="javascript:void(0)" rel="external nofollow" name="opera4" onclick="qiyongThisImageBtn()"  class="easyui-linkbutton" >恢复启用</a></button>' +
                        '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' +
                        '<button type="button" class="btn btn-info btn-xs"><a href="javascript:void(0)" rel="external nofollow" onclick="imageDetailInfoBtn()" name="opera3" class="easyui-linkbutton" style="color: rgba(227,221,255,1)">详情</a></button>'
                    ;
                    if (row.status == "1") {
                        return btn1;
                    } else if (row.status == '0') {
                        return btn2;
                    } else {
                        return btn3;
                    }
                }

            }
        ]]
    });

    function addOneImageDialog() {
        $("#add_new_Image_dialogid").dialog({
            title: '添加',
            width: 750,
            height: 420,
            closed: false,
            cache: false,
            modal: true,
            href: '../bgpages/pages/addNewImage.jsp?type=add',
            buttons: [{
                text: '确定',
                width: 70,
                height: 30,
                iconCls: 'icon-save',
                handler: addNewBook_button_submit
            }, {
                text: '取消',
                width: 70,
                height: 30,
                iconCls: 'icon-cancel',
                handler: function () {
                    $("#add_new_Image_dialogid").dialog('close');
                }
            }],
            onDestroy: function () {
                $('#images_info_grid').datagrid('reload');
            },
            onClose: function () {
                $('#images_info_grid').datagrid('reload');
            }
        });
    }

    //修改图
    function editImageInfoDialog() {
        var row = $("#images_info_grid").datagrid('getSelected');
        if (row == null) {
            $.messager.alert('提示', '请选中一条数据！', 'info');
        } else {
            $("#add_new_Image_dialogid").dialog({
                title: '编辑',
                width: 750,
                height: 420,
                closed: false,
                cache: false,
                modal: true,
                href: '${pageContext.request.contextPath}/image/modifyOneImageByCNG_CHC.do?imageId=' + row.imageId,
                buttons: [{
                    text: '确定',
                    width: 60,
                    height: 30,
                    iconCls: 'icon-save',
                    handler: modifyBookInfoCNG_CHC
                }, {
                    text: '取消',
                    width: 60,
                    height: 30,
                    iconCls: 'icon-cancel',
                    handler: function () {
                        $("#add_new_Image_dialogid").dialog('close');
                    }
                },
                ],
            });
        }
    }

    //详情
    function imageDetailInfoBtn() {
        var row = $("#images_info_grid").datagrid('getSelected');
        if (row == null) {
            $.messager.alert('提示', '请选中一条数据！', 'info');
        } else {
            $("#add_new_Image_dialogid").dialog({
                title: '详情',
                width: 850,
                height: 550,
                closed: false,
                cache: false,
                modal: true,
                href: '${pageContext.request.contextPath}/image/OneImageDetailByCNG_CHC.do?imageId=' + row.imageId,
                buttons: [{
                    text: '关闭',
                    width: 60,
                    height: 30,
                    iconCls: 'icon-cancel',
                    handler: function () {
                        $("#add_new_Image_dialogid").dialog('close');
                    }
                },
                ],
            });
        }
    }

    //禁用
    function forbidThisImageBtn() {
        var row = $("#images_info_grid").datagrid('getSelected');
        if (row.status == '0') {
            $.messager.alert('提示', '该图已经禁用！', 'info');
            return;
        }
        if (row == null) {
            $.messager.alert('提示', '请选中一条数据！', 'info');
        } else {
            $.messager.confirm('提示', '您想要禁用该图吗？', function (r) {
                if (r) {
                    // 退出操作;
                    $.ajax({
                        url: '${pageContext.request.contextPath}/image/modifyImageStatusCNG_CHC_001.do?imageId=' + row.imageId + "&status=0",
                        type: 'post',
                        dataType: 'text',
                        success: function (data) {
                            if (data == "success") {
                                $.messager.alert('提示', '该图已禁用！', 'info');
                                $("#images_info_grid").datagrid('reload');
                            } else {
                                $.messager.alert('提示', '失败！', 'danger');
                            }
                        }
                    });
                }
            });
        }
    }

    //删除
    function deleteThisImageBtn() {
        var row = $("#images_info_grid").datagrid('getSelected');
        if (row == null) {
            $.messager.alert('提示', '请选中一条数据！', 'info');
        } else {
            $.messager.confirm('提示', '您想要删除该图吗？', function (r) {
                if (r) {
                    // 退出操作;
                    $.ajax({
                        url: '${pageContext.request.contextPath}/image/modifyImageStatusCNG_CHC_001.do?status=2&imageId=' + row.imageId,
                        type: 'post',
                        dataType: 'text',
                        success: function (data) {
                            if (data == "success") {
                                $.messager.alert('提示', '该图已删除！', 'info');
                                $("#images_info_grid").datagrid('reload');
                            } else {
                                $.messager.alert('提示', '失败！', 'danger');
                            }
                        }
                    });
                }
            });
        }
    }

    //启用
    function qiyongThisImageBtn() {
        var row = $("#images_info_grid").datagrid('getSelected');
        if (row.status == '1') {
            $.messager.alert('提示', '该图已在首页使用！', 'info');
            return;
        }
        if (row == null) {
            $.messager.alert('提示', '请选中一条数据！', 'info');
        } else {
            $.messager.confirm('提示', '您想要重新启用该图吗？', function (r) {
                if (r) {
                    $.ajax({
                        url: '${pageContext.request.contextPath}/image/modifyImageStatusCNG_CHC_001.do?status=1&imageId=' + row.imageId,
                        type: 'post',
                        dataType: 'text',
                        success: function (data) {
                            if (data == "success") {
                                $.messager.alert('提示', '该图已启用！', 'info');
                                $("#images_info_grid").datagrid('reload');
                            } else {
                                $.messager.alert('提示', '失败！', 'danger');
                            }
                        }
                    });
                }
            });
        }
    }

    //添加新图：
    function addNewBook_button_submit() {
        var valid = $("#ImagesDetail_form_id").form('validate');
        var imageddd = $("#add_imgUrl").val();
        if (!valid) {
            $.messager.alert('我的消息', '存在未完成项，请检查！', 'warning');
            return valid;
        } else if (imageddd == "") {
            $.messager.alert('我的消息', '请选择上传图片', 'warning');
            return;
        } else {
            $.messager.confirm('提示', '确定保存？', function (r) {
                if (r) {
                    $('#ImagesDetail_form_id').form('submit', {
                        url: '${pageContext.request.contextPath}/image/addImageInfoByCNG_CHC001.do',
                        onSubmit: function () {
                        },
                        success: function (data) {
                            $.messager.alert('我的消息', '保存成功！', 'info');
                            $("#add_new_Image_dialogid").dialog('close');
                            $("#images_info_grid").datagrid('reload');
                        }
                    });
                }
            });
        }

    }

    //修改
    function modifyBookInfoCNG_CHC() {
        $.messager.confirm('提示', '确定修改？', function (r) {
            if (r) {
                $('#ImagesDetail_form_id_1').form('submit', {
                    url: '${pageContext.request.contextPath}/image/modifyImageInfoCNG_CHC001.do',
                    onSubmit: function () {
                        var valid = $("#ImagesDetail_form_id_1").form('validate');
                        if (!valid) {
                            $.messager.alert('我的消息', '存在未完成项，请检查！', 'warning');
                        }
                        return valid;
                    },
                    success: function (data) {
                        $.messager.alert('我的消息', '保存成功！', 'info');
                        $("#add_new_Image_dialogid").dialog('close');
                        $("#images_info_grid").datagrid('reload');
                    }
                });
            }
        });

    }


</script>


