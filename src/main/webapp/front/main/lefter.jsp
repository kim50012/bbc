<%@ include file="/front/skin/common.jsp"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, target-densitydpi=medium-dpi">
<meta name="format-detection" content="telephone=no" />
<title>MAIN</title>
</head>
<body>

	<!-- header -->
	<header>
<!-- 		waremec -->
	</header>
	<!-- //header -->

	<!-- container -->
	<div id="container">
		<section id="contents">
			<!-- temp01 -->
<%-- 			${temp01[0].HEADER } --%>
<%-- 			<c:forEach var="list" items="${temp01 }" varStatus="status">    --%>
<%-- 				${list.BODY }     --%>
<%-- 			</c:forEach> --%>
<%-- 			${temp01[0].FOOTER } --%>
			<!-- 01 -->
			<!-- ---------------------------------------------------------- -->
			<section class="visualBnr">
				<h2>Banner</h2>
				<div class="sliderList" data-slider="1">
					<ul>
						<li><img src="/front/img_prd/demoComp/bnr1.jpg" alt="" /></li>
						<li><img src="/front/img_prd/demoComp/banner_top_01.png" alt="" /></li>
						<li><img src="/front/img_prd/demoComp/banner_count.png" alt="" /></li>
					</ul>
				</div>
				<div class="sliderpage"></div>
			</section>
			<!-- ---------------------------------------------------------- -->
			
			<!--02-->  
			<!-- ---------------------------------------------------------- -->
			<ul class="menuList">
				<li><span>全部商品</span></li>
				<li><span>店铺介绍</span></li>
				<li><span>我的收藏</span></li>
				<li><span>我的订单</span></li>
			</ul>
			<!-- ---------------------------------------------------------- -->
			
			<div class="split_div"></div>
			
			<!-- 03 coupon list -->
			<!-- ---------------------------------------------------------- -->
			<section class="couponImg">
				<div class="sliderList" data-slider="1">
					<ul>
						<li>
							<img src="/front/skin/main/img/coupon_01.png" alt=""  />
							<img src="/front/skin/main/img/coupon_02.png" alt=""  />
							<img src="/front/skin/main/img/coupon_03.png" alt=""  />
						</li>
						<li>
							<img src="/front/skin/main/img/coupon_04.png" alt=""  />
							<img src="/front/skin/main/img/coupon_05.png" alt=""  />
							<img src="/front/skin/main/img/coupon_06.png" alt=""  />
						</li>
					</ul>
				</div>
			</section>
			<!-- ---------------------------------------------------------- -->
			
			<div class="split_div"></div>
			
			<!-- 04 今日特卖 -->
			<!-- ----------------------------------------------------------- -->
			<div class="salesoff">
				<div class="red_block"></div>
				<span class="category_title">今日特卖</span>
				<div class="more">更多>></div>
				${temp04[0].HEADER }
				${temp04[0].BODY }
				${temp04[1].BODY }
				${temp04[0].FOOTER }
<!-- 				<div class="saleslist"> -->
<!-- 					<ul> -->
<!-- 						<li> -->
<!-- 							<table> -->
<!-- 								<tr> -->
<!-- 									<td width="50%"> -->
<!-- 										<table> -->
<!-- 											<tr> -->
<!-- 												<td> -->
<!-- 													<img alt="" src="/front/img_prd/demoComp/salesoff1.png"> -->
<!-- 												</td> -->
<!-- 											</tr> -->
<!-- 											<tr> -->
<!-- 												<td class="salesoff_td_padding"> -->
<!-- 													<span class="product_title">拼接立领短款款冬羽绒服</span> -->
<!-- 												</td> -->
<!-- 											</tr> -->
<!-- 											<tr> -->
<!-- 												<td class="salesoff_td_padding2"> -->
<!-- 													<span class="price_float">￥</span> -->
<!-- 													<span class="price_int">109</span> -->
<!-- 													<span class="price_float">.00</span> -->
<!-- 													&nbsp; -->
<!-- 													<del class="price_del">￥398.75</del> -->
<!-- 												</td> -->
<!-- 											</tr> -->
<!-- 										</table> -->
<!-- 									</td> -->
<!-- 									<td  width="50%"> -->
<!-- 										<table> -->
<!-- 											<tr> -->
<!-- 												<td> -->
<!-- 													<img alt="" src="/front/img_prd/demoComp/salesoff2.png"> -->
<!-- 												</td> -->
<!-- 											</tr> -->
<!-- 											<tr> -->
<!-- 												<td class="salesoff_td_padding"> -->
<!-- 													<span class="product_title">拼接立领短款款冬羽绒服</span> -->
<!-- 												</td> -->
<!-- 											</tr> -->
<!-- 											<tr> -->
<!-- 												<td class="salesoff_td_padding2"> -->
<!-- 													<span class="price_float">￥</span> -->
<!-- 													<span class="price_int">109</span> -->
<!-- 													<span class="price_float">.00</span> -->
<!-- 													&nbsp; -->
<!-- 													<del class="price_del">￥398.75</del> -->
<!-- 												</td> -->
<!-- 											</tr> -->
<!-- 										</table> -->
<!-- 									</td> -->
<!-- 								</tr> -->
<!-- 							</table> -->
<!-- 						</li> -->
<!-- 					</ul> -->
<!-- 				</div> -->
			</div>
			<!-- ----------------------------------------------------------- -->
			
			<div class="split_div"></div>
			
			<!-- ----------------05hot banner-------------------------------- -->
			<div class="hot">
				<ul>
					<li>
						<img src="/front/img_prd/demoComp/banner_hot.png" alt="" />
					</li>
				</ul>
			</div>
			<!-- ----------------------------------------------------------- -->
			
			<div class="split_div"></div>
			
			<!-- ----------------06热门分类-------------------------------- -->
			<!-- ----------------------------------------------------------- -->
			<div class="salesoff">
				<div class="red_block"></div>
				<span class="category_title">热门分类</span>
				<div class="more">全部>></div>
				<div class="saleslist">
					<ul>
						<li>
							<table>
								<tr>
									<td colspan="2" style="padding-bottom: 5px;">
										<img alt="" src="/front/img_prd/demoComp/category_01.png">
									</td>
									<td style="padding-bottom: 5px;">
										<img alt="" src="/front/img_prd/demoComp/category_02.png">
									</td>
								</tr>
								<tr>
									<td style="padding-bottom: 5px;">
										<img alt="" src="/front/img_prd/demoComp/category_03.png">
									</td>
									<td style="padding-bottom: 5px;">
										<img alt="" src="/front/img_prd/demoComp/category_04.png">
									</td>
									<td style="padding-bottom: 5px;">
										<img alt="" src="/front/img_prd/demoComp/category_05.png">
									</td>
								</tr>
								<tr>
									<td style="padding-bottom: 5px;">
										<img alt="" src="/front/img_prd/demoComp/category_06.png">
									</td>
									<td style="padding-bottom: 5px;">
										<img alt="" src="/front/img_prd/demoComp/category_07.png">
									</td>
									<td style="padding-bottom: 5px;">
										<img alt="" src="/front/img_prd/demoComp/category_08.png">
									</td>
								</tr>
							</table>
						</li>
					</ul>
				</div>
			</div>
			<!-- ----------------------------------------------------------- -->
			<div class="split_div"></div>
			
			<!-- ----------------07 hot banner-------------------------------- -->
			<div class="hot">
				<ul>
					<li>
						<img src="/front/img_prd/demoComp/banner_strong.png" alt="" />
					</li>
				</ul>
			</div>
			<!-- ----------------hot banner-------------------------------- -->
			<div class="split_div"></div>
			<!-- 08今日特卖 -->
			<!-- ----------------------------------------------------------- -->
			<div class="salesoff">
				<div class="red_block"></div>
				<span class="category_title">热门商品</span>
				<div class="more">更多>></div>
					${temp08[0].HEADER }
					${temp08[0].BODY }
					${temp08[1].BODY }
					${temp08[0].BODY }
					${temp08[1].BODY }
					${temp08[0].FOOTER }
<!-- 				<div class="saleslist"> -->
<!-- 					<ul> -->
<!-- 						<li> -->
<!-- 							<table> -->
<!-- 								<tr> -->
<!-- 									<td class="salesoff_td_padding"> -->
<!-- 										<table> -->
<!-- 											<tr> -->
<!-- 												<td colspan="4"> -->
<!-- 													<img alt="" src="/front/img_prd/demoComp/hot_01.png"> -->
<!-- 												</td> -->
<!-- 											</tr> -->
<!-- 											<tr> -->
<!-- 												<td colspan="4"> -->
<!-- 													<span class="headtitle">修身长款棉衣</span> -->
<!-- 													<span class="subtitle">拼接立领短款款冬羽绒服</span> -->
<!-- 												</td> -->
<!-- 											</tr> -->
<!-- 											<tr> -->
<!-- 												<td colspan="2"> -->
<!-- 													<span class="price_float">￥</span> -->
<!-- 													<span class="price_int">109</span> -->
<!-- 													<span class="price_float">.00</span> -->
<!-- 												</td> -->
<!-- 												<td rowspan="2"><div class="red_split"></div></td> -->
<!-- 												<td align="center"><img style="width: 18px;height: 15px;" alt="" src="/front/skin/main/img/favorites_01.png"></td> -->
<!-- 											</tr> -->
<!-- 											<tr> -->
<!-- 												<td class="salesoff_td_padding2"> -->
<!-- 													<del class="price_del">￥398.75</del> -->
<!-- 												</td> -->
<!-- 												<td> -->
<!-- 													<span class="price_del">68人付款</span> -->
<!-- 												</td> -->
<!-- 												<td align="center"><span class="price_del">收藏</span></td> -->
<!-- 											</tr> -->
<!-- 										</table> -->
<!-- 									</td> -->
<!-- 									<td class="salesoff_td_padding"> -->
<!-- 										<table > -->
<!-- 											<tr> -->
<!-- 												<td colspan="4"> -->
<!-- 													<img alt="" src="/front/img_prd/demoComp/hot_02.png"> -->
<!-- 												</td> -->
<!-- 											</tr> -->
<!-- 											<tr> -->
<!-- 												<td colspan="4"> -->
<!-- 													<span class="headtitle">修身长款棉衣</span> -->
<!-- 													<span class="subtitle">拼接立领短款款冬羽绒服</span> -->
<!-- 												</td> -->
<!-- 											</tr> -->
<!-- 											<tr> -->
<!-- 												<td colspan="2"> -->
<!-- 													<span class="price_float">￥</span> -->
<!-- 													<span class="price_int">109</span> -->
<!-- 													<span class="price_float">.00</span> -->
<!-- 												</td> -->
<!-- 												<td rowspan="2"><div class="red_split"></div></td> -->
<!-- 												<td align="center"><img style="width: 18px;height: 15px;" alt="" src="/front/skin/main/img/favorites_01.png"></td> -->
<!-- 											</tr> -->
<!-- 											<tr> -->
<!-- 												<td class="salesoff_td_padding2"> -->
<!-- 													<del class="price_del">￥398.75</del> -->
<!-- 												</td> -->
<!-- 												<td> -->
<!-- 													<span class="price_del">68人付款</span> -->
<!-- 												</td> -->
<!-- 												<td align="center"><span class="price_del">收藏</span></td> -->
<!-- 											</tr> -->
<!-- 										</table> -->
<!-- 									</td> -->
<!-- 								</tr> -->
<!-- 								<tr> -->
<!-- 									<td class="salesoff_td_padding"> -->
<!-- 										<table > -->
<!-- 											<tr> -->
<!-- 												<td colspan="4"> -->
<!-- 													<img alt="" src="/front/img_prd/demoComp/hot_03.png"> -->
<!-- 												</td> -->
<!-- 											</tr> -->
<!-- 											<tr> -->
<!-- 												<td colspan="4"> -->
<!-- 													<span class="headtitle">修身长款棉衣</span> -->
<!-- 													<span class="subtitle">拼接立领短款款冬羽绒服</span> -->
<!-- 												</td> -->
<!-- 											</tr> -->
<!-- 											<tr> -->
<!-- 												<td colspan="2"> -->
<!-- 													<span class="price_float">￥</span> -->
<!-- 													<span class="price_int">109</span> -->
<!-- 													<span class="price_float">.00</span> -->
<!-- 												</td> -->
<!-- 												<td rowspan="2"><div class="red_split"></div></td> -->
<!-- 												<td align="center"><img style="width: 18px;height: 15px;" alt="" src="/front/skin/main/img/favorites_01.png"></td> -->
<!-- 											</tr> -->
<!-- 											<tr> -->
<!-- 												<td class="salesoff_td_padding2"> -->
<!-- 													<del class="price_del">￥398.75</del> -->
<!-- 												</td> -->
<!-- 												<td> -->
<!-- 													<span class="price_del">68人付款</span> -->
<!-- 												</td> -->
<!-- 												<td align="center"><span class="price_del">收藏</span></td> -->
<!-- 											</tr> -->
<!-- 										</table> -->
<!-- 									</td> -->
<!-- 									<td class="salesoff_td_padding"> -->
<!-- 										<table > -->
<!-- 											<tr> -->
<!-- 												<td colspan="4"> -->
<!-- 													<img alt="" src="/front/img_prd/demoComp/hot_04.png"> -->
<!-- 												</td> -->
<!-- 											</tr> -->
<!-- 											<tr> -->
<!-- 												<td colspan="4"> -->
<!-- 													<span class="headtitle">修身长款棉衣</span> -->
<!-- 													<span class="subtitle">拼接立领短款款冬羽绒服</span> -->
<!-- 												</td> -->
<!-- 											</tr> -->
<!-- 											<tr> -->
<!-- 												<td colspan="2"> -->
<!-- 													<span class="price_float">￥</span> -->
<!-- 													<span class="price_int">109</span> -->
<!-- 													<span class="price_float">.00</span> -->
<!-- 												</td> -->
<!-- 												<td rowspan="2"><div class="red_split"></div></td> -->
<!-- 												<td align="center"><img style="width: 18px;height: 15px;" alt="" src="/front/skin/main/img/favorites_01.png"></td> -->
<!-- 											</tr> -->
<!-- 											<tr> -->
<!-- 												<td class="salesoff_td_padding2"> -->
<!-- 													<del class="price_del">￥398.75</del> -->
<!-- 												</td> -->
<!-- 												<td> -->
<!-- 													<span class="price_del">68人付款</span> -->
<!-- 												</td> -->
<!-- 												<td align="center"><span class="price_del">收藏</span></td> -->
<!-- 											</tr> -->
<!-- 										</table> -->
<!-- 									</td> -->
<!-- 								</tr> -->
<!-- 							</table> -->
<!-- 						</li> -->
<!-- 					</ul> -->
<!-- 				</div> -->
			</div>
			<!-- ----------------------------------------------------------- -->
			<div class="split_div"></div>
			
			<!-- ----------------09hot banner-------------------------------- -->
			<div class="hot">
				<ul>
					<li>
						<img src="/front/img_prd/demoComp/banner_count.png" alt="" />
					</li>
				</ul>
			</div>
			<!-- ----------------------------------------------------------- -->
			<div class="split_div"></div>
			
			<!-- -----------------------10 新品上架--------------------      ---------- -->
			<div class="salesoff">
				<div class="red_block"></div>
				<span class="category_title">新品上架</span>
				<div class="more">更多>></div>
			</div>
				${temp10[0].HEADER }
				${temp10[0].BODY }
				${temp10[1].BODY }
				${temp10[0].FOOTER }
<!-- 			<section class="newproduct"> -->
<!-- 				<div class="sliderList" data-slider="1"> -->
<!-- 					<ul> -->
<!-- 						<li> -->
<!-- 							<img src="/front/img_prd/demoComp/new_product_01.png" alt="" style="padding-top: 10px;"/> -->
<!-- 							<img src="/front/img_prd/demoComp/new_product_02.png" alt="" style="padding-top: 10px;"/> -->
<!-- 						</li> -->
<!-- 						<li> -->
<!-- 							<img src="/front/img_prd/demoComp/new_product_02.png" alt="" style="padding-top: 10px;"/> -->
<!-- 							<img src="/front/img_prd/demoComp/new_product_01.png" alt="" style="padding-top: 10px;"/> -->
<!-- 						</li> -->
<!-- 					</ul> -->
<!-- 				</div> -->
			<!-- <div class="sliderpage"></div> -->
<!-- 			</section> -->
			<!-- --------------------------------------------------------- -->
			
			<div class="split_div"></div>
			
			<div class="salesoff">
				<div class="red_block"></div>
				<span class="category_title">精品推荐</span>
				<div class="more">更多>></div>
			</div>
			<!-- ---------------------------------------------------------- -->
				${temp11[0].HEADER }
				${temp11[0].BODY }
				${temp11[1].BODY }
				${temp11[0].FOOTER }
<!-- 			<ul class="recommend"> -->
<!-- 				<li> -->
<!-- 					<a href="#"> -->
<!-- 						<span class="thumb"><img src="/front/img_prd/demoComp/recommend_01.png" alt="" /></span> -->
<!-- 						<span class="brand">伊夫圣罗兰</span> -->
<!-- 						<span class="name">雅诗兰黛凝彩纤长睫毛膏雅诗兰黛凝彩纤长睫毛膏</span> -->
<!-- 						<strong class="price">$184</strong> -->
<!-- 						<del class="price2">$338</del><br/> -->
<!-- 						<span class="detail">58人付款</span> -->
<!-- 						<span class="detail">105人收藏</span> -->
<!-- 						&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 						<img alt="" width="18px" height="15px" src="/front/skin/main/img/favorites_01.png" style="vertical-align: middle;"> -->
<!-- 						<span class="detail_right">已收藏</span> -->
<!-- 					</a> -->
<!-- 				</li> -->
<!-- 				<li> -->
<!-- 					<a href="#"> -->
<!-- 						<span class="thumb"><img src="/front/img_prd/demoComp/recommend_02.png" alt="" /></span> -->
<!-- 						<span class="brand">伊夫圣罗兰</span> -->
<!-- 						<span class="name">雅诗兰黛凝彩纤长睫毛膏雅诗兰黛凝彩纤长睫毛膏</span> -->
<!-- 						<strong class="price">$184</strong> -->
<!-- 						<del class="price2">$338</del><br/> -->
<!-- 						<span class="detail">58人付款</span> -->
<!-- 						<span class="detail">105人收藏</span> -->
<!-- 						&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 						<img alt="" width="18px" height="15px" src="/front/skin/main/img/favorites_01.png" style="vertical-align: middle;"> -->
<!-- 						<span class="detail_right">已收藏</span> -->
<!-- 					</a> -->
<!-- 				</li> -->
<!-- 			</ul>			 -->
		</section>
		<!-- ---------------------------------------------------------- -->
			
		
		<footer>
			<section class="address">
			</section>
		</footer>
		
		
		
	</div>
	<!-- //container -->

</body>
</html>
