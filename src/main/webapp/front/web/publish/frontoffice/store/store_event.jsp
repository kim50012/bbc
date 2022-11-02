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
<script type="text/javascript" src="/js/jquery/jquery.mousewheel.js"></script>
<script type="text/javascript" src="/js/jquery/mwheelIntent.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.jscrollpane.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.rotate.js"></script>
<script type="text/javascript" src="/js/jquery/common.js"></script> 
<script type="text/javascript" src="/js/jquery/jquery.timers-1.2.js"></script>
<script type="text/javascript">
jQuery(function($){
 
	/*** 서브 배너  ***/
	var subBanner = $(".banner-con a");
		/*** 초기 배너 모션 시작 ***/
		subBanner
		.everyTime(5000, 'subBanner', function(i) {
			if(i > 0) {
				idx = i % subBanner.size();
				subBanner.eq(idx).click();
			}
		});
		/*** 배너 시작  ***/
		subBanner.click(function(){
			subBannerClick($(this));
		});
		
		/***  banner click 공통 ***/ 
		subBannerClick = function(obj){
			$(".banner-list ul li").stop().animate({"opacity" : 0, "z-index" : 0} , 400);
			$(".banner .banner-con a").attr("class" , "");
			obj.attr("class" , "selected");
			$(obj.attr("href")).stop().animate({"opacity" : "1", "z-index" : 1} , 500);
			return false;
		}
		 
		
		/*** 배너 재시작  ***/
		subBannerStart = function(obj){
			subBanner.each(function(x){
				if($(this).attr("href") == obj){
					subBanner.everyTime(3000, 'subBanner', function(i) {
						idx = (x + i) % subBanner.size();
						subBanner.eq(idx).click();
					});
				}
			});
		}
		
		/*** 배너정지 ***/
		$(".play-con span.stop").click(function(){
			subBanner.stopTime();
			imgReplace($(this));
		});
		/*** 배너시작 ***/
		$(".play-con span.play").click(function(){
			bannerpoi = $(".banner-con a.selected").attr("href");
			subBannerStart(bannerpoi);
			imgReplace($(this));
		});

		imgReplace = function(obj){
			$(".play-con span").each(function(){
				$(this).find("img").attr("src" , $(this).find("img").attr("src").replace("_on.gif" , "_off.gif"));
			});
			obj.find("img").attr("src" , obj.find("img").attr("src").replace("_off.gif" , "_on.gif"));
		}
		
		/* [D] 0814 추가 */
		$(".banner-con a").click(function(event){  
			event.preventDefault();
		}); 

});
</script>
</head>
<body>
<div id="wrapper">
	<div id="wrap">
		<%@include file="/publish/frontoffice/include/head_store.jsp"%>
			<div id="body">
			<%@include file="/publish/frontoffice/include/sidebar_store03.jsp"%>
			<div id="contents">
				<div class="page-sublocation">
					<a href="#">主页</a><span>&gt;</span><a href="#">活动</a><span>&gt;</span><strong>活动店铺</strong>
				</div> 
				<div class="location-title visual03">
					<h3><img src="/images/shop/cn/store/h3_title03.gif" alt="SHOP EVENT" /></h3>
					<p><img src="/images/shop/cn/store/comment03.gif" alt="请在新世界免税店尽享购物之快乐！! 我们将为顾客的购物方便尽最大的努力。" /></p>
				</div> 
				
				<div class="store-eventbox">
					<div class="banner">
						<div class="play-con">
							<span class="play"><img src="/images/shop/cn/common/btn_play_on.gif" alt="start" /></span>
							<span class="stop"><img src="/images/shop/cn/common/btn_stop_off.gif" alt="stop" /></span>
						</div><!-- end play-con -->
						<div class="banner-con">
							<a href="#sub-banner01" class="selected">1</a>
							<a href="#sub-banner02">2</a>
							<a href="#sub-banner03">3</a>
							<a href="#sub-banner04">4</a>
							<a href="#sub-banner05">5</a>
						</div><!-- end banner-con -->
						<div class="banner-list">
							<ul>
								<li id="sub-banner01" class="first-child">
									<a href="/shop/store/ssgInfo"><img src="//image.ssgdfs.com/images/shop/store/banner_event01.jpg" alt="이벤트명" /></a>
								</li>
								<li id="sub-banner02">
									<a href="/shop/customer/membershipPrivacy"><img src="//image.ssgdfs.com/images/shop/store/banner_event02.jpg" alt="이벤트명" /></a>
								</li>
								<li id="sub-banner03">
									<a href="/shop/store/ssgMap"><img src="//image.ssgdfs.com/images/shop/store/banner_event03.jpg" alt="이벤트명" /></a>
								</li>
								<li id="sub-banner04">
									<a href="/shop/customer/membershipAgreement"><img src="//image.ssgdfs.com/images/shop/store/banner_event04.jpg" alt="1+1증정" /></a>
								</li>
								<li id="sub-banner05">
									<a href="#"><img src="//image.ssgdfs.com/images/shop/store/banner_event05.jpg" alt="1+1증정" /></a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				 
				<h4><img src="/images/shop/cn/store/title_event01.gif" alt="店内活动 " /><span><img src="/images/shop/cn/store/explain_event01.gif" alt="(本活动与网上免税店无关)" /></span></h4>
				  
				<div class="table-listhtype">	 
					<div class="list store-event">
						<table summary="주문가능 상품 테이블">
							<caption>주문가능 상품 테이블</caption>
							<colgroup>  
								<col width="60px" /> 
								<col width="230px" />  
								<col width="310px" />  
								<col width="180px" />   
							</colgroup>
							<thead>
								<tr>  
									<th scope="row">序号</th> 
									<th scope="row" colspan="2">题目</th>  
									<th scope="row">活动期间</th>     
								</tr>
							</thead>
							<tbody>   
								<tr>  
									<td><span class="fta">1</span></td> 
									<td><p class="photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/common/sub/banner_event03.gif" alt="배너명" /></a></p></td>
									<td class="info">
										<p class="txt"><a href="#">존마스터 오가닉 사은행사</a></p> 
									</td>      
									<td><span class="fta">2013-01-30 ~ 2013-02-30</span></td>
								</tr>      
								<tr>  
									<td><span class="fta">100</span></td> 
									<td>
										<p class="photo"><span class="end"><img src="/images/shop/cn/store/event_end.png" alt="종료된 이벤트" /></span>
										<a href="#"><img src="//image.ssgdfs.com/images/shop/common/sub/banner_event03.gif" alt="배너명" /></a></p>
									</td>
									<td class="info">     
										<p class="txt"><a href="#">만다리나덕 SEASON OFF 30% 세일</a></p> 
									</td>      
									<td><span class="fta">2013-01-30 ~ 2013-02-30</span></td>
								</tr>      
								<tr>  
									<td><span class="fta">1</span></td> 
									<td><p class="photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/common/sub/banner_event03.gif" alt="배너명" /></a></p></td>
									<td class="info">     
										<p class="txt"><a href="#">엘리자베스아덴 사은행사</a></p>  
									</td>      
									<td><span class="fta">2013-01-30 ~ 2013-02-30</span></td>
								</tr>      
								<tr>  
									<td><span class="fta">10</span></td> 
									<td><p class="photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/common/sub/banner_event03.gif" alt="배너명" /></a></p></td>
									<td class="info">      
										<p class="txt"><a href="#">$150이상 구매시 사은품 증정</a></p>  
									</td>      
									<td><span class="fta">2013-01-30 ~ 2013-02-30</span></td>
								</tr>      
								<tr>  
									<td><span class="fta">100</span></td> 
									<td><p class="photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/common/sub/banner_event03.gif" alt="배너명" /></a></p></td>
									<td class="info">     
										<p class="txt"><a href="#">만다리나덕 SEASON OFF 30% 세일</a></p> 
									</td>      
									<td><span class="fta">2013-01-30 ~ 2013-02-30</span></td>
								</tr>       
								<tr>  
									<td><span class="fta">1004</span></td> 
									<td><p class="photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/common/sub/banner_event03.gif" alt="배너명" /></a></p></td>
									<td class="info">      
										<p class="txt"><a href="#">2+2 / 2+1 특별기획세트</a></p> 
									</td>      
									<td><span class="fta">2013-01-30 ~ 2013-02-30</span></td>
								</tr>   
							</tbody>  
						</table> 
					</div> 	
						
					<div class="pager">
						<a href="#"><img src="/images/shop/cn/common/btn_page_first.gif" alt="first" /></a>
						<a href="#"><img src="/images/shop/cn/common/btn_page_prev.gif" alt="previous" /></a>
						<strong>1</strong>
						<a href="#">2</a>
						<a href="#">3</a>
						<a href="#">4</a>
						<a href="#">5</a>
						<a href="#">6</a>
						<a href="#">7</a>
						<a href="#">8</a>
						<a href="#">9</a>
						<a href="#">10</a>
						<a href="#"><img src="/images/shop/cn/common/btn_page_next.gif" alt="next" /></a>
						<a href="#"><img src="/images/shop/cn/common/btn_page_last.gif" alt="last" /></a>
					</div>					
				</div>
				
				
			</div><!-- end contents -->
		</div><!-- end body -->
		<%@include file="/publish/frontoffice/include/foot_store.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
</div><!-- end wrapper -->
</body>
</html>



