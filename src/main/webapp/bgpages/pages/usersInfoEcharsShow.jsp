<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="row clearfix">
                <%--<div class="col-md-6 column">
                    <h3>这里有东西</h3>
                </div>
                <div class="col-md-6 column">
                    <h3>加油</h3>
                </div>--%>

                <div class="alert alert-success alert-dismissable" style="width: 100%">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    <h5 style="text-align: center;vertical-align: center">
                        根据用户在商城购买记录统计...
                    </h5>
                </div>

                <div id="container_shopping" style="height: 500px;width: 100%;"></div>

            </div>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="tabbable" id="tabs-944701">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="#panel-988577" data-toggle="tab">用户购买记录</a>
                    </li>
                    <li>
                        <a href="#panel-456121" data-toggle="tab">购买记录统计占比</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="panel-988577">
                        <div class="row clearfix">
                            <div class="col-md-12 column">
                                <table class="easyui-datagrid" id="users_purchase_record"
                                       style="width:1700px;height:650px"
                                       data-options="url:'${pageContext.request.contextPath}/order/usersPurchaseRecord.do',
                                       fitColumns:false,singleSelect:true,loadMsg:'正在加载...',
                                       rownumbers:true,
                                       pagination:true,
                                       pageNumber:0,
                                       pageSize:10,
                                       pageList:[10,15,20,25],
                                       sortName:'',
                                       sortOrder:'desc',
                                       remoteSort:false,
                                        ">
                                    <%--  <thead>
                                      <tr>
                                          <th>
                                              编号
                                          </th>
                                          <th>
                                              产品
                                          </th>
                                          <th>
                                              交付时间
                                          </th>
                                          <th>
                                              状态
                                          </th>
                                      </tr>
                                      </thead>
                                      <tbody>
                                      <tr>
                                          <td>
                                              1
                                          </td>
                                          <td>
                                              TB - Monthly
                                          </td>
                                          <td>
                                              01/04/2012
                                          </td>
                                          <td>
                                              Default
                                          </td>
                                      </tr>
                                      <tr class="success">
                                          <td>
                                              1
                                          </td>
                                          <td>
                                              TB - Monthly
                                          </td>
                                          <td>
                                              01/04/2012
                                          </td>
                                          <td>
                                              Approved
                                          </td>
                                      </tr>
                                      <tr class="error">
                                          <td>
                                              2
                                          </td>
                                          <td>
                                              TB - Monthly
                                          </td>
                                          <td>
                                              02/04/2012
                                          </td>
                                          <td>
                                              Declined
                                          </td>
                                      </tr>
                                      <tr class="warning">
                                          <td>
                                              3
                                          </td>
                                          <td>
                                              TB - Monthly
                                          </td>
                                          <td>
                                              03/04/2012
                                          </td>
                                          <td>
                                              Pending
                                          </td>
                                      </tr>
                                      <tr class="info">
                                          <td>
                                              4
                                          </td>
                                          <td>
                                              TB - Monthly
                                          </td>
                                          <td>
                                              04/04/2012
                                          </td>
                                          <td>
                                              Call in to confirm
                                          </td>
                                      </tr>
                                      </tbody>--%>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="panel-456121">


                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<script>
    /*数据表格*/
    $("#users_purchase_record").datagrid({
        columns: [[
            {title: '订单号', field: 'orderNumber', width: 130, align: 'center'},
            {title: '用户名', field: 'receiveName', width: 120, align: 'center'},
            {title: '地址', field: 'addrName', width: 220, align: 'center'},
            {title: '电话', field: 'receiveTel', width: 120, align: 'center'},
            {title: '购买详情', field: 'itemCount', width: 300, align: 'center'},
            {title: '图书', field: 'bookName', width: 130, align: 'center'},
            {title: '价格', field: 'bookPrice', width: 120, align: 'center'},
            {title: '价格统计', field: 'itemLittlePrice', width: 150, align: 'center'},
            {title: '订单总计', field: 'totalPrice', width: 80, align: 'center'},
            {
                title: '订单状态', field: 'status', width: 70, align: 'center',
                formatter: function (value, row, index) {
                    if (row.status == '20') {
                        return "未支付订单";
                    } else if (row.status == '30') {
                        return "已支付";
                    } else {
                        return "订单已完成";
                    }
                }
            },
            {
                title: '创建时间', field: 'createTime', width: 140, align: 'center',
                formatter: function (value, row, index) {
                    var unixTimestamp = new Date(value);
                    return unixTimestamp.toLocaleString();
                }
            },
        ]]
    });


    /*echars图*/
    var dom = document.getElementById("container_shopping");
    var myChart = echarts.init(dom);
    var app = {};
    option = null;
    app.title = '购买统计图';

    option = {
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b}: {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            x: 'left',
            data: ['小说', '人文社科', '经典名著', '科技文学', '教育', '青春文学', '成功/励志', '其他']
        },
        series: [
            {
                name: 'TFBOOK',
                type: 'pie',
                selectedMode: 'single',
                radius: [0, '30%'],

                label: {
                    normal: {
                        position: 'inner'
                    }
                },
                labelLine: {
                    normal: {
                        show: false
                    }
                },
                data: [
                    {value: 535, name: '小说', selected: true},
                    {value: 679, name: '人文社科'},
                    {value: 1548, name: '经典名著'}
                ]
            },
            {
                name: 'TFBOOK',
                type: 'pie',
                radius: ['40%', '55%'],
                label: {
                    normal: {
                        formatter: '{a|{a}}{abg|}\n{hr|}\n  {b|{b}：}{c}  {per|{d}%}  ',
                        backgroundColor: '#eee',
                        borderColor: '#aaa',
                        borderWidth: 1,
                        borderRadius: 4,
                        // shadowBlur:3,
                        // shadowOffsetX: 2,
                        // shadowOffsetY: 2,
                        // shadowColor: '#999',
                        // padding: [0, 7],
                        rich: {
                            a: {
                                color: '#999',
                                lineHeight: 22,
                                align: 'center'
                            },
                            // abg: {
                            //     backgroundColor: '#333',
                            //     width: '100%',
                            //     align: 'right',
                            //     height: 22,
                            //     borderRadius: [4, 4, 0, 0]
                            // },
                            hr: {
                                borderColor: '#aaa',
                                width: '100%',
                                borderWidth: 0.5,
                                height: 0
                            },
                            b: {
                                fontSize: 16,
                                lineHeight: 33
                            },
                            per: {
                                color: '#eee',
                                backgroundColor: '#334455',
                                padding: [2, 4],
                                borderRadius: 2
                            }
                        }
                    }
                },
                data: [
                    {value: 935, name: '小说'},
                    {value: 310, name: '人文社科'},
                    {value: 234, name: '经典名著'},
                    {value: 135, name: '科技文学'},
                    {value: 348, name: '教育'},
                    {value: 251, name: '青春文学'},
                    {value: 147, name: '成功/励志'},
                    {value: 102, name: '其他'}
                ]
            }
        ]
    };
    ;
    if (option && typeof option === "object") {
        myChart.setOption(option, true);
    }
</script>