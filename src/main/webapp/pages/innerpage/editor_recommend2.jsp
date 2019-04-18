<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<ul id="flexiselDemo5">
    <c:forEach items="${editor_books}" var="ebook">
        <li>
            <div class="biseller-column">
                <a href="${pageContext.request.contextPath}/book/bookDetails.do?bookId=${ebook.bookId}">
                    <img src="${pageContext.request.contextPath}${ebook.imgUrl}" class="img-responsive" alt=""></a>
                <a href="${pageContext.request.contextPath}/book/bookDetails.do?bookId=${ebook.bookId}"><i
                        class="new"></i></a>
                <div class="biseller-name">
                    <h4 style="text-align: center;">${ebook.bookName}</h4>
                    <div class="col-md-12">
                        <p class="col-md-5">￥${ebook.bookPrice}</p>
                        <div class="col-md-4">
                            <img src="../image/lb/car1.jpg" class="show_img_tj1" data-toggle="tooltip" title="添加"
                                 onclick="window.location.href='${pageContext.request.contextPath}/cart/addToCart.do?bookId=${ebook.bookId}'"
                                 style="width:30px;height:38px;">
                        </div>
                        <div class="col-md-3">
                            <img src="../image/lb/collect_red.jpg" class="show_img_wish_tj1" data-toggle="tooltip"
                                 title="收藏" style="width:30px;height:38px;">
                        </div>
                    </div>
                </div>
            </div>
        </li>
    </c:forEach>
    <%--
     <li>
     <div class="biseller-column">
         <img src="" class="img-responsive" alt="">
         <a href="#"><i class="new"></i></a>
         <div class="biseller-name">
             <h4>Sample Item Title</h4>
             <p>$99.99</p>
         </div>

     </div>
     </li>
     <li>
     <div class="biseller-column">
         <img src="" class="img-responsive" alt="">
         <a href="#"><i class="new"></i></a>
         <div class="biseller-name">
             <h4>Sample Item Title</h4>
             <p>$152</p>
         </div>

     </div>
     </li>--%>
</ul>
<script>
    $(function () {
        $('.show_img_tj1').tooltip('show');
        $('.show_img_wish_tj1').tooltip('show');
    });
</script>