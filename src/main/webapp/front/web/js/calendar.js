jQuery(function($) {
    $.datepicker.setDefaults({
        dateFormat: "yymmdd"
        , showButtonPanel: true
        , showMonthAfterYear: true
        , changeYear: true
        , changeMonth : true
        , monthNamesShort: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
        , dayNamesMin: ['日','一','二','三','四','五','六']
        , prevText:""
        , nextText:""
    	, showOn: "button"
        , buttonImage: "//image.ssgdfs.com/images/shop/order/ico_calender.gif"
       	, buttonImageOnly: true
    });
});