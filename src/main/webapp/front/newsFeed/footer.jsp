<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<style type="text/css">
/* index页面CSS以及底部菜单的CSS */
/* footer-CSS */
	.koreanair-foot{border-top:1px solid #53ACCB;width:100%;height:55px;background-color:#9CD0DE; vertical-align: bottom;text-align: center;font-size:12px;}
	.koreanair-foot li{float: left; width: 20%; height: 37px;}
	.koreanair-foot li a{height:25px;display: inline-block;width:100%;vertical-align: bottom;padding-top:37px;position: relative;}
	.foot-img{background-position: center 8px;background-size:40px 31px;background-repeat: no-repeat;}
	.foot-img.home-selected{background-image: url("/front/skin/koreanair/img/common/nav_home_b.png");color:#0b4395;}
	.foot-img.home-selectedno{background-image: url("/front/skin/koreanair/img/common/nav_home.png");color:#436e7a;}
	.foot-img.news-selected{background-image: url("/front/skin/koreanair/img/common/nav_news_b.png");color:#0b4395;}
	.foot-img.news-selectedno{background-image: url("/front/skin/koreanair/img/common/nav_news.png");color:#436e7a;}
	.foot-img.route-selected{background-image: url("/front/skin/koreanair/img/common/nav_route_b.png");color:#0b4395;}
	.foot-img.route-selectedno{background-image: url("/front/skin/koreanair/img/common/nav_route.png");color:#436e7a;}
	.foot-img.predetermine-selected{background-image: url("/front/skin/koreanair/img/common/nav_predetermine_b.png");color:#0b4395;}
	.foot-img.predetermine-selectedno{background-image: url("/front/skin/koreanair/img/common/nav_predetermine.png");color:#436e7a;}
	.foot-img.csr-selected {background-image: url("/front/skin/koreanair/img/common/nav_CSR_b.png"); color:#0b4395;}
	.foot-img.csr-selectedno {background-image: url("/front/skin/koreanair/img/common/nav_CSR.png"); color:#436e7a;}
	/* footer-CSS */
	
	.fixedMenu1 {position: fixed;bottom:75px;width: 165px;height: 80px;padding: 0px;background: #FFFFFF;-webkit-border-radius: 7px;-moz-border-radius: 7px;border-radius: 7px;border: #0B4395 solid 1px;font-size:1.2em;color:#686868;
	-webkit-box-shadow: 0 3px 2px -2px #686868;
	   -moz-box-shadow: 0 3px 2px -2px #686868;
	        box-shadow: 0 3px 2px -2px #686868;}
	.fixedMenu1:after {content: '';position: absolute;border-style: solid;border-width: 12px 8px 0;border-color: #FFFFFF transparent;display: block;width: 0;z-index: 1;bottom: -12px;left: 74px;}
	.fixedMenu1.changed:after {content: '';position: absolute;border-style: solid;border-width: 12px 8px 0;border-color: #33A2B3 transparent;display: block;width: 0;z-index: 1;bottom: -12px;left: 74px;}
	.fixedMenu1:before {content: '';position: absolute;border-style: solid;border-width: 12px 8px 0;border-color: #0B4395 transparent;display: block;width: 0;z-index: 0;bottom: -13px;left: 74px;}
	
	.fixedMenu2 {position: fixed;bottom:75px; width: 165px;height: 120px;padding: 0px;background: #FFFFFF;-webkit-border-radius: 7px;-moz-border-radius: 7px;border-radius: 7px;border: #0B4395 solid 1px;font-size:1.2em;color:#686868;
	-webkit-box-shadow: 0 3px 2px -2px #686868;
	   -moz-box-shadow: 0 3px 2px -2px #686868;
	        box-shadow: 0 3px 2px -2px #686868;}
	.fixedMenu2:after {content: '';position: absolute;border-style: solid;border-width: 12px 8px 0;border-color: #ffffff transparent;display: block;width: 0;z-index: 1;bottom: -12px;left: 74px;}
	.fixedMenu2.changed:after {content: '';position: absolute;border-style: solid;border-width: 12px 8px 0;border-color: #33A2B3 transparent;display: block;width: 0;z-index: 1;bottom: -12px;left: 74px;}
	.fixedMenu2:before {content: '';position: absolute;border-style: solid;border-width: 12px 8px 0;border-color: #0B4395 transparent;display: block;width: 0;z-index: 0;bottom: -13px;left: 74px;}
	
	.fixedMenu3 {position: fixed;bottom:75px;width: 165px;height: 120px;padding: 0px;background: #FFFFFF;-webkit-border-radius: 7px;-moz-border-radius: 7px;border-radius: 7px;border: #0B4395 solid 1px;font-size:1.2em;color:#686868;
	-webkit-box-shadow: 0 3px 2px -2px #686868;
	   -moz-box-shadow: 0 3px 2px -2px #686868;
	        box-shadow: 0 3px 2px -2px #686868;}
	.fixedMenu3:after {content: '';position: absolute;border-style: solid;border-width: 12px 8px 0;border-color: #FFFFFF transparent;display: block;width: 0;z-index: 1;bottom: -12px;left: 120px;}
	.fixedMenu3.changed:after {content: '';position: absolute;border-style: solid;border-width: 12px 8px 0;border-color: #33A2B3 transparent;display: block;width: 0;z-index: 1;bottom: -12px;left: 120px;}
	.fixedMenu3:before {content: '';position: absolute;border-style: solid;border-width: 12px 8px 0;border-color: #0B4395 transparent;display: block;width: 0;z-index: 0;bottom: -13px;left: 120px;}

	
	button,
	input[type="button"],
	input[type="submit"],
	input[type="reset"]{-webkit-appearance:button;border-radius:50%}
	
	.imgTempOne-index{position: relative; text-align: center;}
	.backGrBuilding{position: absolute;top:75%;width:40%;left:30%;z-index:-1;opacity:0;}
	.backGrAirplane{position: absolute;top:55%;width:auto;left:100%;z-index:1; width:40%;display:none;}
	.logo{position: absolute;top:20px;left:15px;}
	
	.firstBox{text-align: center;margin: -5px auto; z-index:999;}
	.subImg1 {width: 60%; display: inline-block;float: left;margin: 5px 5px 5px 10px;border:1px solid #D6D6D6;background-color:white;padding:3px;}
	.subImg1_1{width: 100%; display: inline-block;float: left;position:relative; overflow:hidden;}
	.subImg1_1 .sliderList {position:relative; overflow:hidden;text-align: center;}
	.subImg1_1 .sliderList ul {position:relative; width:100% !important; background:#fff;}
	.subImg1_1 .sliderList img {width:100%;}
	.subImg1_1 .sliderList li {position:absolute;}
	.subImg1_1 .sliderList li:first-child {position:relative !important;}
	/* .subImg1_1 .sliderpage {position:relative; left:10px; width:100%; text-align:left;} */
	.subImg1_1 .sliderpage {position:absolute; bottom:5px; left:5px; right:0; text-align:left; line-height:0; font-size:0; }
	.subImg1_1 .sliderpage .btnPage {height:9px; width:9px; border:0; font-size:0; line-height:0; background:#ffffff;}
	.subImg1_1 .sliderpage .btnPage + .btnPage {margin-left:3px;}
	.subImg1_1 .sliderpage .btnPage.on {background-color:#FF9200;}
	.subImg1_2{width: 29%; display: inline-block;float: left;margin: 5px 5px 5px 5px;height:168px;}
	
	.scndBox{text-align: center;margin: 0 auto;position: relative; }
	.subImg2_1{width: 46%; display: inline-block;float: left;margin: 5px 5px 5px 10px;border:1px solid #eeeeee;height:122px;position: relative;}
	.subImg2_2{width: 45%; display: inline-block;float: left;margin: 5px 5px 5px 5px;}
	.subImg2_3{width: 45%; display: inline-block;float: left;margin: 0px 5px 5px 5px;}
	.subImg2_1 ul {height:61px;width:100%;background-color: #ffffff;}
	.subImg2_1 ul li{text-align: left;height:40px;width:100%;float:left;position: relative;}
	.subImg2_1 ul li:first-child{vertical-align: middle;line-height: 40px;}
	.subImg2_1 ul li:last-child{border-bottom:1px solid #eeeeee;height:20px;}
	.subImg2_1 ul li p{width:70%;color:#474747;margin-left:5%;font-size:14px;margin-top:5px;position: relative;line-height:16px;word-break:break-word;display:inline-block;height:32px;}
	.subImg2_1 ul li span{font-size:10px;color:#8f8f8f;}
	.subImg2_1 ul li img{width:10px;height:10px;margin-top:4px;margin-left:3px;margin-right:1px;}
	.list-body-msg-div-index{position: absolute;right:2%;top:11px;}
	.list-body-msg-div-index .img-show-div-float-index{width:30px;height:30px;}
	.thBox{text-align: left;margin: 0 auto; display: inline-block;float: left; padding-left: 10px;}
	
	.share {position:absolute; top:0; left:0; width:100%;height:100%; background:url('/front/skin/koreanair/img/main/applink_guide_iPhone_n1.png') no-repeat; background-size:100% 100%; display:none; z-index: 999;}
	.share img {position:absolute; width: 30%; height: 10%; top: 50%; left: 35%;}



/* index页面CSS以及底部菜单的CSS */
</style>

<!-- brand-footer -->
	<div class="bottomFixedMenu" id="brandStoryFoot" 

 	<c:if test="${sessionScope.sessionSkin.shopId ne 13 }">
		style="display:none;"
 	</c:if>
		style="opacity:1;"
	
	>
		<section class="koreanair-foot">
			<ul>
				<li onclick="openMenu('0',${sessionScope.sessionSkin.shopId});"><a class="foot-img home-selected" data-item="0">首页</a></li>
				<li onclick="openMenu('1',${sessionScope.sessionSkin.shopId});"><a class="foot-img news-selectedno" data-item="1">新闻/促销</a></li>
				<li onclick="openMenu('2',${sessionScope.sessionSkin.shopId});"><a class="foot-img route-selectedno" data-item="2" >航线信息</a></li>
				<li onclick="openMenu('3',${sessionScope.sessionSkin.shopId});"><a class="foot-img predetermine-selectedno" data-item="3" >在线预订</a></li> <!-- &blogGroupId=10009 -->
				<li onclick="openMenu('4',${sessionScope.sessionSkin.shopId});"><a class="foot-img csr-selectedno" data-item="4">公益活动</a></li>
			</ul>
		</section>
	</div>
	<!-- brand-footer -->
	
	<div class="fixedMenu1" style="display:none;" >
		<table style="width: 100%; height: 100%;">
			<tr onclick="goPage('1_1',${sessionScope.sessionSkin.shopId})">
				<td class="fixedMenu1_1"  style="width: 100%; height: 50%; border-bottom: solid 1px #D6D6D6;padding-left:10px;border-top-left-radius:6px;border-top-right-radius:6px;">
					最新资讯
				</td>
			</tr>
			<tr onclick="goPage('1_2',${sessionScope.sessionSkin.shopId})">
				<td class="fixedMenu1_2" style="width: 100%; height: 50%;padding-left:10px;border-bottom-right-radius:6px;border-bottom-left-radius:6px;">
					精彩促销
				</td>
			</tr>
		</table>
	</div>
	
	<div class="fixedMenu2" style="display:none;" >
		<table style="width: 100%; height: 100%;">
			<tr onclick="goPage('2_1',${sessionScope.sessionSkin.shopId})">
				<td class="fixedMenu2_1" colspan="2" style="width: 100%; height: 33.3%; border-bottom: solid 1px #D6D6D6;padding-left:10px;border-top-left-radius:6px;border-top-right-radius:6px;" onclick="setScbSave('nosprt')">
					换乘信息
				</td>
			</tr>
			<tr onclick="goPage('2_2')">
				<td class="fixedMenu2_2" style="width: 80%; height: 33.3%;border-bottom: solid 1px #D6D6D6;padding-left:10px;" onclick="setScbSave('nosprt')">
					航班时刻
				</td>
				<td class="fixedMenu2_2" style="width: 20%; height: 33.3%;border-bottom: solid 1px #D6D6D6">
					<img src="/front/skin/koreanair/img/common/icon_applink.png" alt="" style="width:80%;"/>
				</td>
			</tr>
			<tr onclick="goPage('2_3')">
				<td class="fixedMenu2_3" style="width: 80%; height: 33.3%;padding-left:10px;border-bottom-left-radius:6px;" onclick="setScbSave('nosprt')">
					实时航班动态
				</td>
				<td class="fixedMenu2_3" style="width: 20%; height: 33.3%;border-bottom-right-radius:6px;">
					<img src="/front/skin/koreanair/img/common/icon_applink.png" alt="" style="width:80%;"/>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="fixedMenu3" style="display:none;" >
		<table style="width: 100%; height: 100%;">
			<tr onclick="goPage('3_1')">
				<td class="fixedMenu3_1" style="width: 80%; height: 33.3%; border-bottom: solid 1px #D6D6D6;padding-left:10px;border-top-left-radius:6px;" onclick="setScbSave('nosprt')">
					机票预订
				</td>
				<td class="fixedMenu3_1" style="width: 20%; height: 33.3%;border-bottom: solid 1px #D6D6D6;border-top-right-radius:6px;">
					<img src="/front/skin/koreanair/img/common/icon_applink.png" alt="" style="width:75%;"/>
				</td>
			</tr>
			<tr onclick="goPage('3_2')">
				<td class="fixedMenu3_2" style="width: 80%; height: 33.3%;border-bottom: solid 1px #D6D6D6;padding-left:10px;" onclick="setScbSave('nosprt')">
					MY SKYPASS
				</td>
				<td class="fixedMenu3_2" style="width: 20%; height: 33.3%;border-bottom: solid 1px #D6D6D6">
					<img src="/front/skin/koreanair/img/common/icon_applink.png" alt="" style="width:75%;"/>
				</td>
			</tr>
			<tr onclick="goPage('3_3')">
				<td class="fixedMenu3_3" style="width: 80%; height: 33.3%;padding-left:10px;border-bottom-left-radius:6px;" onclick="setScbSave('nosprt')">
					办理登机手续
				</td>
				<td class="fixedMenu3_3" style="width: 20%; height: 33.3%;border-bottom-right-radius:6px;">
					<img src="/front/skin/koreanair/img/common/icon_applink.png" alt="" style="width:75%;"/>
				</td>
			</tr>
		</table>
	</div>
	
	<!-- 下载文件提示页面 -->
	<div id="share" class="share">
		<img src="/front/skin/koreanair/img/main/applink_guide_iPhone_n2.png" onclick="$('#share').hide();" />
	</div>
	<!-- 下载文件提示页面 -->