<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE &gt; 购物车

</title>
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/order.css" rel="stylesheet" type="text/css" />
<link href="/css/order_cn.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.rotate.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.selectbox-0.2.1.js"></script>
<script type="text/javascript" src="/js/jquery/common.js"></script>
<script type="text/javascript">
jQuery(function($){
	
			/*** select box ***/

			$("#layer-select01").selectbox();
		
			
	});
</script>
</head>
<body>
<div id="wrapper">
	<div id="wrap">
		<%@include file="/publish/frontoffice/include/head.jsp"%>
		<div id="body" >
		
		
		
		
		
			<div class="basket-layer-wrap w480p">
										<div class="layer-head-cn">
											<p class="title">查看及使用优惠券</p>
											<p class="layer-close"><img src="//image.ssgdfs.com/images/shop/order/btn_close_layer.gif" alt="닫기" /></p>
										</div><!-- end layer-head -->
										<div class="layer-body-cn">
											<!--  p class="top-tit"><span>[TAG HEUER]</span> TAG HEUER CARRERA</p  -->
											<div >
												<table summary="상품옵션 재설정 서식"  class="layer-tbl">
													<caption>옵션 설정</caption>
													<colgroup>
														<col width="110px" />
														<col width="*" />
														<col width="110px" />
													</colgroup>
													<thead>
														<tr>
															<th scope="col" >优惠券种类</th>
															<th scope="col" >优惠券种类</th>
															<th scope="col" class="last">优惠券种类</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>一般优惠券</td>
															<td>
																<select id="" title="색상을 선택하세요">
																	<option>색상</option>
																</select>
															</td>
															<td class="last">$20 (约 ￥125.00)</td>
														</tr>
														<tr>
															<td colspan="3" class="last">没有可适用优惠券。</td>
														</tr>
														
													</tbody>
												</table>
											</div><!-- end option -->
											<div class="twin-btn">
												<p class="info-txt">* 7折以下折扣商品限制使用优惠券。</p>
												<div class="btn-r">
													<a href="#"><img src="/images/shop/cn/order/btn_order_i02.gif" alt="下载优惠券" /></a>
												</div>
											</div>
											<div class="btn-set">
												<input type="image" src="/images/shop/cn/order/btn_change.gif" alt="변경" /> 
												<a href="#"><img src="/images/shop/cn/order/btn_opt_reset.gif" alt="취소" /></a>
											</div><!-- end btn-set -->
										</div><!-- end layer-body -->
									</div><!-- end basket-layer -->
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		</div><!-- end body -->
		
		
		
		
		
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
</div><!-- end wrapper -->
</body>
</html>



