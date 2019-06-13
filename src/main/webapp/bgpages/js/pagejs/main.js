$(function () {
    $("#menus_accordion").accordion('getSelected').panel('collapse');

    //时间
    window.onload = function () {
        //定时器每秒调用一次fnDate()
        setInterval(function () {
            fnDate();
        }, 1000);
    }

//js 获取当前时间
    function fnDate() {
        var oDiv = document.getElementById("time1");
        var date = new Date();
        var year = date.getFullYear();//当前年份
        var month = date.getMonth();//当前月份
        var data = date.getDate();//天
        var hours = date.getHours();//小时
        var minute = date.getMinutes();//分
        var second = date.getSeconds();//秒
        var time = year + "年" + fnW((month + 1)) + "月" + fnW(data) + "日 "
            + fnW(hours) + ":" + fnW(minute) + ":" + fnW(second);
        oDiv.innerHTML = time;
    }

//补位 当某个字段不是两位数时补0
    function fnW(str) {
        var num;
        str >= 10 ? num = str : num = "0" + str;
        return num;
    }

    var add = descideShowHomePage();
    if (!add) {
        sysmanLogin();
    } else {
        $("#sysman_login_regist_dialog").dialog('close');
    }
})

//判断用户是否登录
function descideShowHomePage() {

    var islogin = $("#no_understand_not_touch1").val();
    if (islogin == null || islogin == '') {
        alert("-----------系统提示：您还没有登录,请先登录-------------");
        return false;
    } else {
        return true;
    }

}


function sysmanLogin() {
    $("#sysman_login_regist_dialog").dialog({
        title: '管理员登录',
        width: 435,
        height: 260,
        closed: false,
        cache: false,
        modal: true,
        href: '../bgpages/pages/admin.jsp?stype=add',
        buttons: [/*{
            text: '确定',
            width: 70,
            height: 30,
            iconCls: 'icon-save',
            handler: function () {
                $("#addUser_form").form('submit', {
                    url: '',
                    onSubmit: function () {
                        var valid = $("#admin_form").form('validate');
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
        }, */{
            text: '关闭',
            width: 70,
            height: 30,
            handler: function () {
                $("#sysman_login_regist_dialog").dialog('close');
            }
        }]
    });

}

function sysmanRegist() {
    $("#sysman_login_regist_dialog").dialog({
        title: '管理员注册',
        width: 435,
        height: 425,
        closed: false,
        cache: false,
        modal: true,
        href: '../bgpages/pages/admin.jsp?stype=reg',
        buttons: [/*{
            text: '确定',
            width: 70,
            height: 30,
            iconCls: 'icon-save',
            handler: function () {
                $("#addUser_form").form('submit', {
                    url: '',
                    onSubmit: function () {
                        var valid = $("#admin_form").form('validate');
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
        }, */{
            text: '关闭',
            width: 70,
            height: 30,
            handler: function () {
                $("#sysman_login_regist_dialog").dialog('close');
            }
        }]
    });

}

function requireToLogOut() {
    $.messager.confirm('提示', '您想要退出该系统吗？', function (r) {
        if (r) {
            // 退出操作;
            $.ajax({
                url: $("#PageContext").val() + "/user/logout_admin.do",
                type: 'post',
                success: function (data) {
                    if (data == 'success_logout') {
                        $.messager.show({
                            title: '我的消息',
                            msg: '已成功退出系统！',
                            timeout: 2000,
                            showType: 'slide',
                        });
                    }
                    setTimeout(function () {  //使用  setTimeout（）方法设定定时2000毫秒
                        window.location.reload();//页面刷新
                    }, 1000);
                }
            });
        }
    });
}

function enter_btn_submit() {
    if (event.keyCode == 13) {
        submitAdminLogin();
    }
}


//首页
function pageHome() {
    // var exist = $("#tabs").tabs('exists', "首页");
    //选中该选项卡
    $("#tabs").tabs('select', "系统首页");
}

function addBookSortsTab() {
    var isLogin = descideShowHomePage();
    if (isLogin == true) {
        //判断该选项卡是否存在
        var exx = $("#tabs").tabs('exists', "图书分类");
        if (!exx) {
            $("#tabs").tabs('add', {
                title: "图书分类",
                iconCls: 'icon-save',
                closable: true,
                href: '../bgpages/pages/sortsInfo.jsp',
            });
        } else {
            //选中该选项卡
            $("#tabs").tabs('select', "图书分类");
        }
    } else {
        return;
    }

}

//图书信息
function addBookInfoTab() {
    var isLogin = descideShowHomePage();
    if (isLogin == true) {
        //判断该选项卡是否存在
        var exx = $("#tabs").tabs('exists', "图书信息");
        if (!exx) {
            $("#tabs").tabs('add', {
                title: "图书信息",
                iconCls: 'icon-save',
                closable: true,
                href: '../bgpages/pages/bookInfo.jsp',
            });
        } else {
            //选中该选项卡
            $("#tabs").tabs('select', "图书信息");
        }
    } else {
        return;
    }
}

//图书展示
function addBooksShowTab() {
    var isLogin = descideShowHomePage();
    if (isLogin == true) {
        //判断该选项卡是否存在
        var exx = $("#tabs").tabs('exists', "图书展示");
        if (!exx) {
            $("#tabs").tabs('add', {
                title: "图书展示",
                iconCls: 'icon-add',
                closable: true,
                href: '../bgpages/pages/detail.jsp',
                //href:'../bgpages/pages/booksShow.jsp',
            });

        } else {
            //选中该选项卡
            $("#tabs").tabs('select', "图书展示");
        }
    } else {
        return;
    }
}

//ecahrs图
function addBooksShoweCharsTab() {
    var isLogin = descideShowHomePage();
    if (isLogin == true) {
        //判断该选项卡是否存在
        var exx = $("#tabs").tabs('exists', "图例展示");
        if (!exx) {
            $("#tabs").tabs('add', {
                title: "图例展示",
                iconCls: 'icon-save',
                closable: true,
                href: '../bgpages/pages/booksEchars.jsp',
            });
        } else {
            //选中该选项卡
            $("#tabs").tabs('select', "图例展示");
        }
    } else {
        return;
    }
}

function addBannerImage() {
    var isLogin = descideShowHomePage();
    if (isLogin == false) return;
    //判断该选项卡是否存在
    var exx = $("#tabs").tabs('exists', "轮播图管理");
    if (!exx) {
        $("#tabs").tabs('add', {
            title: "轮播图管理",
            iconCls: 'icon-save',
            closable: true,
            href: '../bgpages/pages/bannerImage.jsp',
        });
    } else {
        //选中该选项卡
        $("#tabs").tabs('select', "轮播图管理");
    }
}

//图书图片管理
function addImageManager() {
    var isLogin = descideShowHomePage();
    if (isLogin == false) return;
    //判断该选项卡是否存在
    var exx = $("#tabs").tabs('exists', "图书图片管理");
    if (!exx) {
        $("#tabs").tabs('add', {
            title: "图书图片管理",
            iconCls: 'icon-save',
            closable: true,
            href: '../bgpages/pages/booksImage.jsp',
        });
    } else {
        //选中该选项卡
        $("#tabs").tabs('select', "图书图片管理");
    }
}

//用户列表
function userInfoList() {
    var isLogin = descideShowHomePage();
    if (isLogin == false) return;
    //判断该选项卡是否存在
    var exx = $("#tabs").tabs('exists', "用户列表");
    if (!exx) {
        $("#tabs").tabs('add', {
            title: "用户列表",
            iconCls: 'icon-save',
            closable: true,
            href: '../bgpages/pages/usersInfoList.jsp',
        });
    } else {
        //选中该选项卡
        $("#tabs").tabs('select', "用户列表");
    }
}

//用户信息统计展示
function usersInfoStatitShow() {
    var isLogin = descideShowHomePage();
    if (isLogin == false) return;
//判断该选项卡是否存在
    var exx = $("#tabs").tabs('exists', "用户信息统计展示");
    if (!exx) {
        $("#tabs").tabs('add', {
            title: "用户信息统计展示",
            iconCls: 'icon-save',
            closable: true,
            href: '../bgpages/pages/usersInfoEcharsShow.jsp',
        });
    } else {
        //选中该选项卡
        $("#tabs").tabs('select', "用户信息统计展示");
    }
}

function addJyInfo() {
    var isLogin = descideShowHomePage();
    if (isLogin == false) return;
    var exx = $("#tabs").tabs('exists', "交易信息");
    if (!exx) {
        $("#tabs").tabs('add', {
            title: "交易信息",
            iconCls: 'icon-save',
            closable: true,
            href: '../bgpages/pages/usersJiaoYiInfo.jsp',
        });
    } else {
        //选中该选项卡
        $("#tabs").tabs('select', "交易信息");
    }
}

function addOrderManager() {
    var isLogin = descideShowHomePage();
    if (isLogin == false) return;
    var exx = $("#tabs").tabs('exists', "订单管理");
    if (!exx) {
        $("#tabs").tabs('add', {
            title: "订单管理",
            iconCls: 'icon-save',
            closable: true,
            href: '../bgpages/pages/usersOrderManager.jsp',
        });
    } else {
        //选中该选项卡
        $("#tabs").tabs('select', "订单管理");
    }
}

function addOrderRecordInfo() {
    var isLogin = descideShowHomePage();
    if (isLogin == false) return;
    var exx = $("#tabs").tabs('exists', "交易记录");
    if (!exx) {
        $("#tabs").tabs('add', {
            title: "交易记录",
            iconCls: 'icon-save',
            closable: true,
            href: '../bgpages/pages/userOrderRecordInfo.jsp',
        });
    } else {
        //选中该选项卡
        $("#tabs").tabs('select', "交易记录");
    }
}
