<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<h3 class="new-models">新书上架</h3>
<ul id="flexiselDemo3">
    <c:forEach items="${newbooks}" var="book">
        <li>
            <div class="biseller-column">
                <img src="..${book.imgUrl}" class="img-responsive" alt="" class="veiw-img"/>
                <a href="#"><i class="new"></i></a>
                <div class="biseller-name">
                    <h4>${book.bookName} &nbsp;&nbsp;&nbsp;&nbsp;${book.author}</h4>
                    <p>$${book.bookPrice} <a href="#">add to cart</a></p>
                </div>
            </div>
        </li>
    </c:forEach>
</ul>