<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE LAYOUT</title>
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.mousewheel.js"></script>
<script type="text/javascript" src="/js/jquery/mwheelIntent.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.jscrollpane.min.js"></script>
<script type="text/javascript">
jQuery(function($){
		$('.auto-complete dd').jScrollPane({showArrows: true});
		var gnb = $(".gnb-navi ul.main li > span.cate");
		gnb.mouseenter(function(){
			gnb.each(function(){
				$(this).find("img").attr("src" ,$(this).find("img").attr("src").replace("_on.gif" , "_off.gif"));
			});
			$(this).find("img").attr("src" ,$(this).find("img").attr("src").replace("_off.gif" , "_on.gif"));
			$("div.depth").hide();
			$(this).parent().find("div.depth .depth-menu ul li").eq(0).attr("class" , "on");
			$(this).parent().find("div.depth").show();
		});

		$("ul.gnb-menu li").eq(0).find("a").click(function(){
			$($(this).attr("href")).toggle();
			return false;
		});
		$("#quickbar").css("position", "fixed").css('right', "10px").css("left", "50%").css("margin-left", (1000 / 2)+9 + "px");
		 $(window).scroll(function(){
			var headerHeight = $("#head").height();
			var l = (1000 / 2)+9 + "px";   
			if($(document).scrollTop() <= (headerHeight + 169) ) {
				$("#quickbar").css("position", "absolute").css('top' , "174px").css("left", "50%").css("margin-left", l);
			} else {
				$("#quickbar").css("position", "fixed").css('top', "10px").css("left", "50%").css("margin-left", l);
			}
		});
});
</script>
</head>
<body>
<div id="wrapper">
	<div id="wrap">
		<%@include file="/publish/frontoffice/include/head.jsp"%>
		<div id="body">
		
		
		
		
		</div><!-- end body -->		
		<%@include file="/publish/frontoffice/include/quickbar.jsp"%>
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
</div><!-- end wrapper -->
</body>
</html>