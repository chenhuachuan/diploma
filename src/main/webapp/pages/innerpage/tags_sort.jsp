<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<ul>
    <c:forEach items="${tagsName}" var="sort">
        <li><a href="#">${sort.sortName}&nbsp;|&nbsp;</a></li>
    </c:forEach>
</ul>