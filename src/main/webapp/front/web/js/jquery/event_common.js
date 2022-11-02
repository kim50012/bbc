jQuery(function($){
	$(".event-all").selectbox();
	$(".board").selectbox();
	$(".subject").selectbox();

	$(".banner-view .view-con a").mouseover(function(){
		$("div.banner-wrap ul").hide();
		$(".banner-view .view-con a").attr("class" , "");
		$(this).attr("class" , "selected");
		$("#"+$(this).attr("href")).show();
	});
/*	
	$(".event-all").change(function(){
	    var eventId = $(this).val();
	    if(isEmpty(eventId)){
	    	return false;
	    }
	    location.href = "/shop/promotion/event?eventId="+eventId;
    });
	
*/
	$(".event-all").change(function(){
	    var eventId = $.trim($(this).val().split(",")[0]);
	    var eventClassCode = $.trim($(this).val().split(",")[1]);
	    if(isEmpty(eventId)){
	    	return false;
	    }
	    goDetailEvent(eventId, eventClassCode);
    });	
	
	
	$(".more-view span").click(function(){
        $(".list-basic li").show();
        $(".more-view span").hide();
	});
});

function goDetailEvent(eventId, eventClassCode){
//    location.href = "/shop/promotion/detailEventClass"+eventClassCode+"?eventId="+eventId;
    location.href = "/shop/promotion/event"+eventClassCode+"?eventId="+eventId;
}

function goDetailEventByEventId(eventId){
 //   location.href = "/shop/promotion/goDetailEventById?eventId="+eventId;
	  location.href = "/shop/promotion/event?eventId="+eventId;
}
function likeIt(eventId){
    $.ajax({
        url: "/shop/promotion/likeItEvent"
        , data:"eventId="+eventId
        , dataType: "json"
        , success: function(data) {
        	if(data.success){
        		$("p.event"+eventId).text(data.event.goodCount);
        		Alert(data.messages);
        	}else{
        		Alert(data.messages);
        	}
        }
        , error: function(xhr, status, error) {
            alert("시스템 오류가 발생 했습니다. 관리자에게 문의하세요.");
        }
    });
}