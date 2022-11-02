package com.waremec.wpt.front.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.PageData;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.framework.utilities.ListUtil;
import com.waremec.weixin.action.WeixinBaseAction;
import com.waremec.weixin.domain.user.SessionMember;


@Controller("skinListAction")
@Scope(ScopeType.prototype)
public class SkinListAction extends WeixinBaseAction {

	private static final long serialVersionUID = 1L;
				private  Integer newsType;
				private Integer pgCurr=1;
				private Integer pgUnit=5;
				private Integer newsId;
				private Integer msgId;
				private Integer newsClass;
		public String newslist(){
			SessionMember sessionMember = getSessionMember();
			try {
				Map<String,Object> map=new HashMap<String,Object>();
				map.put("newsType",newsType);
				map.put("pageCurr", pgCurr);
				map.put("pageUint", pgUnit);
				List<Map<String,Object>> list=commonService.selectList("DaHan.shop_dahan_news_list", map);
				ListUtil.convertClob2String(list);
				PageData page = new PageData();
				if(!list.isEmpty()){
					int totalCount = IntegerUtils.valueOf(list.get(0).get("TOTAL_CNT"));
					page = new PageData(pageCurr,pageUnit, totalCount , list);
				}
				map.clear();
				map.put("shopId", sessionMember.getShopId());
				map.put("tbName", "SHOP_WX_NEWS_ITEM");
				map.put("fdName", "NEWS_TYPE");
				map.put("isDelete",0);
				map.put("cdId",null);
				request.put("list", commonService.selectList("Material.CM_CODE_CONTROL_SELECT", map));
				request.put("page", page);
			} catch (Exception e) {
				e.getStackTrace();
			}
			return "newslist";
		}
		public String ajaxNewsList(){
			System.out.println("-----------");
			int curr=pgCurr.intValue()+1;
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("newsType",newsType);
			map.put("pageCurr", curr);
			map.put("pageUint", pgUnit);
			List<Map<String,Object>> list=commonService.selectList("DaHan.shop_dahan_news_list", map);
			ListUtil.convertClob2String(list);
			PageData page = new PageData();
			Map<String,Object> rtnMap = new HashMap<String,Object>();
			if(!list.isEmpty()){
				int totalCount = IntegerUtils.valueOf(list.get(0).get("TOTAL_CNT"));
				page = new PageData(curr,pageUnit, totalCount , list);
			}else{
				rtnMap.put("success", false);
				rtnMap.put("msg", "抱歉,暂没有消息了..");
				renderJSON(rtnMap);
				return NONE;
			}
			
			if(curr>(Integer)page.getTotalPageCount()){
				rtnMap.put("success", false);
				rtnMap.put("msg", "抱歉,暂没有消息了..");
				renderJSON(rtnMap);
				return NONE;
			}
			map.clear();
			SessionMember sessionMember = getSessionMember();
			map.put("shopId", sessionMember.getShopId());
			map.put("tbName", "SHOP_WX_NEWS_ITEM");
			map.put("fdName", "NEWS_TYPE");
			map.put("isDelete",0);
			map.put("cdId",null);
			rtnMap.put("list", commonService.selectList("Material.CM_CODE_CONTROL_SELECT", map));
			rtnMap.put("success", true);
			rtnMap.put("page", page);
			rtnMap.put("totalPage", page.getTotalPageCount());
			renderJSON(rtnMap);
			
			return NONE;
		}
		
public String newsview(){
	jsSdkStting();
	Map<String,Object> map=new HashMap<String,Object>();
	map.put("newsId",newsId);
	map.put("msgId", msgId);
	map.put("newsClass", 0);
	List<Map<String,Object>> list=commonService.selectList("DaHan.shop_dahan_news_upcnt", map);
	ListUtil.convertClob2String(list);
	request.put("list", list);
	return "newsview";
}
public String updateNewsCnt(){
	SessionMember sessionMember = getSessionMember();
	System.out.println("======================="+sessionMember.getCustSysId());
	Map<String,Object> map=new HashMap<String,Object>();
	map.put("newsId",newsId);
	map.put("msgId", msgId);
	map.put("newsClass", newsClass);
	map.put("custId", sessionMember.getCustSysId());

	Map<String,Object> resmap=commonService.select("DaHan.shop_dahan_news_upcnt", map);
	
	Map<String,Object> rtnMap = new HashMap<String,Object>();
	System.err.println(resmap.get("OUT_SUC"));
	if(resmap.get("OUT_SUC").toString().trim().equalsIgnoreCase("S")){
		rtnMap.put("success", true);
	}else{
		rtnMap.put("success", false);
	}
	rtnMap.put("ca", resmap.get("OUT_CLASS"));
	renderJSON(rtnMap);
	return NONE;
}
public Integer getNewsType() {
	return newsType;
}
public void setNewsType(Integer newsType) {
	this.newsType = newsType;
}
public Integer getPgCurr() {
	return pgCurr;
}
public void setPgCurr(Integer pgCurr) {
	this.pgCurr = pgCurr;
}
public Integer getPgUnit() {
	return pgUnit;
}
public void setPgUnit(Integer pgUnit) {
	this.pgUnit = pgUnit;
}
public Integer getNewsId() {
	return newsId;
}
public void setNewsId(Integer newsId) {
	this.newsId = newsId;
}
public Integer getMsgId() {
	return msgId;
}
public void setMsgId(Integer msgId) {
	this.msgId = msgId;
}
public Integer getNewsClass() {
	return newsClass;
}
public void setNewsClass(Integer newsClass) {
	this.newsClass = newsClass;
}
}
