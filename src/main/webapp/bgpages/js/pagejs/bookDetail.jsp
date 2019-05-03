<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="row clearfix">

    <div class="col-sm-12 column">
        <div class="col-sm-4">
            <img src="${pageContext.request.contextPath}/${bookDetails.imgUrl}" alt="图书详情">
        </div>

        <div class="col-sm-8">
            <h3><font color="#4ee7cd">书名：${bookDetails.bookName}</font></h3>
            <h5>作者：${bookDetails.author}</h5>
            <span>
                <font color="#e75d52">价钱：</font>￥${bookDetails.bookPrice} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <font color="#e75d52">原价：</font>￥${bookDetails.originalPrice} &nbsp;&nbsp;&nbsp;&nbsp;
                <font color="#e75d52">出版社：</font>${bookDetails.publishCompany}<br/>
                <font color="#e75d52">出版时间：</font><fmt:formatDate value="${bookDetails.publishTime}"
                                                                  pattern="yyyy-MM-dd"/>&nbsp;&nbsp;
                <font color="#e75d52">字数：</font>${bookDetails.wordCount}   &nbsp;&nbsp;&nbsp;
                <font color="#e75d52">页数：</font>${bookDetails.pageCount} <br/>
                <font color="#e75d52">开本:</font>${bookDetails.kaiBen}&nbsp;&nbsp;&nbsp;&nbsp;
                <font color="#e75d52">ISBN:</font>${bookDetails.isbn}<br/>
                <font color="#e75d52">库存：</font>${bookDetails.repertory}&nbsp;&nbsp;&nbsp;&nbsp;
                <font color="#e75d52">销售量：</font>${bookDetails.saleCount}<br/>
            </span>
            <p>
                <font color="#e75d52">简介：</font>${bookDetails.bookIntro}<br/><br/>
                <font color="#e75d52">编辑推荐：</font>${bookDetails.commend}
            </p>
        </div>

        <form id="bookDetail_form" method="post" role="form" class="form-horizontal"
              style="display: none;margin-top: 10px">
            <div class="form-group-separator"></div>
            <div class="form-group">
                <label class="col-sm-1 control-label">书名</label>
                <div class="col-sm-5">
                    <input class="easyui-textbox" type="text" name="bookName" style="width: 260px;"
                           data-options="required:true"/>
                </div>
                <label class="col-sm-1 control-label">作者</label>
                <div class="col-sm-5">
                    <input class="easyui-textbox" type="text" name="author" style="width: 260px;"
                           data-options="required:true"/>
                </div>
            </div>
            <div class="form-group-separator"></div>
            <div class="form-group">
                <label class="col-sm-1 control-label">字数</label>
                <div class="col-sm-5">
                    <input class="easyui-textbox" type="text" name="wordCount" style="width: 260px;"
                           data-options="required:true"/>
                </div>
                <label class="col-sm-1 control-label">页数</label>
                <div class="col-sm-5">
                    <input class="easyui-textbox" type="text" name="pageCount" style="width: 260px;"
                           data-options="required:true"/>
                </div>
            </div>
            <div class="form-group-separator"></div>
            <div class="form-group">
                <label class="col-sm-1 control-label">出版社</label>
                <div class="col-sm-5">
                    <input class="easyui-textbox" type="text" name="publishCompany" style="width: 260px;"
                           data-options="required:true"/>
                </div>
                <label class="col-sm-1 control-label">出版时间</label>
                <div class="col-sm-5">
                    <input class="easyui-datetimebox" name="publishTime"
                           data-options="required:true,showSeconds:false" style="width: 260px;" value="">
                </div>
            </div>
            <div class="form-group-separator"></div>
            <div class="form-group">
                <label class="col-sm-1 control-label">开本</label>
                <div class="col-sm-5">
                    <input class="easyui-textbox" type="text" name="kaiBen" style="width: 260px;"
                           data-options="required:true"/>
                </div>
                <label class="col-sm-1 control-label">数量</label>
                <div class="col-sm-5">
                    <input class="easyui-textbox" type="text" name="repertory" style="width: 260px;"
                           data-options="required:true"/>
                </div>
            </div>
            <div class="form-group-separator"></div>
            <div class="form-group">
                <label class="col-sm-1 control-label">价格</label>
                <div class="col-sm-5">
                    <input class="easyui-textbox" type="text" name="bookPrice" style="width: 260px;"
                           data-options="required:true"/>
                </div>
                <label class="col-sm-1 control-label">原价</label>
                <div class="col-sm-5">
                    <input class="easyui-textbox" type="text" name="originalPrice" style="width: 260px;"
                           data-options="required:true"/>
                </div>
            </div>
            <div class="form-group-separator"></div>
            <div class="form-group">
                <label class="col-sm-1 control-label">ISBN</label>
                <div class="col-sm-5">
                    <input class="easyui-textbox" type="text" name="isbn" style="width: 260px;"
                           data-options="required:true"/>
                </div>
                <label class="col-sm-1 control-label">分类</label>
                <div class="col-sm-5">
                    <%--  <select id="sortName" class="easyui-combobox" name="sortName"  style="width:260px;">
                      </select>--%>

                    <input id="sortName" class="easyui-combobox" style="width: 260px;" name="sortName"
                           data-options="valueField:'sortId',textField:'sortName',url:'${pageContext.request.contextPath}/category/all_category_name_json.do'"/>
                    <%--  <input class="easyui-textbox" type="text" name="sortName" style="width: 260px;"  data-options="required:true" />
                        <input type="hidden" name="sortId" style="width: 260px;"  data-options="required:true" />
                        --%>
                </div>
            </div>
            <div class="form-group-separator"></div>
            <div class="form-group">
                <label class="col-sm-1 control-label" id="img_upload" style="width:80px;">图片上传</label>
                <div class="col-sm-5" id="img_upload2">
                    <input class="easyui-filebox" name="imgUrl" onchange="view_photo()" style="width:280px">
                </div>

                <input type="hidden" name="imgUrl2" style="width: 260px;display: none;"/>
                <label class="col-sm-1 control-label" id="show_img" style="display: none">封面图</label>
                <div class="col-sm-5" style="height: 110px;" id="showImageDivId">
                    <img id="showImageId" width="230" height="110"/>
                </div>
            </div>
            <div class="form-group-separator"></div>
            <div class="form-group">
                <label class="col-sm-1 control-label" style="width:80px;">图书介绍</label>
                <div class="col-sm-10">
                    <textarea class="form-control" rows="4" name="bookIntro" style="margin-left: 13px"
                              name=textarea></textarea>
                </div>
            </div>
            <div class="form-group-separator"></div>
            <div class="form-group">
                <label class="col-sm-1 control-label" style="width:80px;">编辑推荐</label>
                <div class="col-sm-10">
                    <textarea class="form-control" rows="4" name="commend" style="margin-left: 13px"
                              name=textarea></textarea>
                </div>
            </div>
        </form>
    </div>
</div>