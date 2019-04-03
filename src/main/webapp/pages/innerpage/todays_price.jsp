<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<ul class="slides">
    <c:forEach items="${lowPriceBooks}" var="book">
        <li>
            <div class="tittle">
                <a href="${pageContext.request.contextPath}/book/bookDetails.do?bookId=${book.bookId}">
                    <img src="${pageContext.request.contextPath}${book.imgUrl}" class="img-responsive" alt=""/></a><br/>
                <center>
                    <a href="${pageContext.request.contextPath}/book/bookDetails.do?bookId=${book.bookId}">
                        <h6> ${book.bookName}</h6></a>
                    <p>原价:￥${book.originalPrice}</p>
                    <p style="font-size: 22px;"><font color="red">现价:￥${book.bookPrice}</font></p>
                    <p>立志读遍天下书！</p>
                    <a class="show1" href="${pageContext.request.contextPath}/cart/addToCart.do?bookId=${book.bookId}">ADD
                        TO CART</a>
                </center>
            </div>
        </li>
    </c:forEach>

    <%-- <li>
         <div class="tittle">
             <img src="images/shoe.jpg" class="img-responsive" alt=""/>
             <h6>Item Title Here</h6>
             <p>Lorem ipsum dolor sit amet,</p>
             <p>Lorem ipsum dolor sit amet,</p>
             <p>Lorem ipsum dolor sit amet,</p>
             <a class="show1" href="#">SHOW ME MORE</a>
         </div>
     </li>
     <li>
         <div class="tittle">
             <img src="images/shoe.jpg" class="img-responsive" alt=""/>
             <h6>Item Title Here</h6>
             <p>Lorem ipsum dolor sit amet,</p>
             <p>Lorem ipsum dolor sit amet,</p>
             <p>Lorem ipsum dolor sit amet,</p>
             <a class="show1" href="#">SHOW ME MORE</a>
         </div>
     </li>
     <li>
         <div class="tittle">
             <img src="images/shoe.jpg" class="img-responsive" alt=""/>
             <h6>Item Title Here</h6>
             <p>Lorem ipsum dolor sit amet,</p>
             <p>Lorem ipsum dolor sit amet,</p>
             <p>Lorem ipsum dolor sit amet,</p>
             <a class="show1" href="#">SHOW ME MORE</a>
         </div>
     </li>--%>
</ul>

