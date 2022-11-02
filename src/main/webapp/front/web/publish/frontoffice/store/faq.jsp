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

<!-- selectbox 있을경우 추가 -->
<link href="/css/selectbox.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery/jquery.selectbox-0.2.1.js"></script> 
<script language="javascript" type="text/javascript"> 
//<![CDATA[
jQuery(function($){
  
	/* faq 검색 */ 
	$("#faq-search").selectbox(); 
  
	$(".board-btypelist .sub tr td a").click(function(){
		$(".board-btypelist .sub tr.con").children().hide();  
		$(".board-btypelist .sub tr.selected").attr("class" , "selected");
		$(".board-btypelist .sub tr.selected").attr("class" , "");			
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
		<%@include file="/publish/frontoffice/include/head_store.jsp"%>
			<div id="body">
			<%@include file="/publish/frontoffice/include/sidebar_store05.jsp"%>
			<div id="contents">
				<div class="page-sublocation">
					<a href="#">主页</a><span>&gt;</span><a href="#">使用指南</a><span>&gt;</span><strong> FAQ</strong>
				</div>  
				<div class="location-title visual05">
					<h3><img src="/images/shop/cn/store/h3_title05.gif" alt="information" /></h3>
					<p><img src="/images/shop/cn/store/comment03.gif" alt="请在新世界免税店尽享购物之快乐！ 我们将为顾客的购物方便尽最大的努力。" /></p>
				</div> 
				 
				<h4><img src="/images/shop/cn/customer/title_faq.gif" alt="FAQ" /></h4>
				<div class="faqsub-search">
					<div class="faq-search"> 
						<p class="title"><img src="/images/shop/cn/store/faqsearch_title.gif" alt="FAQ 搜索" /></p>
						<div class="box">
							<select id="faq-search" title="검색범위 선택">
								<option>全部</option>
								<option>내용</option> 
							</select>
							<input type="text" name="" id="" title="검색어 입력" /> 
						</div>
						<a href="#" class="btn"><img src="/images/shop/cn/customer/btn_faqsearch.gif" alt="搜索" /></a> 
					</div>
				</div>
				 
				<div class="board-btypelist">  
					<ul class="faq-list">
						<li class="selected"><a href="#">全部</a></li>
						<li><a href="#">会员</a></li>
						<li><a href="#">订购/付款</a></li>
						<li><a href="#">交换/退货</a></li> 
						<li><a href="#">商品</a></li> 
						<li><a href="#">领取商品</a></li> 
						<li><a href="#">积分/积分</a></li> 
						<li><a href="#">优惠券</a></li> 
						<li><a href="#">一般</a></li> 
					</ul>	 
					
					<div class="sub">
						<table summary="자주 묻는 질문 게시판">
							<caption>자주 묻는 질문 게시판</caption>
							<colgroup>  
								<col width="62px" />
								<col width="98px" />   
								<col width="620px" /> 
							</colgroup>
							<thead>
								<tr> 
									<th scope="row">序号</th> 
									<th scope="row">分类</th> 
									<th scope="row">问题</th>  
								</tr>
							</thead>
							<tbody>    
								<tr> 
									<td>20</td> 
									<td class="sort">[会员]</td>
									<td class="subject"><a href="#">환승전용 내항기"이용 고객 쇼핑시 유의사항</a></td>   
								</tr>  
								<tr class="con">
									<td colspan="3">
										<div class="con_box">
											<div  class="con">
												쿠폰은 로그인후 ‘쿠폰존’ 이나 해당 이벤트페이지에서 받으실 수 있습니다.<br />
												쿠폰사용은 주문서 작성시 ‘할인안내’란 하단에 위치한 ‘쿠폰 사용하기’ 버튼을 클릭하시어 해당쿠폰을 
												적용하시면 되며, <br />
												적립금의 경우 ‘사용하실 적립금’ 박스에 보유중인 적립금액 한도내에서 원하시는 금액을 입력하시면 
												최종금액에서 차감 됩니다.
											</div>
											<p class="close"><a href="#"><img src="/images/shop/cn/customer/btn_close_faq.gif" alt="닫기" /></a></p>
										</div>										
									</td>
								</tr>    
								<tr> 
									<td>19</td> 
									<td class="sort">[订购/付款]</td>
									<td class="subject"><a href="#">모바일교환권 및 적립금 지급 공지</a></td>   
								</tr>   
								<tr class="con">
									<td colspan="3">
										<div class="con_box">
											<div  class="con">
												쿠폰은 로그인후 ‘쿠폰존’ 이나 해당 이벤트페이지에서 받으실 수 있습니다.<br />
												쿠폰사용은 주문서 작성시 ‘할인안내’란 하단에 위치한 ‘쿠폰 사용하기’ 버튼을 클릭하시어 해당쿠폰을 
												적용하시면 되며, <br />
												적립금의 경우 ‘사용하실 적립금’ 박스에 보유중인 적립금액 한도내에서 원하시는 금액을 입력하시면 
												최종금액에서 차감 됩니다.
											</div>
											<p class="close"><a href="#"><img src="/images/shop/cn/customer/btn_close_faq.gif" alt="닫기" /></a></p>
										</div>										
									</td>
								</tr>     
								<tr> 
									<td>18</td> 
									<td class="sort">[其他]</td>
									<td class="subject"><a href="#">시스템점검안내-6월11일</a></td>   
								</tr>  
								<tr class="con">
									<td colspan="3">
										<div class="con_box">
											<div  class="con">
												쿠폰은 로그인후 ‘쿠폰존’ 이나 해당 이벤트페이지에서 받으실 수 있습니다.<br />
												쿠폰사용은 주문서 작성시 ‘할인안내’란 하단에 위치한 ‘쿠폰 사용하기’ 버튼을 클릭하시어 해당쿠폰을 
												적용하시면 되며, <br />
												적립금의 경우 ‘사용하실 적립금’ 박스에 보유중인 적립금액 한도내에서 원하시는 금액을 입력하시면 
												최종금액에서 차감 됩니다.
											</div>
											<p class="close"><a href="#"><img src="/images/shop/cn/customer/btn_close_faq.gif" alt="닫기" /></a></p>
										</div>										
									</td>
								</tr>    
								<tr> 
									<td>17</td> 
									<td class="sort">[商品]</td>
									<td class="subject"><a href="#">환승전용 내항기"이용 고객 쇼핑시 유의사항</a></td>   
								</tr>  
								<tr class="con">
									<td colspan="3">
										<div class="con_box">
											<div  class="con">
												쿠폰은 로그인후 ‘쿠폰존’ 이나 해당 이벤트페이지에서 받으실 수 있습니다.<br />
												쿠폰사용은 주문서 작성시 ‘할인안내’란 하단에 위치한 ‘쿠폰 사용하기’ 버튼을 클릭하시어 해당쿠폰을 
												적용하시면 되며, <br />
												적립금의 경우 ‘사용하실 적립금’ 박스에 보유중인 적립금액 한도내에서 원하시는 금액을 입력하시면 
												최종금액에서 차감 됩니다.
											</div>
											<p class="close"><a href="#"><img src="/images/shop/cn/customer/btn_close_faq.gif" alt="닫기" /></a></p>
										</div>										
									</td>
								</tr>    
								<tr> 
									<td>16</td> 
									<td class="sort">[其他]</td>
									<td class="subject"><a href="#">모바일교환권 및 적립금 지급 공지</a></td>   
								</tr>  
								<tr class="con">
									<td colspan="3">
										<div class="con_box">
											<div  class="con">
												쿠폰은 로그인후 ‘쿠폰존’ 이나 해당 이벤트페이지에서 받으실 수 있습니다.<br />
												쿠폰사용은 주문서 작성시 ‘할인안내’란 하단에 위치한 ‘쿠폰 사용하기’ 버튼을 클릭하시어 해당쿠폰을 
												적용하시면 되며, <br />
												적립금의 경우 ‘사용하실 적립금’ 박스에 보유중인 적립금액 한도내에서 원하시는 금액을 입력하시면 
												최종금액에서 차감 됩니다.
											</div>
											<p class="close"><a href="#"><img src="/images/shop/cn/customer/btn_close_faq.gif" alt="닫기" /></a></p>
										</div>										
									</td>
								</tr>         
								<tr> 
									<td>15</td> 
									<td class="sort">[其他]</td>
									<td class="subject"><a href="#">환승전용 내항기"이용 고객 쇼핑시 유의사항</a></td>   
								</tr>  
								<tr class="con">
									<td colspan="3">
										<div class="con_box">
											<div  class="con">
												쿠폰은 로그인후 ‘쿠폰존’ 이나 해당 이벤트페이지에서 받으실 수 있습니다.<br />
												쿠폰사용은 주문서 작성시 ‘할인안내’란 하단에 위치한 ‘쿠폰 사용하기’ 버튼을 클릭하시어 해당쿠폰을 
												적용하시면 되며, <br />
												적립금의 경우 ‘사용하실 적립금’ 박스에 보유중인 적립금액 한도내에서 원하시는 금액을 입력하시면 
												최종금액에서 차감 됩니다.
											</div>
											<p class="close"><a href="#"><img src="/images/shop/cn/customer/btn_close_faq.gif" alt="닫기" /></a></p>
										</div>										
									</td>
								</tr>    
								<tr> 
									<td>14</td> 
									<td class="sort">[商品]</td>
									<td class="subject"><a href="#">모바일교환권 및 적립금 지급 공지</a></td>   
								</tr>  
								<tr class="con">
									<td colspan="3">
										<div class="con_box">
											<div  class="con">
												쿠폰은 로그인후 ‘쿠폰존’ 이나 해당 이벤트페이지에서 받으실 수 있습니다.<br />
												쿠폰사용은 주문서 작성시 ‘할인안내’란 하단에 위치한 ‘쿠폰 사용하기’ 버튼을 클릭하시어 해당쿠폰을 
												적용하시면 되며, <br />
												적립금의 경우 ‘사용하실 적립금’ 박스에 보유중인 적립금액 한도내에서 원하시는 금액을 입력하시면 
												최종금액에서 차감 됩니다.
											</div>
											<p class="close"><a href="#"><img src="/images/shop/cn/customer/btn_close_faq.gif" alt="닫기" /></a></p>
										</div>										
									</td>
								</tr>       
								<tr> 
									<td>13</td> 
									<td class="sort">[其他]</td>
									<td class="subject"><a href="#">환승전용 내항기"이용 고객 쇼핑시 유의사항</a></td>   
								</tr>  
								<tr class="con">
									<td colspan="3">
										<div class="con_box">
											<div  class="con">
												쿠폰은 로그인후 ‘쿠폰존’ 이나 해당 이벤트페이지에서 받으실 수 있습니다.<br />
												쿠폰사용은 주문서 작성시 ‘할인안내’란 하단에 위치한 ‘쿠폰 사용하기’ 버튼을 클릭하시어 해당쿠폰을 
												적용하시면 되며, <br />
												적립금의 경우 ‘사용하실 적립금’ 박스에 보유중인 적립금액 한도내에서 원하시는 금액을 입력하시면 
												최종금액에서 차감 됩니다.
											</div>
											<p class="close"><a href="#"><img src="/images/shop/cn/customer/btn_close_faq.gif" alt="닫기" /></a></p>
										</div>										
									</td>
								</tr>    
								<tr> 
									<td>12</td> 
									<td class="sort">[其他]</td>
									<td class="subject"><a href="#">모바일교환권 및 적립금 지급 공지</a></td>   
								</tr>   
								<tr class="con">
									<td colspan="3">
										<div class="con_box">
											<div  class="con">
												쿠폰은 로그인후 ‘쿠폰존’ 이나 해당 이벤트페이지에서 받으실 수 있습니다.<br />
												쿠폰사용은 주문서 작성시 ‘할인안내’란 하단에 위치한 ‘쿠폰 사용하기’ 버튼을 클릭하시어 해당쿠폰을 
												적용하시면 되며, <br />
												적립금의 경우 ‘사용하실 적립금’ 박스에 보유중인 적립금액 한도내에서 원하시는 금액을 입력하시면 
												최종금액에서 차감 됩니다.
											</div>
											<p class="close"><a href="#"><img src="/images/shop/cn/customer/btn_close_faq.gif" alt="닫기" /></a></p>
										</div>										
									</td>
								</tr>       
								<tr> 
									<td>11</td> 
									<td class="sort">[其他]</td>
									<td class="subject"><a href="#">모바일교환권 및 적립금 지급 공지</a></td>   
								</tr>   
								<tr class="con">
									<td colspan="3">
										<div class="con_box">
											<div  class="con">
												쿠폰은 로그인후 ‘쿠폰존’ 이나 해당 이벤트페이지에서 받으실 수 있습니다.<br />
												쿠폰사용은 주문서 작성시 ‘할인안내’란 하단에 위치한 ‘쿠폰 사용하기’ 버튼을 클릭하시어 해당쿠폰을 
												적용하시면 되며, <br />
												적립금의 경우 ‘사용하실 적립금’ 박스에 보유중인 적립금액 한도내에서 원하시는 금액을 입력하시면 
												최종금액에서 차감 됩니다.
											</div>
											<p class="close"><a href="#"><img src="/images/shop/cn/customer/btn_close_faq.gif" alt="닫기" /></a></p>
										</div>										
									</td>
								</tr>    
								<tr> 
									<td>10</td> 
									<td class="sort">[其他]</td>
									<td class="subject"><a href="#">환승전용 내항기"이용 고객 쇼핑시 유의사항</a></td>   
								</tr>  
								<tr class="con">
									<td colspan="3">
										<div class="con_box">
											<div  class="con">
												쿠폰은 로그인후 ‘쿠폰존’ 이나 해당 이벤트페이지에서 받으실 수 있습니다.<br />
												쿠폰사용은 주문서 작성시 ‘할인안내’란 하단에 위치한 ‘쿠폰 사용하기’ 버튼을 클릭하시어 해당쿠폰을 
												적용하시면 되며, <br />
												적립금의 경우 ‘사용하실 적립금’ 박스에 보유중인 적립금액 한도내에서 원하시는 금액을 입력하시면 
												최종금액에서 차감 됩니다.
											</div>
											<p class="close"><a href="#"><img src="/images/shop/cn/customer/btn_close_faq.gif" alt="닫기" /></a></p>
										</div>										
									</td>
								</tr>    
								<tr> 
									<td>9</td> 
									<td class="sort">[其他]</td>
									<td class="subject"><a href="#">모바일교환권 및 적립금 지급 공지</a></td>   
								</tr>  
								<tr class="con">
									<td colspan="3">
										<div class="con_box">
											<div  class="con">
												쿠폰은 로그인후 ‘쿠폰존’ 이나 해당 이벤트페이지에서 받으실 수 있습니다.<br />
												쿠폰사용은 주문서 작성시 ‘할인안내’란 하단에 위치한 ‘쿠폰 사용하기’ 버튼을 클릭하시어 해당쿠폰을 
												적용하시면 되며, <br />
												적립금의 경우 ‘사용하실 적립금’ 박스에 보유중인 적립금액 한도내에서 원하시는 금액을 입력하시면 
												최종금액에서 차감 됩니다.
											</div>
											<p class="close"><a href="#"><img src="/images/shop/cn/customer/btn_close_faq.gif" alt="닫기" /></a></p>
										</div>										
									</td>
								</tr>      
								<tr> 
									<td>8</td> 
									<td class="sort">[其他]</td>
									<td class="subject"><a href="#">시스템점검안내-6월11일</a></td>   
								</tr>   
								<tr class="con">
									<td colspan="3">
										<div class="con_box">
											<div  class="con">
												쿠폰은 로그인후 ‘쿠폰존’ 이나 해당 이벤트페이지에서 받으실 수 있습니다.<br />
												쿠폰사용은 주문서 작성시 ‘할인안내’란 하단에 위치한 ‘쿠폰 사용하기’ 버튼을 클릭하시어 해당쿠폰을 
												적용하시면 되며, <br />
												적립금의 경우 ‘사용하실 적립금’ 박스에 보유중인 적립금액 한도내에서 원하시는 금액을 입력하시면 
												최종금액에서 차감 됩니다.
											</div>
											<p class="close"><a href="#"><img src="/images/shop/cn/customer/btn_close_faq.gif" alt="닫기" /></a></p>
										</div>										
									</td>
								</tr>    
								<tr> 
									<td>7</td> 
									<td class="sort">[其他]</td>
									<td class="subject"><a href="#">환승전용 내항기"이용 고객 쇼핑시 유의사항</a></td>   
								</tr>  
								<tr class="con">
									<td colspan="3">
										<div class="con_box">
											<div  class="con">
												쿠폰은 로그인후 ‘쿠폰존’ 이나 해당 이벤트페이지에서 받으실 수 있습니다.<br />
												쿠폰사용은 주문서 작성시 ‘할인안내’란 하단에 위치한 ‘쿠폰 사용하기’ 버튼을 클릭하시어 해당쿠폰을 
												적용하시면 되며, <br />
												적립금의 경우 ‘사용하실 적립금’ 박스에 보유중인 적립금액 한도내에서 원하시는 금액을 입력하시면 
												최종금액에서 차감 됩니다.
											</div>
											<p class="close"><a href="#"><img src="/images/shop/cn/customer/btn_close_faq.gif" alt="닫기" /></a></p>
										</div>										
									</td>
								</tr>    
								<tr> 
									<td>6</td> 
									<td class="sort">[其他]</td>
									<td class="subject"><a href="#">모바일교환권 및 적립금 지급 공지</a></td>   
								</tr>  
								<tr class="con">
									<td colspan="3">
										<div class="con_box">
											<div  class="con">
												쿠폰은 로그인후 ‘쿠폰존’ 이나 해당 이벤트페이지에서 받으실 수 있습니다.<br />
												쿠폰사용은 주문서 작성시 ‘할인안내’란 하단에 위치한 ‘쿠폰 사용하기’ 버튼을 클릭하시어 해당쿠폰을 
												적용하시면 되며, <br />
												적립금의 경우 ‘사용하실 적립금’ 박스에 보유중인 적립금액 한도내에서 원하시는 금액을 입력하시면 
												최종금액에서 차감 됩니다.
											</div>
											<p class="close"><a href="#"><img src="/images/shop/cn/customer/btn_close_faq.gif" alt="닫기" /></a></p>
										</div>										
									</td>
								</tr>         
								<tr> 
									<td>5</td> 
									<td class="sort">[其他]</td>
									<td class="subject"><a href="#">환승전용 내항기"이용 고객 쇼핑시 유의사항</a></td>   
								</tr>  
								<tr class="con">
									<td colspan="3">
										<div class="con_box">
											<div  class="con">
												쿠폰은 로그인후 ‘쿠폰존’ 이나 해당 이벤트페이지에서 받으실 수 있습니다.<br />
												쿠폰사용은 주문서 작성시 ‘할인안내’란 하단에 위치한 ‘쿠폰 사용하기’ 버튼을 클릭하시어 해당쿠폰을 
												적용하시면 되며, <br />
												적립금의 경우 ‘사용하실 적립금’ 박스에 보유중인 적립금액 한도내에서 원하시는 금액을 입력하시면 
												최종금액에서 차감 됩니다.
											</div>
											<p class="close"><a href="#"><img src="/images/shop/cn/customer/btn_close_faq.gif" alt="닫기" /></a></p>
										</div>										
									</td>
								</tr>    
								<tr> 
									<td>4</td> 
									<td class="sort">[其他]</td>
									<td class="subject"><a href="#">모바일교환권 및 적립금 지급 공지</a></td>   
								</tr>   
								<tr class="con">
									<td colspan="3">
										<div class="con_box">
											<div  class="con">
												쿠폰은 로그인후 ‘쿠폰존’ 이나 해당 이벤트페이지에서 받으실 수 있습니다.<br />
												쿠폰사용은 주문서 작성시 ‘할인안내’란 하단에 위치한 ‘쿠폰 사용하기’ 버튼을 클릭하시어 해당쿠폰을 
												적용하시면 되며, <br />
												적립금의 경우 ‘사용하실 적립금’ 박스에 보유중인 적립금액 한도내에서 원하시는 금액을 입력하시면 
												최종금액에서 차감 됩니다.
											</div>
											<p class="close"><a href="#"><img src="/images/shop/cn/customer/btn_close_faq.gif" alt="닫기" /></a></p>
										</div>										
									</td>
								</tr>      
								<tr> 
									<td>3</td> 
									<td class="sort">[其他]</td>
									<td class="subject"><a href="#">환승전용 내항기"이용 고객 쇼핑시 유의사항</a></td>   
								</tr>  
								<tr class="con">
									<td colspan="3">
										<div class="con_box">
											<div  class="con">
												쿠폰은 로그인후 ‘쿠폰존’ 이나 해당 이벤트페이지에서 받으실 수 있습니다.<br />
												쿠폰사용은 주문서 작성시 ‘할인안내’란 하단에 위치한 ‘쿠폰 사용하기’ 버튼을 클릭하시어 해당쿠폰을 
												적용하시면 되며, <br />
												적립금의 경우 ‘사용하실 적립금’ 박스에 보유중인 적립금액 한도내에서 원하시는 금액을 입력하시면 
												최종금액에서 차감 됩니다.
											</div>
											<p class="close"><a href="#"><img src="/images/shop/cn/customer/btn_close_faq.gif" alt="닫기" /></a></p>
										</div>										
									</td>
								</tr>    
								<tr> 
									<td>2</td> 
									<td class="sort">[其他]</td>
									<td class="subject"><a href="#">모바일교환권 및 적립금 지급 공지</a></td>   
								</tr>  
								<tr class="con">
									<td colspan="3">
										<div class="con_box">
											<div  class="con">
												쿠폰은 로그인후 ‘쿠폰존’ 이나 해당 이벤트페이지에서 받으실 수 있습니다.<br />
												쿠폰사용은 주문서 작성시 ‘할인안내’란 하단에 위치한 ‘쿠폰 사용하기’ 버튼을 클릭하시어 해당쿠폰을 
												적용하시면 되며, <br />
												적립금의 경우 ‘사용하실 적립금’ 박스에 보유중인 적립금액 한도내에서 원하시는 금액을 입력하시면 
												최종금액에서 차감 됩니다.
											</div>
											<p class="close"><a href="#"><img src="/images/shop/cn/customer/btn_close_faq.gif" alt="닫기" /></a></p>
										</div>										
									</td>
								</tr>        
								<tr> 
									<td>1</td> 
									<td class="sort">[其他]</td>
									<td class="subject"><a href="#">모바일교환권 및 적립금 지급 공지</a></td>   
								</tr>  
								<tr class="con">
									<td colspan="3">
										<div class="con_box">
											<div  class="con">
												쿠폰은 로그인후 ‘쿠폰존’ 이나 해당 이벤트페이지에서 받으실 수 있습니다.<br />
												쿠폰사용은 주문서 작성시 ‘할인안내’란 하단에 위치한 ‘쿠폰 사용하기’ 버튼을 클릭하시어 해당쿠폰을 
												적용하시면 되며, <br />
												적립금의 경우 ‘사용하실 적립금’ 박스에 보유중인 적립금액 한도내에서 원하시는 금액을 입력하시면 
												최종금액에서 차감 됩니다.
											</div>
											<p class="close"><a href="#"><img src="/images/shop/cn/customer/btn_close_faq.gif" alt="닫기" /></a></p>
										</div>										
									</td>
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



