<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE</title>  
<link href="/css/mypage_popup.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.mousewheel.js"></script>
<script type="text/javascript" src="/js/jquery/mwheelIntent.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.jscrollpane.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.selectbox-0.2.1.js"></script> 
<script type="text/javascript">
jQuery(function($){
	
	/*** select box ***/ 
	$("#join-cellphone").selectbox();

});
</script>
</head>
<body>
<div id="wrap">
	<div id="head">
		<h1><img src="/images/shop/cn/mypage/popup/h1_gift.gif" alt="申请礼品" /></h1>
	</div><!-- end head -->
	<div id="body">
		<div class="contents">
			<div class="prbox_scroll">
			
				<div class="giftstore-conbox"> 				 
					<p class="stitle"><img src="/images/shop/cn/mypage/popup/stitle_gift01.gif" alt="申请优惠" /></p>
					<div class="chbox">
						<ul>
							<li><img src="/images/shop/cn/mypage/popup/img_gift01.gif" alt="적립금" />
								<input type="radio" id="wedding-o" name="wedding" /><label for="wedding-o">新世界网上免税店积分</label>
							</li>
							<li><img src="/images/shop/cn/mypage/popup/img_gift02.gif" alt="쿠폰" />
								<input type="radio" id="wedding-x" name="wedding" /><label for="wedding-x">新世界商品券手机交换券</label>
							</li>
						</ul> 
					</div>	
											
					<div class="layer-money">
						<div class="save-present03">
							<table summary="사은품 혜택정보">
								<caption>사은품 혜택정보</caption>
								<colgroup>
									<col width="30%" />
									<col width="35%" /> 
									<col width="35%" />
								</colgroup>
								<thead>
									<tr>
										<th>购买金额</th>
										<th>积分</th>
										<th>商品券</th> 
									</tr>
								</thead>
								<tbody> 
								
									<!-- 1024추가 --> 
									<tr> 
										<td class="useinfo"><span>$100以上</span></td>
										<td colspan="2">星巴克兑换券1张</td>
									</tr>
									<tr> 
										<td class="useinfo"><span>$200以上</span></td>
										<td colspan="2">电影预售票1张</td>
									</tr> 
									<!-- 1024추가 -->
									
									
									<tr> 
										<td class="useinfo"><span>$300 以上</span></td>
										<td>18,000韩元</td>
										<td>15,000韩元</td>
									</tr>
									<tr> 
										<td class="useinfo"><span>$500 以上</span></td>
										<td>28,000韩元</td>
										<td>25,000韩元</td>
									</tr> 
									<tr class="selected"> 
										<td class="useinfo"><span>$1,000 以上</span></td>
										<td>50,000韩元</td>
										<td>50,000韩元</td>
									</tr> 
									<tr> 
										<td class="useinfo"><span>$1,500 以上</span></td>
										<td>75,000韩元</td>
										<td>75,000韩元</td>
									</tr> 
									<tr> 
										<td class="useinfo"><span>$2,000 以上</span></td>
										<td>100,000韩元</td>
										<td>100,000韩元</td>
									</tr> 
									<tr> 
										<td class="useinfo"><span>$2,500 以上</span></td>
										<td>150,000韩元</td>
										<td>150,000韩元</td>
									</tr> 
									<tr> 
										<td class="useinfo"><span>$3,000 以上</span></td>
										<td>300,000韩元</td>
										<td>300,000韩元</td>
									</tr> 
								</tbody>
							</table>
						</div>
					</div>
					
					<p class="stitle"><img src="/images/shop/cn/mypage/popup/stitle_gift02.gif" alt="个人信息使用同意指南" /></p>
					<div class="giftinfo-box">
						<div class="tipping-box">  
							<ul>
								<li>个人信息的使用目的: 为运营活动而进行联系或发送赠品</li>		
								<li>保存及使用期间: 活动结束以及赠品发送以后最多6个月</li>								 							
								<li>所收集的项目: 姓名 / 手机号码</li>	 
							</ul>  
						</div>
						<input type="checkbox" id="ch-info" name="temporary" /><label for="ch-info">同意</label> 
						
						<div class="cellphone">
							<p class="title">※接收交换券的手机号码</p>
							<select id="join-cellphone" title="휴대전화 앞자리를 선택해주세요.">
								<option>010</option>
							</select><span class="tel">-</span>
							<input type="text" title="휴대전화 가운데 번호를 입력하세요." /><span class="tel">-</span><input type="text" title="휴대전화 끝 번호를 입력하세요." />
							<p class="txt">* 若不是以订购者名义办的手机号码，则不可领取商品券。</p> 
						</div>
											
						<div class="btn_wrap">
							<p class="center"><a href="#"><img src="/images/shop/cn/mypage/popup/btn_choice.gif" alt="选择" /></a></p>
						</div>	
					</div>
					
					<p class="stitle"><img src="/images/shop/cn/mypage/popup/stitle_gift03.gif" alt="新世界商品券使用处指南" /><a href="#" class="giftinfo"><img src="/images/shop/cn/mypage/popup/btn_giftstore.gif" alt="查看详细" /></a></p>
					<div class="giftstore">
						<ul>
							<li class="one"><img src="//image.ssgdfs.com/images/shop/mypage/popup/img_giftstore01.gif" alt="휘닉스파크" /></li>
							<li><img src="//image.ssgdfs.com/images/shop/mypage/popup/img_giftstore02.gif" alt="신세계백화점" /></li>
							<li><img src="//image.ssgdfs.com/images/shop/mypage/popup/img_giftstore03.gif" alt="이마트" /></li>
							<li><img src="//image.ssgdfs.com/images/shop/mypage/popup/img_giftstore04.gif" alt="빕스" /></li>
							<li><img src="//image.ssgdfs.com/images/shop/mypage/popup/img_giftstore05.gif" alt="아웃백" /></li>
							<li class="one"><img src="//image.ssgdfs.com/images/shop/mypage/popup/img_giftstore06.gif" alt="영풍문고" /></li>
							<li><img src="//image.ssgdfs.com/images/shop/mypage/popup/img_giftstore07.gif" alt="베니건스" /></li>
							<li><img src="//image.ssgdfs.com/images/shop/mypage/popup/img_giftstore08.gif" alt="CGV" /></li>
							<li><img src="//image.ssgdfs.com/images/shop/mypage/popup/img_giftstore09.gif" alt="교보문고" /></li>
							<li><img src="//image.ssgdfs.com/images/shop/mypage/popup/img_giftstore10.gif" alt="스타벅스" /></li>
						</ul>
					</div>
					 
				</div>
				 
			</div>
		</div>
	</div><!-- end body -->
</div><!-- end wrap -->
</body>
</html>