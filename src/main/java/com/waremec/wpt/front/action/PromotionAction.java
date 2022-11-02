package com.waremec.wpt.front.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.StringUtil;
import com.waremec.weixin.domain.user.SessionMember;
import com.waremec.wpt.front.domain.SessionSkin;

@Controller("promotionAction")
@Scope(ScopeType.prototype)
public class PromotionAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	//店铺Id号
	private int shopId;
	//活动表中的字段
	private String proId;
	private String mesContent;
	private String proWinType;
	private String searchTitle;
	private String proType;
	//活动评论表中的字段
	private String mesType;
	private String winType;
	public String promotionList(){
		pageUnit=2;
		SessionSkin sessionSkin = getSessionSkin();
		shopId=sessionSkin.getShopId();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("pageCurr",pageCurr);
		map.put("pageUint",pageUnit);
		map.put("proWinType", null);
		map.put("proType","I");
		map.put("proId", null);
		map.put("searchTitle", StringUtil.emptyToNull(searchTitle));
		List<Map<String,Object>> list=commonService.selectList("Promotion.selectPromotionList", map);
		int pageCountTotal=0;
		if(list.size()!=0){
			int countTotal=(Integer) list.get(0).get("COUNT_TOTAL");
			pageCountTotal=countTotal/pageUnit+(countTotal%pageUnit==0?0:1);
		}
		request.put("list", list);
		request.put("pageCount", pageCountTotal);
		return "promotionList";
	}
	//下拉显示活动信息查询
	public String getNextPromotion(){
		SessionSkin sessionSkin = getSessionSkin();
		shopId=sessionSkin.getShopId();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("pageCurr",pageCurr);
		map.put("pageUint",pageUnit);
		map.put("proWinType", StringUtil.emptyToNull(proWinType));
		map.put("proType",StringUtil.emptyToNull(proType));
		map.put("proId", StringUtil.emptyToNull(proId));
		map.put("searchTitle", StringUtil.emptyToNull(searchTitle));
		List<Map<String,Object>> list=commonService.selectList("Promotion.selectPromotionList", map);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("list", list);
		renderJSON(returnMap);
		return NONE;
	}
	//下拉显示活动详细信息的评论查询
	public String getNextPromotionView(){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("pageCurr",pageCurr);
		map.put("pageUint",pageUnit);
		map.put("proId", proId);
		map.put("mesType",mesType);
		map.put("winType",null);
		map.put("mesId",null);
		List<Map<String,Object>> list=commonService.selectList("Promotion.selectPromotionView", map);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("list", list);
		renderJSON(returnMap);
		return NONE;
	}
	//发布评论的保存操作
	public String savePromotionView(){
		SessionMember sessionMember = getSessionMember();
		String ret="success";
		try {
			mesContent=new String(mesContent.getBytes("ISO-8859-1"),"UTF-8");
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("proId", proId);
			map.put("mesId",sessionMember.getCustSysId());
			map.put("mesContent",mesContent);
			map.put("winType","N");
			map.put("jobType", "I");
			Map<String,Object> resultMap=commonService.select("Promotion.savePromotionView", map);
			Integer seq=(Integer) resultMap.get("OUT_SEQ_ID");
			if(seq==0||seq==null){
				ret="fail";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			ret="fail";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("ret", ret);
		renderJSON(returnMap);
		return NONE;
	}
	public String promotionView(){
		pageUnit=3;
		SessionMember sessionMember = getSessionMember();
		SessionSkin sessionSkin = getSessionSkin();
		shopId = sessionSkin.getShopId();
		/*Start*/
		/*查询活动的详细信息，其自身的评论信息*/
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("pageCurr",pageCurr);
		map.put("pageUint",pageUnit);
		map.put("proWinType", null);
		map.put("proType","I");
		map.put("proId", Integer.parseInt(proId));
		map.put("searchTitle", StringUtil.emptyToNull(searchTitle));
		map.put("mesType", "P");
		map.put("winType",null);
		map.put("mesId",null);
		//查询活动信息
		Map<String,Object> mapResult=commonService.select("Promotion.selectPromotionList", map);
		mapResult.put("PRO_DESC",mapResult.get("PRO_DESC"));
		request.put("map", mapResult);
		//查询评论信息
		List<Map<String,Object>> list=commonService.selectList("Promotion.selectPromotionView", map);
		request.put("list", list);
		int pageCountTotal=0;
		if(list.size()!=0){
			int countTotal=(Integer) list.get(0).get("COUNT_TOTAL");
			request.put("countTotal",countTotal);
			pageCountTotal=countTotal/pageUnit+(countTotal%pageUnit==0?0:1);
		}
		request.put("pageCount", pageCountTotal);
		/*END*/
		/*Start*/
		/*判断当前用户在此活动中是否已评论*/
		map.put("mesId",sessionMember.getCustSysId());
		List<Map<String,Object>> mapPro=commonService.selectList("Promotion.selectPromotionView",map);
		if(mapPro.size()==0){
			request.put("flagView", 0);
		}else{
			request.put("flagView", 1);
		}
		/*End*/
		return "promotionView";
	}
	public String promotionResultList(){
		pageUnit=6;
		SessionSkin sessionSkin = getSessionSkin();
		shopId = sessionSkin.getShopId();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("pageCurr",pageCurr);
		map.put("pageUint",pageUnit);
		map.put("proWinType","Y");
		map.put("proType",null);
		map.put("proId", null);
		map.put("searchTitle", StringUtil.emptyToNull(searchTitle));
		List<Map<String,Object>> list=commonService.selectList("Promotion.selectPromotionList", map);
		int pageCountTotal=0;
		if(list.size()!=0){
			int countTotal=(Integer) list.get(0).get("COUNT_TOTAL");
			request.put("countTotal",countTotal);
			pageCountTotal=countTotal/pageUnit+(countTotal%pageUnit==0?0:1);
		}
		request.put("list", list);
		request.put("pageCount", pageCountTotal);
		request.put("searchTitle", searchTitle);
		return "promotionResultList";
	}
	public String promotionResultView(){
		pageUnit=3;
		SessionMember sessionMember = getSessionMember();
		SessionSkin sessionSkin = getSessionSkin();
		shopId = sessionSkin.getShopId();
		Map<String,Object> map1=new HashMap<String,Object>();
		map1.put("shopId", shopId);
		map1.put("pageUint",pageUnit);
		map1.put("proWinType", "Y");
		map1.put("proType",null);
		map1.put("proId", proId);
		map1.put("mesType", "W");
		map1.put("winType",null);
		map1.put("pageCurr", 0);
		map1.put("mesId",null);
		List<Map<String,Object>> listWin=commonService.selectList("Promotion.selectPromotionView",map1);
		request.put("listWin",listWin);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("pageCurr",pageCurr);
		map.put("pageUint",pageUnit);
		map.put("proWinType", "Y");
		map.put("proType",null);
		map.put("proId", proId);
		map.put("mesType", "W");
		map.put("winType",null);
		map.put("mesId",null);
		map.put("searchTitle", StringUtil.emptyToNull(searchTitle));
		Map<String,Object> mapResult=commonService.select("Promotion.selectPromotionList", map);
		request.put("map", mapResult);
		List<Map<String,Object>> list=commonService.selectList("Promotion.selectPromotionView", map);
		request.put("list", list);
		int pageCountTotal=0;
		if(list.size()!=0){
			int countTotal=(Integer) list.get(0).get("COUNT_TOTAL");
			request.put("countTotal",countTotal);
			pageCountTotal=countTotal/pageUnit+(countTotal%pageUnit==0?0:1);
		}
		request.put("pageCount", pageCountTotal);
		/*Start*/
		/*判断当前用户在此活动中是否已评论*/
		map.put("mesId",sessionMember.getCustSysId());
		List<Map<String,Object>> mapPro=commonService.selectList("Promotion.selectPromotionView",map);
		if(mapPro.size()==0){
			request.put("flagView", 0);
		}else{
			request.put("flagView", 1);
		}
		/*End*/
		return "promotionResultView";
	}
	public int getShopId() {
		return shopId;
	}
	public void setShopId(int shopId) {
		this.shopId = shopId;
	}
	public String getProId() {
		return proId;
	}
	public void setProId(String proId) {
		this.proId = proId;
	}
	public String getMesContent() {
		return mesContent;
	}
	public void setMesContent(String mesContent) {
		this.mesContent = mesContent;
	}
	public String getProWinType() {
		return proWinType;
	}
	public void setProWinType(String proWinType) {
		this.proWinType = proWinType;
	}
	public String getSearchTitle() {
		return searchTitle;
	}
	public void setSearchTitle(String searchTitle) {
		this.searchTitle = searchTitle;
	}
	public String getProType() {
		return proType;
	}
	public void setProType(String proType) {
		this.proType = proType;
	}
	public String getMesType() {
		return mesType;
	}
	public void setMesType(String mesType) {
		this.mesType = mesType;
	}
	public String getWinType() {
		return winType;
	}
	public void setWinType(String winType) {
		this.winType = winType;
	}
}
