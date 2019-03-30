<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<h3 class="m_2">热销图书</h3>

<div class="best">
    <c:forEach items="${hotbooks}" var="book" varStatus="num">
        <c:if test="${num.index+1<=3}">
            <div>
                <h4><font color="red">${num.index+1}.</font></h4>
            </div>
        </c:if>
        <c:if test="${num.index+1>3}">
            <div>
                <h4>${num.index+1}.</h4>
            </div>
        </c:if>
        <div class="icon">
            <a href="${pageContext.request.contextPath}/book/bookDetails.do?bookId=${book.bookId}">
                <img src="..${book.imgUrl}" class="img-responsive" alt="" width="74px;" height="74px;"/>
            </a>
        </div>
        <div class="data">
            <h4>
                <a href="${pageContext.request.contextPath}/book/bookDetails.do?bookId=${book.bookId}">${book.bookName}</a>
            </h4>
            <p>￥.68.00</p>
            <h5>￥.${book.bookPrice}</h5>
        </div>
    </c:forEach>
    <div class="clearfix"></div>
</div>

<%--
<h3 class="m_2">热销图书</h3>
<div class="best">
    <div class="icon">
        <img src="image/books/13_jyzhd1.jpg" class="img-responsive" alt=""/>
    </div>
    <div class="data">
        <h4><a href="#">都挺好</a></h4>
        <p>$120.00</p>
        <h5>$120.00</h5>
    </div>
    <div class="clearfix"></div>
</div>
<div class="best">
    <div class="icon">
        <img src="images/sh.jpg" class="img-responsive" alt=""/>
    </div>
    <div class="data">
        <h4><a href="#">欢乐颂</a></h4>
        <p>$120.00</p>
        <h5>$120.00</h5>
    </div>
    <div class="clearfix"></div>
</div>
<div class="best">
    <div class="icon">
        <img src="images/sh.jpg" class="img-responsive" alt=""/>
    </div>
    <div class="data">
        <h4><a href="#">倚天屠龙记</a></h4>
        <p>$120.00</p>
        <h5>$120.00</h5>
    </div>
    <div class="clearfix"></div>
</div>
<div class="best">
    <div class="icon">
        <img src="images/sh.jpg" class="img-responsive" alt=""/>
    </div>
    <div class="data">
        <h4><a href="#">琅琊榜</a></h4>
        <p>$120.00</p>
        <h5>$120.00</h5>
    </div>
    <div class="clearfix"></div>
</div>
<div class="best">
    <div class="icon">
        <img src="images/sh.jpg" class="img-responsive" alt=""/>
    </div>
    <div class="data">
        <h4><a href="#">神雕侠侣</a></h4>
        <p>$58.00</p>
        <h5>$38.00</h5>
    </div>
    <div class="clearfix"></div>
</div>
--%>