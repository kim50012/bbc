<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE</title>
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
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
		 
		$(".table-listhtype .qna tr td a").click(function(){
			$(".table-listhtype .qna tr.con").children().hide();  
			$(".table-listhtype .qna tr.selected").attr("class" , "selected");
			$(".table-listhtype .qna tr.selected").attr("class" , "");			
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
			<div class="mypage"> 
				<div class="sidebar">
					<%@include file="/publish/frontoffice/include/sub_mypage.jsp"%>						
					<%@include file="/publish/frontoffice/include/side_common.jsp"%>					
				</div> 
				<div id="contents">  
					<div class="page-sublocation">  
						<a href="#">主页</a><span>&gt;</span><a href="#">我的页面</a><span>&gt;</span><a href="#">我的资讯</a><span>&gt;</span><strong>1:1 咨询</strong>
					</div>
			 
					<%@include file="/publish/frontoffice/include/top_mypage.jsp"%><!-- //마이페이지 공통 --> 
					 				
					<h3><img src="/images/shop/cn/mypage/title_inquiries.gif" alt="1:1 咨询" /><span><img src="/images/shop/cn/mypage/explain_inquiries.gif" alt="对于您的咨询，我们将回复内容发送至您的E-mail。请准确输入您的E-mail信息。" /></span><a href="#" class="btn2"><img src="/images/shop/cn/mypage/btn_inquiries.gif" alt="1:1咨询" /></a></h3>	
					 				 
					<div class="table-listhtype">	 
						<div class="list qna">
							<table summary="1:1 咨询">
                    			<caption>1:1 咨询</caption>
								<colgroup>  
									<col width="110px" /> 
									<col width="455px" /> 
									<col width="115px" />  
									<col width="100px" /> 
								</colgroup>
								<thead>
									<tr> 
										<th scope="row">咨询类别</th> 
										<th scope="row">题目</th> 
										<th scope="row">发表日</th> 
										<th scope="row">恢复状态</th>    
									</tr>
								</thead>
								<tbody>   
									<tr> 
										<td class="sort">会员</td> 
										<td class="subject"><a href="#">회원가입 문의 입니다.</a></td>  
										<td><span class="fta">2013.05.02</span></td>
										<td class="check"><span class="check-on">已回复</span></td>
									</tr>
									<tr class="con"> 
										<td colspan="4">
											<div class="qna-box">
												<div class="q-box">
													회원가입할 때 본인인증이 안됩니다.회원가입할 때 본인인증이 안됩니다.<br />
													회원가입할 때 본인인증이 안됩니다.
												</div>
												<p class="add-file">附件<a href="#" class="file-name">참고화면.JPG</a><a href="#"><img src="/images/shop/cn/mypage/btn_down.gif" alt="下载附件" /></a></p>
												<div class="bg-a">
													<div class="a-box">
														<p class="answer-date">[ 回复日期 : <span>2013.05.02 15:00</span> ]</p>
														다른 문의사항이나, 더 알고 싶으신 점이 있으시면,<br />
														아래의 연락처로 연락주십시오. 상세하게 설명드리겠습니다.<br />
														신세계인터넷면세점 고객센터 : 1577-0161<br />
														항상 더 나은 서비스로 고객님께 다가가는 신세계인터넷면세점이 되겠습니다.<br />
														좋은 하루 되세요.
													</div>
												</div>
												<p class="add-file">附件<a href="#" class="file-name">본인인증_설명.JPG</a><a href="#"><img src="/images/shop/cn/mypage/btn_down.gif" alt="下载附件" /></a></p>
											</div>
										</td>
									</tr>  
									<tr> 
										<td class="sort">交换/退货</td> 
										<td class="subject"><a href="#">상품주문 문의드립니다</a></td>  
										<td><span class="fta">2013.05.02</span></td>
										<td class="check"><span class="check-on">已回复</span></td>
									</tr> 
									<tr class="con"> 
										<td colspan="4">
											<div class="qna-box">
												<div class="q-box">
													회원가입할 때 본인인증이 안됩니다.회원가입할 때 본인인증이 안됩니다.<br />
													회원가입할 때 본인인증이 안됩니다.
												</div>
												<p class="add-file">附件<a href="#" class="file-name">참고화면.JPG</a><a href="#"><img src="/images/shop/cn/mypage/btn_down.gif" alt="下载附件" /></a></p>
												<div class="bg-a">
													<div class="a-box">
														<p class="answer-date">[ 回复日期 : <span>2013.05.02 15:00</span> ]</p>
														다른 문의사항이나, 더 알고 싶으신 점이 있으시면,<br />
														아래의 연락처로 연락주십시오. 상세하게 설명드리겠습니다.<br />
														신세계인터넷면세점 고객센터 : 1577-0161<br />
														항상 더 나은 서비스로 고객님께 다가가는 신세계인터넷면세점이 되겠습니다.<br />
														좋은 하루 되세요.
													</div>
												</div>
												<p class="add-file">附件<a href="#" class="file-name">본인인증_설명.JPG</a><a href="#"><img src="/images/shop/cn/mypage/btn_down.gif" alt="下载附件" /></a></p>
											</div>
										</td>
									</tr>  
									<tr> 
										<td class="sort">会员</td> 
										<td class="subject"><a href="#">반품 문의드립니다.</a></td>  
										<td><span class="fta">2013.05.02</span></td>
										<td class="check"><span class="check-on">已回复</span></td>
									</tr> 
									<tr class="con"> 
										<td colspan="4">
											<div class="qna-box">
												<div class="q-box">
													회원가입할 때 본인인증이 안됩니다.회원가입할 때 본인인증이 안됩니다.<br />
													회원가입할 때 본인인증이 안됩니다.
												</div>
												<p class="add-file">附件<a href="#" class="file-name">참고화면.JPG</a><a href="#"><img src="/images/shop/cn/mypage/btn_down.gif" alt="下载附件" /></a></p>
												<div class="bg-a">
													<div class="a-box">
														<p class="answer-date">[ 回复日期 : <span>2013.05.02 15:00</span> ]</p>
														다른 문의사항이나, 더 알고 싶으신 점이 있으시면,<br />
														아래의 연락처로 연락주십시오. 상세하게 설명드리겠습니다.<br />
														신세계인터넷면세점 고객센터 : 1577-0161<br />
														항상 더 나은 서비스로 고객님께 다가가는 신세계인터넷면세점이 되겠습니다.<br />
														좋은 하루 되세요.
													</div>
												</div>
												<p class="add-file">附件<a href="#" class="file-name">본인인증_설명.JPG</a><a href="#"><img src="/images/shop/cn/mypage/btn_down.gif" alt="下载附件" /></a></p>
											</div>
										</td>
									</tr>  
									<tr> 
										<td class="sort">会员</td> 
										<td class="subject"><a href="#">상품 관련하여 문의드립니다</a></td>  
										<td><span class="fta">2013.05.02</span></td>
										<td class="check"><span class="check">正在准备回复</span></td>
									</tr>  
									<tr class="con"> 
										<td colspan="4">
											<div class="qna-box">
												<div class="q-box">
													<p class="answer-orderno">订单号码 : <a href="#">1234567</a></p>
													회원가입할 때 본인인증이 안됩니다.회원가입할 때 본인인증이 안됩니다.<br />
													회원가입할 때 본인인증이 안됩니다.
												</div>
												<p class="add-file">附件<a href="#" class="file-name">참고화면.JPG</a><a href="#"><img src="/images/shop/cn/mypage/btn_down.gif" alt="下载附件" /></a></p>
												<!--
												<div class="bg-a">
													<div class="a-box">
														<p class="answer-date">[ 回复日期 : <span>2013.05.02 15:00</span> ]</p>
														다른 문의사항이나, 더 알고 싶으신 점이 있으시면,<br />
														아래의 연락처로 연락주십시오. 상세하게 설명드리겠습니다.<br />
														신세계인터넷면세점 고객센터 : 1577-0161<br />
														항상 더 나은 서비스로 고객님께 다가가는 신세계인터넷면세점이 되겠습니다.<br />
														좋은 하루 되세요.
													</div>
												</div>
												<p class="add-file">附件<a href="#" class="file-name">본인인증_설명.JPG</a><a href="#"><img src="/images/shop/cn/mypage/btn_down.gif" alt="下载附件" /></a></p>
												-->
											</div>
										</td>
									</tr> 
									<tr> 
										<td class="sort">交换/退货</td> 
										<td class="subject"><a href="#">상품주문 문의드립니다</a></td>  
										<td><span class="fta">2013.05.02</span></td>
										<td class="check"><span class="check-on">已回复</span></td>
									</tr> 
									<tr class="con"> 
										<td colspan="4">
											<div class="qna-box">
												<div class="q-box">
													회원가입할 때 본인인증이 안됩니다.회원가입할 때 본인인증이 안됩니다.<br />
													회원가입할 때 본인인증이 안됩니다.
												</div>
												<p class="add-file">附件<a href="#" class="file-name">참고화면.JPG</a><a href="#"><img src="/images/shop/cn/mypage/btn_down.gif" alt="下载附件" /></a></p>
												<div class="bg-a">
													<div class="a-box">
														<p class="answer-date">[ 回复日期 : <span>2013.05.02 15:00</span> ]</p>
														다른 문의사항이나, 더 알고 싶으신 점이 있으시면,<br />
														아래의 연락처로 연락주십시오. 상세하게 설명드리겠습니다.<br />
														신세계인터넷면세점 고객센터 : 1577-0161<br />
														항상 더 나은 서비스로 고객님께 다가가는 신세계인터넷면세점이 되겠습니다.<br />
														좋은 하루 되세요.
													</div>
												</div>
												<p class="add-file">附件<a href="#" class="file-name">본인인증_설명.JPG</a><a href="#"><img src="/images/shop/cn/mypage/btn_down.gif" alt="下载附件" /></a></p>
											</div>
										</td>
									</tr>  
									<tr> 
										<td class="sort">会员</td> 
										<td class="subject"><a href="#">적립/포인트 문의드립니다</a></td>  
										<td><span class="fta">2013.05.02</span></td>
										<td class="check"><span class="check">正在准备回复</span></td>
									</tr> 
									<tr class="con"> 
										<td colspan="4">
											<div class="qna-box">
												<div class="q-box">
													회원가입할 때 본인인증이 안됩니다.회원가입할 때 본인인증이 안됩니다.<br />
													회원가입할 때 본인인증이 안됩니다.
												</div>
												<p class="add-file">附件<a href="#" class="file-name">참고화면.JPG</a><a href="#"><img src="/images/shop/cn/mypage/btn_down.gif" alt="下载附件" /></a></p>
												<div class="bg-a">
													<div class="a-box">
														<p class="answer-date">[ 回复日期 : <span>2013.05.02 15:00</span> ]</p>
														다른 문의사항이나, 더 알고 싶으신 점이 있으시면,<br />
														아래의 연락처로 연락주십시오. 상세하게 설명드리겠습니다.<br />
														신세계인터넷면세점 고객센터 : 1577-0161<br />
														항상 더 나은 서비스로 고객님께 다가가는 신세계인터넷면세점이 되겠습니다.<br />
														좋은 하루 되세요.
													</div>
												</div>
												<p class="add-file">附件<a href="#" class="file-name">본인인증_설명.JPG</a><a href="#"><img src="/images/shop/cn/mypage/btn_down.gif" alt="下载附件" /></a></p>
											</div>
										</td>
									</tr>  
									<tr> 
										<td class="sort">交换/退货</td> 
										<td class="subject"><a href="#">쿠폰 문의드립니다</a></td>  
										<td><span class="fta">2013.05.02</span></td>
										<td class="check"><span class="check-on">已回复</span></td>
									</tr> 
									<tr class="con"> 
										<td colspan="4">
											<div class="qna-box">
												<div class="q-box">
													회원가입할 때 본인인증이 안됩니다.회원가입할 때 본인인증이 안됩니다.<br />
													회원가입할 때 본인인증이 안됩니다.
												</div>
												<p class="add-file">附件<a href="#" class="file-name">참고화면.JPG</a><a href="#"><img src="/images/shop/cn/mypage/btn_down.gif" alt="下载附件" /></a></p>
												<div class="bg-a">
													<div class="a-box">
														<p class="answer-date">[ 回复日期 : <span>2013.05.02 15:00</span> ]</p>
														다른 문의사항이나, 더 알고 싶으신 점이 있으시면,<br />
														아래의 연락처로 연락주십시오. 상세하게 설명드리겠습니다.<br />
														신세계인터넷면세점 고객센터 : 1577-0161<br />
														항상 더 나은 서비스로 고객님께 다가가는 신세계인터넷면세점이 되겠습니다.<br />
														좋은 하루 되세요.
													</div>
												</div>
												<p class="add-file">附件<a href="#" class="file-name">본인인증_설명.JPG</a><a href="#"><img src="/images/shop/cn/mypage/btn_down.gif" alt="下载附件" /></a></p>
											</div>
										</td>
									</tr>  
									<tr> 
										<td class="sort">交换/退货</td> 
										<td class="subject"><a href="#">일반 문의드립니다</a></td>  
										<td><span class="fta">2013.05.02</span></td>
										<td class="check"><span class="check-on">已回复</span></td>
									</tr>
									<tr class="con"> 
										<td colspan="4">
											<div class="qna-box">
												<div class="q-box">
													회원가입할 때 본인인증이 안됩니다.회원가입할 때 본인인증이 안됩니다.<br />
													회원가입할 때 본인인증이 안됩니다.
												</div>
												<p class="add-file">附件<a href="#" class="file-name">참고화면.JPG</a><a href="#"><img src="/images/shop/cn/mypage/btn_down.gif" alt="下载附件" /></a></p>
												<div class="bg-a">
													<div class="a-box">
														<p class="answer-date">[ 回复日期 : <span>2013.05.02 15:00</span> ]</p>
														다른 문의사항이나, 더 알고 싶으신 점이 있으시면,<br />
														아래의 연락처로 연락주십시오. 상세하게 설명드리겠습니다.<br />
														신세계인터넷면세점 고객센터 : 1577-0161<br />
														항상 더 나은 서비스로 고객님께 다가가는 신세계인터넷면세점이 되겠습니다.<br />
														좋은 하루 되세요.
													</div>
												</div>
												<p class="add-file">附件<a href="#" class="file-name">본인인증_설명.JPG</a><a href="#"><img src="/images/shop/cn/mypage/btn_down.gif" alt="下载附件" /></a></p>
											</div>
										</td>
									</tr>   
									<tr> 
										<td colspan="5">没有咨询内容。</td>
									</tr> 
								</tbody>  
							</table>
						</div> 	
						
						<div class="pager">
							<a href="#"><img src="//image.ssgdfs.com/images/shop/common/btn_page_first.gif" alt="처음으로" /></a>
							<a href="#"><img src="//image.ssgdfs.com/images/shop/common/btn_page_prev.gif" alt="이전" /></a>
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
							<a href="#"><img src="//image.ssgdfs.com/images/shop/common/btn_page_next.gif" alt="다음" /></a>
							<a href="#"><img src="//image.ssgdfs.com/images/shop/common/btn_page_last.gif" alt="마지막으로" /></a>
						</div>									
					</div>
					  				
					
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