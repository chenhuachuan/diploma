<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<div class="row clearfix">
    <div class="col-md-12 column">
        <form class="navbar-form navbar-left" role="search" id="searchData1">
            <div class="form-group">
                订单编号：<input type="text" class="form-control" id="orderNumber1" style="width:240px"/>
            </div>
            <button type="button" onclick="doSearchOrdersRecord()" class="btn btn-default">查询</button>
            <button type="button" onclick="czSearchData1()" class="btn btn-default">重置</button>
        </form>

        <table class="easyui-datagrid" id="orders_record_v_grid" style="width:1600px;height:480px"
               data-options="url:'${pageContext.request.contextPath}/order/payFlowListInfo.do',
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

<div id="orders_record_info_dialog" style="display: none;text-align: center;"></div>

<script>
    $('#orders_record_v_grid').datagrid({
        columns: [[
            {title: 'ID', field: 'flowId', width: 80, align: 'center', hidden: "true"},
            {title: '订单编号', field: 'orderNum', width: 220, align: 'center'},
            {title: '流水号', field: 'flowNum', width: 240, align: 'center'},
            {title: '支付方式', field: 'payMethod', width: 150, align: 'center'},
            {
                title: '支付金额', field: 'payAmount', width: 80, align: 'center',
                formatter: function (value, row, index) {
                    return value + "元";
                }
            },
            {
                title: '创建时间', field: 'createTime', width: 150, align: 'center',
                formatter: function (value, row, index) {
                    var unixTimestamp = new Date(value);
                    return unixTimestamp.toLocaleString();
                }
            },
            {
                title: '购买明细', field: 'buyCount', width: 120, align: 'center',
                formatter: function (value, row, index) {
                    return row.order.buyCount;
                }
            },
            {
                title: '收货人', field: 'receiveName', width: 100, align: 'center',
                formatter: function (value, row, index) {
                    return row.order.receiveName;
                }
            },
            {
                title: '收货人电话', field: 'receiveTel', width: 150, align: 'center',
                formatter: function (value, row, index) {
                    return row.order.receiveTel;
                }
            },
            {
                title: '详细地址', field: 'addrName', width: 230, align: 'center',
                formatter: function (value, row, index) {
                    return row.order.addrName;
                }
            },
            {
                title: '状态', field: 'status', width: 150, align: 'center',
                formatter: function (value, row, index) {
                    if (row.order.status == '20') {
                        return "已付款，未发货";
                    } else if (row.order.status == '10') {
                        return "待付款";
                    } else if (row.order.status == '50') {
                        return "<font color='#28c1e7'>已发货</font>";
                    } else {
                        return "已退款";
                    }
                }
            },
        ]]
    });

    $('#orders_record_v_grid').datagrid({
        toolbar: '#searchData1'
    });

    //查询
    function doSearchOrdersRecord() {
        var search = $('#orderNumber1').val();
        if (search == '') {
            $('#orders_record_v_grid').datagrid('load', {
                row: 10,
                page: 1
            });
        } else {
            $('#orders_record_v_grid').datagrid('load', {
                orderNumber: $('#orderNumber1').val(),
                row: 10,
                page: 1
            });
        }

    }

    //重置
    function czSearchData1() {
        $("#orderNumber1").val("");
    }
</script>
