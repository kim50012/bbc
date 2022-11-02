jQuery(function($){
	$( ".term").datepicker({
		prevText: "이전",
		nextText: "다음",
		yearSuffix: "년",
		showMonthAfterYear: true,
		dateFormat: "yy/mm/dd",
		monthNames: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'],
		dayNamesMin:  ['日','一','二','三','四','五','六'],
		showOn: "button",
		buttonImage: "//image.ssgdfs.com/images/shop/common/datepicker.gif",
		buttonImageOnly: true
	});
});
