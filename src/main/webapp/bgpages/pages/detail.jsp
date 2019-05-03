<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="show_books_detail">
    <script type="text/javascript">
        $("#show_books_detail").load('${pageContext.request.contextPath}/book/queryBooksbyPage.do');

        /*上一页*/
        function lastPage(param) {
            $("#show_books_detail").load('${pageContext.request.contextPath}/book/queryBooksbyPage.do?currentPage=' + param);
        }

        /*指定页面*/
        function gotoPage(param) {
            $("#show_books_detail").load('${pageContext.request.contextPath}/book/queryBooksbyPage.do?currentPage=' + param);
        }

        /*最后一页*/
        function toLastPage(param) {
            $("#show_books_detail").load('${pageContext.request.contextPath}/book/queryBooksbyPage.do?currentPage=' + param);
        }

        /*下一页*/
        function nextPage(param) {
            $("#show_books_detail").load('${pageContext.request.contextPath}/book/queryBooksbyPage.do?currentPage=' + param);
        }
    </script>
    <%-- <jsp:include page="${pageContext.request.contextPath}/bgpages/pages/booksShow.jsp"/>--%>
</div>