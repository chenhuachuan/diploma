<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<div class="row clearfix">
    <div class="col-sm-12 column">
        <form id="sortDetail_form" method="post" role="form" class="form-horizontal" style="margin-top: 10px">
            <div class="form-group-separator"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">分类名</label>
                <div class="col-sm-5">
                    <input class="easyui-textbox" type="text" name="sortName" id="sort_name_id" style="width: 260px;"
                           data-options="required:true"/>
                    <input type="hidden" id="hidde_sortId_m" name="sortId" style="width: 260px;"/>
                    <input type="hidden" id="hidde_parentdI_m" name="parentId" style="width: 260px;"/>
                </div>
            </div>
            <div class="form-group-separator"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">分类级别</label>
                <div class="col-sm-5">
                    <input class="easyui-combobox" name="sortLevel" id="sortLevel" style="width: 260px;"
                           data-options="valueField:'id',textField:'text',required:true,
                            data:[
                                {id:1,text:'1级'},
                                {id:2,text:'2级'},
                                {id:3,text:'3级'}
                            ]
                            "/>
                </div>
            </div>

            <div class="form-group-separator" id="sh_show_sort">所属分类</div>
            <div class="form-group" id="yiji_sort_show">
                <label class="col-sm-3 control-label">一级名称</label>
                <div class="col-sm-5">
                    <%--onChange="querySecondSort()" --%>
                    <input id="sortName" class="easyui-combobox" style="width: 260px;" data-options="valueField:'sortId',textField:'sortName',
                        url:'${pageContext.request.contextPath}/category/all_category_name_json.do',required:true"/>
                </div>
            </div>
            <div class="form-group" id="erji_sort_show">
                <label class="col-sm-3 control-label">二级名称</label>
                <div class="col-sm-5">
                    <%--onChange="queryThreeSort()"--%>
                    <input id="sortName2" class="easyui-combobox" style="width: 260px;"
                           data-options="valueField:'sortId',textField:'sortName',required:true"/>
                </div>
            </div>
            <%-- <div class="form-group" id="sanji_sort_show">
                 <label class="col-sm-3 control-label">三级名称</label>
                 <div class="col-sm-5">
                     <input id="sortName3" class="easyui-combobox" style="width: 260px;" data-options="valueField:'sortId',textField:'sortName',required:true
                         "/>
                 </div>
             </div>--%>
            <div class="form-group" id="error_tips_div" style="display: none;">
                <span><font color="red">请填写完整分类信息...</font></span>
            </div>

        </form>
    </div>
</div>
<script>
    var type = "<%=request.getParameter("type").toString()%>";
    if (type == "edit") {
        //加载数据
        $("#sortDetail_form").form('load', {
            sortId: selectRowSortData.sortId,
            sortName: selectRowSortData.sortName,
            parentId: selectRowSortData.parentId
        });
    }

    $("#sortLevel").combobox({
        onChange: function () {
            var sortLevel = $("#sortLevel").val();
            if (sortLevel == "1") {
                $("#sh_show_sort").css("display", "none");
                $("#yiji_sort_show").css("display", "none");
                $("#erji_sort_show").css("display", "none");
            }
            if (sortLevel == "2") {
                $("#sh_show_sort").css("display", "");
                $("#yiji_sort_show").css("display", "");
                $("#erji_sort_show").css("display", "none");
            }
            if (sortLevel == "3") {
                $("#sh_show_sort").css("display", "");
                $("#yiji_sort_show").css("display", "");
                $("#erji_sort_show").css("display", "");
            }
        }
    });

    //查询二级分类
    $("#sortName").combobox({
        onChange: function () {
            var sortId = $("#sortName").val();
            $('#sortName2').combobox({
                url: '${pageContext.request.contextPath}/category/second_category_name_json.do?sortId=' + sortId,
                valueField: 'sortId',
                textField: 'sortName'
            });
        }
    });
    //查询三级
    /*   $("#sortName2").combobox({
           onChange:function(){
               var sortId=$("#sortName2").val();
               $('#sortName3').combobox({
                   url:'category/second_category_name_json.do?sortId='+sortId,
                   valueField:'sortId',
                   textField:'sortName'
               });
           }
       });*/

</script>