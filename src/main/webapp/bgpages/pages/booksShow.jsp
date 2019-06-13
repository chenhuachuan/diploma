<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>所有图书</title>
<body>

<div class="row clearfix">
    <div class="detailb_main">
        <div class="col-md-12 column">
            <div class="showgrid_of_6">
                <c:forEach items="${books}" var="book">
                    <div class="showgrid_son_of_6" style="margin-top: 15px">
                        <div class="son_content_box">
                            <img alt="300x200" src="${pageContext.request.contextPath}/${book.imgUrl}"
                                 style="width:180px;height:200px;"/>
                            <div class="caption">
                                <center>
                                    <h4>${book.bookName}</h4>
                                    <p>${book.author}</p>
                                </center>
                                <p style="text-align: center">
                                    <a class="btn btn-primary" onclick="openBookDetailDialog('${book.bookId}')"
                                       style="width: 60px" href="javascript:void(0)">详情</a>
                                    <c:if test="${book.status=='1'}">
                                        <a class="btn btn-primary" onclick="soldOutBook('${book.bookId}')"
                                           style="width: 60px" href="javascript:void(0)"><font color="#daa520">下架</font></a>
                                    </c:if>
                                    <c:if test="${book.status=='0'}">
                                        <a class="btn btn-primary" onclick="noSoldOutBook('${book.bookId}')"
                                           style="width: 60px" href="javascript:void(0)">上架</a>
                                    </c:if>
                                </p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<div class="row clearfix">
    <div class="col-md-4 column"></div>
    <div class="col-md-4 column">
        <ul class="pagination">
            <c:if test="${currentPage<=1}">
                <li class="disabled">
                    <a href="#">上一页</a>
                </li>
            </c:if>
            <c:if test="${currentPage>1}">
                <li>
                        <%--   <a href="${pageContext.request.contextPath}/book/queryBooksbyPage.do?currentPage=${currentPage-1}">上一页</a>--%>
                    <a href="javascript:void(0)" onclick="gotoPage('${currentPage-1}')">上一页</a>
                </li>
            </c:if>
            <c:if test="${totalCount>2}">
                <c:forEach begin="1" step="1" end="${totalCount-1}" varStatus="statusA">
                    <li
                            <c:if test="${currentPage==statusA.index}">
                                class="active"
                            </c:if>
                    >
                            <%--<a href="${pageContext.request.contextPath}/book/queryBooksbyPage.do?currentPage=${statusA.index}">${statusA.index}</a>--%>
                        <a href="javascript:void(0)" onclick="lastPage('${statusA.index}')">${statusA.index}</a>
                    </li>
                </c:forEach>
            </c:if>
            <li class="disabled">
                <a href="#">...</a>
            </li>
            <li
                    <c:if test="${currentPage==totalCount}">
                        class="active"
                    </c:if>
            >
                <a href="javascript:void(0)" onclick="toLastPage('${totalCount}')">${totalCount}</a>
                <%--
                                <a href="${pageContext.request.contextPath}/book/queryBooksbyPage.do?currentPage=${totalCount}">${totalCount}</a>
                --%>
            </li>

            <c:if test="${currentPage<totalCount}">
                <li>
                        <%--     <a href="${pageContext.request.contextPath}/book/queryAllBooksbyPage.do?currentPage=${currentPage+1}">下一页</a>--%>
                    <a href="javascript:void(0)" onclick="nextPage('${currentPage+1}')">下一页</a>
                </li>
            </c:if>
            <c:if test="${currentPage==totalCount}">
                <li class="disabled">
                    <a href="#">下一页</a>
                </li>
            </c:if>
        </ul>
    </div>
    <div class="col-md-4 column">
    </div>
</div>
<%--图书详情--%>
<div class="easyui-dialog" id="book_show_detail_dialog" style="display: none;"></div>

<script>
    function openBookDetailDialog(bookId) {
        $("#book_show_detail_dialog").dialog({
            title: '图书详情',
            width: 730,
            height: 460,
            closed: false,
            cache: false,
            modal: true,
            //href:'../bgpages/js/pagejs/bookDetail.jsp',
            href: '${pageContext.request.contextPath}/book/bookDetail.do?bookId=' + bookId,
            buttons: [{
                text: '关闭',
                width: 70,
                height: 30,
                handler: function () {
                    $("#book_show_detail_dialog").dialog('close');
                }
            }]
        });
    }

    function noSoldOutBook(bookId) {
        $.messager.confirm('提示', '是否确定下架该商品？', function (r) {
            if (r) {
                $.ajax({
                    url: '${pageContext.request.contextPath}/book/modifyBookState_CNG_CHC.do?status=1&bookId=' + bookId,
                    type: 'post',
                    dataType: 'text',
                    success: function (data) {
                        if (data == "success") {
                            $.messager.alert('成功', '该商品已下架！', 'info');
                        } else {
                            $.messager.alert('提示', '失败！', 'danger');
                        }
                    }
                });
            }
        });
    }
    //下架
    function soldOutBook(bookId) {
        $.messager.confirm('提示', '是否确定下架该商品？', function (r) {
            if (r) {
                $.ajax({
                    url: '${pageContext.request.contextPath}/book/modifyBookState_CNG_CHC.do?status=0&bookId=' + bookId,
                    type: 'post',
                    dataType: 'text',
                    success: function (data) {
                        if (data == "success") {
                            $.messager.alert('成功', '该商品已下架！', 'info');
                        } else {
                            $.messager.alert('提示', '失败！', 'danger');
                        }
                    }
                });
            }
        });


    }


</script>


</body>
</head>
</html>

















