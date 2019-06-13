<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<div class="row clearfix">
    <div class="col-sm-12 column">
        <form id="modify_book_info" method="post"
              role="form" data-options="novalidate:true" class="form-horizontal" enctype="multipart/form-data"
              style="margin-top: 10px">
            <input class="easyui-textbox" type="hidden" name="bookId" value="${book_deta.bookId}"/>
            <input class="easyui-textbox" type="hidden" name="saleCount" value="${book_deta.saleCount}"/>
            <input class="easyui-textbox" type="hidden" name="status" value="${book_deta.status}"/>

            <div class="form-group-separator"></div>
            <div class="form-group">
                <label class="col-sm-1 control-label">书名</label>
                <div class="col-sm-5">
                    <input class="easyui-textbox" type="text" id="add_bookName" name="bookName"
                           value="${book_deta.bookName}" style="width: 260px;"
                           data-options="required:true"/>
                </div>
                <label class="col-sm-1 control-label">作者</label>
                <div class="col-sm-5">
                    <input class="easyui-textbox" type="text" id="add_author" name="author" value="${book_deta.author}"
                           style="width: 260px;"
                           data-options="required:true"/>
                </div>
            </div>
            <div class="form-group-separator"></div>
            <div class="form-group">
                <label class="col-sm-1 control-label">字数</label>
                <div class="col-sm-5">
                    <input class="easyui-textbox" type="text" id="add_wordCount" name="wordCount"
                           value="${book_deta.wordCount}" style="width: 260px;"
                           data-options="required:true"/>
                </div>
                <label class="col-sm-1 control-label">页数</label>
                <div class="col-sm-5">
                    <input class="easyui-textbox" type="text" id="add_pageCount" name="pageCount"
                           value="${book_deta.pageCount}" style="width: 260px;"
                           data-options="required:true"/>
                </div>
            </div>
            <div class="form-group-separator"></div>
            <div class="form-group">
                <label class="col-sm-1 control-label">出版社</label>
                <div class="col-sm-5">
                    <input class="easyui-textbox" type="text" id="add_publishCompany" name="publishCompany"
                           value="${book_deta.publishCompany}" style="width: 260px;"
                           data-options="required:true"/>
                </div>
                <label class="col-sm-1 control-label">出版时间</label>
                <div class="col-sm-5">
                    <input class="easyui-datebox" name="publishTime" id="publishTime_id"
                           value="${book_deta.publishTime}"
                           data-options="required:true" readonly style="width: 260px;">
                </div>
            </div>
            <div class="form-group-separator"></div>
            <div class="form-group">
                <label class="col-sm-1 control-label">开本</label>
                <div class="col-sm-5">
                    <input class="easyui-textbox" type="text" id="add_kaiBen" name="kaiBen" style="width: 260px;"
                           value="${book_deta.kaiBen}"
                           data-options="required:true"/>
                </div>
                <label class="col-sm-1 control-label">数量</label>
                <div class="col-sm-5">
                    <input class="easyui-textbox" type="text" id="add_repertory" name="repertory" style="width: 260px;"
                           value="${book_deta.repertory}"
                           data-options="required:true"/>
                </div>
            </div>
            <div class="form-group-separator"></div>
            <div class="form-group">
                <label class="col-sm-1 control-label">价格</label>
                <div class="col-sm-5">
                    <input class="easyui-textbox" type="text" id="add_bookPrice" name="bookPrice" style="width: 260px;"
                           value="${book_deta.bookPrice}"
                           data-options="required:true"/>
                </div>
                <label class="col-sm-1 control-label">原价</label>
                <div class="col-sm-5">
                    <input class="easyui-textbox" type="text" id="add_originalPrice" name="originalPrice"
                           style="width: 260px;" value="${book_deta.originalPrice}"
                           data-options="required:true"/>
                </div>
            </div>
            <div class="form-group-separator"></div>
            <div class="form-group">
                <label class="col-sm-1 control-label">ISBN</label>
                <div class="col-sm-5">
                    <input class="easyui-textbox" type="text" id="add_isbn" name="isbn" style="width: 260px;"
                           value="${book_deta.isbn}"
                           data-options="required:true"/>
                </div>
                <label class="col-sm-1 control-label">分类</label>
                <div class="col-sm-5">
                    <input id="sortId_id" class="easyui-combobox" style="width: 260px;" name="sortId"
                           value="${book_deta.sortId}"
                           data-options="valueField:'sortId',textField:'sortName',required:true,url:'${pageContext.request.contextPath}/category/all_category_name_json1.do'"/>
                </div>
            </div>
            <div class="form-group-separator"></div>
            <div class="form-group">
                <label class="col-sm-1 control-label" id="img_upload" style="width:80px;">图片上传</label>
                <div class="col-sm-5" id="img_upload2">
                    <input type="file" id="add_imgUrl" name="imgUrl" onchange="view_photo()" style="width:280px">
                </div>
                <label class="col-sm-1 control-label" id="show_img" style="display: none">封面图</label>
                <div class="col-sm-5" style="height: 110px;" id="showImageDivId">
                    <img id="showImageId" width="230" height="110"
                         src="${pageContext.request.contextPath}${book_deta.imgUrl}"/>
                </div>
            </div>


            <div class="form-group-separator"></div>
            <div class="form-group">
                <label class="col-sm-1 control-label" style="width:80px;">图书介绍</label>
                <div class="col-sm-10">
                    <textarea class="form-control" id="add_bookIntro" rows="3" name="bookIntro"
                              style="margin-left: 13px" data-options="required:true"
                              name=textarea>${book_deta.bookIntro}</textarea>
                </div>
            </div>
            <div class="form-group-separator"></div>
            <div class="form-group">
                <label class="col-sm-1 control-label" style="width:80px;">编辑推荐</label>
                <div class="col-sm-10">
                    <textarea class="form-control" rows="3" id="add_commend" name="commend" style="margin-left: 13px"
                              data-options="required:true"
                              name=textarea>${book_deta.commend}</textarea>
                </div>
            </div>
        </form>
    </div>
</div>


<script>
    /**
     * 预览图片
     */
    function PreviewImage(fileObj, imgPreviewId, divPreviewId) {
        //允许上传文件的后缀名document.getElementById("hfAllowPicSuffix").value;
        var allowExtention = ".jpg,.bmp,.gif,.png";
        //extention  接受上传图片的格式
        var extention = fileObj.value.substring(fileObj.value.lastIndexOf(".") + 1).toLowerCase();
        var browserVersion = window.navigator.userAgent.toUpperCase();
        if (allowExtention.indexOf(extention) > -1) {
            if (fileObj.files) {//HTML5实现预览，兼容chrome、火狐7+等
                //判断浏览器是否支持FileReader
                //支持FileReader浏览器的用户可以通过一个file input选择一个图像文件将图片显示在页面中，而不用发送到后端
                if (window.FileReader) {
                    //将图片展示出来
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        document.getElementById(imgPreviewId).setAttribute("src", e.target.result);
                    };
                    reader.readAsDataURL(fileObj.files[0]);
                } else if (browserVersion.indexOf("SAFARI") > -1) {
                    alert("不支持Safari6.0以下浏览器的图片预览!");
                }
            } else if (browserVersion.indexOf("MSIE") > -1) {
                if (browserVersion.indexOf("MSIE 6") > -1) {//ie6
                    document.getElementById(imgPreviewId).setAttribute("src", fileObj.value);
                } else {//ie[7-9]
                    fileObj.select();
                    if (browserVersion.indexOf("MSIE 9") > -1)
                        fileObj.blur();//不加上document.selection.createRange().text在ie9会拒绝访问
                    var newPreview = document.getElementById(divPreviewId + "New");
                    if (newPreview == null) {
                        newPreview = document.createElement("div");
                        newPreview.setAttribute("id", divPreviewId + "New");
                        newPreview.style.width = document.getElementById(imgPreviewId).width + "px";
                        newPreview.style.height = document.getElementById(imgPreviewId).height + "px";
                        newPreview.style.border = "solid 1px #d2e2e2";
                    }
                    newPreview.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale',src='" + document.selection.createRange().text + "')";
                    var tempDivPreview = document.getElementById(divPreviewId);
                    tempDivPreview.parentNode.insertBefore(newPreview, tempDivPreview);
                    tempDivPreview.style.display = "none";
                }
            } else if (browserVersion.indexOf("FIREFOX") > -1) {//firefox
                var firefoxVersion = parseFloat(browserVersion.toLowerCase().match(/firefox\/([\d.]+)/)[1]);
                if (firefoxVersion < 7) {//firefox7以下版本
                    document.getElementById(imgPreviewId).setAttribute("src", fileObj.files[0].getAsDataURL());
                } else {//firefox7.0+
                    document.getElementById(imgPreviewId).setAttribute("src", window.URL.createObjectURL(fileObj.files[0]));
                }
            } else {
                document.getElementById(imgPreviewId).setAttribute("src", fileObj.value);
            }
        } else {
            alert("仅支持" + allowExtention + "为后缀名的文件!");
            fileObj.value = "";//清空选中文件
            if (browserVersion.indexOf("MSIE") > -1) {
                fileObj.select();
                document.selection.clear();
            }
            fileObj.outerHTML = fileObj.outerHTML;
        }
    }

    //点击事件   上传时调用该方法
    function view_photo() {
        /*
            showImageId是放置图片的img的id
            showImageDivId 是img外的id
        */
        PreviewImage($("input[name='imgUrl']")[0], 'showImageId', 'showImageDivId');
    }
</script>