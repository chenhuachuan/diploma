<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<ul id="flexiselDemo5">
    <c:forEach items="${editor_books}" var="ebook">
        <li>
            <div class="biseller-column">
                <img src="..${ebook.imgUrl}" class="img-responsive" alt="">
                <a href="#"><i class="new"></i></a>
                <div class="biseller-name">
                    <h4>${ebook.bookName}</h4>
                    <p>$${ebook.bookPrice}</p>
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