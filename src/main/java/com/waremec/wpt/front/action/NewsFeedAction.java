package com.waremec.wpt.front.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.MapUtil;
import com.waremec.framework.utilities.StringUtil;
import com.waremec.weixin.action.WeixinBaseAction;
import com.waremec.weixin.domain.user.SessionMember;
import com.waremec.wpt.front.domain.SessionSkin;

@Controller("newsFeedAction")
@Scope(ScopeType.prototype)
public class NewsFeedAction extends WeixinBaseAction {

	private static final long serialVersionUID = 1L;
	private String shopId = "";
	private String userId = "";
	private String msgId = "";
	private String newsId = "";
	private String mtitle = "";
	private int loginFlag;
	private int pageCurr;
	private int pageUnit;
	private int newsType;

	public String list() {

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
		map.put("pageCurr", 1);
		map.put("pageUnit", 10);
		if (intCustSysId != 0) {
			map.put("custSysId", intCustSysId);
		}
		List<Map<String, Object>> list = commonService.selectList("NewsFeed.getShopWxNewsItemNew", map);
		map.put("newsType", 1);
		List<Map<String, Object>> list1 = commonService.selectList("NewsFeed.getShopWxNewsItemNew", map);
		map.put("newsType", 2);
		List<Map<String, Object>> list2 = commonService.selectList("NewsFeed.getShopWxNewsItemNew", map);
		
		
		Map<String, Object> mapResult = commonService.select("NewsFeed.getShopWxNewsItemBanner", map);
		
		request.put("map", mapResult);
		request.put("list", list);
		request.put("list1", list1);
		request.put("list2", list2);
		request.put("loginFlag", loginFlag);
		request.put("intCustSysId", intCustSysId);
		if(list.size()>0){
			int totalCount=(Integer)(list.get(0).get("TOTAL_CNT"));
			int totalPage=totalCount%10==0?totalCount/10:totalCount/10+1;
			request.put("pageCount", totalPage);
		}else{
			request.put("pageCount", 0);
		}
		if(list1.size()>0){
			int totalCount=(Integer)(list1.get(0).get("TOTAL_CNT"));
			int totalPage=totalCount%10==0?totalCount/10:totalCount/10+1;
			request.put("pageCount1", totalPage);
		}else{
			request.put("pageCount2", 0);
		}
		if(list2.size()>0){
			int totalCount=(Integer)(list2.get(0).get("TOTAL_CNT"));
			int totalPage=totalCount%10==0?totalCount/10:totalCount/10+1;
			request.put("pageCount2", totalPage);
		}else{
			request.put("pageCount2", 0);
		}

		return "list";
	}
	
	
	public String getNextPage(){
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
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		if (intCustSysId != 0) {
			map.put("custSysId", intCustSysId);
		}
		List<Map<String, Object>> list = commonService.selectList("NewsFeed.getShopWxNewsItemNew", map);
		if(list.size()>0){
			int totalCount=(Integer)(list.get(0).get("TOTAL_CNT"));
			int totalPage=totalCount%10==0?totalCount/10:totalCount/10+1;
			request.put("pageCount", totalPage);
		}else{
			request.put("pageCount", 0);
		}
		
		if(list.size()>0){
			int listSize=list.size();
			int totalCount=(Integer)(list.get(0).get("TOTAL_CNT"));
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
				}else if(lastPageCount==5){
					List<Map<String, Object>> lastPageList=new ArrayList<Map<String, Object>>();
					lastPageList.add(list.get(listSize-5));
					lastPageList.add(list.get(listSize-4));
					lastPageList.add(list.get(listSize-3));
					lastPageList.add(list.get(listSize-2));
					lastPageList.add(list.get(listSize-1));
					renderJSON(lastPageList);
				}else if(lastPageCount==6){
					List<Map<String, Object>> lastPageList=new ArrayList<Map<String, Object>>();
					lastPageList.add(list.get(listSize-6));
					lastPageList.add(list.get(listSize-5));
					lastPageList.add(list.get(listSize-4));
					lastPageList.add(list.get(listSize-3));
					lastPageList.add(list.get(listSize-2));
					lastPageList.add(list.get(listSize-1));
					renderJSON(lastPageList);
				}else if(lastPageCount==7){
					List<Map<String, Object>> lastPageList=new ArrayList<Map<String, Object>>();
					lastPageList.add(list.get(listSize-7));
					lastPageList.add(list.get(listSize-6));
					lastPageList.add(list.get(listSize-5));
					lastPageList.add(list.get(listSize-4));
					lastPageList.add(list.get(listSize-3));
					lastPageList.add(list.get(listSize-2));
					lastPageList.add(list.get(listSize-1));
					renderJSON(lastPageList);
				}else if(lastPageCount==8){
					List<Map<String, Object>> lastPageList=new ArrayList<Map<String, Object>>();
					lastPageList.add(list.get(listSize-8));
					lastPageList.add(list.get(listSize-7));
					lastPageList.add(list.get(listSize-6));
					lastPageList.add(list.get(listSize-5));
					lastPageList.add(list.get(listSize-4));
					lastPageList.add(list.get(listSize-3));
					lastPageList.add(list.get(listSize-2));
					lastPageList.add(list.get(listSize-1));
					renderJSON(lastPageList);
				}else if(lastPageCount==9){
					List<Map<String, Object>> lastPageList=new ArrayList<Map<String, Object>>();
					lastPageList.add(list.get(listSize-9));
					lastPageList.add(list.get(listSize-8));
					lastPageList.add(list.get(listSize-7));
					lastPageList.add(list.get(listSize-6));
					lastPageList.add(list.get(listSize-5));
					lastPageList.add(list.get(listSize-4));
					lastPageList.add(list.get(listSize-3));
					lastPageList.add(list.get(listSize-2));
					lastPageList.add(list.get(listSize-1));
					renderJSON(lastPageList);
				}else if(lastPageCount==0){
					List<Map<String, Object>> lastPageList=new ArrayList<Map<String, Object>>();
					lastPageList.add(list.get(listSize-10));
					lastPageList.add(list.get(listSize-9));
					lastPageList.add(list.get(listSize-8));
					lastPageList.add(list.get(listSize-7));
					lastPageList.add(list.get(listSize-6));
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
			request.put("pageCount", 0);
			List<Map<String, Object>> listEmpty=new ArrayList<Map<String, Object>>();
			renderJSON(listEmpty);
		}
		
		
//		request.put("list", list);
//		request.put("loginFlag", loginFlag);
//		request.put("intCustSysId", intCustSysId);
//		renderJSON(list);
		return NONE;
	}
	
	public String getNextPage1(){
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
		map.put("newsType", newsType);
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		if (intCustSysId != 0) {
			map.put("custSysId", intCustSysId);
		}
		List<Map<String, Object>> list = commonService.selectList("NewsFeed.getShopWxNewsItemNew", map);
		if(list.size()>0){
			int totalCount=(Integer)(list.get(0).get("TOTAL_CNT"));
			int totalPage=totalCount%10==0?totalCount/10:totalCount/10+1;
			request.put("pageCount", totalPage);
		}else{
			request.put("pageCount", 0);
		}
		
		if(list.size()>0){
			int listSize=list.size();
			int totalCount=(Integer)(list.get(0).get("TOTAL_CNT"));
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
				}else if(lastPageCount==5){
					List<Map<String, Object>> lastPageList=new ArrayList<Map<String, Object>>();
					lastPageList.add(list.get(listSize-5));
					lastPageList.add(list.get(listSize-4));
					lastPageList.add(list.get(listSize-3));
					lastPageList.add(list.get(listSize-2));
					lastPageList.add(list.get(listSize-1));
					renderJSON(lastPageList);
				}else if(lastPageCount==6){
					List<Map<String, Object>> lastPageList=new ArrayList<Map<String, Object>>();
					lastPageList.add(list.get(listSize-6));
					lastPageList.add(list.get(listSize-5));
					lastPageList.add(list.get(listSize-4));
					lastPageList.add(list.get(listSize-3));
					lastPageList.add(list.get(listSize-2));
					lastPageList.add(list.get(listSize-1));
					renderJSON(lastPageList);
				}else if(lastPageCount==7){
					List<Map<String, Object>> lastPageList=new ArrayList<Map<String, Object>>();
					lastPageList.add(list.get(listSize-7));
					lastPageList.add(list.get(listSize-6));
					lastPageList.add(list.get(listSize-5));
					lastPageList.add(list.get(listSize-4));
					lastPageList.add(list.get(listSize-3));
					lastPageList.add(list.get(listSize-2));
					lastPageList.add(list.get(listSize-1));
					renderJSON(lastPageList);
				}else if(lastPageCount==8){
					List<Map<String, Object>> lastPageList=new ArrayList<Map<String, Object>>();
					lastPageList.add(list.get(listSize-8));
					lastPageList.add(list.get(listSize-7));
					lastPageList.add(list.get(listSize-6));
					lastPageList.add(list.get(listSize-5));
					lastPageList.add(list.get(listSize-4));
					lastPageList.add(list.get(listSize-3));
					lastPageList.add(list.get(listSize-2));
					lastPageList.add(list.get(listSize-1));
					renderJSON(lastPageList);
				}else if(lastPageCount==9){
					List<Map<String, Object>> lastPageList=new ArrayList<Map<String, Object>>();
					lastPageList.add(list.get(listSize-9));
					lastPageList.add(list.get(listSize-8));
					lastPageList.add(list.get(listSize-7));
					lastPageList.add(list.get(listSize-6));
					lastPageList.add(list.get(listSize-5));
					lastPageList.add(list.get(listSize-4));
					lastPageList.add(list.get(listSize-3));
					lastPageList.add(list.get(listSize-2));
					lastPageList.add(list.get(listSize-1));
					renderJSON(lastPageList);
				}else if(lastPageCount==0){
					List<Map<String, Object>> lastPageList=new ArrayList<Map<String, Object>>();
					lastPageList.add(list.get(listSize-10));
					lastPageList.add(list.get(listSize-9));
					lastPageList.add(list.get(listSize-8));
					lastPageList.add(list.get(listSize-7));
					lastPageList.add(list.get(listSize-6));
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
			request.put("pageCount", 0);
			List<Map<String, Object>> listEmpty=new ArrayList<Map<String, Object>>();
			renderJSON(listEmpty);
		}
		
		
//		request.put("list", list);
//		request.put("loginFlag", loginFlag);
//		request.put("intCustSysId", intCustSysId);
//		renderJSON(list);
		return NONE;
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

	// saveShopWxNewsItemLike
	public String savePraise() {

		jsSdkStting();
		
		SessionMember sessionMember = getSessionMember();
		SessionSkin sessionSkin = getSessionSkin();
		//logger.info("222222222222222222");
		//logger.info(sessionMember.toString());
		Map<String, Object> map = new HashMap<String, Object>();
		// shopId = sessionMember.getShopId() + "";
		map.put("custSysId", sessionMember.getCustSysId());
		//logger.info("6666666666666666666666");
		map.put("msgId", StringUtil.emptyToNull(msgId));
		map.put("newsId", StringUtil.emptyToNull(newsId));
		map.put("likeCnt", 1);
		map.put("jobType", "I");
		Map<String, Object> mapResult = commonService.select("NewsFeed.saveShopWxNewsItemLike", map);
		//logger.info("3333333333333333333333");
		Map<String, Object> returnMap = new HashMap<String, Object>();

		try {

			Integer outNewsId = (Integer) mapResult.get("OUT_NEWS_ID");
			String OUT_ERR_MSG = (String) mapResult.get("OUT_ERR_MSG");

			if (outNewsId > 0) {
				//logger.info("444444444444444");
				Integer outLinkFlag = (Integer) mapResult.get("OUT_LINK_FLAG");

				returnMap.put("success", true);
				returnMap.put("outLinkFlag", outLinkFlag);

			} else {
				throw new Exception(OUT_ERR_MSG);
			}

		} catch (Exception e) {
			//logger.info("555555555555555555");
			logger.error(e.getMessage());
			returnMap.put("success", false);
			returnMap.put("err_msg", e.getMessage());
		}
		
		//logger.info("666666666666666666");

		renderJSON(returnMap);

		return NONE;
	}

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


	public int getNewsType() {
		return newsType;
	}


	public void setNewsType(int newsType) {
		this.newsType = newsType;
	}
}
