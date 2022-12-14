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
						<a href="#">??????</a><span>&gt;</span><a href="#">????????????</a><span>&gt;</span><a href="#">????????????</a><span>&gt;</span><strong>??????Q&amp;A</strong>
					</div>
			 
					<%@include file="/publish/frontoffice/include/top_mypage.jsp"%><!-- //??????????????? ?????? --> 
						 				
					<h3><img src="/images/shop/cn/mypage/title_qna.gif" alt="??????Q&amp;A" /><span><img src="/images/shop/cn/mypage/explain_inquiries.gif" alt="?????????????????????????????????????????????????????????E-mail????????????????????????E-mail?????????" /></span></h3>	
					 				 
					<div class="table-listhtype">								 
						<div class="list qna">
							<table summary="??????Q&amp;A" class="qna-table">
                    			<caption>??????Q&amp;A</caption>
								<colgroup>  
									<col width="270px" /> 
									<col width="120px" /> 
									<col width="185px" />  
									<col width="120px" />  
									<col width="85px" /> 
								</colgroup>
								<thead>
									<tr> 
										<th scope="row">??????</th> 
										<th scope="row">??????</th> 
										<th scope="row">?????????</th> 
										<th scope="row">?????????</th> 
										<th scope="row">????????????</th>    
									</tr>
								</thead>
								<tbody>   
									<tr>
										<td class="subject"><a href="#">???????????? ?????? ?????????.</a></td>  
										<td class="brand"><span>ANNA SUI</span></td> 
										<td class="model-name"><a href="#"><span>BLEMISH BALM LIGHT</span></a></td> 
										<td><span class="fta">2013.05.02</span></td>
										<td class="check"><span class="check-on">?????????</span></td>
									</tr>
									<tr class="con"> 
										<td colspan="5">
											<div class="qna-box">
												<div class="q-box">
													??????????????? ??? ??????????????? ????????????.??????????????? ??? ??????????????? ????????????.<br />
													??????????????? ??? ??????????????? ????????????.
													<a href="#" class="btn_de"><img src="/images/shop/cn/mypage/btn_delete.gif" alt="??????" /></a>
												</div>
												<p class="add-file">??????<a href="#" class="file-name">????????????.JPG</a><a href="#"><img src="/images/shop/cn/mypage/btn_down.gif" alt="????????????" /></a></p>
												<div class="bg-a">
													<div class="a-box">
														<p class="answer-date">[ ???????????? : <span>2013.05.02 15:00</span> ]</p>
														?????? ??????????????????, ??? ?????? ????????? ?????? ????????????,<br />
														????????? ???????????? ??????????????????. ???????????? ????????????????????????.<br />
														??????????????????????????? ???????????? : 1577-0161<br />
														?????? ??? ?????? ???????????? ???????????? ???????????? ?????????????????????????????? ???????????????.<br />
														?????? ?????? ?????????.
													</div>
												</div>
												<p class="add-file">??????<a href="#" class="file-name">????????????_??????.JPG</a><a href="#"><img src="/images/shop/cn/mypage/btn_down.gif" alt="????????????" /></a></p>
											</div>
										</td>
									</tr>   
									<tr>
										<td class="subject"><a href="#">???????????? ?????? ?????????.</a></td>  
										<td class="brand"><span>JOHN MASTERS ORGANICS</span></td> 
										<td class="model-name"><a href="#"><span>BLEMISH BALM CLASSIC</span></a></td> 
										<td><span class="fta">2013.05.02</span></td>
										<td class="check"><span class="check-on">?????????</span></td>
									</tr>  
									<tr class="con"> 
										<td colspan="5">
											<div class="qna-box">
												<div class="q-box">
													??????????????? ??? ??????????????? ????????????.??????????????? ??? ??????????????? ????????????.<br />
													??????????????? ??? ??????????????? ????????????.
													<a href="#" class="btn_de"><img src="/images/shop/cn/mypage/btn_delete.gif" alt="??????" /></a>
												</div>
												<p class="add-file">??????<a href="#" class="file-name">????????????.JPG</a><a href="#"><img src="/images/shop/cn/mypage/btn_down.gif" alt="????????????" /></a></p>
												<div class="bg-a">
													<div class="a-box">
														<p class="answer-date">[ ???????????? : <span>2013.05.02 15:00</span> ]</p>
														?????? ??????????????????, ??? ?????? ????????? ?????? ????????????,<br />
														????????? ???????????? ??????????????????. ???????????? ????????????????????????.<br />
														??????????????????????????? ???????????? : 1577-0161<br />
														?????? ??? ?????? ???????????? ???????????? ???????????? ?????????????????????????????? ???????????????.<br />
														?????? ?????? ?????????.
													</div>
												</div>
												<p class="add-file">??????<a href="#" class="file-name">????????????_??????.JPG</a><a href="#"><img src="/images/shop/cn/mypage/btn_down.gif" alt="????????????" /></a></p>
											</div>
										</td>
									</tr>    
									<tr>
										<td class="subject"><a href="#">???????????? ?????? ?????????.</a></td>  
										<td class="brand"><span>SK-II</span></td> 
										<td class="model-name"><a href="#"><span>WATCH</span></a></td> 
										<td><span class="fta">2013.05.02</span></td>
										<td class="check"><span class="check">??????????????????</span></td>
									</tr> 
									<tr class="con"> 
										<td colspan="5">
											<div class="qna-box">
												<div class="q-box">
													??????????????? ??? ??????????????? ????????????.??????????????? ??? ??????????????? ????????????.<br />
													??????????????? ??? ??????????????? ????????????.
													<a href="#" class="btn_de"><img src="/images/shop/cn/mypage/btn_delete.gif" alt="??????" /></a>
												</div>
												<p class="add-file">??????<a href="#" class="file-name">????????????.JPG</a><a href="#"><img src="/images/shop/cn/mypage/btn_down.gif" alt="????????????" /></a></p>
												<div class="bg-a">
													<div class="a-box">
														<p class="answer-date">[ ???????????? : <span>2013.05.02 15:00</span> ]</p>
														?????? ??????????????????, ??? ?????? ????????? ?????? ????????????,<br />
														????????? ???????????? ??????????????????. ???????????? ????????????????????????.<br />
														??????????????????????????? ???????????? : 1577-0161<br />
														?????? ??? ?????? ???????????? ???????????? ???????????? ?????????????????????????????? ???????????????.<br />
														?????? ?????? ?????????.
													</div>
												</div>
												<p class="add-file">??????<a href="#" class="file-name">????????????_??????.JPG</a><a href="#"><img src="/images/shop/cn/mypage/btn_down.gif" alt="????????????" /></a></p>
											</div>
										</td>
									</tr>    
									<tr>
										<td class="subject"><a href="#">???????????? ?????? ???????????????.</a></td>  
										<td class="brand"><span>SCHRAMMEK</span></td> 
										<td class="model-name"><a href="#"><span>????????????PITERDELUX SET</span></a></td> 
										<td><span class="fta">2013.05.02</span></td>
										<td class="check"><span class="check">??????????????????</span></td>
									</tr> 
									<tr class="con"> 
										<td colspan="5">
											<div class="qna-box">
												<div class="q-box">
													??????????????? ??? ??????????????? ????????????.??????????????? ??? ??????????????? ????????????.<br />
													??????????????? ??? ??????????????? ????????????.
													<a href="#" class="btn_de"><img src="/images/shop/cn/mypage/btn_delete.gif" alt="??????" /></a>
												</div>
												<p class="add-file">??????<a href="#" class="file-name">????????????.JPG</a><a href="#"><img src="/images/shop/cn/mypage/btn_down.gif" alt="????????????" /></a></p>
												<div class="bg-a">
													<div class="a-box">
														<p class="answer-date">[ ???????????? : <span>2013.05.02 15:00</span> ]</p>
														?????? ??????????????????, ??? ?????? ????????? ?????? ????????????,<br />
														????????? ???????????? ??????????????????. ???????????? ????????????????????????.<br />
														??????????????????????????? ???????????? : 1577-0161<br />
														?????? ??? ?????? ???????????? ???????????? ???????????? ?????????????????????????????? ???????????????.<br />
														?????? ?????? ?????????.
													</div>
												</div>
												<p class="add-file">??????<a href="#" class="file-name">????????????_??????.JPG</a><a href="#"><img src="/images/shop/cn/mypage/btn_down.gif" alt="????????????" /></a></p>
											</div>
										</td>
									</tr>     
									<tr>
										<td class="subject"><a href="#">???????????? ?????? ?????????.</a></td>  
										<td class="brand"><span>DKNY</span></td> 
										<td class="model-name"><a href="#"><span>BLEMISH BALM CLASSIC</span></a></td> 
										<td><span class="fta">2013.05.02</span></td>
										<td class="check"><span class="check-on">?????????</span></td>
									</tr> 
									<tr class="con"> 
										<td colspan="5">
											<div class="qna-box">
												<div class="q-box">
													??????????????? ??? ??????????????? ????????????.??????????????? ??? ??????????????? ????????????.<br />
													??????????????? ??? ??????????????? ????????????.
													<a href="#" class="btn_de"><img src="/images/shop/cn/mypage/btn_delete.gif" alt="??????" /></a>
												</div>
												<p class="add-file">??????<a href="#" class="file-name">????????????.JPG</a><a href="#"><img src="/images/shop/cn/mypage/btn_down.gif" alt="????????????" /></a></p>
												<div class="bg-a">
													<div class="a-box">
														<p class="answer-date">[ ???????????? : <span>2013.05.02 15:00</span> ]</p>
														?????? ??????????????????, ??? ?????? ????????? ?????? ????????????,<br />
														????????? ???????????? ??????????????????. ???????????? ????????????????????????.<br />
														??????????????????????????? ???????????? : 1577-0161<br />
														?????? ??? ?????? ???????????? ???????????? ???????????? ?????????????????????????????? ???????????????.<br />
														?????? ?????? ?????????.
													</div>
												</div>
												<p class="add-file">??????<a href="#" class="file-name">????????????_??????.JPG</a><a href="#"><img src="/images/shop/cn/mypage/btn_down.gif" alt="????????????" /></a></p>
											</div>
										</td>
									</tr>     
									<tr>
										<td class="subject"><a href="#">???????????? ?????? ?????????.</a></td>  
										<td class="brand"><span>DKNY</span></td> 
										<td class="model-name"><a href="#"><span>BLEMISH BALM OHN MASTERS CLASSIC</span></a></td>  
										<td><span class="fta">2013.05.02</span></td>
										<td class="check"><span class="check-on">?????????</span></td>
									</tr>  
									<tr class="con"> 
										<td colspan="5">
											<div class="qna-box">
												<div class="q-box">
													??????????????? ??? ??????????????? ????????????.??????????????? ??? ??????????????? ????????????.<br />
													??????????????? ??? ??????????????? ????????????.
													<a href="#" class="btn_de"><img src="/images/shop/cn/mypage/btn_delete.gif" alt="??????" /></a>
												</div>
												<p class="add-file">??????<a href="#" class="file-name">????????????.JPG</a><a href="#"><img src="/images/shop/cn/mypage/btn_down.gif" alt="????????????" /></a></p>
												<div class="bg-a">
													<div class="a-box">
														<p class="answer-date">[ ???????????? : <span>2013.05.02 15:00</span> ]</p>
														?????? ??????????????????, ??? ?????? ????????? ?????? ????????????,<br />
														????????? ???????????? ??????????????????. ???????????? ????????????????????????.<br />
														??????????????????????????? ???????????? : 1577-0161<br />
														?????? ??? ?????? ???????????? ???????????? ???????????? ?????????????????????????????? ???????????????.<br />
														?????? ?????? ?????????.
													</div>
												</div>
												<p class="add-file">??????<a href="#" class="file-name">????????????_??????.JPG</a><a href="#"><img src="/images/shop/cn/mypage/btn_down.gif" alt="????????????" /></a></p>
											</div>
										</td>
									</tr>     
									<tr>
										<td class="subject"><a href="#">???????????? ?????? ?????????.</a></td>  
										<td class="brand"><span>SMITHS ROSEBUD SALVE</span></td> 
										<td class="model-name"><a href="#"><span>BLEMISH BALM CLASSIC</span></a></td>  
										<td><span class="fta">2013.05.02</span></td>
										<td class="check"><span class="check-on">?????????</span></td>
									</tr>  
									<tr class="con"> 
										<td colspan="5">
											<div class="qna-box">
												<div class="q-box">
													??????????????? ??? ??????????????? ????????????.??????????????? ??? ??????????????? ????????????.<br />
													??????????????? ??? ??????????????? ????????????.
													<a href="#" class="btn_de"><img src="/images/shop/cn/mypage/btn_delete.gif" alt="??????" /></a>
												</div>
												<p class="add-file">??????<a href="#" class="file-name">????????????.JPG</a><a href="#"><img src="/images/shop/cn/mypage/btn_down.gif" alt="????????????" /></a></p>
												<div class="bg-a">
													<div class="a-box">
														<p class="answer-date">[ ???????????? : <span>2013.05.02 15:00</span> ]</p>
														?????? ??????????????????, ??? ?????? ????????? ?????? ????????????,<br />
														????????? ???????????? ??????????????????. ???????????? ????????????????????????.<br />
														??????????????????????????? ???????????? : 1577-0161<br />
														?????? ??? ?????? ???????????? ???????????? ???????????? ?????????????????????????????? ???????????????.<br />
														?????? ?????? ?????????.
													</div>
												</div>
												<p class="add-file">??????<a href="#" class="file-name">????????????_??????.JPG</a><a href="#"><img src="/images/shop/cn/mypage/btn_down.gif" alt="????????????" /></a></p>
											</div>
										</td>
									</tr>     
									<tr>
										<td class="subject"><a href="#">???????????? ?????? ?????????.</a></td>  
										<td class="brand"><span>DKNY</span></td> 
										<td class="model-name"><a href="#"><span>BLEMISH BALM CLASSIC</span></a></td>  
										<td><span class="fta">2013.05.02</span></td>
										<td class="check"><span class="check-on">?????????</span></td>
									</tr>   
									<tr class="con"> 
										<td colspan="5">
											<div class="qna-box">
												<div class="q-box">
													??????????????? ??? ??????????????? ????????????.??????????????? ??? ??????????????? ????????????.<br />
													??????????????? ??? ??????????????? ????????????.
													<a href="#" class="btn_de"><img src="/images/shop/cn/mypage/btn_delete.gif" alt="??????" /></a>
												</div>
												<p class="add-file">??????<a href="#" class="file-name">????????????.JPG</a><a href="#"><img src="/images/shop/cn/mypage/btn_down.gif" alt="????????????" /></a></p>
												<div class="bg-a">
													<div class="a-box">
														<p class="answer-date">[ ???????????? : <span>2013.05.02 15:00</span> ]</p>
														?????? ??????????????????, ??? ?????? ????????? ?????? ????????????,<br />
														????????? ???????????? ??????????????????. ???????????? ????????????????????????.<br />
														??????????????????????????? ???????????? : 1577-0161<br />
														?????? ??? ?????? ???????????? ???????????? ???????????? ?????????????????????????????? ???????????????.<br />
														?????? ?????? ?????????.
													</div>
												</div>
												<p class="add-file">??????<a href="#" class="file-name">????????????_??????.JPG</a><a href="#"><img src="/images/shop/cn/mypage/btn_down.gif" alt="????????????" /></a></p>
											</div>
										</td>
									</tr>    
									<tr>
										<td class="subject"><a href="#">???????????? ?????? ?????????.</a></td>  
										<td class="brand"><span>SMITHS ROSEBUD SALVE</span></td> 
										<td class="model-name"><a href="#"><span>BLEMISH BALM CLASSIC</span></a></td>  
										<td><span class="fta">2013.05.02</span></td>
										<td class="check"><span class="check-on">?????????</span></td>
									</tr> 
									<tr class="con"> 
										<td colspan="5">
											<div class="qna-box">
												<div class="q-box">
													??????????????? ??? ??????????????? ????????????.??????????????? ??? ??????????????? ????????????.<br />
													??????????????? ??? ??????????????? ????????????.
													<a href="#" class="btn_de"><img src="/images/shop/cn/mypage/btn_delete.gif" alt="??????" /></a>
												</div>
												<p class="add-file">??????<a href="#" class="file-name">????????????.JPG</a><a href="#"><img src="/images/shop/cn/mypage/btn_down.gif" alt="????????????" /></a></p>
												<div class="bg-a">
													<div class="a-box">
														<p class="answer-date">[ ???????????? : <span>2013.05.02 15:00</span> ]</p>
														?????? ??????????????????, ??? ?????? ????????? ?????? ????????????,<br />
														????????? ???????????? ??????????????????. ???????????? ????????????????????????.<br />
														??????????????????????????? ???????????? : 1577-0161<br />
														?????? ??? ?????? ???????????? ???????????? ???????????? ?????????????????????????????? ???????????????.<br />
														?????? ?????? ?????????.
													</div>
												</div>
												<p class="add-file">??????<a href="#" class="file-name">????????????_??????.JPG</a><a href="#"><img src="/images/shop/cn/mypage/btn_down.gif" alt="????????????" /></a></p>
											</div>
										</td>
									</tr>      
									<tr>
										<td class="subject"><a href="#">???????????? ?????? ?????????.</a></td>  
										<td class="brand"><span>DKNY</span></td> 
										<td class="model-name"><a href="#"><span>BLEMISH BALM CLASSIC</span></a></td>  
										<td><span class="fta">2013.05.02</span></td>
										<td class="check"><span class="check-on">?????????</span></td>
									</tr> 
									<tr class="con"> 
										<td colspan="5">
											<div class="qna-box">
												<div class="q-box">
													??????????????? ??? ??????????????? ????????????.??????????????? ??? ??????????????? ????????????.<br />
													??????????????? ??? ??????????????? ????????????.
													<a href="#" class="btn_de"><img src="/images/shop/cn/mypage/btn_delete.gif" alt="??????" /></a>
												</div>
												<p class="add-file">??????<a href="#" class="file-name">????????????.JPG</a><a href="#"><img src="/images/shop/cn/mypage/btn_down.gif" alt="????????????" /></a></p>
												<div class="bg-a">
													<div class="a-box">
														<p class="answer-date">[ ???????????? : <span>2013.05.02 15:00</span> ]</p>
														?????? ??????????????????, ??? ?????? ????????? ?????? ????????????,<br />
														????????? ???????????? ??????????????????. ???????????? ????????????????????????.<br />
														??????????????????????????? ???????????? : 1577-0161<br />
														?????? ??? ?????? ???????????? ???????????? ???????????? ?????????????????????????????? ???????????????.<br />
														?????? ?????? ?????????.
													</div>
												</div>
												<p class="add-file">??????<a href="#" class="file-name">????????????_??????.JPG</a><a href="#"><img src="/images/shop/cn/mypage/btn_down.gif" alt="????????????" /></a></p>
											</div>
										</td>
									</tr>   
									<tr> 
										<td colspan="5">?????????????????????</td>
									</tr> 
								</tbody>  
							</table>
						</div> 	
						
						<div class="pager">
							<a href="#"><img src="//image.ssgdfs.com/images/shop/common/btn_page_first.gif" alt="????????????" /></a>
							<a href="#"><img src="//image.ssgdfs.com/images/shop/common/btn_page_prev.gif" alt="??????" /></a>
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
							<a href="#"><img src="//image.ssgdfs.com/images/shop/common/btn_page_next.gif" alt="??????" /></a>
							<a href="#"><img src="//image.ssgdfs.com/images/shop/common/btn_page_last.gif" alt="???????????????" /></a>
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