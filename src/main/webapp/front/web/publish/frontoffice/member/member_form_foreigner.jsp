<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE LAYOUT</title>
<link href="/css/base.css" rel="stylesheet" type="text/css" />
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/order.css" rel="stylesheet" type="text/css" />
<link href="/css/member.css" rel="stylesheet" type="text/css" />
<!--[if IE 7]><link rel="stylesheet" type="text/css" href="/css/ie7.css" ><![endif]-->
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.rotate.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.mousewheel.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.selectbox-0.2.1.js"></script>
<script type="text/javascript" src="/js/jquery/common.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.jscrollpane.min.js"></script>
<script type="text/javascript" src="/js/jquery/mwheelIntent.js"></script>
<script type="text/javascript">
jQuery(function($){
	
			/*** select box ***/

			$("#local").selectbox();
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

			$("#expire-year").selectbox();
			$("#expire-month").selectbox();
			$("#expire-date").selectbox();
			
			
			
			/*
			$("table td").css("z-index" ,"1");
			$("table td div").css("z-index" ,"1");
			$("table td div").click(function(){
				$(this).css("z-index" ,"10");
				$(this).find("ul").css("z-index" ,"15");		
			});
			$("table td div ul").focus(function(){
				$(this).css("z-index" ,"15");
				$(this).find("li").css("z-index" ,"20");	
			});
			$("table td div").focusout(function(){
				$(this).css("z-index" ,"1");
				$(this).child().css("z-index" ,"1");
			});
			*/

			
			
			$("table").css("z-index" ,"1");
			$("table td").css("z-index" ,"1");
			$("table td div").click(function(){
				$(this).parent().parent().parent().parent().parent().css("z-index" ,"2");	
				$(this).css("z-index" ,"10");			
			});
			$("table td div").focusout(function(){
				$(this).css("z-index" ,"1");			
			})
			
 			$(".order-board").eq(0).css("z-index" ,"6");
 			$("p.form-tit").eq(0).css("z-index" ,"6");
 			$(".order-board").eq(1).css("z-index" ,"5");
 			$("p.form-tit").eq(1).css("z-index" ,"5");
 			$(".order-board").eq(2).css("z-index" ,"3");
 			$("p.form-tit").eq(2).css("z-index" ,"3");
			
});
</script>
</head>
<body>
<div id="wrapper">
	<div id="wrap">
		<%@include file="/publish/frontoffice/include/head.jsp"%>
		<div id="body">
			<div id="contents">
				<div class="page-sublocation join-location">
					<a href="#">主页</a><span>&gt;</span><a href="#">会员</a><span>&gt;</span><a href="#">注册会员</a><span>&gt;</span><strong>填写会员注册申请书</strong>
				</div>
				<div class="join-welcomebox">
					<div class="stepbox">
						<p class="step01"><img src="/images/shop/cn/member/step01.gif" alt="step01 选择韩国人/外国人" /></p>
						<p class="step02"><img src="/images/shop/cn/member/step02.gif" alt="step02 同意条款及确认注册与否" /></p>
						<p class="step03"><img src="/images/shop/cn/member/step03_on.gif" alt="step03 填写会员注册申请书" /></p>
						<p class="step04 last-child"><img src="/images/shop/cn/member/step04.gif" alt="step04 注册完毕" /></p>
					</div>
					<!-- 0828 아래 alt값 수정 -->
					<p class="form-tit"><img src="/images/shop/cn/member/form_tit01.gif" alt="网上会员必需信息" /><span><img src="/images/shop/cn/member/form_tit01_1.gif" alt="注册会员时必须输入的信息。以下项目为必填项。" /></span></p>
					<div class="order-board">
						<table summary="회원가입에 필요한 필수 정보를 입력하는 표">
							<caption>회원가입 필수 정보 입력</caption>
							<colgroup>
								<col width="179px" />
								<col width="754px" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><label for="join-user-id"><img src="/images/shop/cn/member/f_info1_tit01.gif" alt="会员用户名" /></label></th>
									<td>
										<input type="text" id="join-user-id" name="join-user-id" class="mar-right" />
										<a href="#"><img src="/images/shop/cn/member/btn_id_overlab.gif" alt="重复确认用户名" /></a><!-- 사용 불가능 아이디 -->
										<a href="#"><img src="/images/shop/cn/member/btn_id_ok.gif" alt="更改用户名" /></a> <!-- 0828 사용가능 아이디 -->
										<span> * 由英文 + 数字构成(5~10字) </span>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="join-user-pw"><img src="/images/shop/cn/member/f_info1_tit02.gif" alt="密码" /></label></th>
									<td>
										<input type="password" id="join-user-pw" name="join-user-pw" /><span> * 由英文 + 数字构成(5~15字)</span>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="join-pw-ok"><img src="/images/shop/cn/member/f_info1_tit03.gif" alt="确认密码" /></label></th>
									<td>
										<!-- 사용가능 class="font-concur" 사용 불가능 class="font-discord" -->
										<input type="password" id="join-pw-ok" name="join-pw-ok" /><span class="font-concur">* 密码一致</span><span class="font-discord">* 密码不一致</span>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="join-name-k"><img src="/images/shop/cn/member/f_info1_tit04.gif" alt="姓名" /></label></th>
									<td>
										<input type="text" id="join-name-k" title="Last Name" value="Last Name" class="mar-right" /><input type="text" title="First Name" value="First Name" />
										<span class="font-discord">특수문자는 사용이 불가능 합니다.</span>
									</td>
								</tr>
								<tr>
									<th scope="row"><img src="/images/shop/cn/member/f_info1_tit05.gif" alt="居住地" /></th>
									<td class="local">
										<select id="local">
											<option>서울</option>
											<option>서울</option>
											<option>서울</option>
											<option>서울</option>
											<option>서울</option>
											<option>서울</option>
											<option>서울</option>
											<option>서울</option>
											<option>서울</option>
										</select>
									</td>
								</tr>
								<tr>
									<th scope="row"><img src="/images/shop/cn/member/f_info1_tit06.gif" alt="生年月日" /></th>
									<td class="birthday-box">
										<p class="join-birthday">
											<select id="join-birthday-year" title="태어난 연도를 선택해주세요">
												<option>2013</option>
												<option>2013</option>
												<option>2013</option>
												<option>2013</option>
												<option>2013</option>
											</select><span>年</span>
										</p>
										<p>
											<select id="join-birthday-month" title="태어난 월을 선택해주세요">
												<option>12</option>
												<option>11</option>
												<option>10</option>
												<option>9</option>
												<option>8</option>
												<option>7</option>
												<option>6</option>
												<option>5</option>
												<option>4</option>
												<option>3</option>
												<option>2</option>
											</select><span>月</span>
											<select id="join-birthday-date" title="태어난 날짜를 선택해주세요">
												<option>31</option>
												<option>30</option>
												<option>29</option>
												<option>28</option>
												<option>27</option>
												<option>26</option>
												<option>25</option>
												<option>24</option>
												<option>23</option>
											</select><span>日</span>
										</p>
										<span>* 必须填写与护照一致的信息。 (</span><span class="font-discord">信息不一致，将无法领取商品</span><span>)</span>
									</td>
								</tr>
								<tr>
									<th scope="row"><img src="/images/shop/cn/member/f_info1_tit07.gif" alt="性别" /></th>
									<td>
										<input type="radio" id="join-men" name="join-gender" /><label for="join-men">男</label>
										<input type="radio" id="join-woman" name="join-gender" /><label for="join-woman">女</label>
									</td>
								</tr>
								<tr>
									<th scope="row"><img src="/images/shop/cn/member/f_info1_tit08.gif" alt="E-mail" /></th>
									<td class="join-email">
										<div>
											<input type="text" title="이메일 주소를 입력하세요." />
											<p class="txt"><input type="checkbox" id="mail-sms" name="mail-sms" /><label for="mail-sms">接收活动介绍以及商品信息有关的E-mail。</label></p>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row"><img src="/images/shop/cn/member/f_info1_tit09.gif" alt="认证码" /></th>
									<td class="join-email">
										<div>
											<input type="text" title="인증코드를 입력하세요." /><a href="#"><img src="/images/shop/cn/member/btn_code_again.gif" alt="인증코드 재전송" /></a>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div><!-- end order-board -->
					<p class="form-tit"><img src="/images/shop/cn/member/form_tit02.gif" alt="网上会员附加信息" /><span><img src="/images/shop/cn/member/form_tit02_1.gif" alt="以下信息为选填项。" /></span></p>
					<div class="order-board">
						<table summary="회원가입에 필요한 부가 정보를 입력하는 표" class="add-info">
							<caption>회원가입 부가 정보 입력</caption>
							<colgroup>
								<col width="179px" />
								<col width="240px" />
								<col width="178px" />
								<col width="264px" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><img src="/images/shop/cn/member/f_info2_tit01.gif" alt="电话" /></th>
									<td colspan="3">
										<input type="text" title="집전화 번호를 입력하세요." />
									</td>
								</tr>								
								<tr>
									<th scope="row"><img src="/images/shop/cn/member/f_info2_tit02.gif" alt="手机" /></th>
									<td colspan="3">
										<div>
											<input type="text" title="휴대폰 번호를 입력하세요." />
											<p class="txt"><input type="checkbox" id="phone" /><label for="phone">接收活动信息以及商品信息有关的短信。</label></p>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row"><img src="/images/shop/cn/member/f_info2_tit04.gif" alt="输入地址" /></th>
									<td colspan="3" class="address">
										<p class="zip-code-no"><input type="text" title="우편 번호를 입력하세요" /></p>
									</td>
								</tr>
								<tr>
									<th scope="row"><img src="/images/shop/cn/member/f_info2_tit05.gif" alt="婚否" /></th>
									<td class="wedding-ox">
										<input type="radio" id="wedding-o" name="wedding" /><label for="wedding-o">未婚</label>
										<input type="radio" id="wedding-x" name="wedding" /><label for="wedding-x">已婚</label>
									</td>
									<th scope="row" class="bor-left"><img src="/images/shop/cn/member/f_info2_tit06.gif" alt="推荐用户名" /></th>
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
												<option>9</option>
												<option>8</option>
												<option>7</option>
												<option>6</option>
												<option>5</option>
												<option>4</option>
												<option>3</option>
												<option>2</option>
												<option>1</option>
											</select><span>月</span>
											<select id="wedding-date" title="결혼 날짜를 선택해주세요">
												<option>31</option>
												<option>30</option>
												<option>29</option>
												<option>29</option>
												<option>29</option>
												<option>29</option>
												<option>29</option>
												<option>29</option>
												<option>29</option>
												<option>29</option>
												<option>29</option>
												<option>29</option>
												<option>29</option>
											</select><span>日</span>
										</p>
									</td>									
								</tr>
								<tr>
									<th scope="row"><img src="/images/shop/cn/member/f_info2_tit06.gif" alt="结婚纪念日" /></th>
									<td colspan="3">
										<input type="text" title="추천인 아이디를 입력하세요" class="mar-right" />
										<a href="#"><img src="/images/shop/cn/member/btn_id_con.gif" alt="搜索用户名" /></a>
										<span>* 输入推荐用户名，可在促销时享受优惠。</span>
									</td>
								</tr>
								<tr>
									<th scope="row"><img src="/images/shop/cn/member/f_info2_tit07.gif" alt="喜欢的品牌(最多可选5个)" /></th>
									<td colspan="3" class="category-box">
										<div class="category first-child">
											<div class="tit-left">
												<span class="tit">化妆品</span>
											</div>
											<div class="content-right">
												<span><input type="checkbox" id="cate0100" /><label for="skin">基础护理</label></span>
												<span><input type="checkbox" id="cate0100" /><label for="makeup">彩妆</label></span>
												<span><input type="checkbox" id="cate0200"/><label for="sun">洁面/ 防晒</label></span>
												<span><input type="checkbox" id="cate0100" /><label for="skin">基础护理</label></span>
												<span><input type="checkbox" id="cate0100" /><label for="makeup">彩妆</label></span>
												<span><input type="checkbox" id="cate0200"/><label for="sun">洁面/ 防晒</label></span>
												<span><input type="checkbox" id="cate0100" /><label for="skin">基础护理</label></span>
												<span><input type="checkbox" id="cate0100" /><label for="makeup">彩妆</label></span>
												<span><input type="checkbox" id="cate0200"/><label for="sun">洁面/ 防晒</label></span>
											</div>
										</div>
										<div class="category">
											<div class="tit-left">
												<span class="tit">化妆品</span>
											</div>
											<div class="content-right">
												<input type="checkbox" id="cate0100" /><label for="skin">스킨케어</label>
												<input type="checkbox" id="cate0100" /><label for="makeup">메이크업</label>
												<input type="checkbox" id="cate0200"/><label for="sun">클렌징/선케어</label>
												<input type="checkbox" id="cate0200" /><label for="my-body">바디용품</label>
												<input type="checkbox" id="cate0300"/><label for="hair">헤어케어</label>
												<input type="checkbox" id="cate0300"/><label for="bu-men">남성용</label>
												<input type="checkbox" id="cate0100" /><label for="skin">스킨케어</label>
												<input type="checkbox" id="cate0100" /><label for="makeup">메이크업</label>
												<input type="checkbox" id="cate0200"/><label for="sun">클렌징/선케어</label>
												<input type="checkbox" id="cate0200" /><label for="my-body">바디용품</label>
												<input type="checkbox" id="cate0300"/><label for="hair">헤어케어</label>
												<input type="checkbox" id="cate0300"/><label for="bu-men">남성용</label>
												<input type="checkbox" id="cate0100" /><label for="skin">스킨케어</label>
												<input type="checkbox" id="cate0100" /><label for="makeup">메이크업</label>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div><!-- end order-board -->
					<p class="form-tit"><img src="/images/shop/cn/member/form_tit03.gif" alt="输入护照信息" /><span><img src="/images/shop/cn/member/form_tit03_1.gif" alt="以下信息虽为选填项，但如果输入信息有误或未输入，则无法订购商品及领取商品。" /></span></p>
					<p class="form-check"><a href="#"><img src="/images/shop/cn/member/btn_sample.gif" alt="查看输入样本" /></a></p>
					<div class="order-board">
						<table summary="회원가입에 필요한 여권 정보를 입력하는 표">
							<caption>회원가입 여권 정보 입력</caption>
							<colgroup>
								<col width="179px" />
								<col width="754px" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><img src="/images/shop/cn/member/f_info3_tit01.gif" alt="国籍" /></th>
									<td colspan="3" class="passport_nationality">
										<select id="passport_nationality">
											<option>한국</option>
										</select>
									</td>
								</tr>
								<tr>
									<th scope="row"><img src="/images/shop/cn/member/f_info3_tit02.gif" alt="英文姓名" /></th>
									<td colspan="3" class="name-e">
										<input type="text" id="passt-lastname" name="passt-lastname" /><label for="passt-lastname">(姓)</label>
										<input type="text" id="passt-firstname" name="passt-firstname" /><label for="passt-firstname">(名)</label>
										<p class="tipping-con">
											<span class="tit-tipping">必须输入与护照相同的姓名，且输入时不要空格。</span>
											<span class="tit-tipping">姓(Last name) 例&gt;HONG, 名(First name) 例&gt;GILDONG</span>
											<span class="tit-tipping">输入名字(First name)请不要空格。</span>
										</p>
									</td>
								</tr>
								<tr>
									<th scope="row"><img src="/images/shop/cn/member/f_info3_tit03.gif" alt="护照号码" /></th>
									<td>
										<input type="text" title="여권번호를 입력하여주세요" />
										<a href="#"><img type="image" src="/images/shop/cn/member/btn_overlab.gif" alt="重复确认" /></a><!-- 중복확인 -->
										<a href="#"><img type="image" src="/images/shop/cn/member/btn_change.gif" alt="更改" /></a><!-- 0828 변경 -->
										<span class="tit-tipping">请用大写字母填写。若护照号码输入有误，则无法领取商品。</span>
									</td>				
								</tr>
								<tr>
									<th scope="row"><img src="/images/shop/cn/member/f_info3_tit04.gif" alt="有效期" /></th>
									<td class="complete">
										<div>
											<p class="join-birthday">
												<select id="expire-year" title="태어난 연도를 선택해주세요">
													<option>선택</option>
												</select><span>년</span>
											</p>
											<p>
												<select id="expire-month" title="태어난 월을 선택해주세요">
													<option>12</option>
													<option>11</option>
													<option>10</option>
													<option>9</option>
													<option>8</option>
													<option>7</option>
													<option>6</option>
													<option>5</option>
													<option>4</option>
													<option>3</option>
													<option>2</option>
													<option>1</option>
												</select><span>월</span>
												<select id="expire-date" title="태어난 날짜를 선택해주세요">
													<option>31</option>
												</select><span>일</span>
											</p>
											<p class="passport-tip"><span>* 여권상의 생년월일과 동일하게 입력하시기 바랍니다. (</span><span class="font-discord">불일치 시 상품인도 불가</span><span>)</span></p>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div><!-- end order-board -->
					<p class="form-tit"><img src="/images/shop/cn/member/form_tit04.gif" alt="附加选填信息" /><span><img src="/images/shop/cn/member/form_tit04_1.gif" alt="以下信息为附加选填项，只限于相应顾客填写。" /></span></p>
					<div class="order-board">
						<table summary="해당사항이 있는 고객님만 회원가입에 필요한 부가 정보를 입력하는 표">
							<caption>해당사항이 있는 고객의 회원가입 부가 정보 입력</caption>
							<colgroup>
								<col width="179px" />
								<col width="754px" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><img src="/images/shop/cn/member/f_info4_tit01.gif" alt="同时注册线下会员" /></th>
									<td colspan="3">
										<input type="checkbox" id="same" name="same" /><label for="same" class="mar-right">同时注册</label>
										<a href="#">
											<img src="/images/shop/cn/member/btn_certification.gif" alt="오프라인 회원 혜택" />
										</a>
										<span>* 访问店铺领取会员卡后立即生效。</span>
									</td>
								</tr>
								<tr>
									<th scope="row"><img src="/images/shop/cn/member/f_info4_tit02.gif" alt="实体店VIP" /></th>
									<td colspan="3" class="offline-vip">
										<label for="offline-vip" class="offline-vip">VIP NO.</label><input type="text" id="offline-vip" name="offline-vip" />
										<a href="#">
											<img src="/images/shop/cn/member/btn_certification.gif" alt="인증하기" />
										</a>
										<span class="tit-tipping">已有实体店会员资格的顾客只要输入卡号，便可认证VIP。</span>
									</td>
								</tr>
								<tr>
									<th scope="row"><img src="/images/shop/cn/member/f_info4_tit03.gif" alt="职员认证" /></th>
									<td class="offline-vip">
										<label for="member-no" class="offline-vip">认证完毕</label><input type="text" id="member-no" title="사원번호를 입력하여주세요" />
										<a href="#">
											<img src="/images/shop/cn/member/btn_overlab.gif" alt="중복확인" />
										</a>
										<p class="tipping-con">
											<span class="tit-tipping">대문자로 입력하여 주십시오. 여권번호를 잘못 입력하실 경우 주문하신 상품을 인도 받으실 수 없습니다.</span>
										</p>
									</td>				
								</tr>
							</tbody>
						</table>
					</div><!-- end order-board -->
					<div class="btn-set">
						<input type="image" src="/images/shop/cn/member/btn_join01.gif" alt="申请注册" />
						<a href="#"><img src="/images/shop/cn/member/btn_join02.gif" alt="取消注册会员" /></a>
					</div>
				</div><!-- end join-welcomebox -->
			</div><!-- end contents -->
	
		</div><!-- end body -->		
		<%@include file="/publish/frontoffice/include/quickbar.jsp"%>
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
</div><!-- end wrapper -->
</body>
</html>