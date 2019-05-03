<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>

<%--商城信息--%>
<div class="inner-block">
    <!--用户，订单，信息-->
    <div class="market-updates">
        <div class="col-md-4 market-update-gd" style="height: 80px">
            <div class="market-update-block clr-block-1" style="height: 120px;">
                <div class="col-md-6 market-update-left">
                    <h3>83</h3>
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
            <div class="market-update-block clr-block-2" style="height: 120px;">
                <div class="col-md-6 market-update-left">
                    <h3>135</h3>
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
            <div class="market-update-block clr-block-3" style="height: 120px;">
                <div class="col-md-6 market-update-left">
                    <h3>233</h3>
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
                                        21
                                    </td>
                                </tr>
                                <tr>
                                    <td width="50px">
                                        代发货订单：
                                    </td>
                                    <td width="50px">
                                        1
                                    </td>
                                </tr>
                                <tr class="error">
                                    <td width="50px">
                                        待结算订单
                                    </td>
                                    <td width="50px">
                                        0
                                    </td>
                                </tr>
                                <tr class="warning">
                                    <td width="50px">
                                        已经成交订单
                                    </td>
                                    <td width="50px">
                                        33
                                    </td>
                                </tr>
                                <tr class="warning">
                                    <td width="50px">
                                        交易取消
                                    </td>
                                    <td width="50px">
                                        3
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
                                        233
                                    </td>
                                </tr>
                                <tr class="success">
                                    <td>
                                        上架图书：
                                    </td>
                                    <td>
                                        233
                                    </td>
                                </tr>
                                <tr class="error">
                                    <td>
                                        下架图书
                                    </td>
                                    <td>
                                        2
                                    </td>
                                </tr>
                                <tr class="warning">
                                    <td>
                                        热销图书
                                    </td>
                                    <td>
                                        2
                                    </td>
                                </tr>
                                <tr class="warning">
                                    <td>
                                        好评图书
                                    </td>
                                    <td>
                                        2
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
                                        1223
                                    </td>
                                </tr>
                                <tr class="success">
                                    <td>
                                        注册会员数：
                                    </td>
                                    <td>
                                        332
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
                                                绿皮书电影上映获得好评
                                            </li>
                                            <li>
                                                复仇者联盟4票房大卖
                                            </li>
                                            <li>
                                                如何拯救一个傻逼
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
                    <table class="table">
                        <thead>
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
                        </tbody>
                    </table>
                </div>
                <div class="col-md-6 column">
                    <table class="table">
                        <thead>
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
            text: '某地区蒸发量和降水量',
            subtext: '纯属虚构'
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data: ['蒸发量', '降水量']
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
                name: '蒸发量',
                type: 'bar',
                data: [2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3],
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
                name: '降水量',
                type: 'bar',
                data: [2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3],
                markPoint: {
                    data: [
                        {name: '年最高', value: 182.2, xAxis: 7, yAxis: 183},
                        {name: '年最低', value: 2.3, xAxis: 11, yAxis: 3}
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
    app.title = '环形图';

    option = {
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b}: {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            x: 'left',
            data: ['直接访问', '邮件营销', '联盟广告', '视频广告', '搜索引擎']
        },
        series: [
            {
                name: '访问来源',
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
                    {value: 335, name: '直接访问'},
                    {value: 310, name: '邮件营销'},
                    {value: 234, name: '联盟广告'},
                    {value: 135, name: '视频广告'},
                    {value: 1548, name: '搜索引擎'}
                ]
            }
        ]
    };
    ;
    if (option && typeof option === "object") {
        myChart.setOption(option, true);
    }
</script>

