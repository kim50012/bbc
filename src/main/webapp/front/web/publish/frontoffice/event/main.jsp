<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE</title>
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/base.css" rel="stylesheet" type="text/css" />
<link href="/css/base_cn.css" rel="stylesheet" type="text/css" />
<link href="/css/event.css" rel="stylesheet" type="text/css" />
<link href="/css/selectbox.css" rel="stylesheet" type="text/css" />
<link href="/css/jquery.jscrollpane.css" rel="stylesheet" type="text/css" />
<link href="/css/jquery.ui.datepicker.css" rel="stylesheet" type="text/css" />
<link href="/css/jquery.ui.theme.css" rel="stylesheet" type="text/css" />
<link href="/css/selectbox.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/common.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.core.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.widget.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="/js/jquery/calendar.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.mousewheel.js"></script>
<script type="text/javascript" src="/js/jquery/mwheelIntent.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.jscrollpane.min.js"></script>
<script type="text/javascript" src="/js/jquery/event_common.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.rotate.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.selectbox-0.2.1.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.timers-1.2.js"></script>
<script type="text/javascript" src="/js/event_main.js"></script>
<script type="text/javascript">
jQuery(function($){


		 var bannerSize = $(".event-menu ul li").size();
    var itemWidth = $(".event-menu ul li").width();
    var bannerLen = (bannerSize*itemWidth)+bannerSize;
    var viewSize = itemWidth*1+3;
    
    var banner = $(".event-menu ul li a");
    var bannerEvent = $(".event-menu ul");
    
    /*** 초기 배너 모션 시작 ***/
    function startEvent(where){
        bannerEvent.everyTime(5000, 'banner', function(i) {
            if(where != null && where != undefined && where != ""){
                i = where++;
            }
            idx = i % bannerEvent.children("li").size();
            banner.eq(idx).click();
        });
    }
    
    /*** 시작 ***/
    startEvent();
     
    /*** 배너 mouseout ***/
    banner.mouseout(function(){
        var tagTxt = $(this).attr("href").substr(7);
        startEvent(tagTxt);
    });
    /*** 배너 mouseover ***/
    banner.mouseover(function(){
        bannerEvent.stopTime();
        $(".event-menu ul li").attr("class" , "");
        $(this).click();
    });
    /*** 배너정지 버튼***/
    $(".event-banner .play-con span.stop").click(function(){
        bannerEvent.stopTime();
    });
    /*** 배너시작 버튼***/
    $(".event-banner .play-con span.play").click(function(){
        bannerpoi = $(".event-menu ul").find(" li.selected a").attr("href").substr(7);
        startEvent(bannerpoi);
    });
    
    /*** 배너타이틀 롤링  ***/
    banner.click(function(){
        bannerClick($(this));
    });
    /***  banner click 공통 ***/
    bannerClick = function(obj){
        $(".event-menu ul").width(bannerLen);//전체 ul크기
            var text = obj.attr("href").substr(7);//현제 넘버
            
            $(".event-list ul li").stop().animate({"opacity" : 0} , 400);
            $(".event-menu ul li").attr("class" , "");
            obj.parent().attr("class" , "selected");
            $(obj.attr("href")).stop().animate({"opacity" : "1"} , 500);
            
            if(text == 1) {//1일때 초기화
                $(".event-menu ul").animate({"left" : 0} ,500);
            }else if((text)%3 == 1) {//4,7 일대 체인지
                $(".event-menu ul").animate({"left" : "-"+ (viewSize * ((text-1)/3))} ,500);
            }
            
            return false;
    };
    
    /***  다음버튼 클릭 ***/
    $(".event-menu-wrap .next").click(function(){
        var target = $(".event-menu ul").find("li[class='selected']").index()+1;
        bannerEvent.stopTime();
        if(target < 4){//123
            target = 4;
        }else if(target < 7 && 6 < bannerSize){//456
            target = 7;
        }else{//789
            target = 1;
        }
        banner.eq(target-1).click();
        startEvent(target);
    });
    
    /***  이전버튼 클릭 ***/
    $(".event-menu-wrap .prev").click(function(){
        var target = $(".event-menu ul").find("li[class='selected']").index()+1;
        bannerEvent.stopTime();
        if(target < 4 && 6 < bannerSize){//123
            target = 7;
        }else if(target < 7){
            target = 1;//456
        }else{//789
            target = 4;
        }
        banner.eq(target-1).click();
        startEvent(target);
    });

	$('.pattern-list').jScrollPane({showArrows: true});

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
			$(".banner-list ul li").stop().animate({"opacity" : 0} , 400);;
			$(".banner .banner-con a").attr("class" , "");
			obj.attr("class" , "selected");
			$(obj.attr("href")).stop().animate({"opacity" : "1"} , 500);
			return false;
		}
		/*** 배너 재시작  ***/
		subBannerStart = function(obj){
			subanner.find("a").each(function(x){
				if($(this).attr("href") == obj){
					banner.everyTime(3000, 'subBanner', function(i) {
						idx = (x + i) % subBanner.size();
						banner.eq(idx).click();
					});
				}
			});
		}

		/*** 이벤트 네비게이션 마우스 오버  ***/

		$(".event-navi ul li").mouseover(function(){
			replaceImg($(".event-navi ul li"));
			$(".event-navi ul li").attr("class" , "");
			$(this).find("img").attr("src" ,$(this).find("img").attr("src").replace("_off.gif" , "_on.gif"));
			$(this).attr("class" , "selected");
		});

		/*** 이벤트 정보 tab ***/
		var patternInfo = $(".pattern-wrap");
		patternInfo.hide();
		patternInfo.eq(0).show();
		$(".info-tab ul li a").click(function(){
			patternInfo.hide();
			replaceImg($(".info-tab ul li a"));
			$(".info-tab ul li").attr("class" , "");
			$(this).parent().attr("class" , "selected");
			$(this).find("img").attr("src" ,$(this).find("img").attr("src").replace("_off.gif" , "_on.gif"));
			$($(this).attr("href")).show();
			$($(this).attr("href")).find("div.banner-area ul li").eq(0).show();
			return false;
		});

		/*** 이벤트 정보 tab 마우스 오버  ***/
		$("div.banner-area ul li").hide();
		$("div.banner-area ul li").eq(0).show();
		$(".pattern-wrap div.pattern-list").find("ul li").mouseover(function(){
			idx = $(this).index();
			menu = $(this).parent().parent().parent().parent();
			$("div.banner-area ul li").hide();
			menu.next().find("ul li").eq(idx).show();
			//menu.next().find("ul li").eq(idx).show();
			patternInfo.find("ul li").attr("class" , "");
			$(this).attr("class" , "selected");
			//$(this).find("div.banner").show();
		});

		/** 이미지 replace **/

		replaceImg = function(listing){
			listing.each(function(){
				$(this).find("img").attr("src" ,$(this).find("img").attr("src").replace("_on.gif" , "_off.gif"));
			});	
			
		}

		/*** layer-hide ***/
	  $(".layer-banner span").click(function(){
		  $(".layer-banner").hide();
	  });

	  $(".section-pattern-list dl dd p.more-view").click(function(){
		  $(this).parent().find("ul").css({"overflow" : "visible" , "height" : "auto"});
	  });

});
</script>
</head>
<body>
<div id="wrapper">
	<div id="wrap">
		<%@include file="/publish/frontoffice/include/head.jsp"%>
		<div id="body">
			<div class="page-submainlocation submainloc-line">  
				<p class="title"><img src="/images/shop/cn/common/title_event.gif" alt="新世界网上免税店 活动" /></p>
				<a href="#">主页</a><span>&gt;</span><strong>活动</strong>
			</div>
			<div class="event">
				<div class="selecting search-type-top">
					<form action="#">
					<fieldset>
						<legend>이벤트 검색 서식</legend>
						<dl class="total">
							<dt>全部活动 <span>&gt;</span></dt>
							<dd>
								<select class="event-all">
									<option>正在进行的活动</option>
									<option>正在进行的活动</option>
									<option>正在进行的活动</option>
									<option>正在进行的活动</option>
									<option>正在进行的活动</option>
									<option>正在进行的活动</option>
									<option>正在进行的活动</option>
									<option>正在进行的活动</option>
									<option>正在进行的活动</option>
								</select>
							</dd>
						</dl>
					</fieldset>
					</form>
				</div><!-- end plan-search -->
				<div class="main-banner-navi">
					<div class="event-banner">
						<div class="play-con">
							<span class="play"><img src="/images/shop/cn/common/btn_play_on.gif" alt="start" /></span>
							<span class="stop"><img src="/images/shop/cn/common/btn_stop_off.gif" alt="stop" /></span>
						</div><!-- end play-con -->
						<div class="event-menu-wrap">
							<div class="view-con">
								<span class="prev"><img src="/images/shop/cn/event/btn_prev.gif" alt="previous" /></span>
								<span class="next"><img src="/images/shop/cn/event/btn_next.gif" alt="next" /></span>
							</div><!-- end view-con -->
							<div class="event-menu">
								<ul>
									<li class="selected"><a href="#event01">성년의 날 이벤트01</a></li>
									<li><a href="#event02">휴고보스 SEASON OFF01</a></li>
									<li><a href="#event03">팬디 시계 일부 40% 세일01</a></li>
									<li><a href="#event04">성년의 날 이벤트02</a></li>
									<li><a href="#event05">성년의 날 이벤트02</a></li>
									
								</ul>
							</div><!-- end event-menu -->
						</div><!-- end event-menu-wrap -->
						<div class="event-list">
							<ul>
								<li id="event01" class="first-child"><a href="#"><img src="/images/shop/cn/event/banner01.gif" alt="" /></a></li>
								<li id="event02"><a href="#"><img src="/images/shop/cn/event/banner02.gif" alt="" /></a></li>
								<li id="event03"><a href="#"><img src="/images/shop/cn/event/banner03.gif" alt="" /></a></li>
								<li id="event04"><a href="#"><img src="/images/shop/cn/event/banner04.gif" alt="" /></a></li>
								<li id="event05"><a href="#"><img src="/images/shop/cn/event/banner05.gif" alt="" /></a></li>
								<li id="event06"><a href="#"><img src="/images/shop/cn/event/banner06.gif" alt="" /></a></li>
								<li id="event07"><a href="#"><img src="/images/shop/cn/event/banner07.gif" alt="" /></a></li>
								<li id="event08"><a href="#"><img src="/images/shop/cn/event/banner08.gif" alt="" /></a></li>
								<li id="event09"><a href="#"><img src="/images/shop/cn/event/banner09.gif" alt="" /></a></li>
							</ul>
						</div><!-- end banner-list -->
					</div><!-- end event-banner -->
				</div><!-- end main-banner-navi -->
				<div class="comment-reply">
					<div class="count-form">
						<p class="cnt">共有 <span>125</span>个活动。</p>
					</div><!-- end count-form -->
					<div class="comment-table cn-eventtable">
						<table summary="댓글내용을 보여주는 표">
							<caption>댓글 내용</caption>
							<colgroup>
								<col width="89px" />
								<col width="549px" />
								<col width="159px" />
								<col width="200px" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col" colspan="4">
										<p class="title"><a href="#" class="on">按起始日</a><a href="#">按结束日</a></p>
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><p><a href="#"><img src="/images/shop/cn/event/btn_ing.gif" alt="正在进行" /></a></p></td>
									<td class="event-tit">
										<p><span>[댓글이벤트]</span><a href="#">클라란스 댓글 이벤트 당첨자</a></p>
									</td>
									<td>F,S,SV,H,HV</td>
									<td class="fta"><span>2013.01.30 - 2013.01.30</span></td>
								</tr>
								<tr>
									<td><p><a href="#"><img src="/images/shop/cn/event/btn_end.gif" alt="已结束" /></a></p></td>
									<td class="event-tit">
										<p><span>[브랜드 사은품]</span><a href="#">클라란스 댓글 이벤트 당첨자</a></p>
									</td>
									<td>F,S,SV,H,HV</td>
									<td class="fta"><span>2013.01.30 - 2013.01.30</span></td>
								</tr>
								<tr>
									<td><p><a href="#"><img src="/images/shop/cn/event/btn_ing.gif" alt="正在进行" /></a></p></td>
									<td class="event-tit">
										<p><span>[댓글이벤트]</span><a href="#">클라란스 댓글 이벤트 당첨자</a></p>
									</td>
									<td class="mem-step">F,S,SV,H,HV</td>
									<td class="fta"><span>2013.01.30 - 2013.01.30</span></td>
								</tr>
								<tr>
									<td><p><a href="#"><img src="/images/shop/cn/event/btn_ing.gif" alt="正在进行" /></a></p></td>
									<td class="event-tit">
										<p><span>[브랜드 사은품]</span><a href="#">클라란스 댓글 이벤트 당첨자</a></p>
									</td>
									<td class="mem-step">F,S,SV,H,HV</td>
									<td class="fta"><span>2013.01.30 - 2013.01.30</span></td>
								</tr>
								<tr>
									<td><p><a href="#"><img src="/images/shop/cn/event/btn_ing.gif" alt="正在进行" /></a></p></td>
									<td class="event-tit">
										<p><span>[댓글이벤트]</span><a href="#">클라란스 댓글 이벤트 당첨자</a></p>
									</td>
									<td class="mem-step">F,S,SV,H,HV</td>
									<td class="fta"><span>2013.01.30 - 2013.01.30</span></td>
								</tr>
								<tr>
									<td><p><a href="#"><img src="/images/shop/cn/event/btn_end.gif" alt="已结束" /></a></p></td>
									<td class="event-tit">
										<p><span>[브랜드 사은품]</span><a href="#">클라란스 댓글 이벤트 당첨자</a></p>
									</td>
									<td class="mem-step">F,S,SV,H,HV</td>
									<td class="fta"><span>2013.01.30 - 2013.01.30</span></td>
								</tr>
								<tr>
									<td><p><a href="#"><img src="/images/shop/cn/event/btn_end.gif" alt="已结束" /></a></p></td>
									<td class="event-tit">
										<p><span>[댓글이벤트]</span><a href="#">클라란스 댓글 이벤트 당첨자</a></p>
									</td>
									<td class="mem-step">F,S,SV,H,HV</td>
									<td class="fta"><span>2013.01.30 - 2013.01.30</span></td>
								</tr>
								<tr>
									<td><p><a href="#"><img src="/images/shop/cn/event/btn_end.gif" alt="已结束" /></a></p></td>
									<td class="event-tit">
										<p><span>[브랜드 사은품]</span><a href="#">클라란스 댓글 이벤트 당첨자</a></p>
									</td>
									<td class="mem-step">F,S,SV,H,HV</td>
									<td class="fta"><span>2013.01.30 - 2013.01.30</span></td>
								</tr>
								<tr>
									<td><p><a href="#"><img src="/images/shop/cn/event/btn_end.gif" alt="已结束" /></a></p></td>
									<td class="event-tit">
										<p><span>[댓글이벤트]</span><a href="#">클라란스 댓글 이벤트 당첨자</a></p>
									</td>
									<td class="mem-step">F,S,SV,H,HV</td>
									<td class="fta"><span>2013.01.30 - 2013.01.30</span></td>
								</tr>
								<tr>
									<td><p><a href="#"><img src="/images/shop/cn/event/btn_end.gif" alt="已结束" /></a></p></td>
									<td class="event-tit">
										<p><span>[브랜드 사은품]</span><a href="#">클라란스 댓글 이벤트 당첨자</a></p>
									</td>
									<td class="mem-step">F,S,SV,H,HV</td>
									<td class="fta"><span>2013.01.30 - 2013.01.30</span></td>
								</tr>
							</tbody>
						</table>
					</div><!-- end comment-table -->
					<div class="pager">
						<a href="#" class="first"><img src="/images/shop/cn/common/btn_page_first.gif" alt="first" /></a>
						<a href="#" class="prev"><img src="/images/shop/cn/common/btn_page_prev.gif" alt="previous" /></a>
						<a href="#">1</a>
						<a href="#">2</a>
						<a href="#">3</a>
						<a href="#">4</a>
						<a href="#">5</a>
						<a href="#">6</a>
						<a href="#">7</a>
						<a href="#">8</a>
						<a href="#">9</a>
						<a href="#">10</a>
						<a href="#" class="next"><img src="/images/shop/cn/common/btn_page_next.gif" alt="next" /></a>
						<a href="#" class="last"><img src="/images/shop/cn/common/btn_page_last.gif" alt="last" /></a>
					</div><!-- end pager -->
				</div><!-- end comment-replay -->
			</div><!-- end event -->
		
		</div><!-- end body -->		
		<%@include file="/publish/frontoffice/include/quickbar.jsp"%>
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
</div><!-- end wrapper -->
</body>
</html>