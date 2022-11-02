package com.waremec.wpt.front.nongshim.action;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.framework.utilities.MapUtil;
import com.waremec.framework.utilities.StringUtil;
import com.waremec.weixin.action.WeixinBaseAction;
import com.waremec.weixin.domain.user.SessionMember;
import com.waremec.wpt.front.domain.SessionSkin;

@Controller("newsFeedNongshimAction")
@Scope(ScopeType.prototype)
public class NewsFeedNongshimAction extends WeixinBaseAction {
	
	private static final long serialVersionUID = 1L;
	
	private String msgId = "";
	private String newsId = "";
	private String mtitle = "";
	private String flag;
	private String body;

	private int pageCurr;
	private int pageUnit;
	private int loginFlag;
	private int shopId;
	private int bbsId;
	private int bbsType;
	private int bbsParentId;
	private int custSysId;
	
	
	//乐享健康
	public String healthyLife(){
		
		jsSdkStting();
		
		SessionMember sessionMember = getSessionMember();
		SessionSkin sessionSkin = getSessionSkin();

		int intCustSysId = 0;
		loginFlag = 0;

		if (sessionMember != null) {
			intCustSysId = sessionMember.getCustSysId();
			loginFlag = 1;
		}

		Map<String, Object> map = new HashMap<String, Object>();
		int shopId=sessionSkin.getShopId();
		map.put("shopId", shopId);
		map.put("userId", null);
		map.put("msgId", StringUtil.emptyToNull(msgId));
		map.put("newsId", StringUtil.emptyToNull(newsId));
		map.put("mtitle", StringUtil.emptyToNull(mtitle));
		if (intCustSysId != 0) {
			map.put("custSysId", intCustSysId);
		}
		List<Map<String, Object>> list = commonService.selectList("NewsFeed.getShopWxNewsItem", map);
		
//		if (!list.isEmpty()) {
//			for(int i=0;i<list.size();i++){
//				MapUtil.convertClob2String(list.get(i));
//			}
//		}
		
		request.put("list", list);
		request.put("loginFlag", loginFlag);
		request.put("intCustSysId", intCustSysId);
		
		return "healthyLife";
	}
	
	//到club页面
	public String club(){
		
		jsSdkStting();
		custSysId=0;
		SessionMember sessionMember = getSessionMember();
		if(sessionMember!=null){
			custSysId=sessionMember.getCustSysId();
		}
		int pageCurr = IntegerUtils.valueOf(getRequest().getParameter("pageCurr"),1);
		Map<String, Object> map = new HashMap<String, Object>();
		
//		int shopId=sessionMember.getShopId();
		map.put("SHOP_ID", shopId);
		map.put("USER_ID", null);
		map.put("BBS_ID", null);
		map.put("BBS_STS", 2);
		map.put("START_DT", null);
		map.put("END_DT", null);
		map.put("TITLE", null);
		map.put("PAGE_CURR", 1);
		map.put("PAGE_UINT", pageCurr*5);
		map.put("ORDERBY", null);
		map.put("BBS_TYPE", 1);
		List<Map<String, Object>> list = commonService.selectList("NewsFeedNongshim.bbsList", map);
		map.put("PARENT_ID", 0);
		List<Map<String, Object>> publishList= commonService.selectList("NewsFeedNongshim.bbsList", map);
		map.put("PAGE_UINT", 99999);
		map.put("PARENT_ID", 1);
		List<Map<String, Object>> replyList= commonService.selectList("NewsFeedNongshim.bbsList", map);
		request.put("list", list);
		request.put("publishList", publishList);
		request.put("replyList", replyList);
		if(publishList.size()> 0){
			int totalCount=(Integer)(publishList.get(0).get("TOTAL_PARENT"));
			int totalPage=totalCount%5==0?totalCount/5:totalCount/5+1;
			request.put("pageCount", totalPage);
		}else{
			request.put("pageCount", 0);
		}
		request.put("custSysId", custSysId);
		map.put("CUST_SYS_ID", custSysId);
    	Map<String,Object> custMap = commonService.select("BBS.getCustDetail",map);
    	String nickName = "无名氏";
    	if(custMap!=null){
    		nickName = custMap.get("CUST_NICK_NM").toString();
    	}
    	request.put("nickName", nickName);
    	request.put("pageCurr", pageCurr);
		return "club";
	}

	//分页
	public String getNextPage(){
		int pageCurr = IntegerUtils.valueOf(getRequest().getParameter("pageCurr"),1);
//		SessionMember sessionMember = getSessionMember();
		Map<String, Object> map = new HashMap<String, Object>();
//		int shopId=sessionMember.getShopId();
		map.put("SHOP_ID", shopId);
		map.put("USER_ID", null);
		map.put("BBS_ID", null);
		map.put("BBS_STS", 2);
		map.put("START_DT", null);
		map.put("END_DT", null);
		map.put("TITLE", null);
		map.put("PAGE_CURR", pageCurr);
		map.put("PAGE_UINT", pageUnit);
		map.put("ORDERBY", null);
		map.put("PARENT_ID", 0);
		map.put("BBS_TYPE", 1);
		List<Map<String, Object>> list= commonService.selectList("NewsFeedNongshim.bbsList", map);
		if(list.size()>0){
			int listSize=list.size();
			int totalCount=(Integer)(list.get(0).get("TOTAL_PARENT"));
			int totalPage=totalCount%pageUnit==0?totalCount/pageUnit:totalCount/pageUnit+1;
			if(pageCurr<totalPage){
				renderJSON(list);
			}else if(pageCurr==totalPage){
				int lastPageCount=totalCount%pageUnit;
				if(lastPageCount==1){
					List<Map<String, Object>> lastPageList=new ArrayList<Map<String, Object>>();
					lastPageList.add(list.get(listSize-1));
					renderJSON(lastPageList);
				}else if(lastPageCount==2){
					List<Map<String, Object>> lastPageList=new ArrayList<Map<String, Object>>();
					lastPageList.add(list.get(listSize-2));
					lastPageList.add(list.get(listSize-1));
					renderJSON(lastPageList);
				}else if(lastPageCount==3){
					List<Map<String, Object>> lastPageList=new ArrayList<Map<String, Object>>();
					lastPageList.add(list.get(listSize-3));
					lastPageList.add(list.get(listSize-2));
					lastPageList.add(list.get(listSize-1));
					renderJSON(lastPageList);
				}else if(lastPageCount==4){
					List<Map<String, Object>> lastPageList=new ArrayList<Map<String, Object>>();
					lastPageList.add(list.get(listSize-4));
					lastPageList.add(list.get(listSize-3));
					lastPageList.add(list.get(listSize-2));
					lastPageList.add(list.get(listSize-1));
					renderJSON(lastPageList);
				}else if(lastPageCount==0){
					List<Map<String, Object>> lastPageList=new ArrayList<Map<String, Object>>();
					lastPageList.add(list.get(listSize-5));
					lastPageList.add(list.get(listSize-4));
					lastPageList.add(list.get(listSize-3));
					lastPageList.add(list.get(listSize-2));
					lastPageList.add(list.get(listSize-1));
					renderJSON(lastPageList);
				}
				
			}else{
				List<Map<String, Object>> listEmpty=new ArrayList<Map<String, Object>>();
				renderJSON(listEmpty);
			}
			request.put("pageCount", totalPage);
		}else{
				List<Map<String, Object>> listEmpty=new ArrayList<Map<String, Object>>();
				renderJSON(listEmpty);
		}
		request.put("pageCurr", pageCurr);
		return NONE;
	}
	
	//获取分页的评论内容
	public String getNextPageReply(){
		
//		SessionMember sessionMember = getSessionMember();
		Map<String, Object> map = new HashMap<String, Object>();
//		int shopId=sessionMember.getShopId();
		map.put("SHOP_ID", shopId);
		map.put("USER_ID", null);
		map.put("BBS_ID", null);
		map.put("BBS_STS", 2);
		map.put("START_DT", null);
		map.put("END_DT", null);
		map.put("TITLE", null);
		map.put("PAGE_CURR", 1);
		map.put("PAGE_UINT", 999999999);
		map.put("ORDERBY", null);
		map.put("PARENT_ID", 1);
		map.put("BBS_TYPE", 1);
		List<Map<String, Object>> list= commonService.selectList("NewsFeedNongshim.bbsList", map);
		renderJSON(list);
		return NONE;
	}
	
	//赞或取消赞
	public String bbsLikeShareInsert(){
		flag="zan";
		custSysId=0;
		SessionMember sessionMember = getSessionMember();
		if(sessionMember!=null){
			custSysId=sessionMember.getCustSysId();
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("SHOP_ID", shopId);
		map.put("BBS_TYPE", bbsType);
		map.put("BBS_ID", bbsId);
		map.put("BBS_PARENT_ID", bbsParentId);
		map.put("CUST_SYS_ID", custSysId);
		map.put("FLG", flag);
		try {
			commonService.select("NewsFeedNongshim.bbsLikeShareInsert", map);
			map.put("status", "success");
		} catch (Exception e) {
			map.put("status", "failed");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		renderJSON(map);
		return NONE;
	}
	
	//评价
	public String bbsContentInsert() throws Exception{
		custSysId=0;
		SessionMember sessionMember = getSessionMember();
//		sessionMember.getCustSysId()
		if(sessionMember!=null){
			custSysId=sessionMember.getCustSysId();
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("JOB_TYPE", "I");
//		map.put("USER_ID", custSysId);
		map.put("SHOP_ID", shopId);
//		bbsType=1;
		map.put("BBS_TYPE", bbsType);
		map.put("BBS_PARENT_ID", bbsParentId);
		map.put("BODY", URLDecoder.decode(body, "UTF-8"));
		map.put("TITLE", "评论");
		map.put("CREATE_ID", custSysId);
		map.put("BBS_STS", 2);
		try {
			commonService.select("NewsFeedNongshim.bbsContentInsert", map);
			map.put("status", "S");// S  or  保存失败
		} catch (Exception e) {
			map.put("status", "F");// S  or  保存失败
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		renderJSON(map);
		return NONE;
	}
	
	//判断是否赞过
	public String getBbsLikeShareCount(){
		custSysId=0;
		SessionMember sessionMember = getSessionMember();
		if(sessionMember!=null){
			custSysId=sessionMember.getCustSysId();
		}
		
		bbsParentId=0;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("SHOP_ID", shopId);
		map.put("BBS_TYPE", bbsType);
		map.put("BBS_ID", bbsId);
		map.put("BBS_PARENT_ID", bbsParentId);
		map.put("CUST_SYS_ID", custSysId);
		map=commonService.select("NewsFeedNongshim.bbsLikeShareSelect", map);
		renderJSON(map);
		return NONE;
	}
	
	public String bbsDetail(){
		
		jsSdkStting();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("SHOP_ID", shopId);
		map.put("BBS_ID", bbsId);
		map.put("BBS_STS", 2);
		SessionMember sessionMember = getSessionMember();
		if(sessionMember!=null){
			custSysId=sessionMember.getCustSysId();
		}else{
			custSysId=0;
		}
		map.put("USER_ID", custSysId);
		//detail
		Map<String,Object> detail= commonService.select("NewsFeedNongshim.bbsList", map);
		request.put("detail", detail);
		//review list
		map.put("PAGE_CURR", 1);
		map.put("PAGE_UINT",10);
		map.put("BBS_PARENT_ID", bbsId);
		map.put("BBS_ID", null);
//		map.put("BBS_TYPE", 1);
		List<Map<String, Object>> replyList= commonService.selectList("NewsFeedNongshim.bbsList", map);
		request.put("replyList", replyList);
		//bbsLikeList
		map.put("BBS_ID", bbsId);
		List<Map<String, Object>> likeList= commonService.selectList("NewsFeedNongshim.bbsLikeList", map);
		request.put("likeList", likeList);
		
		if(replyList.size()>0){
			int totalCount=(Integer)(replyList.get(0).get("NUM"));
			int totalPage=totalCount%10==0?totalCount/10:totalCount/10+1;
			request.put("pageCount", totalPage);
		}else{
			request.put("pageCount", 0);
		}
		return "bbsDetail";
	}
	
	public String getNextReplyOfDeatil(){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("SHOP_ID", shopId);
		map.put("PAGE_CURR", pageCurr);
		map.put("PAGE_UINT",pageUnit);
		map.put("BBS_PARENT_ID", bbsId);
		map.put("BBS_ID", null);
		SessionMember sessionMember = getSessionMember();
		if(sessionMember!=null){
			custSysId=sessionMember.getCustSysId();
		}else{
			custSysId=0;
		}
		map.put("USER_ID", custSysId);
		map.put("BBS_TYPE", 1);
		List<Map<String, Object>> replyList= commonService.selectList("NewsFeedNongshim.bbsList", map);
		renderJSON(replyList);
		return NONE;
	}
	
	public String newsFeedNongshim(){
		jsSdkStting();
		SessionMember sessionMember = getSessionMember();
		SessionSkin sessionSkin = getSessionSkin();

		int intCustSysId = 0;
		loginFlag = 0;

		if (sessionMember != null) {
			intCustSysId = sessionMember.getCustSysId();
			loginFlag = 1;
		}

		Map<String, Object> map = new HashMap<String, Object>();
		int shopId=sessionSkin.getShopId();
		map.put("shopId", shopId);
		map.put("userId", null);
		map.put("msgId", StringUtil.emptyToNull(msgId));
		map.put("newsId", StringUtil.emptyToNull(newsId));
		map.put("mtitle", StringUtil.emptyToNull(mtitle));
		if (intCustSysId != 0) {
			map.put("custSysId", intCustSysId);
		}
		List<Map<String, Object>> list = commonService.selectList("NewsFeed.getShopWxNewsItem", map);
		
		if (!list.isEmpty()) {
			for(int i=0;i<list.size();i++){
				MapUtil.convertClob2String(list.get(i));
			}
		}
		
		Map<String, Object> mapResult = commonService.select("NewsFeed.getShopWxNewsItemBanner", map);
		
		request.put("map", mapResult);
		request.put("list", list);
		request.put("loginFlag", loginFlag);
		request.put("intCustSysId", intCustSysId);
		return "newsFeedNongshim";
	}

	public String detail() {

		jsSdkStting();
		SessionMember sessionMember = getSessionMember();
		SessionSkin sessionSkin = getSessionSkin();
		int intCustSysId = 0;
		loginFlag = 0;

		if (sessionMember != null) {
			intCustSysId = sessionMember.getCustSysId();
			loginFlag = 1;
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("shopId", sessionSkin.getShopId());
		map.put("userId", null);
		map.put("msgId", StringUtil.emptyToNull(msgId));
		map.put("newsId", StringUtil.emptyToNull(newsId));
		map.put("mtitle", StringUtil.emptyToNull(mtitle));
		if (intCustSysId != 0) {
			map.put("custSysId", intCustSysId);
		}

		Map<String, Object> mapResult = commonService.select("NewsFeed.getShopWxNewsItem", map);
		if (!mapResult.isEmpty()) {
			MapUtil.convertClob2String(mapResult);
		}

		request.put("map", mapResult);
		request.put("loginFlag", loginFlag);
		request.put("intCustSysId", intCustSysId);

		return "detail";
	}
	
	//分享
	public String bbsShareInsert(){
		flag="share";
		SessionMember sessionMember = getSessionMember();
		custSysId=sessionMember.getCustSysId();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("SHOP_ID", shopId);
		map.put("BBS_TYPE", bbsType);
		map.put("BBS_ID", bbsId);
		map.put("BBS_PARENT_ID", bbsParentId);
		map.put("CUST_SYS_ID", custSysId);
		map.put("FLG", flag);
		try {
			commonService.select("NewsFeedNongshim.bbsLikeShareInsert", map);
			map.put("status", "success");
		} catch (Exception e) {
			map.put("status", "failed");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		renderJSON(map);
		return NONE;
	}
	
	public String deleteReview(){
		custSysId=0;
		SessionMember sessionMember = getSessionMember();
		if(sessionMember!=null){
			custSysId=sessionMember.getCustSysId();
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("JOB_TYPE", "D");
		map.put("SHOP_ID", shopId);
		map.put("USER_ID", custSysId);
		map.put("BBS_ID", bbsId);
		try {
			commonService.select("NewsFeedNongshim.bbsContentInsert", map);
			map.put("status", "S");// S  or  保存失败
		} catch (Exception e) {
			map.put("status", "F");// S  or  保存失败
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		renderJSON(map);
		return NONE;
	}
	
	public String getAjaxReplyList(){
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("SHOP_ID", shopId);
		map.put("USER_ID", null);
		map.put("BBS_ID", null);
		map.put("BBS_STS", null);
		map.put("START_DT", null);
		map.put("END_DT", null);
		map.put("TITLE", null);
		map.put("ORDERBY", null);
		map.put("BBS_TYPE", null);
		map.put("BBS_ID", null);
		map.put("PARENT_ID", 1);
		map.put("BBS_PARENT_ID", bbsId);
		map.put("PAGE_CURR", 1);
		map.put("PAGE_UINT",99999999);
		List<Map<String, Object>> replyList= commonService.selectList("NewsFeedNongshim.bbsList", map);
		
		renderJSON(replyList);
		return NONE;
	}
	public String getAjaxLikeList(){
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("SHOP_ID", shopId);
		map.put("USER_ID", null);
		map.put("BBS_ID", null);
		map.put("BBS_STS", null);
		map.put("START_DT", null);
		map.put("END_DT", null);
		map.put("TITLE", null);
		map.put("ORDERBY", null);
		map.put("BBS_TYPE", null);
		map.put("PARENT_ID", 0);
		map.put("BBS_ID", bbsId);
		map.put("PAGE_CURR", 1);
		map.put("PAGE_UINT",99999999);
		Map<String, Object> detail= commonService.select("NewsFeedNongshim.bbsList", map);
		renderJSON(detail);
		return NONE;
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

	public int getPageCurr() {
		return pageCurr;
	}

	public void setPageCurr(int pageCurr) {
		this.pageCurr = pageCurr;
	}

	public int getPageUnit() {
		return pageUnit;
	}

	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}

	public int getShopId() {
		return shopId;
	}

	public void setShopId(int shopId) {
		this.shopId = shopId;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public int getBbsId() {
		return bbsId;
	}

	public void setBbsId(int bbsId) {
		this.bbsId = bbsId;
	}

	public int getBbsParentId() {
		return bbsParentId;
	}

	public void setBbsParentId(int bbsParentId) {
		this.bbsParentId = bbsParentId;
	}

	public int getCustSysId() {
		return custSysId;
	}

	public void setCustSysId(int custSysId) {
		this.custSysId = custSysId;
	}

	public int getBbsType() {
		return bbsType;
	}

	public void setBbsType(int bbsType) {
		this.bbsType = bbsType;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

}
