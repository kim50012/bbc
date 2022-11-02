<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE 고객센터</title>
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
<script language="javascript" type="text/javascript"> 
//<![CDATA[
jQuery(function($){
 
	$("#cellphone-number").selectbox();
	$("#inquiries-list").selectbox();
	 
}); 
//]]>
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
						<a href="#">主页</a><span>&gt;</span><a href="#">客服中心</a><span>&gt;</span><strong>1:1 咨询</strong>
					</div>
					
					<%@include file="/publish/frontoffice/include/top_customer.jsp"%><!-- //고객센터 공통 -->
					 
					<h3><img src="/images/shop/cn/customer/title_inquiries.gif" alt="1:1 咨询" /></h3>
					
					<!-- [D] 기획확인 필요합니다 -->
					<div class="table-atype">
						<table summary="1:1문의 게시판">
							<caption>1:1문의 게시판</caption>
							<colgroup>  
								<col width="105px" /> 
								<col width="285px" /> 
								<col width="140px" />   
								<col width="250px" />  
							</colgroup> 
							<tbody> 
								<tr> 
									<th scope="col"><span>咨询类型</span></th> 
									<td colspan="3" class="inquiries-list"> 
										<select id="inquiries-list" title="1:1상담하실 문의 유형을 선택해주세요">
											<option>全部</option>                    
											<option value="001">会员</option>                    
											<option value="002">订购/付款</option>                    
											<option value="003">交换/退货</option>                    
											<option value="004">商品</option>                    
											<option value="005">领取商品</option>                    
											<option value="006">积分/点数</option>                    
											<option value="007">优惠券</option>                    
											<option value="008">一般</option>             
											<option value="009">活动</option>   
										</select> 
										<div class="rec-faq">
											<p class="title">请确认推荐FAQ。</p>
											<p class="list"><a href="#">인터넷면세점에서 출국일 몇일 전부터 구매 가능합니까?</a></p>
											<p class="list"><a href="#">인터넷 면세점 회원인 경우에 본인이 출국하지 않고, 다른 사람이 출국하는데 구매를 할 수 있습니까?</a></p>
											<p class="list"><a href="#">해외를 몇일 전에 다녀왔는데 상품을 구매 할 수 있습니까?</a></p>
										</div>
									</td>   
								</tr>  
								<tr> 
									<th scope="col"><span>订单号码</span></th> 
									<td colspan="3" class="orderno">
										<a href="#"><img src="/images/shop/cn/customer/btn_ordernocheck.gif" alt="确认订单号码" /></a>
										<input type="text" title="주문번호 입니다" />									
										<div class="tipping-box">
											<span class="txt-tipping">没有订购明细的顾客请向“咨询类型：一般”咨询。</span>
										</div>
									</td>   
								</tr>   	 
								<tr> 
									<th scope="col"><span>商品信息</span></th>
									<td colspan="3" class="orderno">
										<a href="#"><img src="/images/shop/cn/customer/btn_product.gif" alt="搜索商品" /></a>
										<input type="text" title="주문번호 입니다" />	
										<div class="tipping-box">
											<span class="txt-tipping">有关商品的咨询，利用商品Q&amp;A，就可以得到更加迅速的回复。</span>
										</div> 
									</td>   
								</tr>  
								<tr> 
									<th scope="col"><span>咨询者姓名</span></th> 
									<td class="text"><span>홍길동</span></td>  
									<th scope="col" class="tow"><span>联系电话</span></th>
									<td class="cellphone-box"> 
										<div class="cellphone-box">
											<select id="cellphone-number" title="핸드폰번호 앞자리를 선택해주세요">
												<option>010</option>
												<option>011</option>
												<option>016</option>
												<option>017</option>
												<option>018</option>
												<option>019</option> 
											</select>
											-<input type="text" title="휴대전화 가운데 자리" />-<input type="text" title="휴대전화 마지막 자리" /> 
										</div>
									</td>
								</tr>  
								<tr> 
									<th scope="col"><span>题目</span></th> 
									<td colspan="3" class="subject">
										<input type="text" title="제목을 입력하세요" />
									</td>   
								</tr>  
								<tr> 
									<th scope="col"><span>内容</span></th> 
									<td colspan="3">
										<textarea cols="60" rows="5"></textarea>										
										<div class="tipping-box">
											<span class="txt-tipping">为了得到准确而快速的回复，请详细输入欲咨询的内容。 咨询内容最多可输入1000Byte。</span>
										</div>
									</td>   
								</tr>  
								<tr> 
									<th scope="col"><span>添加附件</span></th> 
									<td colspan="3">
										<div class="file-wrap">
											<input type="text" id="file_route" class="file-text" readonly="readonly" title="첨부된 파일경로" />										
											<span class="file-box">
												<input type="file" class="file-add" onchange="javascript:document.getElementById('file_route').value=this.value" title="浏览…" />
											</span><!-- 삭제 -->
											<a href="#" class="btn"><img src="/images/shop/cn/customer/btn_dell.gif" alt="删除" /></a> 
										</div>
										<div class="tipping-box">
											<span class="txt-tipping">文件名只能使用英文和数字，且只能上传, JPG(JPEG), GIF, PDF格式的文件。</span> 
										</div>
									</td>   
								</tr>  
							</tbody>  
						</table>
						
						<div class="btn_wrap">
							<p class="center">
								<a href="#"><img src="/images/shop/cn/customer/btn_cancel.gif" alt="取消" /></a>
								<a href="#"><img src="/images/shop/cn/customer/btn_inquiries.gif" alt="咨询" /></a>
							</p>
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