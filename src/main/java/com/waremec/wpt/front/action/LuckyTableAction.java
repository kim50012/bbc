package com.waremec.wpt.front.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.StringUtil;
import com.waremec.weixin.action.WeixinBaseAction;
import com.waremec.weixin.domain.user.SessionMember;
import com.waremec.wpt.front.domain.SessionSkin;

@Controller("luckyTableAction")
@Scope(ScopeType.prototype)
public class LuckyTableAction extends WeixinBaseAction{
	private static final long serialVersionUID = 1L;
	
	private int pageUnit=6;
	private String gameId="";
	
	public String luckyTable(){
		SessionSkin sessionSkin = getSessionSkin();
		SessionMember sessionMember = getSessionMember();
		int shopId=sessionSkin.getShopId();
		int custSysId = sessionMember.getCustSysId();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("custSysId", custSysId);
		map.put("gameId", StringUtil.emptyToNull(gameId));
		map.put("winType", 2);
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		List<Map<String,Object>> list=commonService.selectList("Lucky.listSel",map);
		request.put("list", list);
		request.put("gameId", gameId);
		Map<String,Object> map1=new HashMap<String,Object>();
		map1.put("custSysId", custSysId);
		Map<String,Object> custImg=commonService.select("Lucky.imgSel",map1);
		request.put("custImg", custImg);
		return "luckyTable";
	}
	public String hongbao(){
		SessionSkin sessionSkin = getSessionSkin();
		SessionMember sessionMember = getSessionMember();
		int shopId=sessionSkin.getShopId();
		int custSysId = sessionMember.getCustSysId();
		String ret = "success";

		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("custSysId", custSysId);
		map.put("gameId", StringUtil.emptyToNull(gameId));
		map.put("winType", 2);
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		List<Map<String,Object>> list=commonService.selectList("Lucky.listSel",map);
		if(shopId==0){
			ret="false";
		}
		Map<String,Object> map1=new HashMap<String,Object>();
		map1.put("custSysId", custSysId);
		Map<String,Object> custImg=commonService.select("Lucky.imgSel",map1);
		request.put("custImg", custImg);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		returnMap.put("list", list);
		renderJSON(returnMap);

		return NONE;
	}
	public String jifen(){
		SessionSkin sessionSkin = getSessionSkin();
		SessionMember sessionMember = getSessionMember();
		int shopId=sessionSkin.getShopId();
		int custSysId = sessionMember.getCustSysId();
		String ret = "success";

		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("custSysId", custSysId);
		map.put("gameId", StringUtil.emptyToNull(gameId));
		map.put("winType", 1);
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		List<Map<String,Object>> list=commonService.selectList("Lucky.listSel",map);
		if(shopId==0){
			ret="false";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		returnMap.put("list", list);
		renderJSON(returnMap);

		return NONE;
	}
	public int getPageUnit() {
		return pageUnit;
	}
	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}
	public String getGameId() {
		return gameId;
	}
	public void setGameId(String gameId) {
		this.gameId = gameId;
	}
	
}
