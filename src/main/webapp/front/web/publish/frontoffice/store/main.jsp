<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE LAYOUT</title>
<link href="/css/layout_store.css" rel="stylesheet" type="text/css" />
<link href="/css/store.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script> 
<script type="text/javascript" src="/js/jquery/jquery.rotate.js"></script>
<script type="text/javascript" src="/js/jquery/common.js"></script> 

<script type="text/javascript" src="/js/jqueryScroll/jcarousellite_1.0.1.min.js"></script> 
<script type="text/javascript">
jQuery(function($){
  
	$(".storemain-box p.morebtn01 a.btnhide").click(function(){ 
		$(".storemain-box p.morebtn01 a.btnhide").attr("class" , "btnhide");   		
		$(this).attr("class" , "btnopen");  					
	});
	 
	$(".storemain-box p.morebtn01 a.btnopen").click(function(){ 
		$(".storemain-box p.morebtn01 a.btnopen").attr("class" , "btnopen");   		
		$(this).attr("class" , "btnhide");  					
	});
	 
	$(".storemain-box p.morebtn01 a").click(function(){
		$('.eventlist').toggle(); 
		return false;
	});
	
	 
	$(".storemain-box p.morebtn02 a").click(function(){
		$('.noticelist').toggle(); 
		return false;
	});	
	 
	/*
	$(".storemain-box p.morebtn01 a").click(function(){ 
		if( statsChk == "btnhide") {
			$(this).attr('class','btnopen');  
		} else if( statsChk == "btnopen") {
			$(this).attr('class','btnhide'); 
		}
	}); 

  	 

	$(".storemain-box p.morebtn02 a").click(function(){ 	
		
		if( statsChk == "btnhide") {
			$(this).attr('class','btnopen');  
		} else if( statsChk == "btnopen") {
			$(this).attr('class','btnhide'); 	 
		
		$('.noticelist').toggle(); 									
		return false;
	})
	  */
	
});
</script>
</head>
<body>
<div id="wrapper">
	<div id="wrap">
		<%@include file="/publish/frontoffice/include/head_store.jsp"%>
			<div id="body">
			 
			<div id="storemain"> 
				<div class="mainvisual"> 
					<p><img src="/images/shop/cn/store/main_visual.jpg" alt="????????????????????????????????????????????????????????? ????????????????????????????????????" /></p>
				</div>
				
				<div class="storemain-box">				
					<div class="title"><img src="/images/shop/cn/store/title_main01.gif" alt="????????????" /></div>
					<div class="eventlist">
						<ul>
							<li>
								<a href="#"><img src="//image.ssgdfs.com/images/shop/common/sub/banner_event03.gif" alt="?????????" /></a>
								<span>2013-01-30 ~ 2013-02-30</span>
							</li> 
							<li>
								<a href="#"><img src="//image.ssgdfs.com/images/shop/common/sub/banner_event03.gif" alt="?????????" /></a>
								<span>2013-01-30 ~ 2013-02-30</span>
							</li> 
							<li>
								<a href="#"><img src="//image.ssgdfs.com/images/shop/common/sub/banner_event03.gif" alt="?????????" /></a>
								<span>2013-01-30 ~ 2013-02-30</span>
							</li> 
							<li class="last">
								<a href="#"><img src="//image.ssgdfs.com/images/shop/common/sub/banner_event03.gif" alt="?????????" /></a>
								<span>2013-01-30 ~ 2013-02-30</span>
							</li> 
						</ul>
					</div>  
					<p class="morebtn morebtn01"><a href="#" class="btnhide"></a></p>  
				</div>
				
				<div class="storemain-box">				
					<div class="title"><img src="/images/shop/cn/store/title_main02.gif" alt="????????????????????????" /></div>
					<div class="noticelist">
						 <div class="notice_box">
							<div class="notice">
								<p class="stitle"><img src="/images/shop/cn/store/stitle_main02_1.gif" alt="????????????" /></p>
								<ul class="list">
									<li><a href="#">[MONTBLANC] ?????? ?????? ??????</a>
									<li><a href="#">?????? ??????????????? ????????? ?????? ??? ?????? ...</a>
									<li><a href="#">2013.05??? ????????? ?????? ?????? ??????</a>
									<li><a href="#">TISSOT/LONGINES ?????? ????????? ?????? ...</a>
								</li>
								<p class="more"><a href="#"><img src="/images/shop/cn/store/btn_more.gif" alt="more" /></a></p>
							</div>
							<div class="noticeevent">
								<p class="stitle"><img src="/images/shop/cn/store/stitle_main02_2.gif" alt="????????????????????????" /></p>
								<ul class="list">
									<li><a href="#">[MONTBLANC] ?????? ?????? ??????</a>
									<li><a href="#">?????? ??????????????? ????????? ?????? ??? ?????? ...</a>
									<li><a href="#">2013.05??? ????????? ?????? ?????? ??????</a>
									<li><a href="#">TISSOT/LONGINES ?????? ????????? ?????? ...</a>
								</li>
								<p class="more"><a href="#"><img src="/images/shop/cn/store/btn_more.gif" alt="more" /></a></p>
							</div>
						</div>
					</div>  
					<p class="morebtn morebtn02"><a href="#" class="btnhide"></a></p>    
				</div>
				 
				<div class="storelist-box"> 
					<div class="view-con">
						<span class="prev"><img src="/images/shop/cn/store/btn_main_next.gif" alt="next" /></span>
						<span class="next"><img src="/images/shop/cn/store/btn_main_prev.gif" alt="previouse" /></span>
					</div> 
					<div class="storelist">
						<ul>
							<li><a href="#"><img src="//image.ssgdfs.com/images/shop/store/main_store01.jpg" alt="?????????" /></a></li>  
							<li><a href="#"><img src="//image.ssgdfs.com/images/shop/store/main_store02.jpg" alt="?????????" /></a></li> 
							<li><a href="#"><img src="//image.ssgdfs.com/images/shop/store/main_store03.jpg" alt="?????????" /></a></li> 
							<li class="selected"><a href="#"><img src="//image.ssgdfs.com/images/shop/store/main_store04.jpg" alt="?????????" /></a></li> 
							<li><a href="#"><img src="//image.ssgdfs.com/images/shop/store/main_store05.jpg" alt="?????????" /></a></li> 
							<li><a href="#"><img src="//image.ssgdfs.com/images/shop/store/main_store06.jpg" alt="?????????" /></a></li> 
							<li><a href="#"><img src="//image.ssgdfs.com/images/shop/store/main_store07.jpg" alt="?????????" /></a></li>  
						</ul>
					</div> 
					<div class="infobox">
						<p><strong>GUCCI</strong> <span>/</span> <span class="tel">051-123-4567</span> <span>/</span> ???????????????????????????3???</p>
					</div>
				</div>
				
				<div class="sitemapbox">
					<ul>
						<li>
							<dl>
								<dt><img src="/images/shop/cn/store/sitemap_main01.gif" alt="??????????????????" /></dt>
								<dd><a href="#"><img src="/images/shop/cn/store/sitemap_main0101.gif" alt="???????????????????????????" /></a></dd>
								<dd><a href="#"><img src="/images/shop/cn/store/sitemap_main0102.gif" alt="????????????" /></a></dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt><img src="/images/shop/cn/store/sitemap_main02.gif" alt="????????????" /></dt>
								<dd><a href="#"><img src="/images/shop/cn/store/sitemap_main0201.gif" alt="???????????????/????????????" /></a></dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt><img src="/images/shop/cn/store/sitemap_main03.gif" alt="??????" /></dt>
								<dd><a href="#"><img src="/images/shop/cn/store/sitemap_main0301.gif" alt="????????????" /></a></dd>
								<dd><a href="#"><img src="/images/shop/cn/store/sitemap_main0302.gif" alt="??????DM" /></a></dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt><img src="/images/shop/cn/store/sitemap_main04.gif" alt="??????" /></dt>
								<dd><a href="#"><img src="/images/shop/cn/store/sitemap_main0401.gif" alt="????????????" /></a></dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt><img src="/images/shop/cn/store/sitemap_main05.gif" alt="????????????" /></dt>
								<dd><a href="#"><img src="/images/shop/cn/store/sitemap_main0501.gif" alt="????????????" /></a></dd>
								<dd><a href="#"><img src="/images/shop/cn/store/sitemap_main0502.gif" alt="????????????" /></a></dd>
								<dd><a href="#"><img src="/images/shop/cn/store/sitemap_main0503.gif" alt="????????????????????????" /></a></dd>
								<dd><a href="#"><img src="/images/shop/cn/store/sitemap_main0504.gif" alt="????????????(FAQ)" /></a></dd>
								<dd><a href="#"><img src="/images/shop/cn/store/sitemap_main0505.gif" alt="???????????????" /></a></dd>
								<dd><a href="#"><img src="/images/shop/cn/store/sitemap_main0506.gif" alt="????????????" /></a></dd>
								<dd><a href="#"><img src="/images/shop/cn/store/sitemap_main0507.gif" alt="??????????????????" /></a></dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt><img src="/images/shop/cn/store/sitemap_main06.gif" alt="SHOPPING MALL" /></dt>
								<dd><a href="#" target="_blank"><img src="/images/shop/cn/store/sitemap_main0601.gif" alt="NEW" /></a></dd>
								<dd><a href="#" target="_blank"><img src="/images/shop/cn/store/sitemap_main0602.gif" alt="TOP100" /></a></dd>
								<dd><a href="#" target="_blank"><img src="/images/shop/cn/store/sitemap_main0603.gif" alt="??????" /></a></dd>
								<dd><a href="#" target="_blank"><img src="/images/shop/cn/store/sitemap_main0604.gif" alt="?????????" /></a></dd>
								<dd><a href="#" target="_blank"><img src="/images/shop/cn/store/sitemap_main0605.gif" alt="?????????" /></a></dd>
								<dd><a href="#" target="_blank"><img src="/images/shop/cn/store/sitemap_main0606.gif" alt="Wedding" /></a></dd>
								<dd><a href="#" target="_blank"><img src="/images/shop/cn/store/sitemap_main0607.gif" alt="Shop Info" /></a></dd>
							</dl>
						</li>
					</ul>
				</div>
				  
			</div><!-- end contents -->
		</div><!-- end body -->
		<%@include file="/publish/frontoffice/include/foot_store.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
</div><!-- end wrapper -->
</body>
</html>



