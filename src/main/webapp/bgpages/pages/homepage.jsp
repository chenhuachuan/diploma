<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--商城信息--%>
<div class="inner-block">
    <!--用户，订单，信息-->
    <div class="market-updates">
        <div class="col-md-4 market-update-gd" style="height: 80px">
            <div class="market-update-block clr-block-1" onclick="userInfoList()" style="height: 120px;">
                <div class="col-md-6 market-update-left">
                    <h3>${sessionScope.userCount}</h3>
                    <h4>商城用户</h4>
                    <p>Shopping Users</p>
                </div>
                <div class="col-md-6 market-update-right">
                    <i class="fa fa-file-text-o">
                        <img src="../bgpages/images/user_logo.jpg" width="140" height="100">
                    </i>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="col-md-4 market-update-gd" style="height: 80px">
            <div class="market-update-block clr-block-2" onclick="addOrderManager()" style="height: 120px;">
                <div class="col-md-6 market-update-left">
                    <h3>${sessionScope.orderCount}</h3>
                    <h4>商城订单</h4>
                    <p>Shopping Orders</p>
                </div>
                <div class="col-md-6 market-update-right">
                    <img src="../bgpages/images/order_logo.jpg" width="140" height="100">
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="col-md-4 market-update-gd" style="height: 80px">
            <div class="market-update-block clr-block-3" onclick="addOrderRecordInfo()" style="height: 120px;">
                <div class="col-md-6 market-update-left">
                    <h3>${sessionScope.recordCount}</h3>
                    <h4>交易记录</h4>
                    <p>Trading Record</p>
                </div>
                <div class="col-md-5 market-update-right">
                    <img src="../bgpages/images/cart_logo.jpg" width="140" height="100">
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="clearfix"></div>

        <%--商品、订单统计表格--%>
        <div class="col-md-12 column" style="margin-top: 30px">
            <div class="row clearfix" style="margin-top: 40px;">
                <div class="col-md-6 column">
                    <div class="row clearfix">
                        <div class="col-md-6 column">
                            <table class="table table-bordered" border="1">
                                <thead>
                                <tr>
                                    <th width="50px" style="text-align: center;background-color: rgba(97,103,92,0.82)"
                                        colspan="2">订单信息统计
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td width="50px">
                                        未处理订单：
                                    </td>
                                    <td width="50px">
                                        ${sessionScope.orderInfoStaties.wcl}
                                    </td>
                                </tr>
                                <tr>
                                    <td width="50px">
                                        代发货订单：
                                    </td>
                                    <td width="50px">
                                        ${sessionScope.orderInfoStaties.dfh}
                                    </td>
                                </tr>
                                <tr class="error">
                                    <td width="50px">
                                        待结算订单
                                    </td>
                                    <td width="50px">
                                        ${sessionScope.orderInfoStaties.dfk}
                                    </td>
                                </tr>
                                <tr class="warning">
                                    <td width="50px">
                                        已经成交订单
                                    </td>
                                    <td width="50px">
                                        ${sessionScope.orderInfoStaties.ycj}
                                    </td>
                                </tr>
                                <tr class="warning">
                                    <td width="50px">
                                        用户已删除
                                    </td>
                                    <td width="50px">
                                        ${sessionScope.orderInfoStaties.ysc}
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="col-md-6 column">
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th style="text-align: center;background-color: rgba(97,103,92,0.82)" colspan="2">
                                        商品信息统计
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>
                                        图书总数：
                                    </td>
                                    <td>
                                        ${sessionScope.booksInfoStaties.tuzs}
                                    </td>
                                </tr>
                                <tr class="success">
                                    <td>
                                        上架图书：
                                    </td>
                                    <td>
                                        ${sessionScope.booksInfoStaties.sjts}
                                    </td>
                                </tr>
                                <tr class="error">
                                    <td>
                                        下架图书
                                    </td>
                                    <td>
                                        ${sessionScope.booksInfoStaties.xjts}
                                    </td>
                                </tr>
                                <tr class="warning">
                                    <td>
                                        热销图书
                                    </td>
                                    <td>
                                        ${sessionScope.booksInfoStaties.rxts}
                                    </td>
                                </tr>
                                <tr class="warning">
                                    <td>
                                        好评图书
                                    </td>
                                    <td>
                                        ${sessionScope.booksInfoStaties.jjts}
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 column">
                    <div class="row clearfix">
                        <div class="col-md-6 column">
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th style="text-align: center;background-color: rgba(97,103,92,0.82)" colspan="2">
                                        用户登录统计
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>
                                        用户登录数：
                                    </td>
                                    <td>
                                        ${sessionScope.userInfoStaties.totalUser}
                                    </td>
                                </tr>
                                <tr class="success">
                                    <td>
                                        系统管理员：
                                    </td>
                                    <td>
                                        ${sessionScope.userInfoStaties.totalAdmin}
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="col-md-6 column">
                            <div class="row clearfix">
                                <div class="col-md-12 column">
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th style="text-align: center;background-color: rgba(97,103,92,0.82)"
                                                colspan="2">最新消息
                                            </th>
                                        </tr>
                                        </thead>
                                    </table>
                                    <div>
                                        <ol style="padding-left: 20px;">
                                            <li>
                                                您有两个新订单，请及时处理。
                                            </li>
                                            <li>
                                                XX图书在最近两个月位居销售榜首。
                                            </li>
                                            <li>
                                                暂无更多消息
                                            </li>
                                        </ol>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%--表格--%>
        <div class="col-md-12 column" style="margin-top: 25px">
            <div class="row clearfix">
                <div class="col-md-6 column">
                    <span style="font-size: medium;color:rgba(231,70,102,0.99)">热销图书</span>
                    <table class="table">
                        <thead>
                        <tr class="info">
                            <th>
                                编号
                            </th>
                            <th>
                                图书名称
                            </th>
                            <th>
                                库存
                            </th>
                            <th>
                                销量
                            </th>
                            <th>
                                上架时间
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${sessionScope.bg_hotBooks1}" var="ht_book" varStatus="ind">
                            <tr class="warning">
                                <td>
                                        ${ind.index+1}
                                </td>
                                <td>
                                        ${ht_book.bookName}
                                </td>
                                <td>
                                        ${ht_book.repertory}
                                </td>
                                <td>
                                        ${ht_book.saleCount}
                                </td>
                                <td>
                                    <fmt:formatDate value="${ht_book.publishTime}"
                                                    pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-6 column">
                    <span style="font-size: medium;color: #2aabd2">最新图书</span>
                    <table class="table">
                        <thead>
                        <tr class="info">
                            <th>
                                编号
                            </th>
                            <th>
                                图书名称
                            </th>
                            <th>
                                库存
                            </th>
                            <th>
                                销量
                            </th>
                            <th>
                                状态
                            </th>
                            <th>
                                上架时间
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${sessionScope.newBookShelvesBG}" var="nw_book" varStatus="ind1">
                            <tr class="warning">
                                <td>
                                        ${ind1.index+1}
                                </td>
                                <td>
                                        ${nw_book.bookName}
                                </td>
                                <td>
                                        ${nw_book.repertory}
                                </td>
                                <td>
                                        ${nw_book.saleCount}
                                </td>
                                <td>
                                    <c:if test="${nw_book.status=='0'}">
                                        已下架
                                    </c:if>
                                    <c:if test="${nw_book.status=='1'}">
                                        已上架
                                    </c:if>
                                </td>
                                <td>
                                    <fmt:formatDate value="${nw_book.publishTime}"
                                                    pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="col-md-12 column" style="margin-top: 30px;">
            <div class="row clearfix">
                <div class="col-md-6 column">
                    <div id="container" style="height:500px"></div>
                </div>
                <div class="col-md-1" column></div>
                <div class="col-md-5 column">
                    <div id="container_pie2" style="height: 500px;"></div>
                </div>
            </div>
        </div>


        <div class="clearfix"></div>


    </div>
    <div class="container" style="text-align: center">
        <p>Copyright &copy; 2019.chenhc All rights reserved !</p>
    </div>
</div>

<script>

    var dom = document.getElementById("container");
    var myChart = echarts.init(dom);
    var app = {};
    option = null;
    option = {
        title: {
            text: '年度销售概览',
            subtext: 'TFBOOK'
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data: ['销售量', '系统库存']
        },
        toolbox: {
            show: true,
            feature: {
                dataView: {show: true, readOnly: false},
                magicType: {show: true, type: ['line', 'bar']},
                restore: {show: true},
                saveAsImage: {show: true}
            }
        },
        calculable: true,
        xAxis: [
            {
                type: 'category',
                data: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月']
            }
        ],
        yAxis: [
            {
                type: 'value'
            }
        ],
        series: [
            {
                name: '销售量',
                type: 'bar',
                data: [32, 63, 47, 23, 121, 76, 135, 162, 211, 78, 64, 133],
                markPoint: {
                    data: [
                        {type: 'max', name: '最大值'},
                        {type: 'min', name: '最小值'}
                    ]
                },
                markLine: {
                    data: [
                        {type: 'average', name: '平均值'}
                    ]
                }
            },
            {
                name: '系统库存',
                type: 'bar',
                data: [66, 73, 67, 43, 171, 86, 185, 222, 256, 108, 121, 203],
                markPoint: {
                    data: [
                        {name: '年最高', value: 185, xAxis: 7, yAxis: 183},
                        {name: '年最低', value: 43, xAxis: 11, yAxis: 3}
                    ]
                },
                markLine: {
                    data: [
                        {type: 'average', name: '平均值'}
                    ]
                }
            }
        ]
    };
    ;
    if (option && typeof option === "object") {
        myChart.setOption(option, true);
    }

    /*饼图*/
    var dom = document.getElementById("container_pie2");
    var myChart = echarts.init(dom);
    var app = {};
    option = null;
    app.title = 'TFBOOK销量一览';

    option = {
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b}: {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            x: 'left',
            data: ['小说', '人文社科', '经典名著', '科技文学', '其他']
        },
        series: [
            {
                name: '销量情况',
                type: 'pie',
                radius: ['50%', '70%'],
                avoidLabelOverlap: false,
                label: {
                    normal: {
                        show: false,
                        position: 'center'
                    },
                    emphasis: {
                        show: true,
                        textStyle: {
                            fontSize: '30',
                            fontWeight: 'bold'
                        }
                    }
                },
                labelLine: {
                    normal: {
                        show: false
                    }
                },
                data: [
                    {value: 1335, name: '小说'},
                    {value: 310, name: '人文社科'},
                    {value: 234, name: '经典名著'},
                    {value: 135, name: '科技文学'},
                    {value: 548, name: '其他'}
                ]
            }
        ]
    };
    ;
    if (option && typeof option === "object") {
        myChart.setOption(option, true);
    }
</script>

