<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<div class="row clearfix">
    <div class="col-sm-12 column">
        <form id="bookDetail_form" method="post" role="form" data-options="novalidate:true" class="form-horizontal"
              style="margin-top: 10px">
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
<script>
    var type = "<%=request.getParameter("type").toString()%>";
    if (type == "edit") {
        $("#show_img").attr("style", "display:block");
        //加载数据
        $("#bookDetail_form").form('load', {
            bookName: selectRowData.bookName,
            author: selectRowData.author,
            score: selectRowData.score,
            author: selectRowData.author,
            wordCount: selectRowData.wordCount,
            pageCount: selectRowData.pageCount,
            publishCompany: selectRowData.publishCompany,
            publishTime: selectRowData.publishTime,
            kaiBen: selectRowData.kaiBen,
            repertory: selectRowData.repertory,
            bookPrice: selectRowData.bookPrice,
            originalPrice: selectRowData.originalPrice,
            isbn: selectRowData.isbn,
            imgUrl2: selectRowData.imgUrl,
            bookIntro: selectRowData.bookIntro,
            commend: selectRowData.commend,
            sortName: selectRowData.sort.sortName,
            sortId: selectRowData.sort.sortId
        });
    }

    /*
        $.ajax({
            url:'',
            type:'post',
            dataType:'json',
            success:function (data) {
                $("#sortName").combobox({//往下拉框塞值
                    data:data,
                    valueField:"sortId",//value值
                    textField:"sortName",//文本值
                    panelHeight:"auto"
                })
            }

        });*/


    /**
     * 预览图片
     */
    function PreviewImage(fileObj, imgPreviewId, divPreviewId) {
        //允许上传文件的后缀名document.getElementById("hfAllowPicSuffix").value;
        var allowExtention = ".jpg,.bmp,.gif,.png";
        //extention  接受上传图片的格式
        var extention = fileObj.value.substring(fileObj.value.lastIndexOf(".") + 1).toLowerCase();
        /*browserVersion
            window.navigator.userAgent    判断pc端浏览器的类别
            toUpperCase()   转换成小写字母
        */
        var browserVersion = window.navigator.userAgent.toUpperCase();
        /*判断上传文件 格式是否符合要求
            indexOf() 方法可返回某个指定的字符串值在字符串中首次出现的位置。
            如果没有找到匹配的字符串则返回 -1。
        */
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