<%@page contentType="text/html;charset=utf-8" language="java" %> 
					 
					<div class="side-common">	 
						<div class="order-search order-search-type01">
							<form action="#">
								<fieldset>
									<legend>查询可订购时间</legend>
									<p class="title"><img src="/images/shop/cn/common/sub/ordertime_title.gif" alt="查询可订购时间" />
									<img src="/images/shop/cn/common/sub/ordertime_explain.gif" alt="请输入出境地点/出境日期。" /></p>
									<p class="starting">
										<select id="starting" title="출국장소를 선택하세요">
											<option>인천공항</option>
											<option>김해공항</option>
											<option>김포공항</option>
											<option>대구공항</option>
											<option>부산국제부두</option>
											<option>모지항</option>
											<option>영도터미널</option>
										</select>
									</p>
									<p class="date"> 
										<input type="text" class="date term" title="출국일자를 입력하세요" />
									</p> 
									<div class="timebox">
										<p class="time"> 
											<select id="daparture-hour" title="시간을 선택하세요">
												<option>12시</option>
												<option>11시</option>
												<option>10시</option>
												<option>09시</option>
												<option>08시</option>
												<option>07시</option>
											</select>
										</p>
										<p class="time2"> 
											<select id="daparture-min" title="분을 선택하세요">
												<option>선택</option>
											</select>
										</p>
									</div> 
									<p class="sidech"><input type="text" class="sidech" title="항공편명" /><a href="#"><img src="/images/shop/cn/common/sub/btn_sidech.gif" alt="搜索航班号" /></a></p> 
									<p class="btn1"><a href="#"><img src="/images/shop/cn/common/sub/btn_ordertime_sh.gif" alt="查询可订购时间" /></a></p>									
									 
									<div class="pop-box">
										<div class="infobox">	
											<p class="title"><img src="/images/shop/cn/common/sub/ordertime_layertitle.gif" alt="查询可订购时间" /></p>
											<div class="info"> 
												<p class="info-txt">各商品的订购时间会有一些差异。</p>
												<p class="info-tit"><span>2013.08.31 18:30</span><br />
												从仁川机场出境出境时商品订购时间<br />
												截止到 <strong>2013.08.29 18:30</strong>为止。</p>												
												<p class="info-con1">离商品订购截止时间还剩 <strong>D-22 TT:MM:SS</strong></p>
												<p class="btn">
													<a href="#"><img src="/images/shop/cn/common/sub/btn_save.gif" alt="保存" /></a> 
												</p>
											</div>
											<p class="close"><a href="#"><img src="/images/shop/cn/order/btn_close_pop.gif" alt="close" /></a></p>
										</div>
									</div> 
								</fieldset>
							</form>
						</div>
						 
						<div class="order-search">
							<form action="#">
								<fieldset>
									<legend>주문가능 남은시간</legend>									
									<p class="title"><img src="/images/shop/cn/common/sub/ordertime_title.gif" alt="查询可订购时间" />
									<img src="/images/shop/cn/common/sub/ordertime_explain.gif" alt="请输入出境地点/出境日期。" /></p> 
									<!-- <p class="title02"><img src="/images/shop/cn/common/sub/ordertime_title2.gif" alt="주문가능 남은시간" /></p>-->
									<!-- <p class="info-con02">
										<strong>2013년06월19일18시30분</strong><br /> 인천공항 출국
									</p> -->
									<p class="info-con"> 
										<span>可订购时间离出境日期还剩</span><br /> 
										<strong>D-6 23:00:00</strong>
									</p>   
									<p class="btn3"><a href="#"><img src="/images/shop/cn/common/sub/btn_ordertime_resh.gif" alt="再次查询可订购时间" /></a></p>
									
									 
									<div class="pop-box">
										<div class="infobox">	
											<p class="title"><img src="/images/shop/cn/common/sub/ordertime_layertitle.gif" alt="查询可订购时间" /></p>
											<div class="info"> 
												<p class="info-txt">各商品的订购时间会有一些差异。</p>
												<p class="info-tit"><span>2013.08.31 18:30</span><br />
												从仁川机场出境出境时商品订购时间<br />
												截止到 <strong>2013.08.29 18:30</strong>为止。</p>												
												<p class="info-con2">已超过可订购时间，无法进行订购。</p>
												<p class="btn">
													<a href="#"><img src="/images/shop/cn/common/sub/btn_confirm.gif" alt="确认" /></a> 
												</p>
											</div>
											<p class="close"><a href="#"><img src="/images/shop/cn/order/btn_close_pop.gif" alt="close" /></a></p>
										</div>
									</div>  
								</fieldset>
							</form>
						</div>
						 
					</div>			