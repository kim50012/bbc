<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE</title>
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/customer.css" rel="stylesheet" type="text/css" />
<!--[if IE 7]><link rel="stylesheet" type="text/css" href="/css/ie7.css"><![endif]-->
<link href="/css/jquery.ui.datepicker.css" rel="stylesheet" type="text/css" /> 
<link href="/css/jquery.ui.theme.css" rel="stylesheet" type="text/css" />
<link href="/css/selectbox.css" rel="stylesheet" type="text/css" /> 
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.rotate.js"></script>
<script type="text/javascript" src="/js/jquery/common.js"></script>
<script type="text/javascript" src="/js/jquery/common_customer.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.core.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.widget.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="/js/jquery/calendar.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.selectbox-0.2.1.js"></script> 
<script type="text/javascript">
jQuery(function($){

		$(".board-btypelist .main tr td a").click(function(){
			$(".board-btypelist .main tr.con").children().hide();  
			$(".board-btypelist .main tr.selected").attr("class" , "selected");
			$(".board-btypelist .main tr.selected").attr("class" , "");			
			$(this).parent().parent().addClass("selected");
			question = $(this).parent().parent();
			question.next().children().show();
			return false;
		}); 

});
</script>
</head>
<body>
<div id="wrapper">
	<div id="wrap">
		<%@include file="/publish/frontoffice/include/head.jsp"%>
		<div id="body">  
			<div class="customer">				 
				<div class="sidebar">
					<%@include file="/publish/frontoffice/include/sub_customer.jsp"%>						
					<%@include file="/publish/frontoffice/include/side_common.jsp"%>					
				</div> 
				<div id="contents">  				
					<div class="page-sublocation">   
						<a href="#">主页</a><span>&gt;</span><strong>客服中心</strong>
					</div>
					
					<%@include file="/publish/frontoffice/include/top_customer.jsp"%><!-- //고객센터 공통 -->
			  
					<div class="faqmain-search">
						<div class="faq-search"> 
							<p class="title"><img src="/images/shop/cn/customer/faqsearch_title.gif" alt="搜索常见问题" /></p>
							<div class="box">
								<!-- 삭제 
								<select id="faq-search" title="검색범위 선택">
									<option>전체</option>
									<option>회원</option>
									<option>주문/결제</option>
									<option>교환/반품</option>
									<option>상품</option>
									<option>상품수령</option>
									<option>적립/포인트</option>
									<option>쿠폰</option>
									<option>일반</option>
									<option>기타</option>
								</select>-->
								<input type="text" name="" id="" title="검색어 입력" /> 
							</div>
							<a href="#" class="btn"><img src="/images/shop/cn/customer/btn_faqsearch.gif" alt="搜索" /></a>
							<ul class="rec-list"> 
								<li class="one"><a href="#">会员等级介绍</a></li>
								<li><a href="#">付款方式</a></li>
								<li><a href="#">积分介绍</a></li>
								<li><a href="#">领取商品</a></li>
							</ul> 	
							<!-- 변경 
							<dl class="rec-list">
								<dt><img src="/images/shop/cn/customer/faqsearch_text.gif" alt="추천검색어" /></dt>
								<dd class="one"><a href="#">회원</a></dd>
								<dd><a href="#">배송</a></dd>
								<dd><a href="#">현금영수증</a></dd>
								<dd><a href="#">무이자할부</a></dd>
								<dd><a href="#">적립금</a></dd>
								<dd><a href="#">오류</a></dd>
							</dl> 	-->				 
						</div>
					</div>  
					 
					<h3><img src="/images/shop/cn/customer/title_faq10.gif" alt="常见问题TOP10" /><span><img src="/images/shop/cn/customer/explain_faq10.gif" alt="顾客提问最多的问题。" /></span></h3> 					
					<div class="board-btypelist">   
						<div class="main">
							<table summary="常见问题TOP10">
								<caption>常见问题TOP10</caption> 
								<colgroup>  
									<col width="100%" />  
								</colgroup> 
								<tbody>    
									<tr>  
										<td class="subject"><a href="#">출국 하기 전에 취소는 어떻게 해야 합니까?</a></td>   
									</tr>  
									<tr class="con">
										<td>
											<div class="con_box">
												<div  class="con">
													쿠폰은 로그인후 ‘쿠폰존’ 이나 해당 이벤트페이지에서 받으실 수 있습니다.<br />
													쿠폰사용은 주문서 작성시 ‘할인안내’란 하단에 위치한 ‘쿠폰 사용하기’ 버튼을 클릭하시어 해당쿠폰을 적용하시면 되며, <br />
													적립금의 경우 ‘사용하실 적립금’ 박스에 보유중인 적립금액 한도내에서 원하시는 금액을 입력하시면 최종금액에서 차감 됩니다.<br />
													사용이 불가능한 쿠폰이 있을 수 있으며, 쿠폰과 적립금은 동시 사용이 가능합니다.<br />
													할인율 또는 브랜드 특성상 쿠폰 또는 적립금의 사용이 불가능한 상품이 있을 수 있습니다.  
												</div>
												<p class="close"><a href="#"><img src="/images/shop/cn/customer/btn_close_faq.gif" alt="닫기" /></a></p>
											</div>										
										</td>
									</tr>   
									<tr>  
										<td class="subject"><a href="#">출국사항(출국일자, 장소, 시간, 편명) 및 회원정보(영문이름, 여권번호)가 변경된 경우는 어떻게 합니까?</a></td>   
									</tr> 
									<tr class="con">
										<td>
											<div class="con_box">
												<div  class="con">
													쿠폰은 로그인후 ‘쿠폰존’ 이나 해당 이벤트페이지에서 받으실 수 있습니다.<br />
													쿠폰사용은 주문서 작성시 ‘할인안내’란 하단에 위치한 ‘쿠폰 사용하기’ 버튼을 클릭하시어 해당쿠폰을 적용하시면 되며, <br />
													적립금의 경우 ‘사용하실 적립금’ 박스에 보유중인 적립금액 한도내에서 원하시는 금액을 입력하시면 최종금액에서 차감 됩니다.<br />
													사용이 불가능한 쿠폰이 있을 수 있으며, 쿠폰과 적립금은 동시 사용이 가능합니다.<br />
													할인율 또는 브랜드 특성상 쿠폰 또는 적립금의 사용이 불가능한 상품이 있을 수 있습니다.  
												</div>
												<p class="close"><a href="#"><img src="/images/shop/cn/customer/btn_close_faq.gif" alt="닫기" /></a></p>
											</div>										
										</td>
									</tr>   
									<tr>  
										<td class="subject"><a href="#">주문 후 교환권을 출력하지 못하는 경우 어떻게 합니까?</a></td>   
									</tr>  
									<tr class="con">
										<td>
											<div class="con_box">
												<div  class="con">
													쿠폰은 로그인후 ‘쿠폰존’ 이나 해당 이벤트페이지에서 받으실 수 있습니다.<br />
													쿠폰사용은 주문서 작성시 ‘할인안내’란 하단에 위치한 ‘쿠폰 사용하기’ 버튼을 클릭하시어 해당쿠폰을 적용하시면 되며, <br />
													적립금의 경우 ‘사용하실 적립금’ 박스에 보유중인 적립금액 한도내에서 원하시는 금액을 입력하시면 최종금액에서 차감 됩니다.<br />
													사용이 불가능한 쿠폰이 있을 수 있으며, 쿠폰과 적립금은 동시 사용이 가능합니다.<br />
													할인율 또는 브랜드 특성상 쿠폰 또는 적립금의 사용이 불가능한 상품이 있을 수 있습니다.  
												</div>
												<p class="close"><a href="#"><img src="/images/shop/cn/customer/btn_close_faq.gif" alt="닫기" /></a></p>
											</div>										
										</td>
									</tr>      
									<tr>  
										<td class="subject"><a href="#">쿠폰과 적립금은 어떻게 사용합니까?</a></td>   
									</tr>  
									<tr class="con">
										<td>
											<div class="con_box">
												<div  class="con">
													쿠폰은 로그인후 ‘쿠폰존’ 이나 해당 이벤트페이지에서 받으실 수 있습니다.<br />
													쿠폰사용은 주문서 작성시 ‘할인안내’란 하단에 위치한 ‘쿠폰 사용하기’ 버튼을 클릭하시어 해당쿠폰을 적용하시면 되며, <br />
													적립금의 경우 ‘사용하실 적립금’ 박스에 보유중인 적립금액 한도내에서 원하시는 금액을 입력하시면 최종금액에서 차감 됩니다.<br />
													사용이 불가능한 쿠폰이 있을 수 있으며, 쿠폰과 적립금은 동시 사용이 가능합니다.<br />
													할인율 또는 브랜드 특성상 쿠폰 또는 적립금의 사용이 불가능한 상품이 있을 수 있습니다.  
												</div>
												<p class="close"><a href="#"><img src="/images/shop/cn/customer/btn_close_faq.gif" alt="닫기" /></a></p>
											</div>										
										</td>
									</tr>    
									<tr> 
										<td class="subject"><a href="#">출국 하기 전에 취소는 어떻게 해야 합니까?</a></td>   
									</tr>   
									<tr class="con">
										<td>
											<div class="con_box">
												<div  class="con">
													쿠폰은 로그인후 ‘쿠폰존’ 이나 해당 이벤트페이지에서 받으실 수 있습니다.<br />
													쿠폰사용은 주문서 작성시 ‘할인안내’란 하단에 위치한 ‘쿠폰 사용하기’ 버튼을 클릭하시어 해당쿠폰을 적용하시면 되며, <br />
													적립금의 경우 ‘사용하실 적립금’ 박스에 보유중인 적립금액 한도내에서 원하시는 금액을 입력하시면 최종금액에서 차감 됩니다.<br />
													사용이 불가능한 쿠폰이 있을 수 있으며, 쿠폰과 적립금은 동시 사용이 가능합니다.<br />
													할인율 또는 브랜드 특성상 쿠폰 또는 적립금의 사용이 불가능한 상품이 있을 수 있습니다.  
												</div>
												<p class="close"><a href="#"><img src="/images/shop/cn/customer/btn_close_faq.gif" alt="닫기" /></a></p>
											</div>										
										</td>
									</tr>       
									<tr>  
										<td class="subject"><a href="#">주문 후 교환권을 출력하지 못하는 경우 어떻게 합니까?</a></td>   
									</tr>  
									<tr class="con">
										<td>
											<div class="con_box">
												<div  class="con">
													쿠폰은 로그인후 ‘쿠폰존’ 이나 해당 이벤트페이지에서 받으실 수 있습니다.<br />
													쿠폰사용은 주문서 작성시 ‘할인안내’란 하단에 위치한 ‘쿠폰 사용하기’ 버튼을 클릭하시어 해당쿠폰을 적용하시면 되며, <br />
													적립금의 경우 ‘사용하실 적립금’ 박스에 보유중인 적립금액 한도내에서 원하시는 금액을 입력하시면 최종금액에서 차감 됩니다.<br />
													사용이 불가능한 쿠폰이 있을 수 있으며, 쿠폰과 적립금은 동시 사용이 가능합니다.<br />
													할인율 또는 브랜드 특성상 쿠폰 또는 적립금의 사용이 불가능한 상품이 있을 수 있습니다.  
												</div>
												<p class="close"><a href="#"><img src="/images/shop/cn/customer/btn_close_faq.gif" alt="닫기" /></a></p>
											</div>										
										</td>
									</tr>   
									<tr>  
										<td class="subject"><a href="#">출국사항(출국일자, 장소, 시간, 편명) 및 회원정보(영문이름, 여권번호)가 변경된 경우는 어떻게 합니까?</a></td>   
									</tr>   
									<tr class="con">
										<td>
											<div class="con_box">
												<div  class="con">
													쿠폰은 로그인후 ‘쿠폰존’ 이나 해당 이벤트페이지에서 받으실 수 있습니다.<br />
													쿠폰사용은 주문서 작성시 ‘할인안내’란 하단에 위치한 ‘쿠폰 사용하기’ 버튼을 클릭하시어 해당쿠폰을 적용하시면 되며, <br />
													적립금의 경우 ‘사용하실 적립금’ 박스에 보유중인 적립금액 한도내에서 원하시는 금액을 입력하시면 최종금액에서 차감 됩니다.<br />
													사용이 불가능한 쿠폰이 있을 수 있으며, 쿠폰과 적립금은 동시 사용이 가능합니다.<br />
													할인율 또는 브랜드 특성상 쿠폰 또는 적립금의 사용이 불가능한 상품이 있을 수 있습니다.  
												</div>
												<p class="close"><a href="#"><img src="/images/shop/cn/customer/btn_close_faq.gif" alt="닫기" /></a></p>
											</div>										
										</td>
									</tr>     
									<tr>  
										<td class="subject"><a href="#">쿠폰과 적립금은 어떻게 사용합니까?</a></td>   
									</tr>  
									<tr class="con">
										<td>
											<div class="con_box">
												<div  class="con">
													쿠폰은 로그인후 ‘쿠폰존’ 이나 해당 이벤트페이지에서 받으실 수 있습니다.<br />
													쿠폰사용은 주문서 작성시 ‘할인안내’란 하단에 위치한 ‘쿠폰 사용하기’ 버튼을 클릭하시어 해당쿠폰을 적용하시면 되며, <br />
													적립금의 경우 ‘사용하실 적립금’ 박스에 보유중인 적립금액 한도내에서 원하시는 금액을 입력하시면 최종금액에서 차감 됩니다.<br />
													사용이 불가능한 쿠폰이 있을 수 있으며, 쿠폰과 적립금은 동시 사용이 가능합니다.<br />
													할인율 또는 브랜드 특성상 쿠폰 또는 적립금의 사용이 불가능한 상품이 있을 수 있습니다.  
												</div>
												<p class="close"><a href="#"><img src="/images/shop/cn/customer/btn_close_faq.gif" alt="닫기" /></a></p>
											</div>										
										</td>
									</tr>   
									<tr> 
										<td class="subject"><a href="#">출국 하기 전에 취소는 어떻게 해야 합니까?</a></td>   
									</tr>   
									<tr class="con">
										<td>
											<div class="con_box">
												<div  class="con">
													쿠폰은 로그인후 ‘쿠폰존’ 이나 해당 이벤트페이지에서 받으실 수 있습니다.<br />
													쿠폰사용은 주문서 작성시 ‘할인안내’란 하단에 위치한 ‘쿠폰 사용하기’ 버튼을 클릭하시어 해당쿠폰을 적용하시면 되며, <br />
													적립금의 경우 ‘사용하실 적립금’ 박스에 보유중인 적립금액 한도내에서 원하시는 금액을 입력하시면 최종금액에서 차감 됩니다.<br />
													사용이 불가능한 쿠폰이 있을 수 있으며, 쿠폰과 적립금은 동시 사용이 가능합니다.<br />
													할인율 또는 브랜드 특성상 쿠폰 또는 적립금의 사용이 불가능한 상품이 있을 수 있습니다.  
												</div>
												<p class="close"><a href="#"><img src="/images/shop/cn/customer/btn_close_faq.gif" alt="닫기" /></a></p>
											</div>										
										</td>
									</tr>       
									<tr>  
										<td class="subject"><a href="#">주문 후 교환권을 출력하지 못하는 경우 어떻게 합니까?</a></td>   
									</tr>  
									<tr class="con">
										<td>
											<div class="con_box">
												<div  class="con">
													쿠폰은 로그인후 ‘쿠폰존’ 이나 해당 이벤트페이지에서 받으실 수 있습니다.<br />
													쿠폰사용은 주문서 작성시 ‘할인안내’란 하단에 위치한 ‘쿠폰 사용하기’ 버튼을 클릭하시어 해당쿠폰을 적용하시면 되며, <br />
													적립금의 경우 ‘사용하실 적립금’ 박스에 보유중인 적립금액 한도내에서 원하시는 금액을 입력하시면 최종금액에서 차감 됩니다.<br />
													사용이 불가능한 쿠폰이 있을 수 있으며, 쿠폰과 적립금은 동시 사용이 가능합니다.<br />
													할인율 또는 브랜드 특성상 쿠폰 또는 적립금의 사용이 불가능한 상품이 있을 수 있습니다.  
												</div>
												<p class="close"><a href="#"><img src="/images/shop/cn/customer/btn_close_faq.gif" alt="닫기" /></a></p>
											</div>										
										</td>
									</tr>      
								</tbody>  
							</table>
						</div>				   						
					</div>  
					 	 
					 
				</div><!-- //contents -->  
			</div><!-- //customer -->	 
	
		</div><!-- end body -->		
		<%@include file="/publish/frontoffice/include/quickbar.jsp"%>
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
</div><!-- end wrapper -->
</body>
</html>