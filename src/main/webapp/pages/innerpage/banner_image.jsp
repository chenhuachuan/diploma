<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="carousel-example-generic" class="carousel slide carousel-slider">
    <!-- 序号 -->
    <ol class="carousel-indicators">
        <c:forEach begin="0" step="1" end="${imageSize-1}" varStatus="img">
            <li data-target="#carousel-example-generic" data-slide-to="${img.index}"
                    <c:if test="${img.index==0}">
                        class="active"
                    </c:if>
            ></li>
        </c:forEach>
        <%--<li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        <li data-target="#carousel-example-generic" data-slide-to="3"></li>--%>
    </ol>

    <!-- 四张轮播 -->
    <div class="carousel-inner" role="listbox">
        <!-- 第一张图-->
        <%-- ../image/bannerImage/banner1.jpg --%>
        <c:forEach items="${imagesBanner}" var="image" varStatus="numd">
            <div
                    <c:if test="${numd.index==0}">
                        class="item carousel-item-four active"
                    </c:if>
                    <c:if test="${numd.index==1}">
                        class="item carousel-item-five"
                    </c:if>
                    <c:if test="${numd.index==2}">
                        class="item carousel-item-six "
                    </c:if>
                    <c:if test="${numd.index==3}">
                        class="item carousel-item-seven"
                    </c:if>

                    style="background: url('${pageContext.request.contextPath}/${image.imageUrl}');background-repeat: no-repeat;background-size: 100%">
                <div class="container">
                    <div class="carousel-position-four text-center">
                        <h3 class="margin-bottom-20 animate-delay carousel-title-v3 border-bottom-title text-uppercase"
                            data-animation="animated fadeInDown">
                            <span class="color-red-v2">
                                <%--人不能像走兽那样活着，应该追求知识和美德。--%>
                                ${image.imageDesc}
                            </span><br/>
                        </h3>
                            <%--  <p class="carousel-subtitle-v2" data-animation="animated fadeInUp">人是活的，书是死的。活人读死书，可以把书读活。<br/>
                                  死书读活人，可以把人读死。</p>--%>
                    </div>
                </div>
            </div>
        </c:forEach>

        <!-- 第二张 -->
        <div class="item carousel-item-five"
             style="display:none;background: url('../image/bannerImage/banner2.jpg');background-repeat: no-repeat;background-size: 100%">
            <div class="container">
                <div class="carousel-position-four text-center">
                    <h2 class="animate-delay carousel-title-v4" data-animation="animated fadeInDown">
                        TFBOOK
                    </h2>
                    <p class="carousel-subtitle-v2" data-animation="animated fadeInDown">
                        为乐趣而读书。
                    </p>
                    <p class="carousel-subtitle-v3 margin-bottom-30" data-animation="animated fadeInUp">
                        热卖图书
                    </p>
                    <a class="carousel-btn"
                       href="${pageContext.request.contextPath}/book/queryAllBooksbyPage.do?parSortId=1"
                       data-animation="animated fadeInUp">查看详情</a>
                </div>
                <%-- <img class="carousel-position-five animate-delay hidden-sm hidden-xs"
                      src="${pageContext.request.contextPath}/pages/images/shop-slider/slide2/price.png" alt="Price"
                      data-animation="animated zoomIn" style="margin-left: 10px;">--%>
            </div>
        </div>

        <!-- 第三张 -->
        <div class="item carousel-item-six"
             style="display:none;background: url('../image/bannerImage/banner3.jpg');background-repeat: no-repeat;background-size: 100%">
            <div class="container">
                <div class="carousel-position-four text-center">
                            <span class="carousel-subtitle-v3 margin-bottom-15" data-animation="animated fadeInDown">
                                书籍把我们引入最美好的社会&amp; 使我们认识各个时代的伟大智者。
                            </span>
                    <p class="carousel-subtitle-v4" data-animation="animated fadeInDown">
                        --史美尔斯
                    </p>
                    <p class="carousel-subtitle-v3" data-animation="animated fadeInDown">
                        每一次飞行都始于坠落。
                    </p>
                </div>
            </div>
        </div>

        <!-- 第四张 -->
        <div class="item carousel-item-seven"
             style="display:none;background: url('../image/bannerImage/banner4.jpg');background-repeat: no-repeat;background-size: 100%">
            <div class="center-block">
                <div class="center-block-wrap">
                    <div class="center-block-body">
                        <h2 class="carousel-title-v1 margin-bottom-20" data-animation="animated fadeInDown">
                            周榜 <br/>
                            最受欢迎的图书！
                        </h2>
                        <a class="carousel-btn"
                           href="${pageContext.request.contextPath}/book/queryAllBooksbyPage.do?parSortId=1&sonSortId=&granSortId=&sortFlag=pop"
                           data-animation="animated fadeInUp">查看详情</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 左右箭头 -->
    <a class="left carousel-control carousel-control-shop" href="#carousel-example-generic" role="button"
       data-slide="prev">
        <i class="fa fa-angle-left" aria-hidden="true"></i>
    </a>
    <a class="right carousel-control carousel-control-shop" href="#carousel-example-generic" role="button"
       data-slide="next">
        <i class="fa fa-angle-right" aria-hidden="true"></i>
    </a>
</div>