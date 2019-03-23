<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--分类导航--%>
<div class="container">
    <div class="head-nav">
        <span class="menu"></span>
        <ul class="megamenu skyblue">
            <li><a class="color1" href="../pages/home.jsp">Home</a></li>
            <%--一级分类--%>
            <%-- <c:forEach items="${sortsList}" var="par_sort">--%>

            <c:forEach items="${sortsList}" var="par_sort">
                <!--小说-->
                <li class="grid"><a class="color${par_sort.sortId}"
                                    href="${pageContext.request.contextPath}/book/queryAllBooksbyPage.do?parSortId=${par_sort.sortId}">${par_sort.sortName}</a>
                    <div class="megapanel">
                        <div class="row">
                            <c:forEach var="son_sort" items="${par_sort.sortList}">
                                <div class="col1">
                                    <div class="h_nav" id="second_level_div2"><%--二级分类--%>
                                        <a href="#"><span class="label label-success">${son_sort.sortName}</span></a>
                                            <%--<h4>${son_sort.sortName}</h4>--%>
                                        <c:forEach items="${son_sort.sortList}" var="gs_sort">
                                            <a href="#"><span class="label label-info">${gs_sort.sortName}</span></a>
                                        </c:forEach>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </li>
            </c:forEach>
            <%--
                            <li class="grid"><a class="color" href="categories.jsp">${par_sort.sortName}</a>
                                <div class="megapanel" id="second_level_div1">
                                    <div class="row">
                                        <div class="col1">
                                            <!--2级分类开始-->
                                                <div class="h_nav">
                                                    <a href="login_regist.jsp">
                                                        <span class="label label-info" style="width: 155px;height: 30px">&lt;%&ndash;${son_sort.sortName}&ndash;%&gt;</span></a>

                                                    <li><a href="categories.jsp">${gson_sort.sortName}</a></li>


                                                    &lt;%&ndash;<c:forEach items="${par_sort.sortList}" var="son_sort">
                                                        <h4></h4>
                                                        <a href="login_regist.jsp"><span class="label label-info" style="width: 155px;height: 30px">${son_sort.sortName}</span></a>
                                                    <ul>
                                                        <c:forEach items="${son_sort.sortList}" var="gson_sort">
                                                            <li><a href="categories.jsp">${gson_sort.sortName}</a></li>
                                                        </c:forEach>
                                                    </ul>
                                                    </c:forEach>&ndash;%&gt;
                                                </div>

                                        </div>

                                  &lt;%&ndash;      <div class="col1">
                                            <div class="h_nav">
                                                <h4>中国近现代小说</h4>
                                                <ul>
                                                    <li><a href="categories.jsp">武侠</a></li>
                                                    <li><a href="categories.jsp">社会</a></li>
                                                    <li><a href="categories.jsp">职场</a></li>
                                                    <li><a href="categories.jsp">军事</a></li>
                                                    <li><a href="categories.jsp">爱情</a></li>
                                                    <li><a href="categories.jsp">校园</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col1">
                                            <div class="h_nav">
                                                <h4>中国古典小说</h4>
                                                <ul>
                                                    <li><a href="categories.jsp">武侠</a></li>
                                                    <li><a href="categories.jsp">官场</a></li>
                                                    <li><a href="categories.jsp">历史</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col1">
                                            <div class="h_nav">
                                                <h4>四大名著</h4>
                                                <ul>
                                                    <li><a href="categories.jsp">西游记</a></li>
                                                    <li><a href="categories.jsp">三国演义</a></li>
                                                    <li><a href="categories.jsp">红楼梦</a></li>
                                                    <li><a href="categories.jsp">水浒传</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col1">
                                            <div class="h_nav">
                                                <h4>外国小说</h4>
                                                <ul>
                                                    <li><a href="categories.jsp">社会</a></li>
                                                    <li><a href="categories.jsp">财经</a></li>
                                                    <li><a href="categories.jsp">恐怖</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col1">
                                            <div class="h_nav">
                                                <h4>世界名著 </h4>
                                                <ul>
                                                    <li><a href="categories.jsp">军事</a></li>
                                                    <li><a href="categories.jsp">人文</a></li>
                                                    <li><a href="categories.jsp">纪实</a></li>
                                                </ul>
                                            </div>
                                        </div>&ndash;%&gt;
                                    </div>
                                </div>
                                //dd
                            </li>
                                --%>

            <div class="clearfix"></div>
        </ul>
    </div>
</div>

<script type="text/javascript">
    /*if(jspType=='detail'){
        $("#search_div_all").css(display,none);
    }else{
        $("#search_div_all").css(display,'');
    }
*/
</script>


<%--


<script type="text/javascript">
    function query_second_level_names(spId) {
        $("#second_level_div2").load('${pageContext.request.contextPath}/category/grandson_level_name.do?sparentId='+spId);

    }
</script>
--%>

