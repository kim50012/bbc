<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE</title>
<link href="/css/popup.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.mousewheel.js"></script>
<script type="text/javascript" src="/js/jquery/mwheelIntent.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.jscrollpane.min.js"></script>
<script type="text/javascript">
jQuery(function($){
	$(".coupon-progress").hide();
	$("#coupon01").show();
	$('.inside').jScrollPane({showArrows: true});
	$(".tab-menu ul li a").click(function(){
		$(".coupon-progress").hide();
		$(".tab-menu ul li").removeClass("selected");
		$(this).parent().addClass("selected");
		$($(this).attr("href")).show();
		$('.inside').jScrollPane({showArrows: true});
		return false;
	});

});
</script>
</head>
<body>
<div id="wrap">
	<div id="head">
		<h1><img src="/images/shop/cn/category/h1_compare.gif" alt="商品比较结果" /></h1>
	</div><!-- end head -->
	<div id="body">
		<div class="contents">
			<div class="prbox_scroll">
			
				<div class="category">
					<div class="compare-info">
						<p class="title">商品比较结果</p>
						<div class="compareinfo-box">
							<div  class="compare-wrap">
								<div>
									<table>
										<caption>商品比较结果</caption>
										<colgroup>
											<col width="100px" />
											<col width="171px" />
										</colgroup>
										<tbody>
											<tr>
												<td colspan="2" class="product">
													<p class="event">[키엘 대용량 특가전]</p>
													<p class="photo"><img src="//image.ssgdfs.com/images/shop/category/130X130.gif" alt="" /></p>
													<p class="link-set">
														<a href="#"><img src="/images/shop/cn/category/btn_detail.gif" alt="查看详细" /></a>
														<a href="#"><img src="/images/shop/cn/category/btn_basket.gif" alt="购物车" /></a>
													</p> 
												</td>
											</tr>
											<tr>
												<th scope="row"><span>品牌</span></th>
												<td><p>키엘</p></td>
											</tr>
											<tr>
												<th scope="row"><span>销售价</span></th>
												<td><p>$41</p></td>
											</tr>
											<tr>
												<th scope="row"><span>折扣价</span></th>
												<td><p>$36.90</p></td>
											</tr>
											<tr>
												<th scope="row"><span>积分</span></th>
												<td><p>837원(2%)</p></td>
											</tr>
											<tr>
												<th scope="row"><span>打折券</span></th>
												<td><p>키엘바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운</p></td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="secound-product">
									<table>
										<caption>상품비교화면</caption>
										<colgroup>
											<col width="100px" />
											<col width="171px" />
										</colgroup>
										<tbody>
											<tr>
												<td colspan="2" class="product">
													<p class="event">[바비브라운 할인행사]</p>
													<p class="photo"><img src="//image.ssgdfs.com/images/shop/category/130X13001.gif" alt="" /></p>
													<p class="link-set">
														<a href="#"><img src="/images/shop/cn/category/btn_detail.gif" alt="查看详细" /></a>
														<a href="#"><img src="/images/shop/cn/category/btn_basket.gif" alt="购物车" /></a>
													</p> 
												</td>
											</tr>
											<tr>
												<th scope="row"><span>品牌</span></th>
												<td><p>바비브라운</p></td>
											</tr>
											<tr>
												<th scope="row"><span>销售价</span></th>
												<td><p>$41</p></td>
											</tr>
											<tr>
												<th scope="row"><span>折扣价</span></th>
												<td><p>$36.90</p></td>
											</tr>
											<tr>
												<th scope="row"><span>积分</span></th>
												<td><p>837원(2%)</p></td>
											</tr>
											<tr>
												<th scope="row"><span>打折券</span></th>
												<td><p>바비부라운</p></td>
											</tr>
										</tbody>
									</table>
								</div> 
							</div> 
						</div>
						
						<div class="compareinfo-box">							
							<div class="compare-wrap wrap-type01">
								<div>
									<table>
										<caption>상품비교화면 상세정보</caption>
										<colgroup>
											<col width="100px" />
											<col width="171px" />
										</colgroup>
										<thead>
											<tr>
												<th scope="colgroup" colspan="2">상세정보</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row"><span>性别</span></th>
												<td><p>여자</p></td>
											</tr>
											<tr>
												<th scope="row"><span>颜色</span></th>
												<td><p>블랙</p></td>
											</tr>
											<tr>
												<th scope="row"><span>尺寸</span></th>
												<td><p>XL바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운바비부라운</p></td>
											</tr>
											<tr>
												<th scope="row"><span>规格</span></th>
												<td><p>150ML</p></td>
											</tr>
											<tr>
												<th scope="row"><span>类型</span></th>
												<td><p>A Type</p></td>
											</tr>
											<tr>
												<th scope="row"><span>产地</span></th>
												<td><p>Korea</p></td>
											</tr>
											<tr>
												<th scope="row">
													<span>制造商、<br />
													进口商或销售国</span>
												</th>
												<td><p>매디슨에비뉴</p></td>
											</tr>
											<tr>
												<th scope="row"><span>素材及主要成分</span></th>
												<td><p>금속</p></td>
											</tr>
											<tr>
												<th scope="row"><span>性别</span>	</th>
												<td><p></p></td>
											</tr>
											<tr>
												<th scope="row"><span>颜色</span></th>
												<td><p></p></td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="secound-product">
									<table>
										<caption>상품비교화면 상세정보</caption>
										<colgroup> 
											<col width="100px" />
											<col width="171px" />
										</colgroup>
										<thead>
											<tr>
												<th scope="colgroup" colspan="2">상세정보</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row"><span>性别</span></th>
												<td><p>여자</p></td>
											</tr>
											<tr>
												<th scope="row"><span>颜色</span></th>
												<td><p>블랙</p></td>
											</tr>
											<tr>
												<th scope="row"><span>尺寸</span></th>
												<td><p>XL</p></td>
											</tr>
											<tr>
												<th scope="row"><span>规格</span></th>
												<td><p>150ML</p></td>
											</tr>
											<tr>
												<th scope="row"><span>类型</span></th>
												<td><p>A Type</p></td>
											</tr>
											<tr>
												<th scope="row"><span>产地</span></th>
												<td><p>Korea</p></td>
											</tr>
											<tr>
												<th scope="row">
													<span>制造商、<br />
													进口商或销售国</span>
												</th>
												<td><p>매디슨에비뉴</p></td>
											</tr>
											<tr>
												<th scope="row"><span>素材及主要成分</span></th>
												<td><p>금속</p></td>
											</tr>
											<tr>
												<th scope="row"><span>性别</span></th>
												<td><p></p></td>
											</tr>
											<tr>
												<th scope="row"><span>颜色</span></th>
												<td><p></p></td>
											</tr>
										</tbody>
									</table>
								</div> 
							</div> 
						</div>
						
						<p class="btn-set"><a href="#"><img src="/images/shop/cn/category/btn_close.gif" alt="close" /></a></p>
					</div><!-- end  compare-info -->
				</div><!-- end category -->
			</div>
		</div>
	</div><!-- end body -->
</div><!-- end wrap -->
</body>
</html>

