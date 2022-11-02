<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" /> 
<title>SHINSEGAE 마이페이지</title>
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/member.css" rel="stylesheet" type="text/css" />
<link href="/css/order.css" rel="stylesheet" type="text/css" />
<link href="/css/mypage.css" rel="stylesheet" type="text/css" />
<link href="/css/jquery.ui.datepicker.css" rel="stylesheet" type="text/css" /> 
<link href="/css/jquery.ui.theme.css" rel="stylesheet" type="text/css" />
<link href="/css/selectbox.css" rel="stylesheet" type="text/css" /> 
<link href="/css/jquery.jscrollpane.css" rel="stylesheet" type="text/css" /> 
<!--[if IE 7]><link rel="stylesheet" type="text/css" href="/css/ie7.css"><![endif]-->
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.rotate.js"></script>
<script type="text/javascript" src="/js/jquery/common.js"></script>
<script type="text/javascript" src="/js/jquery/common_mypage.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.core.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.widget.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="/js/jquery/calendar.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.selectbox-0.2.1.js"></script> 
<script type="text/javascript" src="/js/jquery/mwheelIntent.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.mousewheel.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.jscrollpane.min.js"></script>
<script type="text/javascript">
$(function($){
	$('.scroll-pane').jScrollPane({showArrows: true});
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
						<a href="#">主页</a><span>&gt;</span><a href="#">我的页面</a><span>&gt;</span><a href="#">我的信息</a><span>&gt;</span><strong>退出会员</strong>
					</div>
			 
					<%@include file="/publish/frontoffice/include/top_mypage.jsp"%><!-- //마이페이지 공통 -->
			 
					<div class="memberinfo-container">
						<h3><img src="/images/shop/cn/mypage/title_cancel01.gif" alt="退出会员" /></h3> 
						<div class="accreditation-box accreditation-box02"> 
							<div class="scroll-pane">
								<div class="terms-box">
									<p>申请会员退出</p>
									<br />
									<p>会员退出是指会员终止使用新世界网上免税店。会员退出申请之后，经新世界免税店管理员认可方可完成会员退出。</p>
									<br />
									<p>第4条 个人信息的保存以及使用期限</p>
									<br />
									<p>顾客的个人信息在退出会员、丧失资格等达到个人信息的收集及使用目的以后，将即刻销毁该信息。</p>
									<p>并且对于提供给第三方的个人信息，将采取措施使第三方及时销毁该信息。朝鲜酒店将持有的个人信息只用于保存，且保存期限如下。</p>
									<br />
									<p>1. 撤销合同或申购等相关记录</p>
									<p>- 保存原因： 基于电子商务等消费者保护的法律</p>
									<p>- 保存期限： 5年</p>
									<br />
									<p>2. 货款结算及商品供应等记录</p>
									<p>- 保存原因： 基于电子商务等消费者保护的法律</p>
									<p>- 保存期限 ： 5年</p>
									<br />
									<p>3. 关于消费者投诉或纠纷处理的记录</p>
									<p>- 保存原因： 基于电子商务等消费者保护的法律</p>
									<p>- 保存期限 ： 3年</p>
									<br />
									<p>4. 其他事先取得顾客同意的情况 : 所获得同意的期限为止</p>
									<br />
									<p>第5条 个人信息的删除步骤及方法</p>
									<br />
									<p>原则上，朝鲜酒店在实现个人信息收集及使用目的之后，将即刻删除相应信息。具体的删除程序及方法如下。</p>
									<p>1. 销毁步骤</p>
									<br />
									<p>- 删除步骤 - 会员为加入会员等输入的信息在使用目的达成后，根据内部方针和其它有关法规规定的信息保护规定（参考保存及使用期间），在保存一定时间后进行删除或销毁。</p>
									<p>- 个人信息只能依据法律的规定而保存，绝不会用于其他目的。</p>
									<br />
									<p>2. 删除方法</p>
									<br />
									<p>- 在纸张输出的个人信息 : 将用碎纸机切碎或焚毁。</p>
									<p>- 以电子文件形式储存的个人信息: 将用无法还原的删除技术进行删除</p>
									<br />
									<p>第 6条 个人信息的阅览、更正、退出以及撤销同意的方法</p>
									<br />
									<p>① 会员随时可以阅览、更正所注册的会员信息或者退出会员。</p>
									<br />
									<p>A. 访问朝鲜酒店以及直营营业场所、免税店： 确认是本人以后，可阅览、更正个人信息或退出会员。 </p>
									<p>B. 访问朝鲜酒店网页及新世界网上免税店网页： 登陆以后，点击“修改信息”按钮阅览、更正个人信息或退出会员。</p>
									<p>C. 向个人信息管理负责人以书面、电话或邮件的方式进行联系时也会即刻进行处理 。</p>
									<br />
									<p>② 在用户要求对个人信息的错误进行修正时，在修正工作完成前，该个人信息将不被使用或提供。并且如果已经把错误的个人信息提供给第三方，就及时把更正结果通知给第三方以更正错误信息。</p>
									<p>③ 会员同意将本人的个人信息提供给第三方的内容可以通过朝鲜酒店网页及新世界网上免税店网页确认，并随时可以撤销同意。</p>
									<p>④ 依据会员的要求删除的个人信息，朝鲜酒店将根据“个人信息的保存及使用期限”中所示内容进行处理，使其无法为其它的用途浏览和使用。但是，如果法律上有特别规定或必须遵守法律上的义务时，如有可能害及他人的生命或身体；侵害他人的财产及其他利益时，就可以拒绝该要求。并且发生相关问题时，将及时进行通知。</p>
									
									<p>新世界网上免税店</p> 
									<br />
									<p>会员必需信息 •固有识别信息 :护照号码、护照有效期</p>
									<p>• 联系方式信息：地址、电话号码、手机号码、电子邮箱</p>
									<p>• 其他: 姓名、英文姓名、出生年月日、国籍、登陆ID、密码、密码提问与答案、性别、EMS&amp;SMS收信与否、卡付款信息-固有识别信息：用于使用会员制度服务时识别个人</p>
									<br />
									<p>- 联系信息（电子邮箱、电话号码、地址等）：为履行服务联系或通知客户、转达公告事项、不满处理等沟通时使用 </p>
									<p>- 金融信息（信用卡号等）支付会费</p>
									<p>- 其它信息 : (性别、纪念日等)用于编写统计资料或开发、提供顾客个性化服务的资料</p> 
									<p>保存期限截止到申请会员退出为止（但为了防止重复发放积分，登陆ID、护照号码在退出会员后继续保存3年）</p>
									<br />
									<p>网页注册申请书</p> 
									<p>其他选择信息：职业、婚否、纪念日、关注事项</p> 
								</div>
							</div> 
						</div>
						<!-- //accreditation-box -->

						<p class="small-tit"><img src="/images/shop/cn/mypage/title_cancel01_s02.gif" alt="请选择退出新世界免税店会员的理由。(必须)" /></p>
						<div class="accreditation-box">
							<ul class="reason">
								<li><input type="checkbox" id="dissatisfaction" /><label for="dissatisfaction">商品种类/价格/质量不满意</label></li>
								<li><input type="checkbox" id="error" /><label for="error">对系统错误/速度不满意</label></li>
								<li><input type="checkbox" id="difficult" /><label for="difficult">在选择商品, 订购等使用方面有难度</label></li>
								<li><input type="checkbox" id="personal-information" /><label for="personal-information">担心个人信息被泄露</label></li>
								<li><input type="checkbox" id="benefit" /><label for="benefit">会员优惠/购物优惠不足</label></li>
								<li><input type="checkbox" id="use" /><label for="use">不经常使用</label></li>
								<li><input type="checkbox" id="take" /><label for="take">对取货处商品取货不满意</label></li>
								<li><input type="checkbox" id="as" /><label for="as">对取消订购/退货/售后服务不满意</label></li>
							</ul>
						</div> 
						<p class="small-tit small-none"><img src="/images/shop/cn/mypage/title_cancel01_s03.gif" alt="请填写您的留言。" /></p>
						<div class="accreditation-box">
							<textarea cols="120" rows="4"></textarea>
						</div> 
						<div class="btn-set">
							<a href="#"><img src="/images/shop/cn/mypage/btn_cancel_la.gif" alt="取消" /></a>
							<input type="image" src="/images/shop/cn/mypage/btn_cancel_mypage.gif" alt="会员退出申请" />
						</div>	
					</div>
					<!-- end memberinfo-container --> 
					
				
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