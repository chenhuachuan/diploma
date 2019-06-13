<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-md-12 column">
    <div class="row clearfix">
        <div class="col-md-12">
            <img alt="140x140" src="${pageContext.request.contextPath}/${imageDetail.imageUrl}"
                 style="width: 100%;height: 300px;"/>
        </div>
        <div class="col-md-12 column">
            <h5 style="text-align: left">图片详情：</h5>
            <div class="row clearfix">
                <div class="col-md-1 column">
                </div>
                <div class="col-md-11 column">
                    <ul style="text-align: left">
                        <li>
                            图片位置：&nbsp;&nbsp;&nbsp;&nbsp;<font color="#ff8a68">
                            <c:if test="${imageDetail.type=='0'}">
                                背景小图
                            </c:if>
                            <c:if test="${imageDetail.type=='1'}">
                                轮播图
                            </c:if>
                        </font>
                        </li>
                        <li>
                            图片状态：&nbsp;&nbsp;&nbsp;&nbsp;<font color="#ff8a68">
                            <c:if test="${imageDetail.status=='0'}">
                                已禁用
                            </c:if>
                            <c:if test="${imageDetail.status=='1'}">
                                已启用
                            </c:if>
                            <c:if test="${imageDetail.status=='2'}">
                                已删除
                            </c:if>
                        </font>
                        </li>
                        <li>
                            替换时间:&nbsp;&nbsp;&nbsp;&nbsp; <fmt:formatDate value="${imageDetail.replaceTime}"
                                                                          pattern="yyyy-MM-dd HH:mm:ss"/>
                        </li>
                        <li>
                            图片描述：&nbsp;&nbsp;&nbsp;&nbsp;${imageDetail.imageDesc}
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
