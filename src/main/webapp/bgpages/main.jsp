<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Home</title>
    <script type="text/javascript" src="../bgpages/js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="../bgpages/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../bgpages/js/jquery.min.js"></script>
    <script type="text/javascript" src="../bgpages/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../bgpages/js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../bgpages/js/echarts.js"></script>
    <script type="text/javascript" src="../bgpages/js/echarts.min.js"></script>
    <script type="text/javascript" src="../bgpages/js/china.js"></script>
    <script type="text/javascript" src="../bgpages/js/dataTool.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/bgpages/js/pagejs/main.js"></script>

    <link rel="stylesheet" type="text/css" href="../bgpages/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="../bgpages/css/demo.css">
    <link rel="stylesheet" type="text/css" href="../bgpages/css/style_bg.css">
    <link rel="stylesheet" type="text/css" href="../bgpages/themes/bootstrap/easyui.css">
    <link href="${pageContext.request.contextPath}/pages/css/bootstrap.css" rel="stylesheet" type="text/css"
          media="all">
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"
          media="all">
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet"
          type="text/css" media="all">


    <%--
     <link href="${pageContext.request.contextPath}/pages/css/style.css" rel="stylesheet" type="text/css" media="all"/>
     <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
     <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
     <script src="${pageContext.request.contextPath}/pages/js/jquery-1.10.2.js" type="text/javascript"></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/pages/js/easing.js"></script>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/pages/css/flexslider.css" type="text/css"
           media="screen"/>
     <link href="${pageContext.request.contextPath}/pages/css/megamenu.css" rel="stylesheet" type="text/css"
           media="all"/>
     <link href="${pageContext.request.contextPath}/pages/css/form.css" rel="stylesheet" type="text/css" media="all"/>
     <link href="${pageContext.request.contextPath}/pages/css/slider.css" rel="stylesheet" type="text/css"/>
     <link href="${pageContext.request.contextPath}/pages/css/font-awesome/css/font-awesome.css" rel="stylesheet"
           type="text/css"/>
     <link href="${pageContext.request.contextPath}/pages/css/font-awesome/css/font-awesome.min.css" rel="stylesheet"
           type="text/css"/>
     <script type="text/javascript" src="${pageContext.request.contextPath}/pages/js/megamenu.js"></script>
     <script src="${pageContext.request.contextPath}/pages/js/menu_jquery.js"></script>
     <script src="${pageContext.request.contextPath}/pages/js/jquery.easydropdown.js"></script>
     <script src="${pageContext.request.contextPath}/pages/js/jquery.etalage.min.js"></script>
     <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
     <script type="text/javascript" src="${pageContext.request.contextPath}/pages/js/jquery.flexisel.js"></script>
     <script defer src="${pageContext.request.contextPath}/pages/js/jquery.flexslider.js"></script>
     --%>
</head>
<body class="easyui-layout" onKeyDown="enter_btn_submit()">

<div data-options="region:'north',title:'',split:true" style="height:90px;background-color: rgba(89,103,69,0.23)">
    <div class="container" style="width: 100%;">
        <input id="PageContext" type="hidden" value="${pageContext.request.contextPath}"/>
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div class="row clearfix">
                    <div class="col-md-4 column">
                        <img alt="140x140" src="../image/lb/logo.png"/>
                    </div>
                    <div class="col-md-4 column">
                        <h2 class="text-info">
                            TFBOOK<span>在线书城后台管理系统</span>
                        </h2>
                    </div>
                    <div class="col-md-4 column">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse"
                                    data-target="#bs-example-navbar-collapse-1">
                                <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span>
                                <span class="icon-bar"></span><span class="icon-bar"></span>
                            </button>
                        </div>
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav">
                                <c:if test="${sessionScope.CurrentAdmin==null}">
                                    <li class="active">
                                            <%--  <a href="../pages/login.jsp">登录</a>--%>
                                        <a href="javascript:void(0)" onclick="sysmanLogin()">登录</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0)" onclick="sysmanRegist()">注册</a>
                                    </li>
                                </c:if>
                                <c:if test="${sessionScope.CurrentAdmin!=null}">
                                    <li>
                                        <a href="javascript:void(0)">欢迎您：<font color="#e76f40"
                                                                               size="2.2px">${sessionScope.CurrentAdmin.nickName}</font></a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0)" onclick="requireToLogOut()">退出</a>
                                    </li>

                                    <li style="display: none" class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">个人首页<strong
                                                class="caret"></strong></a>
                                        <ul class="dropdown-menu">
                                            <li>
                                                <a href="#">我的订单</a>
                                            </li>
                                            <li>
                                                <a href="#">我的收藏</a>
                                            </li>
                                            <li>
                                                <a href="#">我的消息</a>
                                            </li>
                                            <li class="divider">
                                            </li>
                                            <li>
                                                <a href="#">我的消息</a>
                                            </li>
                                            <li class="divider">
                                            </li>
                                            <li>
                                                <a href="#">One more separated link</a>
                                            </li>
                                        </ul>
                                    </li>
                                </c:if>
                                <li style="">
                                    <a>
                                        <div id="time1"></div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%--

            <div class="row clearfix">
                <div class="col-md-12 column">
                    <div class="row clearfix">
                        <div class="col-md-2 column" style="text-align: center">
                            <div class="panel-group" id="panel-218780">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <a class="panel-title" id="sys_main_tf" data-toggle="collapse" data-parent="#panel-218780" href="#panel-element-437117">系统首页</a>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <a class="panel-title" data-toggle="collapse" data-parent="#panel-218780" href="#panel-element-608282">产品管理</a>
                                    </div>
                                    <div id="panel-element-608282" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            产品分类
                                        </div>
                                        <div class="panel-body">
                                            产品厂家
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <a class="panel-title" data-toggle="collapse" data-parent="#panel-218780" href="#panel-element-60822">交易管理</a>
                                    </div>
                                    <div id="panel-element-60822" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            交易信息
                                        </div>
                                        <div class="panel-body">订单信息</div>
                                        <div class="panel-body">订单处理</div>
                                        <div class="panel-body">退款管理</div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <a class="panel-title" data-toggle="collapse" data-parent="#panel-218780" href="#panel-element-63382">会员管理</a>
                                    </div>
                                    <div id="panel-element-63382" class="panel-collapse collapse">
                                        <div class="panel-body">会员列表</div>
                                        <div class="panel-body">会员记录管理</div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <a class="panel-title" data-toggle="collapse" data-parent="#panel-218780" href="#panel-element-608dd282">图片管理</a>
                                    </div>
                                    <div id="panel-element-608dd282" class="panel-collapse collapse">
                                        <div class="panel-body">广告管理</div>
                                        <div class="panel-body">分类管理</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-10 column">
                            <div class="tabbable" id="tabs-126014">
                                <ul class="nav nav-tabs">
                                    <li class="active">
                                        <a href="javascript:void(0)" data-toggle="tab">首页</a>
                                    </li>
                                </ul>
                                <div class="tab-content" id="tab_main_sb">
                                    <div class="tab-pane active" id="panel-465233">
                                        <jsp:include page="../bgpages/main_v2.jsp"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="row clearfix" style="margin-top: 100px">
                        <div class="col-md-12 column" style="text-align: center">
                            <p>
                                Copyright &copy; 2019.chenhc All rights reserved !
                            </p>
                        </div>
                    </div>

                </div>
            </div>
        --%>

    </div>
</div>

<div data-options="region:'west',split:true,title:'分页导航'" style="width:200px;padding:5px;">
    <div id="menus_accordion" class="easyui-accordion" data-options="fit:true,collapsed:true" style="height: 10px;">
        <div title="系统首页" data-options="iconCls:'icon-save'" onclick="pageHome()"
             style="overflow:auto;padding:10px;"></div>
        <div title="图书管理" data-options="iconCls:'icon-reload'">
            <button type="button" id="book_category_show" onclick="addBookSortsTab()" class="btn btn-info"
                    style="width:150px;margin: 3px;margin-left: 5px;">图书分类
            </button>
            <br/>
            <button type="button" id="book_info_show" onclick="addBookInfoTab()" class="btn btn-info"
                    style="width:150px;margin: 3px;margin-left: 5px;">图书信息
            </button>
            <br/>
            <button type="button" class="btn btn-info" onclick="addBooksShowTab()"
                    style="width:150px;margin: 3px;margin-left: 5px;">图书展示
            </button>
            <br/>
            <button type="button" class="btn btn-info" onclick="addBooksShoweCharsTab()"
                    style="width:150px;margin: 3px;margin-left: 5px;">图例展示
            </button>
            <br/>
        </div>
        <div title="图片管理" data-options="iconCls:'icon-reload'">
            <button type="button" class="btn btn-info" onclick="addBannerImage()"
                    style="width:150px;margin: 3px;margin-left: 5px;">轮播图管理
            </button>
            <br/>
            <button type="button" class="btn btn-info" onclick="addImageManager()"
                    style="width:150px;margin: 3px;margin-left: 5px;">图书图片管理
            </button>
            <br/>
        </div>
        <div title="交易管理" data-options="iconCls:'icon-reload'">
            <button type="button" class="btn btn-info" style="width:150px;margin: 3px;margin-left: 5px;">交易信息</button>
            <br/>
            <button type="button" class="btn btn-info" style="width:150px;margin: 3px;margin-left: 5px;">订单管理</button>
            <br/>
            <button type="button" class="btn btn-info" style="width:150px;margin: 3px;margin-left: 5px;">订单处理</button>
            <br/>
            <button type="button" class="btn btn-info" style="width:150px;margin: 3px;margin-left: 5px;">退款管理</button>
            <br/>
        </div>
        <div title="用户管理" data-options="iconCls:'icon-reload'">
            <button type="button" class="btn btn-info" onclick="userInfoList()"
                    style="width:150px;margin: 3px;margin-left: 5px;">用户列表
            </button>
            <br/>
            <button type="button" class="btn btn-info" onclick="usersInfoStatitShow()"
                    style="width:150px;margin: 3px;margin-left: 5px;">用户统计展示
            </button>
            <br/>
        </div>
        <div title="文章管理" data-options="iconCls:'icon-reload'">
            <button type="button" class="btn btn-info" style="width:150px;margin: 3px;margin-left: 5px;">文章列表</button>
            <br/>
        </div>
    </div>
</div>
<%--   <div data-options="region:'east',split:true,collapsed:false,title:'xx'" style="width:100px;padding:10px;">右边</div>
--%>
<div data-options="region:'center',split:true,title:'系统首页'">
    <div id="tabs" class="easyui-tabs" data-options="fit:true,narrow:true,pill:true">
        <div title="主页" data-options="iconCls:'icon-neighbourhood',"
             style="background-color: rgba(74,45,31,0.22);background-size:100% 100%;">
            <div class="alert alert-success alert-dismissable" style="width: 100%">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <h5 style="text-align: center;vertical-align: center">
                    <strong>欢迎使用TFBOOK后台管理系统v1.0.0</strong> 您本次登录时间为：2019-05-03,登录IP：1111111111
                </h5>
            </div>


            <%-- 未登录show 轮播图--%>
            <div class="col-md-12 column" style="display: none;">
                <div class="carousel slide" id="carousel-449715">
                    <ol class="carousel-indicators">
                        <li class="active" data-slide-to="0" data-target="#carousel-449715">
                        </li>
                        <li data-slide-to="1" data-target="#carousel-449715">
                        </li>
                        <li data-slide-to="2" data-target="#carousel-449715">
                        </li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="item active">
                            <img alt="" src="../pages/images/shop-slider/slide1/banner1.jpg"/>
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
                        <div class="item">
                            <img alt="" src="../pages/images/shop-slider/slide2/banner2.jpg"/>
                            <div class="carousel-caption">
                                <h4>
                                    为乐趣而读书。
                                </h4>
                                <p>
                                    书籍把我们引入最美好的社会&amp; 使我们认识各个时代的伟大智者。--史美尔斯
                                </p>
                            </div>
                        </div>
                        <div class="item">
                            <img alt="" src="../pages/images/shop-slider/slide3/banner3.jpg"/>
                            <div class="carousel-caption">
                                <h4>
                                    每一次飞行都始于坠落。
                                </h4>
                                <p>
                                    遇到最好的自己。--chenhc
                                </p>
                            </div>
                        </div>
                    </div>
                    <a class="left carousel-control" href="#carousel-449715" data-slide="prev"><span
                            class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control"
                                                                                    href="#carousel-449715"
                                                                                    data-slide="next"><span
                        class="glyphicon glyphicon-chevron-right"></span></a>
                </div>
            </div>

            <jsp:include page="../bgpages/pages/homepage.jsp"/>


        </div>
    </div>
</div>
<div id="sysman_login_regist_dialog" style="display: none;text-align: center;"></div>

<div class="footer">
    <div class="container">
        <p>Copyright &copy; 2019.chenhc All rights reserved !</p>
    </div>
</div>
<script>

</script>
</body>
</html>