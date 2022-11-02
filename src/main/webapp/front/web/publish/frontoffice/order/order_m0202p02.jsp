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
<link href="/css/selectbox.css" rel="stylesheet" type="text/css" />
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
		
		
		
		
		
									<div class="basket-layer-wrap w630p">
										<div class="layer-head-cn">
											<p class="title">查看及使用优惠券</p>
											<p class="layer-close"><img src="//image.ssgdfs.com/images/shop/order/btn_close_layer.gif" alt="닫기" /></p>
										</div><!-- end layer-head -->
										<div class="layer-body-cn">
											<p class="top-tit "><span class="cn-txt-red01">若顾客信息与出境者信息不一致, 则无法在取货处领取商品, 因此所输入的顾客信息必须与护照上的信息一致。
											</span></p>
											<ul class="cn-layer-txt">
												<li>输入的姓名应与护照上的姓名一致，而且不应留有空白。</li>
												<li>填写名字(First name)时，请不要留空。例：First name为 Gil-Dong时，输入为GILDONG。</li>
												<li>护照号码不应留有空白，且用英文大写字母填写。 </li>
											</ul>
											<div>
												<img src="/images/shop/cn/order/order_guide.gif" alt="" />
											</div><!-- end option -->
											
											<div class="btn-set">
												<a href="#"><img src="/images/shop/cn/order/btn_close_cn.gif" alt="关闭" /></a>
											</div><!-- end btn-set -->
										</div><!-- end layer-body -->
									</div><!-- end basket-layer -->
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		</div><!-- end body -->
		
		
		
		
		
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
</div><!-- end wrapper -->
</body>
</html>



