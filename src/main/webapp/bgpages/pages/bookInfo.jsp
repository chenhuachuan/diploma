<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<div class="row clearfix">
    <div class="col-md-12 column">
        <form class="navbar-form navbar-left" role="search">
            <div class="form-group">
                图书名称：<input type="text" class="form-control" name="search" style="width:240px"/>
                开始时间：<input class="easyui-datetimebox" name="createTime"
                            data-options="required:true,showSeconds:true" value="" style="width:200px;height: 32px;">
                至：<input class="easyui-datetimebox" name="createTime"
                         data-options="required:true,showSeconds:true" value="" style="width:200px;height: 32px;">
            </div>
            <button type="submit" class="btn btn-default">查询</button>
        </form>
        <table class="easyui-datagrid" id="book_info_grid" style="width:2200px;height:650px"
               data-options="url:'${pageContext.request.contextPath}/book/allBooksInfo.do',fitColumns:false,singleSelect:true,loadMsg:'正在加载...',
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
                            text:'添加图书',
                            width:100,
                            height:30,
                            handler: addOneBookDialog
                        },{
                            iconCls: 'icon-edit',
                            text:'修改',
                            width:100,
                            height:30,
                            handler: editBookInfoDialog
                        },{
                            iconCls: 'icon-remove',
                            text:'下架',
                            width:100,
                            height:30,
                            handler:deleteOneBookDialog
                        }]

                ">
            <thead>
            <tr>
                <th data-options="field:'bookId',width:50,hidden:'true'">编码</th>
                <th data-options="field:'bookName',width:120,align:'center'">图书名称</th>
                <th data-options="field:'sortName',width:100,align:'both'">所属分类</th>
                <th data-options="field:'author',width:120,align:'both'">作者</th>
                <th data-options="field:'publishCompany',width:150,align:'both'">出版社</th>
                <th data-options="field:'publishTime',width:120,align:'both'">出版时间</th>
                <th data-options="field:'wordCount',width:60,align:'both'">字数</th>
                <th data-options="field:'pageCount',width:60,align:'both'">页数</th>
                <th data-options="field:'kaiBen',width:60,align:'both'">开本</th>
                <th data-options="field:'repertory',width:60,align:'both'">库存</th>
                <th data-options="field:'bookPrice',width:60,align:'both'">价格</th>
                <th data-options="field:'originalPrice',width:60,align:'both'">原价</th>
                <th data-options="field:'isbn',width:100,align:'both'">ISBN</th>
                <th data-options="field:'saleCount',width:60,align:'both'">销售量</th>
                <th data-options="field:'imgUrl',width:150,align:'both'">图书图片</th>
                <th data-options="field:'bookIntro',width:500,align:'both'">图书介绍</th>
                <th data-options="field:'commend',width:500,align:'both'">编辑推荐</th>
            </tr>
            </thead>
        </table>
    </div>
</div>

<%--新图书--%>
<div id="add_new_book_dialogid" style="display: none;text-align: center;"></div>


<script>
    var selectRowData;
    $('#book_info_grid').datagrid({
        columns: [[
            {title: '图书名称', field: 'bookName', width: 120, align: 'center'},
            {
                field: 'sortName', title: '所属分类', width: 120,
                formatter: function (value, row, index) {
                    if (row.sort) {
                        return row.sort.sortName;
                    } else {
                        return "";
                    }
                }
            },
            {title: '作者', field: 'author', width: 100, align: 'center'},
            {title: '出版社', field: 'publishCompany', width: 150, align: 'center'},
            {
                title: '出版时间', field: 'publishTime', width: 100, align: 'center',
                formatter: function (value, row, index) {
                    var unixTimestamp = new Date(value);
                    return unixTimestamp.toLocaleString();
                }
            },
            {title: '字数', field: 'wordCount', width: 60, align: 'center'},
            {title: '页数', field: 'pageCount', width: 60, align: 'center'},
            {title: '开本', field: 'kaiBen', width: 60, align: 'center'},
            {title: '库存', field: 'repertory', width: 60, align: 'center'},
            {title: '价格', field: 'bookPrice', width: 60, align: 'center'},
            {title: '原价', field: 'originalPrice', width: 60, align: 'center'},
            {title: 'ISBN', field: 'isbn', width: 80, align: 'center'},
            {title: '销售量', field: 'saleCount', width: 60, align: 'center'},
            {title: '图书图片', field: 'imgUrl', width: 120, align: 'center'},
            {title: '图书介绍', field: 'bookIntro', width: 500, align: 'center'},
            {title: '编辑推荐', field: 'commend', width: 550, align: 'center'},
        ]]
    });

    function addOneBookDialog() {
        $("#add_new_book_dialogid").dialog({
            title: '添加新书',
            width: 850,
            height: 650,
            closed: false,
            cache: false,
            modal: true,
            href: '../bgpages/js/pagejs/addnewbook.jsp?type=add',
            buttons: [{
                text: '确定',
                width: 70,
                height: 30,
                iconCls: 'icon-save',
                handler: function () {
                    $("#bookDetail_form").form('submit', {
                        url: '',
                        onSubmit: function () {
                            var valid = $("#bookDetail_form").form('validate');
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
                    $("#add_new_book_dialogid").dialog('close');
                }
            }],
            onDestroy: function () {
                $('#book_info_grid').datagrid('reload');
            },
            onClose: function () {
                $('#book_info_grid').datagrid('reload');
            }
        });
    }

    //修改图书
    function editBookInfoDialog() {
        var row = $("#book_info_grid").datagrid('getSelected');
        if (row == null) {
            $.messager.alert('提示', '请选中一条数据！', 'info');
        } else {
            //var rowData = JSON.stringify(row);
            selectRowData = row;
            $("#add_new_book_dialogid").dialog({
                title: '编辑',
                width: 850,
                height: 650,
                closed: false,
                cache: false,
                modal: true,
                href: '../bgpages/js/pagejs/addnewbook.jsp?type=edit',
                buttons: [{
                    text: '确定',
                    width: 60,
                    height: 30,
                    iconCls: 'icon-save',
                    handler: function () {

                    }
                }, {
                    text: '取消',
                    width: 60,
                    height: 30,
                    iconCls: 'icon-cancel',
                    handler: function () {
                        $("#add_new_book_dialogid").dialog('close');
                    }
                },

                ],
            });
        }
    }

    //删除
    function deleteOneBookDialog() {
        var row = $("#book_info_grid").datagrid('getSelected');
        if (row == null) {
            $.messager.alert('提示', '请选中一条数据！', 'info');
        } else {
            $.messager.confirm('提示', '您想要下架该图书吗？', function (r) {
                if (r) {
                    // 退出操作;
                    $.ajax({
                        url: '${pageContext.request.contextPath}/book/deleteBook.do',
                        type: 'post',
                        dataType: 'json',
                        success: function (data) {
                            if (data == "success") {
                                $.messager.alert('提示', '该图书已下架！', 'info');
                            } else {
                                $.messager.alert('提示', '失败！', 'danger');
                            }
                        }
                    });
                }
            });
        }
    }


</script>
