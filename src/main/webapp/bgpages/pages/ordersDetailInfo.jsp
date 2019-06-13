<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-md-12 column">
    <div class="alert" style="background-color: rgba(177,192,231,0.4)">
        <h5 style="text-align: left">订单信息：</h5>
        <span>
                    订单号：${orderDetail.orderNumber}  &nbsp;&nbsp;&nbsp;
                    创建时间： <fmt:formatDate value="${orderDetail.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>  &nbsp;&nbsp;&nbsp;
                    总计：${orderDetail.totalPrice} &nbsp;&nbsp;&nbsp;<br/>
                    商品名称：${orderDetail.bookName} &nbsp;&nbsp;&nbsp;<br/>
                    状态：
                    <c:if test="${orderDetail.status=='10'}">
                        待付款
                    </c:if>
                    <c:if test="${orderDetail.status=='20'}">
                        已付款
                        &nbsp;&nbsp;&nbsp;
                        支付方式：支付宝支付
                    </c:if>
                    <c:if test="${orderDetail.status=='30'}">
                        订单已删除
                    </c:if>

                </span>
    </div>

    <div class="alert" style="background-color: rgba(129,231,126,0.24)">
        <h5 style="text-align: left">收件人信息：</h5>
        <span>
                收货人姓名：${orderDetail.receiveName} &nbsp;&nbsp;&nbsp;
                收货电话：：${orderDetail.receiveTel}  &nbsp;&nbsp;&nbsp;
                邮政编码:${address.zipCode} &nbsp;&nbsp;
                详细地址：  ${orderDetail.addrName}
                </span>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <c:forEach items="${books}" var="book">
                <div class="row clearfix">
                    <div class="col-md-3 column">
                        <img alt="140x140" src="${pageContext.request.contextPath}/${book.imgUrl}"/>
                    </div>
                    <div class="col-md-9 column">
                        <ul style="text-align: left">
                            <li>
                                <font style="font-size: medium;color: rgba(231,83,29,0.71)">图书名称：${book.bookName}</font>
                            </li>
                            <li>
                                作者：${book.author}
                            </li>
                            <li>
                                价格：${book.bookPrice} &nbsp;&nbsp;&nbsp; 原价：${book.originalPrice}
                            </li>
                            <li>
                                出版社：${book.publishCompany}
                            </li>
                            <li>
                                出版时间:<fmt:formatDate value="${book.publishTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                            </li>
                            <li>
                                字数:${book.wordCount}&nbsp;&nbsp;&nbsp;页数:${book.pageCount}&nbsp;&nbsp;
                            </li>
                            <li>
                                isbn:${book.isbn} &nbsp;&nbsp;&nbsp;开本:${book.kaiBen}
                            </li>
                            <li>
                                图书介绍：${book.bookIntro}
                            </li>
                        </ul>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
