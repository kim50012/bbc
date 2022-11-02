package com.waremec.wpt.front.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.SessionUtils;
import com.waremec.framework.utilities.StringUtil;
import com.waremec.weixin.action.WeixinBaseAction;
import com.waremec.weixin.domain.user.SessionMember;
import com.waremec.wpt.front.domain.SessionSkin;
@Controller("koreanairAction")
@Scope(ScopeType.prototype)
public class KoreanairAction extends WeixinBaseAction {
	
	private static final long serialVersionUID = 1L;
	private String shopId="";
	private String userId="";
	private String msgId="";
	private String newsId="";
	private String mtitle="";
	private String answer1="";
	private String answer2="";
	private String phone="";
	private int loginFlag;
	private String letterId="0";
	private String openId="";
	private String orderBy="";
	private String reviewId="";
	private String reviewOpenId="";
	private String reviewBody="";
	private String reviewType="";
	private String reviewFileId="";
	private String newsCdTp="";
	
	
	public String newsoutes() {
		jsSdkStting();
		
		return "newsoutes";
	}
	public String actionFinished(){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("letterId", letterId);
		List<Map<String,Object>> list=commonService.selectList("MessageList.selectCustWinList", map);
		request.put("list", list);
		return "actionFinished";
	}
	//打开列表页面
	public String messageList(){
		
		jsSdkStting();
		
		SessionMember sessionMember = getSessionMember();
		logger.info("sessionMember_followpage====start");
		if (sessionMember == null) {
			
			logger.info("sessionMember_followpage====ing");
			return "followpage";
		}
		logger.info("sessionMember_followpage====end");
		
		
		 
		Map<String,Object> map=new HashMap<String,Object>();
		openId=sessionMember.getOpenid();
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		map.put("letterId", letterId);
		map.put("openId", StringUtil.emptyToNull(openId));
		map.put("orderBy", StringUtil.emptyToNull(orderBy));
		List<Map<String,Object>> list=commonService.selectList("MessageList.getMessageList", map);
		request.put("list", list);
		request.put("orderBy", orderBy);
		if(!list.isEmpty()){
			Integer total=(Integer) list.get(0).get("TOTAL_COUNT");
			request.put("total", total);
			double pageit=(double)pageUnit;
			int pageNum=(int) Math.ceil(total/pageit);
			request.put("pageNum", pageNum);
		}
		request.put("letterId", letterId);
		return "messageList";
	}
	//发表新的助威评论
	public String saveLetterReview(){
		SessionMember sessionMember = getSessionMember();
		Map<String,Object> map=new HashMap<String,Object>();
		try{
			openId=sessionMember.getOpenid();
			reviewBody=new String(reviewBody.getBytes("ISO-8859-1"),"UTF-8");
			map.put("letterId", letterId);
			map.put("reviewOpenId", StringUtil.emptyToNull(openId));
			map.put("reviewFileId",reviewFileId );
			map.put("reviewId",StringUtil.emptyToNull(reviewId));
			map.put("reviewBody", reviewBody);
			map.put("reviewType", reviewType);
		}catch(Exception e){
			e.printStackTrace();
		}
		Map<String,Object> mapResult=commonService.select("MessageList.saveLetterReview", map);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("map", mapResult);
		renderJSON(returnMap);
		return NONE;
	}
	//是否给评论助威
	public String saveReviewLike(){
		SessionMember sessionMember = getSessionMember();
		Map<String,Object> map=new HashMap<String,Object>();
		openId=sessionMember.getOpenid();
		map.put("letterId", letterId);
		map.put("openId", StringUtil.emptyToNull(openId));
		map.put("reviewOpenId",reviewOpenId );
		map.put("reviewId",reviewId );
		Map<String,Object> mapResult=commonService.select("MessageList.saveReview", map);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("map", mapResult);
		renderJSON(returnMap);
		return NONE;
	}
	//页面上滑时候加载信息
	public String getNextMessageList(){
		Map<String,Object> map=new HashMap<String,Object>();
		SessionMember sessionMember = getSessionMember();
		openId=sessionMember.getOpenid();
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		map.put("letterId", letterId);
		map.put("openId", StringUtil.emptyToNull(openId));
		map.put("orderBy", StringUtil.emptyToNull(orderBy));
		List<Map<String,Object>> list=commonService.selectList("MessageList.getMessageList", map);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("list", list);
		renderJSON(returnMap);
		return NONE;
	}
	public String index(){

		jsSdkStting();
		SessionMember sessionMember = getSessionMember();
		SessionSkin sessionSkin = getSessionSkin();
		
		int intCustSysId = 0;
		loginFlag = 0;
				
		if (sessionMember != null) {
			intCustSysId = sessionMember.getCustSysId();
			loginFlag = 1;
		}
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId", sessionSkin.getShopId());
		map.put("SHOP_ID", sessionSkin.getShopId());
		map.put("userId", null);
		map.put("msgId", StringUtil.emptyToNull(msgId));
		map.put("newsId", StringUtil.emptyToNull(newsId));
		map.put("mtitle", StringUtil.emptyToNull(mtitle));
		if (intCustSysId != 0) {
			map.put("custSysId", intCustSysId);
		}
		
		List<Map<String,Object>> list = commonService.selectList("NewsFeed.getShopWxNewsItem", map);
		List<Map<String,Object>> bannerList = commonService.selectList("Main.getShopBannerList", map);
		
		request.put("list", list);
		request.put("bannerList", bannerList);
		request.put("loginFlag", loginFlag);
		request.put("intCustSysId", intCustSysId);
		
		return "index";
	}
	
	public String index2(){

		jsSdkStting();
		SessionMember sessionMember = getSessionMember();
		SessionSkin sessionSkin = getSessionSkin();
		
		int intCustSysId = 0;
		loginFlag = 0;
				
		if (sessionMember != null) {
			intCustSysId = sessionMember.getCustSysId();
			loginFlag = 1;
		}
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId", sessionSkin.getShopId());
		map.put("SHOP_ID", sessionSkin.getShopId());
		map.put("userId", null);
		map.put("msgId", StringUtil.emptyToNull(msgId));
		map.put("newsId", StringUtil.emptyToNull(newsId));
		map.put("mtitle", StringUtil.emptyToNull(mtitle));
		if (intCustSysId != 0) {
			map.put("custSysId", intCustSysId);
		}
		
		List<Map<String,Object>> list = commonService.selectList("NewsFeed.getShopWxNewsItem", map);
		List<Map<String,Object>> bannerList = commonService.selectList("Main.getShopBannerList", map);
		
		request.put("list", list);
		request.put("bannerList", bannerList);
		request.put("loginFlag", loginFlag);
		request.put("intCustSysId", intCustSysId);
		
		return "index2";
	}
	public String transferInfo(){

		jsSdkStting();
		SessionMember sessionMember = getSessionMember();
		SessionSkin sessionSkin = getSessionSkin();
		
		/*int intCustSysId = 0;
		loginFlag = 0;
				
		if (sessionMember != null) {
			intCustSysId = sessionMember.getCustSysId();
			loginFlag = 1;
		}
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId", sessionSkin.getShopId());
		map.put("userId", null);
		map.put("msgId", StringUtil.emptyToNull(msgId));
		map.put("newsId", StringUtil.emptyToNull(newsId));
		map.put("mtitle", StringUtil.emptyToNull(mtitle));
		if (intCustSysId != 0) {
			map.put("custSysId", intCustSysId);
		}
		
		List<Map<String,Object>> list=commonService.selectList("NewsFeed.getShopWxNewsItem", map);
		
		request.put("list", list);
		request.put("loginFlag", loginFlag);
		request.put("intCustSysId", intCustSysId);*/
		
		return "transferInfo";
	}
	

	public String answer1(){
		
		SessionMember sessionMember = getSessionMember();
		logger.info("sessionMember_followpage====start");
		if (sessionMember == null) {
			
			logger.info("sessionMember_followpage====ing");
			return "followpage";
		}
		logger.info("sessionMember_followpage====end");
		
		return "answer1";
	}
	
	public String answer2() throws Exception{
		
		SessionMember sessionMember = getSessionMember();
		logger.info("sessionMember_followpage====start");
		if (sessionMember == null) {
			
			logger.info("sessionMember_followpage====ing");
			return "followpage";
		}
		logger.info("sessionMember_followpage====end");
		
		answer1=new String (answer1.getBytes("ISO-8859-1"),"UTF-8"); 
		
		return "answer2";
	}
	public String phone() throws Exception{
		
		SessionMember sessionMember = getSessionMember();
		logger.info("sessionMember_followpage====start");
		if (sessionMember == null) {
			
			logger.info("sessionMember_followpage====ing");
			return "followpage";
		}
		logger.info("sessionMember_followpage====end");
		
		answer1=new String (answer1.getBytes("ISO-8859-1"),"UTF-8"); 
		answer2=new String (answer2.getBytes("ISO-8859-1"),"UTF-8"); 
		
		return "phone";
	}
	
	public String addRoute(){
		String ret="";
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("LETTER_ID", "2");
		map.put("SHOP_ID", sessionMember.getShopId());
		map.put("OPENID", sessionMember.getCustSysId());
		map.put("ANSWER1", answer1);
		map.put("ANSWER2", answer2);
		map.put("ANSWER3", phone);
		try {
			Map<String,Object> mapFlag=commonService.select("Koreanair.addRoute", map);
			String flag=(String) mapFlag.get("OUT_ERR_MSG");
			if(flag=="S" || "S".equals(flag)){
				ret="success";
			}else{
				ret="fail";
			}
		} catch (Exception e) {
			e.printStackTrace();
			ret="fail";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		renderJSON(returnMap);
		return NONE;
	}
	public String thanks(){
		return "thanks";
	}
	public String csr(){
		
		jsSdkStting();

		return "csr";
	}
	public String csr1(){
		
		jsSdkStting();

		return "csr1";
	}
	
	public String end(){
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("EVENT_ID", 1);
		List<Map<String,Object>> list=commonService.selectList("Koreanair.prizeList", map);
		request.put("prizeList", list);
		return "end";
	}
	
	public String indexDream(){
		
		jsSdkStting();

		return "indexDream";
	}
	
	//保存分享的信息
	public String share(){
		String ret="success";
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		
		try{
			Map<String,Object> map=new HashMap<String, Object>();
			map.put("LETTER_ID", "6");
			map.put("SHOP_ID", sessionMember.getShopId());
			map.put("OPENID", sessionMember.getOpenid());
	
			Map<String,Object> mapFlag=commonService.select("Koreanair.share", map);
		
		}catch(Exception e){
			e.printStackTrace();
			ret="fail";
		}
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		renderJSON(returnMap);
		return NONE;
	}
	
	
	/////////////////////////////////////////////////////////
	// ST Version 2 new Site by dikim on 20160725

	//ka_main.jsp
	public String kaMain() throws Exception{
		
//		logger.info("sessionMember_followpage====start");
//		if (sessionMember == null) {
//			
//			logger.info("sessionMember_followpage====ing");
//			return "followpage";
//		}
//		logger.info("sessionMember_followpage====end");


		jsSdkStting();
		SessionMember sessionMember = getSessionMember();
		SessionSkin sessionSkin = getSessionSkin();
		
		int intCustSysId = 0;
		loginFlag = 0;
				
		if (sessionMember != null) {
			intCustSysId = sessionMember.getCustSysId();
			loginFlag = 1;
		}
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId", sessionSkin.getShopId());
		map.put("SHOP_ID", sessionSkin.getShopId());
		map.put("userId", null);
		map.put("msgId", null);
		map.put("newsId", null);
		map.put("mtitle", null);
		map.put("pageCurr", 1);
		map.put("pageUnit", 2);
		map.put("newsCdTp", "NN");
		if (intCustSysId != 0) {
			map.put("custSysId", intCustSysId);
		}
		
		List<Map<String,Object>> list = commonService.selectList("NewsFeed.getShopWxNewsItemKa", map);
		
		request.put("list", list);
		request.put("loginFlag", loginFlag);
		request.put("intCustSysId", intCustSysId);
		
		return "kaMain";
	}

	//ka_list.jsp
	public String kaList() throws Exception{
		
		return "kaList";
	}

	//ka_view.jsp
	public String kaView() throws Exception{
		
		return "kaView";
	}

	//ka_special_offer_list.jsp
	public String kaSpecialOfferList() throws Exception{

		jsSdkStting();
		SessionMember sessionMember = getSessionMember();
		SessionSkin sessionSkin = getSessionSkin();
		
		int intCustSysId = 0;
		loginFlag = 0;
				
		if (sessionMember != null) {
			intCustSysId = sessionMember.getCustSysId();
			loginFlag = 1;
		}
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId", sessionSkin.getShopId());
		map.put("SHOP_ID", sessionSkin.getShopId());
		map.put("userId", null);
		map.put("msgId", null);
		map.put("newsId", null);
		map.put("mtitle", null);
		map.put("pageCurr", 1);
		map.put("pageUnit", 10);
		map.put("newsCdTp", "SP");
		if (intCustSysId != 0) {
			map.put("custSysId", intCustSysId);
		}
		
		List<Map<String,Object>> list = commonService.selectList("NewsFeed.getShopWxNewsItemKa", map);
		
		request.put("list", list);
		request.put("loginFlag", loginFlag);
		request.put("intCustSysId", intCustSysId);
		
		return "kaSpecialOfferList";
	}

	//ka_news_notice_list.jsp
	public String kaNewsNoticeList() throws Exception{

		jsSdkStting();
		SessionMember sessionMember = getSessionMember();
		SessionSkin sessionSkin = getSessionSkin();
		
		int intCustSysId = 0;
		loginFlag = 0;
				
		if (sessionMember != null) {
			intCustSysId = sessionMember.getCustSysId();
			loginFlag = 1;
		}
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId", sessionSkin.getShopId());
		map.put("SHOP_ID", sessionSkin.getShopId());
		map.put("userId", null);
		map.put("msgId", null);
		map.put("newsId", null);
		map.put("mtitle", null);
		map.put("pageCurr", 1);
		map.put("pageUnit", 10);
		map.put("newsCdTp", "NN");
		if (intCustSysId != 0) {
			map.put("custSysId", intCustSysId);
		}
		
		List<Map<String,Object>> list = commonService.selectList("NewsFeed.getShopWxNewsItemKa", map);
		
		request.put("list", list);
		request.put("loginFlag", loginFlag);
		request.put("intCustSysId", intCustSysId);
		
		return "kaNewsNoticeList";
	}

	//ka_promotions_list.jsp
	public String kaPromotionsList() throws Exception{

		jsSdkStting();
		SessionMember sessionMember = getSessionMember();
		SessionSkin sessionSkin = getSessionSkin();
		
		int intCustSysId = 0;
		loginFlag = 0;
				
		if (sessionMember != null) {
			intCustSysId = sessionMember.getCustSysId();
			loginFlag = 1;
		}
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId", sessionSkin.getShopId());
		map.put("SHOP_ID", sessionSkin.getShopId());
		map.put("userId", null);
		map.put("msgId", null);
		map.put("newsId", null);
		map.put("mtitle", null);
		map.put("pageCurr", 1);
		map.put("pageUnit", 10);
		map.put("newsCdTp", "PR");
		if (intCustSysId != 0) {
			map.put("custSysId", intCustSysId);
		}
		
		List<Map<String,Object>> list = commonService.selectList("NewsFeed.getShopWxNewsItemKa", map);
		
		request.put("list", list);
		request.put("loginFlag", loginFlag);
		request.put("intCustSysId", intCustSysId);
		
		return "kaPromotionsList";
	}

	public String kaNewsListSelect(){
		
		SessionSkin sessionSkin = getSessionSkin();

		Map<String,Object> map=new HashMap<String,Object>();
		
		try{
			map.put("shopId", sessionSkin.getShopId());
			map.put("SHOP_ID", sessionSkin.getShopId());
			map.put("userId", null);
			map.put("msgId", null);
			map.put("newsId", null);
			map.put("mtitle", null);
			map.put("pageCurr", pageCurr);
			map.put("pageUnit", pageUnit);
			map.put("newsCdTp", newsCdTp);
		}catch(Exception e){
			e.printStackTrace();
		}
		Map<String,Object> mapResult=commonService.select("MessageList.getShopWxNewsItemKa", map);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("map", mapResult);
		renderJSON(returnMap);
		return NONE;
	}
	
	
	
	
	// ED Version 2 new Site by dikim on 20160725
	/////////////////////////////////////////////////////////
	
	
	
	
	///////////////////////////////getter and setter//////////////////////////////////////////////////////////
	public String getShopId() {
		return shopId;
	}
	public void setShopId(String shopId) {
		this.shopId = shopId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getMsgId() {
		return msgId;
	}
	public void setMsgId(String msgId) {
		this.msgId = msgId;
	}
	public String getNewsId() {
		return newsId;
	}
	public void setNewsId(String newsId) {
		this.newsId = newsId;
	}
	public String getMtitle() {
		return mtitle;
	}
	public void setMtitle(String mtitle) {
		this.mtitle = mtitle;
	}
	public int getLoginFlag() {
		return loginFlag;
	}
	public void setLoginFlag(int loginFlag) {
		this.loginFlag = loginFlag;
	}

	public String getAnswer1() {
		return answer1;
	}

	public void setAnswer1(String answer1) {
		this.answer1 = answer1;
	}

	public String getAnswer2() {
		return answer2;
	}

	public void setAnswer2(String answer2) {
		this.answer2 = answer2;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getLetterId() {
		return letterId;
	}
	public void setLetterId(String letterId) {
		this.letterId = letterId;
	}
	public String getOpenId() {
		return openId;
	}
	public void setOpenId(String openId) {
		this.openId = openId;
	}
	public String getOrderBy() {
		return orderBy;
	}
	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}
	public String getReviewId() {
		return reviewId;
	}
	public void setReviewId(String reviewId) {
		this.reviewId = reviewId;
	}
	public String getReviewOpenId() {
		return reviewOpenId;
	}
	public void setReviewOpenId(String reviewOpenId) {
		this.reviewOpenId = reviewOpenId;
	}
	public String getReviewBody() {
		return reviewBody;
	}
	public void setReviewBody(String reviewBody) {
		this.reviewBody = reviewBody;
	}
	public String getReviewType() {
		return reviewType;
	}
	public void setReviewType(String reviewType) {
		this.reviewType = reviewType;
	}
	public String getReviewFileId() {
		return reviewFileId;
	}
	public void setReviewFileId(String reviewFileId) {
		this.reviewFileId = reviewFileId;
	}
	public String getNewsCdTp() {
		return newsCdTp;
	}
	public void setNewsCdTp(String newsCdTp) {
		this.newsCdTp = newsCdTp;
	}
	
}
