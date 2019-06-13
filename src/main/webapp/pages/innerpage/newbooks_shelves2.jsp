<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<ul id="flexiselDemo3-1">
    <c:forEach items="${newbooks2}" var="book">
        <li>
            <div class="biseller-column">
                <a href="${pageContext.request.contextPath}/book/bookDetails.do?bookId=${book.bookId}">
                    <img src="${pageContext.request.contextPath}/${book.imgUrl}" class="img-responsive" alt=""
                         width="200px" height="200px"
                         class="veiw-img"/>
                </a>
                <a href="${pageContext.request.contextPath}/book/bookDetails.do?bookId=${book.bookId}"><i
                        class="new"></i></a>
                <div class="biseller-name">
                    <h4 style="text-align: center;">${book.bookName} &nbsp;&nbsp;&nbsp;&nbsp;${book.author}</h4>
                        <%--<a href="#">cart</a>--%>
                    <div class="col-md-12">
                        <p class="col-md-5">￥${book.bookPrice}</p>
                        <div class="col-md-4">
                            <img class="show_img_cart" title="添加" data-toggle="tooltip" src="../image/lb/car1.jpg"
                                 id="img_cart_id"
                                 onclick="window.location.href='${pageContext.request.contextPath}/cart/addToCart.do?bookId=${book.bookId}'"
                                 style="width:30px;height:38px;">
                        </div>
                        <div class="col-md-3">
                            <img class="show_img_wish" title="收藏" src="../image/lb/collect_red.jpg"
                                 data-toggle="tooltip"
                                 onclick="window.location.href='${pageContext.request.contextPath}/user/person/addWishBook.do?bookId=${book.bookId}'"
                                 style="width:30px;height:38px;">
                        </div>
                    </div>
                </div>
            </div>
        </li>
    </c:forEach>
</ul>
<script>
    $(function () {
        $('.show_img_cart').tooltip('show');
        $('.show_img_wish').tooltip('show');
    });

</script>