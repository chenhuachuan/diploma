<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<h3 class="new-models" style="background-color: rgba(255,111,18,0.87)">新书上架</h3>

<ul id="flexiselDemo3">
    <c:forEach items="${newbooks}" var="book">
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
                    <div class="col-md-12">
                        <p class="col-md-5">￥${book.bookPrice}</p>
                        <div class="col-md-4">
                            <img src="../image/lb/car1.jpg" class="show_img_cart1" data-toggle="tooltip" title="添加"
                                 onclick="window.location.href='${pageContext.request.contextPath}/cart/addToCart.do?bookId=${book.bookId}'"
                                 style="width:30px;height:38px;">
                        </div>
                        <div class="col-md-3">
                            <img src="../image/lb/collect_red.jpg" class="show_img_wish1" data-toggle="tooltip"
                                 title="收藏"
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
        $('.show_img_cart1').tooltip('show');
        $('.show_img_wish1').tooltip('show');
    });

    function addbookToWishList(data) {
        //.src('../image/lb/collect_red.jpg');

        /* $.ajax({
              type:'post',
              url:'/user/person/addWishBook.do?bookId='+bookId,
             dataType:'text',
              success:function (text) {
                      alert(text);
              }
          });*/
    }
</script>