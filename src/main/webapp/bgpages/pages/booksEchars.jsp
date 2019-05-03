<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="row clearfix">
                <div class="col-md-6 column">
                    <div id="books_echars_pie" style="height: 460px;width: 520px;"></div>
                </div>
                <div class="col-md-6 column">
                    <div id="booksContainer" style="height: 460px;width: 560px;"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    var dom2 = document.getElementById("booksContainer");
    var myChart2 = echarts.init(dom2);
    var app = {};
    option = null;
    option = {
        title: {
            text: '图书销量信息',
            subtext: 'TFBOOK',
            x: 'center'
        },
        legend: {},
        tooltip: {},
        dataset: {
            dimensions: ['product', '销量', '库存', '剩余'],
            source: [
                ['product', '销量', '库存', '剩余'],
                ['小说', 22, 67, 45],
                ['人文社科', 83, 112, 44],
                ['经典名著', 45, 67, 43],
                ['科技文学', 72, 53, 39],
                ['教育', 22, 67, 39],
                ['青春文学', 14, 56, 39],
                ['成功/励志', 50, 53, 3]
            ]
        },
        xAxis: {type: 'category'},
        yAxis: {},
        series: [
            {type: 'bar'},
            {type: 'bar'},
            {type: 'bar'}
        ]
    };
    if (option && typeof option === "object") {
        myChart2.setOption(option, true);
    }

    var dom3 = document.getElementById("books_echars_pie");
    var myChart3 = echarts.init(dom3);
    var app = {};
    option = null;
    option = {
        title: {
            text: '各分类下图书所占比例',
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
            data: ['小说', '人文社科', '经典名著', '科技文学', '教育', '青春文学', '成功/励志']
        },
        series: [
            {
                name: 'TFBOOK',
                type: 'pie',
                radius: '55%',
                center: ['50%', '60%'],
                data: [
                    {value: 335, name: '小说'},
                    {value: 310, name: '人文社科'},
                    {value: 234, name: '经典名著'},
                    {value: 135, name: '科技文学'},
                    {value: 248, name: '教育'},
                    {value: 348, name: '青春文学'},
                    {value: 88, name: '成功/励志'}
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
    if (option && typeof option === "object") {
        myChart3.setOption(option, true);
    }


</script>