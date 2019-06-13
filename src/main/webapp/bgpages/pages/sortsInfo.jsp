<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<div class="row clearfix">
    <div class="col-md-12 column">
        <div class="col-md-6 column">
            <table class="easyui-datagrid" id="sort_datagrid_one" style="width:600px;height:450px"
                   data-options="url:'${pageContext.request.contextPath}/category/all_category_name_json1.do',
                   fitColumns:true,singleSelect:true,resizeHandle:'right',loadMsg:'正在加载...', rownumbers:true,
                                striped:true,
                   toolbar: [{
                            iconCls: 'icon-add ',
                            text:'添加分类',
                            width:100,
                            height:30,
                            handler: addOneSortDialog
                        },{
                            iconCls: 'icon-edit',
                            text:'修改分类名',
                            width:100,
                            height:30,
                            handler: editSortNameDialog
                        },{
                            iconCls: 'icon-remove',
                            text:'删除分类',
                            width:100,
                            height:30,
                            handler:deleteSortNameDialog
                        }]

                ">
                <thead>
                <tr>
                    <th data-options="field:'sortId',width:40">ID</th>
                    <th data-options="field:'code',width:80">分类级别</th>
                    <th data-options="field:'name',width:80">分类名称</th>
                    <th data-options="field:'name',width:40">父级ID</th>
                    <th data-options="field:'time',width:100">创建时间</th>
                </tr>
                </thead>
            </table>
        </div>
        <div class="col-md-6 column">
            <div id="container_ecahrs" style="height: 450px;width: 400px;margin-left: 100px"></div>
        </div>

    </div>
</div>

<div id="add_new_sort_dialogid" style="display: none;text-align: center;"></div>


<script>
    var selectRowSortData;
    $('#sort_datagrid_one').datagrid({
        columns: [[
            {title: 'ID', field: 'sortId', width: 50, align: 'center', hidden: 'true'},
            {
                title: '分类级别', field: 'sortLevel', width: 100, align: 'center',
                formatter: function (value, row, index) {
                    var curId = row.sortId;
                    if (curId < 10 || row.parentId == 0) {
                        return "一级";
                    } else if (curId >= 10 && curId < 33) {
                        return "二级";
                    } else {
                        return "三级";
                    }
                }
            },
            {title: '分类名称', field: 'sortName', width: 150, align: 'center'},
            {title: '父级ID', field: 'parentId', width: 50, align: 'center'},
            {
                title: '创建时间', field: 'createTime', width: 130, align: 'center',
                formatter: function (value, row, index) {
                    var unixTimestamp = new Date();
                    return unixTimestamp.toLocaleString();
                }
            },
        ]]
    });

    function addOneSortDialog() {
        $("#add_new_sort_dialogid").dialog({
            title: '添加新类别',
            width: 450,
            height: 380,
            closed: false,
            cache: false,
            modal: true,
            href: '../bgpages/js/pagejs/addNewSort.jsp?type=add',
            buttons: [{
                text: '确定',
                width: 70,
                height: 30,
                iconCls: 'icon-save',
                handler: function () {
                    var sort_name = $("#sort_name_id").val();
                    var pardd = 0;
                    var sordd1 = $("#sortName").val();//一级
                    var sordd2 = $("#sortName2").val();//二级
                    var sortLevel = $("#sortLevel").val();//等级
                    var isfvalidate = $("#sortDetail_form").form('validate');
                    if (sortLevel == 1) {
                        $("#sortName").combobox({disabled: true});
                        $("#sortName2").combobox({disabled: true});
                        if (sort_name == "") {
                            $("#error_tips_div").css("display", "");
                            return;
                        }

                    }
                    if (sortLevel == 2) {
                        $("#sortName2").combobox({disabled: true});
                        $("#sortName").combobox({disabled: false});
                        if (sort_name == "" || sordd1 == "") {
                            $("#error_tips_div").css("display", "");
                            return;
                        }
                    }
                    if (sortLevel == 3) {
                        $("#sortName2").combobox({disabled: false});
                        $("#sortName").combobox({disabled: false});
                        if (sort_name == "" || sordd1 == "" || sordd2 == "") {
                            $("#error_tips_div").css("display", "");
                            return;
                        }
                    }
                    if (isfvalidate) {
                        $("#error_tips_div").css("display", "none");
                        $.ajax({
                            url: '${pageContext.request.contextPath}/category/add_newSort_CNG_001.do',
                            type: 'post',
                            data: {
                                "sortName": sort_name,
                                "sortOne": pardd,
                                "sortTwo": sordd1,
                                "sortThree": sordd2
                            },
                            dataType: 'text',
                            success: function (data) {
                                if (data == "success") {
                                    $.messager.alert('提示', '添加成功！', 'info');
                                } else {
                                    $.messager.alert('提示', '失败！', 'danger');
                                }
                            }
                        });
                        $("#add_new_sort_dialogid").dialog('close');
                    } else {
                        $("#error_tips_div").css("display", "");
                        return;
                    }
                }
            }, {
                text: '取消',
                width: 70,
                height: 30,
                iconCls: 'icon-cancel',
                handler: function () {
                    $("#add_new_sort_dialogid").dialog('close');
                }
            }],
            onDestroy: function () {
                $('#sort_datagrid_one').datagrid('reload');
            },
            onClose: function () {
                $('#sort_datagrid_one').datagrid('reload');
            }
        });
    }

    function editSortNameDialog() {
        var row = $("#sort_datagrid_one").datagrid('getSelected');
        if (row == null) {
            $.messager.alert('提示', '请选中一条数据！', 'info');
        } else {
            selectRowSortData = row;
            $("#add_new_sort_dialogid").dialog({
                title: '编辑',
                width: 450,
                height: 380,
                closed: false,
                cache: false,
                modal: true,
                href: '../bgpages/js/pagejs/addNewSort.jsp?type=edit',
                buttons: [{
                    text: '确定',
                    width: 60,
                    height: 30,
                    iconCls: 'icon-save',
                    handler: function () {
                        var sort_name = $("#sort_name_id").val();
                        var parentId = $("#hidde_parentdI_m").val();
                        var sortId = $("#hidde_sortId_m").val();
                        var sordd1 = $("#sortName").val();//一级
                        var sordd2 = $("#sortName2").val();//二级
                        var sortLevel = $("#sortLevel").val(), sdd = "";//等级
                        if (sort_name == "") {
                            $("#error_tips_div").css("display", "");
                            return;
                        } else {
                            if (sortLevel == 1) {
                                sdd = 0;
                            }
                            if (sortLevel == 2 || sortLevel == 3) {
                                sdd = "";
                            }
                            $("#error_tips_div").css("display", "none");
                            $.ajax({
                                url: '${pageContext.request.contextPath}/category/modifydOneSort_CNG_001.do',
                                type: 'post',
                                data: {
                                    "sortDB": sdd,
                                    "sortId": sortId,
                                    "sortName": sort_name,
                                    "parentId": parentId,
                                    "sortOne": sordd1,
                                    "sortTwo": sordd2
                                },
                                dataType: 'text',
                                success: function (data) {
                                    if (data == "success") {
                                        $.messager.alert('提示', '修改成功！', 'info');
                                        $("#add_new_sort_dialogid").dialog('close');
                                        $('#sort_datagrid_one').datagrid('reload');
                                    } else {
                                        $.messager.alert('提示', '失败！', 'danger');
                                    }
                                }
                            });
                        }
                    }
                }, {
                    text: '取消',
                    width: 60,
                    height: 30,
                    iconCls: 'icon-cancel',
                    handler: function () {
                        $("#add_new_sort_dialogid").dialog('close');
                    }
                },

                ],
            });
        }

    }

    function deleteSortNameDialog() {
        var row = $("#sort_datagrid_one").datagrid('getSelected');
        if (row == null) {
            $.messager.alert('提示', '请选中一条数据！', 'info');
        } else {
            $.messager.confirm('提示', '确定删除？', function (r) {
                if (r) {
                    // 退出操作;
                    $.ajax({
                        url: '${pageContext.request.contextPath}/category/deleteOneSort_CNG_001.do',
                        type: 'post',
                        data: {
                            "sortId": row.sortId
                        },
                        dataType: 'text',
                        success: function (data) {
                            if (data == "success") {
                                $.messager.alert('提示', '删除成功！', 'info');
                                $('#sort_datagrid_one').datagrid('reload');
                            } else {
                                $.messager.alert('提示', '失败！', 'danger');
                            }
                        }
                    });
                    $('#sort_datagrid_one').datagrid('reload');
                }
            });
        }
    }

    /*echars*/
    var dom = document.getElementById("container_ecahrs");
    var myChart = echarts.init(dom);
    var app = {};
    option = null;
    option = {
        title: {
            text: '分类信息',
            subtext: 'TFBOOK',
            x: 'center'
        },
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            left: 'left',
            data: ['一级分类', '二级分类', '三级分类', '四级分类', '其他']
        },
        series: [
            {
                name: '分类信息',
                type: 'pie',
                radius: '55%',
                center: ['50%', '60%'],
                data: [
                    {value: 9, name: '一级分类'},
                    {value: 23, name: '二级分类'},
                    {value: 69, name: '三级分类'},
                    {value: 0, name: '四级分类'},
                    {value: 0, name: '其他'}
                ],
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };
    ;
    if (option && typeof option === "object") {
        myChart.setOption(option, true);
    }


</script>