<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<div class="row clearfix">
    <div class="col-md-12 column">
        <form class="navbar-form navbar-left" role="search" id="searchData">
            <div class="form-group">
                订单编号：<input type="text" class="form-control" id="orderNumber" style="width:240px"/>
            </div>
            <button type="button" onclick="doSearchOrders()" class="btn btn-default">查询</button>
            <button type="button" onclick="czSearchData()" class="btn btn-default">重置</button>
        </form>

        <table class="easyui-datagrid" id="orders_info_grid" style="width:1600px;height:480px"
               data-options="url:'${pageContext.request.contextPath}/order/usersPurchaseRecord.do',
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

<div id="orders_info_dialog_id" style="display: none;text-align: center;"></div>

<script>
    var selectRowOrdersData;
    $('#orders_info_grid').datagrid({
        columns: [[
            {title: 'ID', field: 'orderId', width: 80, align: 'center', hidden: "true"},
            {title: '订单编号', field: 'orderNumber', width: 220, align: 'center'},
            {title: '产品名称', field: 'bookName', width: 200, align: 'center'},
            {title: '数量', field: 'itemCount', width: 200, align: 'center'},
            {title: '总价', field: 'totalPrice', width: 60, align: 'center'},
            {
                title: '订单时间', field: 'createTime', width: 150, align: 'center',
                formatter: function (value, row, index) {
                    var unixTimestamp = new Date(value);
                    return unixTimestamp.toLocaleString();
                }
            },
            {title: '收货人', field: 'receiveName', width: 80, align: 'center'},
            {title: '收货人电话', field: 'receiveTel', width: 100, align: 'center'},
            {
                title: '状态', field: 'status', width: 150, align: 'center',
                formatter: function (value, row, index) {
                    if (row.status == '20') {
                        return "已付款，未发货";
                    } else if (row.status == '10') {
                        return "待付款";
                    } else if (row.status == '50') {
                        return "<font color='#28c1e7'>已发货</font>";
                    } else {
                        return "订单完成，用户已删除订单";
                    }
                }
            },
            {
                title: '操作', field: 'radry', width: 260, align: 'center',
                formatter: function (value, row, index) {
                    var btn = '<button type="button" class="btn btn-success btn-xs"><a href="javascript:void(0)" rel="external nofollow" name="opera1" onclick="deliverGoods()"  class="easyui-linkbutton" >发货</a></button>' +
                        '&nbsp;&nbsp;&nbsp;' +
                        '<button type="button" class="btn btn-info btn-xs"><a href="javascript:void(0)" rel="external nofollow" onclick="orderDetailInfo()" name="opera2" class="easyui-linkbutton" >订单明细</a></button>'
                    ;
                    var btn2 = '<button type="button" class="btn btn-info btn-xs"><a href="javascript:void(0)" rel="external nofollow" onclick="orderDetailInfo()" name="opera2" class="easyui-linkbutton" >订单明细</a></button>' +
                        '&nbsp;&nbsp;&nbsp;' +
                        '<button type="button" class="btn btn-warning btn-xs"><a href="javascript:void(0)" rel="external nofollow" onclick="deleteOrder()" name="opera2" class="easyui-linkbutton" >删除</a></button>'
                    ;
                    var btn3 = '<button type="button" class="btn btn-info btn-xs"><a href="javascript:void(0)" rel="external nofollow" onclick="orderDetailInfo()" name="opera2" class="easyui-linkbutton" >订单明细</a></button>';
                    var btn4 = '<button type="button" class="btn btn-info btn-xs"><a href="javascript:void(0)" rel="external nofollow" onclick="orderDetailInfo()" name="opera2" class="easyui-linkbutton" >订单明细</a></button>' +
                        '&nbsp;&nbsp;&nbsp;' +
                        '<button type="button" class="btn btn-warning btn-xs"><a href="javascript:void(0)" rel="external nofollow" onclick="deleteOrder()" name="opera2" class="easyui-linkbutton" >删除</a></button>';
                    var btn5 = '<button type="button" class="btn btn-info btn-xs"><a href="javascript:void(0)" rel="external nofollow" onclick="orderDetailInfo()" name="opera2" class="easyui-linkbutton" >订单明细</a></button>' +
                        '&nbsp;&nbsp;&nbsp;' +
                        '<button type="button" class="btn btn-warning btn-xs"><a href="javascript:void(0)" rel="external nofollow" onclick="deleteOrder()" name="opera2" class="easyui-linkbutton" >退款中</a></button>';
                    /* //10:代付款，20：已付款 30：用户删除订单 40：发货  50:已发货  60：取消订单 */
                    if (row.status == '20') {
                        return btn;
                    } else if (row.status == '30' || row.status == '50') {
                        return btn2;
                    } else if (row.status == '10') {
                        return btn4;
                    } else if (row.status == '60') {
                        return btn5;
                    } else {
                        return btn3;
                    }
                }
            }
        ]]
    });

    $('#orders_info_grid').datagrid({
        toolbar: '#searchData'
    });

    //查询
    function doSearchOrders() {
        var search = $('#orderNumber').val();
        if (search == '') {
            $('#orders_info_grid').datagrid('load', {
                row: 10,
                page: 1
            });
        } else {
            $('#orders_info_grid').datagrid('load', {
                orderNumber: $('#orderNumber').val(),
                row: 10,
                page: 1
            });
        }

    }

    //重置
    function czSearchData() {
        $("#orderNumber").val("");
    }


    //发货
    function deliverGoods() {
        var rowOrders = $("#orders_info_grid").datagrid('getSelected');
        if (rowOrders == null) {
            $.messager.alert('提示', '请选中一条数据！', 'info');
        } else {
            $.messager.confirm('提示', '确定发货？', function (r) {
                if (r) {
                    $.ajax({
                        url: '${pageContext.request.contextPath}/order/deliverOrder.do',
                        type: 'post',
                        dataType: 'json',
                        data: {
                            orderNumber: rowOrders.orderNumber
                        },
                        success: function (data) {
                            if (data == 'success') {
                                $.messager.alert('我的消息', '已发货！', 'info');
                            } else {
                                $.messager.alert('我的消息', '系统维护中，请稍后再试！', 'info');
                            }
                        }
                    });
                }
            });
        }
    }

    //订单明细
    function orderDetailInfo() {
        var rowOrders = $("#orders_info_grid").datagrid('getSelected');
        if (rowOrders == null) {
            $.messager.alert('提示', '请选中一条数据！', 'info');
        } else {
            selectRowOrdersData = rowOrders;
            var orderId = rowOrders.orderId;
            $("#orders_info_dialog_id").dialog({
                title: '订单明细',
                width: 850,
                height: 560,
                closed: false,
                cache: false,
                modal: true,
                //href: '../bgpages/pages/ordersDetailInfo.jsp?type=edit',
                href: '${pageContext.request.contextPath}/order/orderDetailInfo.do?orderId=' + orderId,
                buttons: [{
                    text: '关闭',
                    width: 70,
                    height: 30,
                    iconCls: 'icon-cancel',
                    handler: function () {
                        $("#orders_info_dialog_id").dialog('close');
                    }
                }],
                onDestroy: function () {
                    $('#orders_info_grid').datagrid('reload');
                },
                onClose: function () {
                    $('#orders_info_grid').datagrid('reload');
                }
            });
        }
    }

    //删除订单
    function deleteOrder() {
        var rowOrders = $("#orders_info_grid").datagrid('getSelected');
        if (rowOrders == null) {
            $.messager.alert('提示', '请选中一条数据！', 'info');
        } else {
            $.messager.confirm('提示', '确定删除该订单记录吗？', function (r) {
                if (r) {
                    $.ajax({
                        url: '${pageContext.request.contextPath}/order/deleteOrderInfo.do',
                        type: 'post',
                        dataType: 'json',
                        data: {
                            orderNumber: rowOrders.orderNumber
                        },
                        success: function (data) {
                            if (data == 'success') {
                                $('#orders_info_grid').datagrid('reload');
                                $.messager.alert('我的消息', '已删除！', 'info');
                            } else {
                                $.messager.alert('我的消息', '系统维护中，请稍后再试！', 'info');
                            }
                        }
                    });
                }
            });
        }
        $('#orders_info_grid').datagrid('reload');
    }

</script>
