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
  
	$("#cellphone-number").selectbox();
	$("#sori-list").selectbox();
  
	$("#email").selectbox();
	 
});  
//]]>
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
					<a href="#">主页</a><span>&gt;</span><a href="#">使用指南</a><span>&gt;</span><strong>顾客之声</strong>
				</div>  
				<div class="location-title visual05">
					<h3><img src="/images/shop/cn/store/h3_title05.gif" alt="information" /></h3>
					<p><img src="/images/shop/cn/store/comment03.gif" alt="请在新世界免税店尽享购物之快乐！ 我们将为顾客的购物方便尽最大的努力。" /></p>
				</div> 
				 
				<h4><img src="/images/shop/cn/store/title_sori.gif" alt="顾客之声" /><span><img src="/images/shop/cn/store/explain_sori.gif" alt="若E-mail或联系方式输入有误，则无法收到回复。" /></span></h4>
				<div class="table-atype">
					<table summary="고객의 소리 게시판">
						<caption>고객의 소리 게시판</caption>
						<colgroup>  
							<col width="107px" /> 
							<col width="673px" />  
						</colgroup> 
						<tbody> 
							<tr> 
								<th scope="col"><span>姓名</span></th> 
								<td class="name"><input type="text" title="이름을 입력하세요" /></td>   
							</tr>  
							<tr> 
								<th scope="col"><span>E-mail</span></th> 
								<td class="email">
									<div class="email">
										<input type="text" title="이메일 주소를 입력하세요." /><span>@</span><input type="text" title="이메일 마지막 주소를 입력하세요." />
										<select id="email">
											<option>直接输入</option>
										</select>  
									</div>
								</td>
							</tr>  
							<tr> 
								<th scope="col"><span>联系方式</span></th> 
								<td class="cellphone-box">
									<select id="cellphone-number" title="연락처 앞자리를 선택해주세요">
										<option>选择</option>
										<option>011</option>
										<option>016</option>
									</select>
									-<input type="text" title="연락처 가운데 자리" />-<input type="text" title="연락처 마지막 자리" /> 
								</td>  
							</tr>  
							<tr> 
								<th scope="col"><span>类型</span></th> 
								<td class="sori-list">
									<select id="sori-list" title="문의 유형을 선택해주세요">
										<option>选择</option>
										<option>상품관련</option>
										<option>결제관련</option>
										<option>상품수령</option>
										<option>적립금</option>
										<option>쿠폰</option>
										<option>상품권</option>
										<option>VIP CARD</option>
										<option>교환 및 취소</option> 
									</select> 
								</td>    
							</tr>  
							<tr> 
								<th scope="col"><span>题目</span></th> 
								<td class="subject">
									<input type="text" title="제목을 입력하세요" />
								</td>
							</tr>   
							<tr> 
								<th scope="col"><span>内容</span></th> 
								<td> 
									<textarea cols="60" rows="5"></textarea>
									<p class="info">(<span>0</span> / 1,000byte)</p>	
								</td>
							</tr>  
						</tbody>  
					</table>
					
					<div class="btn_wrap">
						<p class="center">
							<a href="#"><img src="/images/shop/cn/store/btn_sori_reg.gif" alt="注册" /></a>
							<a href="#"><img src="/images/shop/cn/store/btn_sori_reset.gif" alt="取消" /></a>
						</p>
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



