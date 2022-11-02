<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" /> 
<title>SHINSEGAE 마이페이지</title>
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/member.css" rel="stylesheet" type="text/css" />
<link href="/css/order.css" rel="stylesheet" type="text/css" />
<link href="/css/mypage.css" rel="stylesheet" type="text/css" />
<!--[if IE 7]><link rel="stylesheet" type="text/css" href="/css/ie7.css"><![endif]-->
<link href="/css/jquery.ui.datepicker.css" rel="stylesheet" type="text/css" /> 
<link href="/css/jquery.ui.theme.css" rel="stylesheet" type="text/css" />
<link href="/css/selectbox.css" rel="stylesheet" type="text/css" /> 
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.rotate.js"></script>
<script type="text/javascript" src="/js/jquery/common.js"></script>
<script type="text/javascript" src="/js/jquery/common_mypage.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.core.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.widget.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="/js/jquery/calendar.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.selectbox-0.2.1.js"></script> 
<script type="text/javascript">
jQuery(function($){
	
		/*** select box ***/
		$("#local").selectbox();
		$("#local02").selectbox();
		
		$("#join-birthday-year").selectbox();
		$("#join-birthday-month").selectbox();
		$("#join-birthday-date").selectbox();


		$("#join-cellphone").selectbox();
		$("#join-email").selectbox();
		
		$("#wedding-year").selectbox();
		$("#wedding-month").selectbox();
		$("#wedding-date").selectbox();
		
		$("#tel").selectbox();
		
		$("#passport_nationality").selectbox();


		$("#complete-year").selectbox();
		$("#complete-month").selectbox();
		$("#complete-date").selectbox();

			
		$("table").css("z-index" ,"1");
		$("table td").css("z-index" ,"1");
		$("table td div").click(function(){
			$(this).parent().parent().parent().parent().parent().css("z-index" ,"2");	
			$(this).css("z-index" ,"10");			
		});
		$("table td div").focusout(function(){
			$(this).css("z-index" ,"1");			
		})
});
</script>
</head>
<body>
<div id="wrapper">
	<div id="wrap">
		<%@include file="/publish/frontoffice/include/head.jsp"%>
		<div id="body">  
			<div class="mypage"> 
				<div class="sidebar">
					<%@include file="/publish/frontoffice/include/sub_mypage.jsp"%>						
					<%@include file="/publish/frontoffice/include/side_common.jsp"%>					
				</div> 
				<div id="contents">  
					<div class="page-sublocation">  
						<a href="#">主页</a><span>&gt;</span><a href="#">我的页面</a><span>&gt;</span><a href="#">我的信息</a><span>&gt;</span><strong>修改会员信息</strong>
					</div>
			 
					<%@include file="/publish/frontoffice/include/top_mypage.jsp"%><!-- //마이페이지 공통 -->
					 
					<div class="memberinfo-container">
						<h3><img src="/images/shop/cn/mypage/title_memberinfo.gif" alt="修改会员信息" /></h3>
						
						<p class="small-tit"><img src="/images/shop/cn/mypage/title_memberinfo_s01.gif" alt="请输入必须信息" /></p>
						<div class="order-board">
							<table summary="회원가입시 입력한 회원 정보 수정하는 표">
								<caption>회원가입시 입력한 회원 정보 수정</caption>
								<colgroup>
									<col width="107px" />
									<col width="672px" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><span>用户名</span></th>
										<td>Honggildong</td>
									</tr> 
									<tr>
										<th scope="row"><span>姓名</span></th>
										<td>GILDONG HONG</td>
									</tr>
									<tr>
										<th scope="row"><span>居住地</span></th>
										<td class="local">
											<select id="local">
												<option>서울</option>
											</select>
											<select id="local02">
												<option>동남아</option>
											</select>
										</td>
									</tr>
									<tr>
										<th scope="row"><span>生年月日</span></th>
										<td class="birthday-box">
											<p class="join-birthday">
												<select id="join-birthday-year" title="태어난 연도를 선택해주세요">
													<option>선택</option>
												</select><span>年</span>
											</p>
											<p>
												<select id="join-birthday-month" title="태어난 월을 선택해주세요">
													<option>12</option>
													<option>11</option>
													<option>10</option>
												</select><span>月</span>
												<select id="join-birthday-date" title="태어난 날짜를 선택해주세요">
													<option>31</option>
												</select><span>日</span>
											</p>
											<span>* 若与护照上的信息不一致，则无法取货，<br />&nbsp; 请正确填写与护照上的生年月日一致的信息。</span>
										</td>
									</tr>
									<tr>
										<th scope="row"><span>性别</span></th>
										<td class="gender">
											<input type="radio" id="join-men" name="join-gender" /><label for="join-men">男</label>
											<input type="radio" id="join-woman" name="join-gender" /><label for="join-woman">女</label>
										</td>
									</tr>  
									<tr>
										<th scope="row"><span>E-mail</span></th>
										<td class="join-email"> 
											<div>
												<input type="text" title="이메일 주소를 입력하세요." />
												<a href="#"><img src="/images/shop/cn/mypage/btn_mail_change.gif" alt="变更E-mail" /></a>
												<a href="#"><img src="/images/shop/cn/mypage/btn_code_w.gif" alt="发送认证码" /></a>
												<p class="mail-check">
													<input type="checkbox" id="mail-sms" name="mail-sms" /><label for="mail-sms">同意接收有关活动介绍以及商品信息的E-mail。</label>
												</p>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row"><span>认证码</span></th>
										<td class="join-email"> 
											<div>
												<input type="text" title="인증 코드 번호를 입력하세요." /><a href="#"><img src="/images/shop/cn/mypage/btn_comfirm02.gif" alt="确认认证码" /></a>
											</div>
										</td>
									</tr>  
								</tbody>
							</table>
						</div><!-- end order-board -->
						
						<p class="small-tit"><img src="/images/shop/cn/mypage/title_memberinfo_s02.gif" alt="附加信息" /></p>
							<div class="order-board">
							<table summary="회원가입에 필요한 부가 정보를 입력하는 표"  class="add-info">
								<caption>회원가입 부가 정보 입력</caption>
								<colgroup>
									<col width="107px" />
									<col width="260px" />
									<col width="107px" />
									<col width="300px" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><span>电话</span></th>
										<td colspan="3">
											<input type="text" title="전화번호를 입력하세요." />
										</td>
									</tr>
									<tr>
										<th scope="row"><span>手机</span></th>
										<td colspan="3">
											<input type="text" title="전화번호를 입력하세요." />
											<span><input type="checkbox" />同意接收有关活动介绍以及商品信息的SMS。</span>
										</td>
									</tr> 
									<tr>
										<th scope="row"><span>地址</span></th>
										<td colspan="3" class="address">
											<p><input type="text" title="집 주소를 입력하세요" class="address-size-f" /></p>
										</td>
									</tr>
									<tr class="form-wedding">
										<th scope="row"><span>婚否</span></th>
										<td class="gender">
											<input type="radio" id="wedding-o" name="wedding" /><label for="wedding-o">未婚</label>
											<input type="radio" id="wedding-x" name="wedding" /><label for="wedding-x">已婚</label>
										</td>
										<th scope="row" class="bor-left"><span>结婚纪念日</span></th>
										<td class="birthday-box">
											<p class="join-birthday">
												<select id="wedding-year" title="결혼 연도를 선택해주세요">
													<option>선택</option>
												</select><span>年</span>
											</p>
											<p>
												<select id="wedding-month" title="결혼 월을 선택해주세요">
													<option>12</option>
													<option>11</option>
													<option>10</option>
												</select><span>月</span>
												<select id="wedding-date" title="결혼 날짜를 선택해주세요">
													<option>31</option>
												</select><span>日</span>
											</p>
										</td>									
									</tr>
									<tr>
										<th scope="row"><span>推荐人</span></th>
										<td colspan="3">ckddyd</td>
									</tr> 
									<tr>
										<th scope="row" class="category-tit"><span>喜欢的分类</span></th>
										<td colspan="3" class="category-box"> 
											<div class="category first-child">
												<p>请输入喜欢的分类。喜欢的分类最多可选择5个。</p> 
											</div>
											<div class="category"> 
												<div class="tit-left">
													<span class="tit">化妆品</span>
												</div>
												<div class="content-right">
													<p><input type="checkbox" id="cate0100" /><label for="skin">基础护理</label></p>
													<p><input type="checkbox" id="cate0100" /><label for="makeup">彩妆</label></p>
													<p><input type="checkbox" id="cate0200"/><label for="sun">洁面/防晒</label></p>
													<p><input type="checkbox" id="cate0200" /><label for="my-body">身体护理</label></p>
													<p><input type="checkbox" id="cate0300"/><label for="hair">头部护理</label></p>
													<p><input type="checkbox" id="cate0300"/><label for="bu-men">男士</label></p>
													<p><input type="checkbox" id="cate0100" /><label for="hair">女士</label></p>
												</div>
											</div>
											<div class="category">
												<div class="tit-left">
													<span class="tit">香水</span>
												</div>
												<div class="content-right">   
													<p><input type="checkbox" id="cate0100" /><label for="skin">男士</label></p>
													<p><input type="checkbox" id="cate0100" /><label for="makeup">女士</label></p>
													<p><input type="checkbox" id="cate0200"/><label for="sun">套装</label></p>
													<p><input type="checkbox" id="cate0200" /><label for="my-body">芳香剂</label></p> 
												</div>
											</div>
											<div class="category">
												<div class="tit-left">
													<span class="tit">包/钱包</span>
												</div>
												<div class="content-right">
													<p><input type="checkbox" id="cate0100" /><label for="skin">包</label></p>
													<p><input type="checkbox" id="cate0100" /><label for="makeup">钱包</label></p>
												</div>
											</div>
											<div class="category">
												<div class="tit-left">
													<span class="tit">手表/饰品</span>
												</div>
												<div class="content-right">
													<p><input type="checkbox" id="cate0100" /><label for="skin">手表</label></p>
													<p><input type="checkbox" id="cate0100" /><label for="makeup">首饰</label></p>
													<p><input type="checkbox" id="cate0200"/><label for="sun">饰品</label></p>
												</div>
											</div>
											<div class="category">
												<div class="tit-left">
													<span class="tit">时尚/配饰</span>
												</div>
												<div class="content-right">
													<p><input type="checkbox" id="cate0100" /><label for="skin">太阳镜</label></p>
													<p><input type="checkbox" id="cate0100" /><label for="makeup">腰带</label></p>
													<p><input type="checkbox" id="cate0200"/><label for="sun">鞋</label></p>
													<p><input type="checkbox" id="cate0200" /><label for="my-body">领带/丝巾</label></p>
													<p><input type="checkbox" id="cate0300"/><label for="hair">服饰</label></p>
													<p><input type="checkbox" id="cate0200" /><label for="my-body">笔/打火机</label></p>
													<p><input type="checkbox" id="cate0300"/><label for="hair">时尚配饰</label></p>
												</div>
											</div>
											<div class="category">
												<div class="tit-left">
													<span class="tit">电子产品</span>
												</div>
												<div class="content-right">
													<p><input type="checkbox" id="cate0100" /><label for="skin" class="long-txt">数码相机/便携式摄像机</label></p>
													<p><input type="checkbox" id="cate0100" /><label for="makeup" class="long-txt">电子词典/MP3 </label></p>
													<p><input type="checkbox" id="cate0200"/><label for="sun" class="long-txt">电动牙刷/剃须刀</label></p>
													<p><input type="checkbox" id="cate0200" /><label for="my-body">其它</label></p> 
												</div>
											</div>
											<div class="category">
												<div class="tit-left">
													<span class="tit">食品</span>
												</div>
												<div class="content-right">
													<p><input type="checkbox" id="cate0100" /><label for="skin">红参/人参</label></p>
													<p><input type="checkbox" id="cate0100" /><label for="makeup">保健食品</label></p>
													<p><input type="checkbox" id="cate0200"/><label for="sun">零食</label></p>
												</div>
											</div>
											<div class="category">
												<div class="tit-left">
													<span class="tit">国内品牌</span>
												</div>
												<div class="content-right">
													<p><input type="checkbox" id="cate0100" /><label for="skin">化妆品</label></p>
													<p><input type="checkbox" id="cate0100" /><label for="makeup">包/钱包</label></p>
													<p><input type="checkbox" id="cate0200"/><label for="sun">时尚配饰</label></p>
													<p><input type="checkbox" id="cate0200" /><label for="my-body">电子产品</label></p>
													<p><input type="checkbox" id="cate0300"/><label for="hair">保健食品</label></p>
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div><!-- end order-board -->
						
						<p class="small-tit"><img src="/images/shop/cn/mypage/title_memberinfo_s03.gif" alt="护照信息" />
						<span class="pass-info"><input type="checkbox" id="pass-info" /> <label for="pass-info">여권 정보 입력</label></span>
						</p>
							<div class="order-board">
							<table summary="여권 정보 표">
								<caption>여권 정보 입력</caption>
								<colgroup>
									<col width="107px" />
									<col width="672px" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><span>国籍</span></th>
										<td class="nationality">
											<select id="passport_nationality">
												<option>한국</option>
											</select>
										</td>
									</tr> 
									<tr>
										<th scope="row"><span>英文姓名</span></th>
										<td class="english-name02"><input type="text" /> <input type="text" />
											<span class="infotxt">* 输入的姓名应与护照上的姓名一致，而且不应留有空白<br />
											填写名字(First name)时，请不要空格。 <br />
											例： First name为Gil-Dong时，输入为GILDONG。</span>
										</td>
									</tr>
									<tr>
										<th scope="row"><span>护照号码</span></th>
										<td>
											<input type="text" title="여권번호를 입력하세요" /><a href="#"><img src="/images/shop/cn/member/btn_overlab.gif" alt="重复确认" /></a>
											<span class="tip">填写护照号码时，请不要空格。</span>
										</td>
									</tr>
									<tr>
										<th scope="row"><span>护照有效期</span></th>
										<td class="complete-box">
											<p class="complete-year">
												<select id="complete-year" title="여권만료 연도를 선택해주세요">
													<option>선택</option>
												</select><span>年</span>
											</p>
											<p>
												<select id="complete-month" title="여권만료 월을 선택해주세요">
													<option>12</option>
													<option>11</option>
													<option>10</option>
												</select><span>月</span>
												<select id="complete-date" title="여권만료 날짜를 선택해주세요">
													<option>31</option>
												</select><span>日</span>
											</p>
										</td>
									</tr>
								</tbody>
							</table>
						</div><!-- end order-board -->		
						<p class="small-tit off-title"><img src="/images/shop/cn/mypage/title_memberinfo_s04.gif" alt="实体店统一会员" /></p>
						<div class="add-table-box"> 
							
							<div class="order-board">
								<table summary="해당사항이 있는 고객님의 부가 정보 표" class="add-box">
									<caption>해당사항이 있는 고객님의 부가 정보</caption>
									<colgroup>
										<col width="107px" />
										<col width="672px" />
									</colgroup>
									<tbody>
										<tr>
											<th scope="row"><span>实体店VIP认证</span></th>
											<td colspan="3">已完成实体店VIP会员认证 (VIP No. : 0000-0000-0000-0000)</td>
										</tr>
										<tr>
											<th scope="row"><span>职员认证</span></th>
											<td colspan="3">认证完毕</td>
										</tr>
									</tbody>
								</table>
							</div><!-- end order-board -->	
							<div class="order-board">
								<table summary="해당사항이 있는 고객님만 부가 정보를 입력하는 표">
									<caption>해당사항이 있는 고객의 부가 정보 입력</caption>
									<colgroup>
										<col width="107px" />
										<col width="672px" />
									</colgroup>
									<tbody>
										<tr>
											<th scope="row"><span>实体店VIP认证</span></th>
											<td colspan="3" class="offline-vip">
												<label for="offline-vip" class="offline-vip">VIP NO.</label><input type="text" id="offline-vip" name="offline-vip" />
												<a href="#">
													<img src="/images/shop/cn/mypage/btn_certification.gif" alt="认证" />
												</a> 
												<span class="txt">实体店 VIP通过输入会员卡进行认证，可在网上享受同样的优惠。</span>
											</td>
										</tr>
										<tr>
											<th scope="row"><span>职员认证</span></th>
											<td class="offline-vip">
												<label for="employee-number" class="offline-vip">职员编号</label><input type="text" id="employee-number" name="employee-number" />
												<a href="#">
													<img src="/images/shop/cn/mypage/btn_certification.gif" alt="认证" />
												</a>
											</td>				
										</tr>
									</tbody>
								</table>
							</div>
	 						<div class="btn-set">
								<a href="#"><img src="/images/shop/cn/mypage/btn_cancel_la.gif" alt="取消" /></a>
								<input type="image" src="/images/shop/cn/mypage/btn_info_modify.gif" alt="修改" />
							</div>
						</div><!-- end add-table-box -->
					</div>
					<!-- end memberinfo-container --> 
				
				
				
				</div><!-- //contents -->  
			</div><!-- //mypage -->	 
			
		</div><!-- end body -->		
		<%@include file="/publish/frontoffice/include/quickbar.jsp"%>
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
</div><!-- end wrapper -->
</body>
</html>