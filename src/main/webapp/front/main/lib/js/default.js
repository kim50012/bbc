//layer bg
//글로벌 layerpop 함수 생성
function validPopOpen(_id,_type) {
	//$('#'+_id).find("h3 .title").html(_title);
	//$('#'+_id).find(".layer_contents").html(_data);
	$('#'+_id).fadeIn(100);
	$('body').append('<div id="modalback" class="modal-bg"></div>');
	$('#modalback').css({ 'opacity': '0.8', 'height': $(document).height() }).fadeIn(100);
	var $popTop = $(window).scrollTop();
	if(_type == "text"){
		var popupleftmargin = ($('#'+_id).width() + 10) / 2;
		var popuptopmargin = ($('#'+_id).height() + 10 ) / 2;
		$('#'+_id).css({
			'margin-top' : -popuptopmargin,
			'margin-left' : -popupleftmargin
		});
	}
}
function closeValidPop(){
    $('#modalback').hide();
    $('.layer-pop').hide();
}
