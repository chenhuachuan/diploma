/*
//var rootPath="${pageContext.request.contextPath}";
/!*
* 页面初始化
* *!/
function init() {
    // getCategoryName();//分类信息
    getNewShelvesBooks();//新书上架
}

function getCategoryName() {
    // document.getElementById('page_load_contrller_data_div').load('${pageContext.request.contextPath/category/all_category_name.do');
    //$("#page_load_contrller_data_div")
}

function getNewShelvesBooks() {
    $("#new_books_shelves_div").load('${pageContext.request.contextPath}/book/newBookShelves.do');
}
*/
var total_order_count = $("#total_order_count").val();

(function ($) {
    $('.spinner .btn:first-of-type').on('click', function () {
        $('.spinner input').val(parseInt($('.spinner input').val(), 10) + 1);
    });
    $('.spinner .btn:last-of-type').on('click', function () {
        $('.spinner input').val(parseInt($('.spinner input').val(), 10) - 1);
    });
})(jQuery);


