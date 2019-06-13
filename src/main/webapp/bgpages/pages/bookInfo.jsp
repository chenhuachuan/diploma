<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<div class="row clearfix">
    <div class="col-md-12 column">

        <form class="navbar-form" role="search" id="searchBook_data">
            <div class="form-group">
                图书名称：<input type="text" class="form-control" id="bookName" style="width:240px;height: 30px"/>
            </div>
            <button type="button" onclick="doSearchBooks()" class="btn btn-default" style="height: 30px">查询</button>
            <button type="button" onclick="czSearchData()" class="btn btn-default" style="height: 30px">重置</button>
        </form>

        <table class="easyui-datagrid" id="book_info_grid" style="width:2200px;height:580px"
               data-options="url:'${pageContext.request.contextPath}/book/allBooksInfo.do',
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
                        },{
                            iconCls: 'icon-add',
                            text:'上架',
                            width:100,
                            height:30,
                            handler:dkakaOneBookDialog
                        }]

                ">
        </table>
    </div>
</div>

<%--新图书--%>
<div id="add_new_book_dialogid" style="display: none;text-align: center;"></div>


<script>
    var selectRowData, $bookDetail_form_id;
    $('#book_info_grid').datagrid({
        columns: [[
            {
                title: '状态', field: 'status', width: 120, align: 'center',
                formatter: function (value, row, index) {
                    if (value == '1') {
                        return "<font color='green'>已上架</font>";
                    } else if (value == '0') {
                        return "<font color='red'>已下架</font>";
                    } else {
                        return "data error ";
                    }
                }
            },
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
                title: '出版时间', field: 'publishTime', width: 150, align: 'center',
                formatter: function (value, row, index) {
                    var unixTimestamp = new Date(row.publishTime);
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
            {title: '图书图片', field: 'imgUrl', width: 190, align: 'center'},
            {title: '图书介绍', field: 'bookIntro', width: 500, align: 'center'},
            {title: '编辑推荐', field: 'commend', width: 550, align: 'center'},
        ]]
    });

    $('#book_info_grid').datagrid({
        toolbar: '#searchBook_data'
    });

    //图书搜索
    function doSearchBooks() {
        var search = $('#bookName').val();
        if (search == '') {
            $('#book_info_grid').datagrid('load', {
                row: 10,
                page: 1
            });
        }
        else {
            $('#book_info_grid').datagrid('load', {
                bookName: $('#bookName').val(),
                row: 10,
                page: 1
            });
        }
    }

    //重置
    function czSearchData() {
        $("#bookName").val("");
    }

    function addOneBookDialog() {
        $("#add_new_book_dialogid").dialog({
            title: '添加新书',
            width: 850,
            height: 650,
            closed: false,
            cache: false,
            modal: true,
            href: '../bgpages/js/pagejs/addnewbook.jsp?type=add',
            //href: '../bgpages/js/pagejs/addFile.jsp',
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
                height: 720,
                closed: false,
                cache: false,
                modal: true,
                //href: '../bgpages/js/pagejs/addnewbook.jsp?type=edit',
                href: '${pageContext.request.contextPath}/book/bookDetail_M_CNG_001.do?bookId=' + row.bookId,
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
        if (row.status == '0') {
            $.messager.alert('提示', '该图书已经下架了！', 'info');
            return;
        }
        if (row == null) {
            $.messager.alert('提示', '请选中一条数据！', 'info');
        } else {
            $.messager.confirm('提示', '您想要下架该图书吗？', function (r) {
                if (r) {
                    // 退出操作;
                    $.ajax({
                        url: '${pageContext.request.contextPath}/book/modifyBookState_CNG_CHC.do?status=0&bookId=' + row.bookId,
                        type: 'post',
                        dataType: 'text',
                        success: function (data) {
                            if (data == "success") {
                                $.messager.alert('提示', '该图书已下架！', 'info');
                                $("#book_info_grid").datagrid('reload');
                            } else {
                                $.messager.alert('提示', '失败！', 'danger');
                            }
                        }
                    });
                }
            });
        }
    }

    //上架
    function dkakaOneBookDialog() {
        var row = $("#book_info_grid").datagrid('getSelected');
        if (row.status == '1') {
            $.messager.alert('提示', '该图书已经上架了！', 'info');
            return;
        }
        if (row == null) {
            $.messager.alert('提示', '请选中一条数据！', 'info');
        } else {
            $.messager.confirm('提示', '您想要重新上架该图书吗？', function (r) {
                if (r) {
                    // 退出操作;
                    $.ajax({
                        url: '${pageContext.request.contextPath}/book/modifyBookState_CNG_CHC.do?status=1&bookId=' + row.bookId,
                        type: 'post',
                        dataType: 'text',
                        success: function (data) {
                            if (data == "success") {
                                $.messager.alert('提示', '该图书已上架！', 'info');
                                $("#book_info_grid").datagrid('reload');
                            } else {
                                $.messager.alert('提示', '失败！', 'danger');
                            }
                        }
                    });
                }
            });
        }
    }

    //添加新书：
    function addNewBook_button_submit() {
        var imageddd = $("#add_imgUrl").val();
        var valid = $("#bookDetail_form_id").form('validate');
        if (!valid) {
            $.messager.alert('我的消息', '存在未完成项，请检查！', 'warning');
            return valid;
        } else if (imageddd == "") {
            $.messager.alert('我的消息', '请选择需要上传的图片！', 'warning');
            return;
        } else {
            $('#bookDetail_form_id').form('submit', {
                url: '${pageContext.request.contextPath}/book/addOneNewBook_CNG_001',
                onSubmit: function () {
                },
                success: function (data) {
                    $.messager.alert('我的消息', '保存成功！', 'info');
                    $("#add_new_book_dialogid").dialog('close');
                    $("#book_info_grid").datagrid('reload');
                }
            });
        }
    }

    //修改
    function modifyBookInfoCNG_CHC() {
        $.messager.confirm('提示', '确定修改？', function (r) {
            if (r) {
                $('#modify_book_info').form('submit', {
                    url: '${pageContext.request.contextPath}/book/modifyOneBook_CNG_001',
                    onSubmit: function () {
                        var valid = $("#modify_book_info").form('validate');
                        if (!valid) {
                            $.messager.alert('我的消息', '存在未完成项，请检查！', 'warning');
                        }
                        return valid;
                    },
                    success: function (data) {
                        $.messager.alert('我的消息', '保存成功！', 'info');
                        $("#add_new_book_dialogid").dialog('close');
                        $("#book_info_grid").datagrid('reload');
                    }
                });
            }
        });

    }


</script>


<%--
  var bookName = $("#add_bookName").val();
        var author = $("#add_author").val();
        var wordCount = $("#add_wordCount").val();
        var pageCount = $("#add_pageCount").val();
        var publishCompany = $("#add_publishCompany").val();
        var kaiBen = $("#add_kaiBen").val();
        var repertory = $("#add_repertory").val();
        var bookPrice = $("#add_bookPrice").val();
        var originalPrice = $("#add_originalPrice").val();
        var isbn = $("#add_isbn").val();
        var sortId = $("#sortId_id").val();
        //var imgUrl = $("#add_imgUrl").getValue();
        //var imgUrl = $("#add_imgUrl").filebox('getText');
        var bookIntro = $("#add_bookIntro").val();
        var commend = $("#add_commend").val();
        var publishTime = $("#publishTime_id").val();
        var jsonData={
            "bookId":"",
            "bookName":bookName,
            "author":author,
            "wordCount":parseInt(wordCount),
            "pageCount":parseInt(pageCount),
            "publishCompany":publishCompany,
            "kaiBen":kaiBen,
            "repertory":parseInt(repertory),
            "bookPrice":parseFloat(bookPrice),
            "originalPrice":parseFloat(originalPrice),
            "isbn":isbn,
            "sortId":sortId,
            //"imgUrl":"",
            "bookIntro":bookIntro,
            "commend":commend,
            "publishTime":new Date(publishTime),
            "status":"1",
            "saleCount":0,
        };
        console.log(jsonData);

--%>