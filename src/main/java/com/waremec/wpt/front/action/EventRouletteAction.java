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

@Controller("eventRouletteAction")
@Scope(ScopeType.prototype)
public class EventRouletteAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	private String gameId = "";
	private String shopId = "";
	private String custSysId = "";
	private String itemId = "";
	private String chaneId = "";
	private String msg = "";

	public String eventRoulette() {
		Map<String, Object> map = new HashMap<String, Object>();
		SessionMember sessionMember = getSessionMember();
		shopId = sessionMember.getShopId() + "";
		custSysId = sessionMember.getCustSysId() + "";
		map.put("shopId", shopId);
		map.put("gameId", gameId);
		map.put("custSysId", custSysId);
		map.put("itemId", StringUtil.emptyToNull(itemId));
		List<Map<String, Object>> list = commonService.selectList("EventRoulette.selectEventRoulette", map);
		request.put("list", list);
		Map<String, Object> mapResult = commonService.select("RouletteActivity.selectShopMsg", map);
		request.put("map", mapResult);
		return "eventRoulette";
	}
	/**
	 * 判断该用户是否还有摇奖次数，可否继续摇奖
	 * @return
	 */
	public String getCustChanceNum(){
		String ret = "success";
		Map<String, Object> map = new HashMap<String, Object>();
		SessionMember sessionMember = getSessionMember();
		shopId = sessionMember.getShopId() + "";
		custSysId = sessionMember.getCustSysId() + "";
		map.put("shopId", shopId);
		map.put("gameId", gameId);
		map.put("custSysId", custSysId);
		map.put("itemId", StringUtil.emptyToNull(itemId));
		List<Map<String, Object>> list = commonService.selectList("EventRoulette.selectEventRoulette", map);
		if (!list.isEmpty()) {
			Integer num = (Integer) list.get(0).get("CHANCE_NUM");
			Integer custChanceNum = (Integer) list.get(0).get("CUST_CHANCE_NUM");
			Integer startFlag=(Integer) list.get(0).get("START_FLAG");
			Integer endFlag=(Integer) list.get(0).get("END_FLAG");
			if(startFlag==0){
				ret="startFail";
			}else if(endFlag==0){
				ret="endFail";
			}else if (num > 0 ||custChanceNum==0) {
				ret = "success";
			} else {
				ret = "fail";
			}
		} else {
			ret = "fail";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("ret", ret);
		renderJSON(returnMap);
		return NONE;
	}
	/**
	 * 判断该奖项是否已经送完
	 * @return
	 */
	public String getLimitCnt() {
		String ret = "success";
		Map<String, Object> map = new HashMap<String, Object>();
		SessionMember sessionMember = getSessionMember();
		shopId = sessionMember.getShopId() + "";
		custSysId = sessionMember.getCustSysId() + "";
		map.put("shopId", shopId);
		map.put("gameId", gameId);
		map.put("custSysId", custSysId);
		map.put("itemId", StringUtil.emptyToNull(itemId));
		Map<String, Object> mapResult = commonService.select("EventRoulette.selectEventRoulette", map);
		if (!mapResult.isEmpty()) {
			Integer num = (Integer) mapResult.get("GAME_LIMIT_CNT_EVERY");
			Integer num1 = (Integer) mapResult.get("GAME_WIN_CNT");
			Integer typeId = (Integer) mapResult.get("WIN_TYPE");
			if (num > num1 || typeId == 0) {
				ret = "success";
			} else {
				ret = "fail";
			}
		} else {
			ret = "bad";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("ret", ret);
		renderJSON(returnMap);
		return NONE;
	}

	public String updateEventRoulette() {
		String ret = "success";
		Map<String, Object> map = new HashMap<String, Object>();
		SessionMember sessionMember = getSessionMember();
		shopId = sessionMember.getShopId() + "";
		custSysId = sessionMember.getCustSysId() + "";
		map.put("shopId", shopId);
		map.put("gameId", gameId);
		map.put("custSysId", custSysId);
		map.put("itemId", StringUtil.emptyToNull(itemId));
		map.put("chaneId", chaneId);
		map.put("msg", msg);
		Map<String, Object> mapResult = commonService.select("EventRoulette.updateEventRoulette", map);
		int itmeTypeOut=-1;
		int eventId=0;
		int prizeId=0;
		if(mapResult.isEmpty()){
			ret="fail";
		}else{
			String errMsg=(String) mapResult.get("OUT_ERR_MSG");
			if(errMsg=="S" || "S".equals(errMsg)){
				ret="success";
				itmeTypeOut=(Integer)mapResult.get("OUT_WIN_TYPE");
				if(itmeTypeOut>0){
					eventId=(Integer)mapResult.get("OUT_EVENT_ID");
					prizeId=(Integer)mapResult.get("OUT_PRIZE_ID");
				}
			}else{
				ret="fail";
			}
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("ret", ret);
		returnMap.put("type", itmeTypeOut);
		returnMap.put("eventId",eventId);
		returnMap.put("prizeId",prizeId);
		renderJSON(returnMap);
		return NONE;
	}

	public String getGameId() {
		return gameId;
	}

	public void setGameId(String gameId) {
		this.gameId = gameId;
	}

	public String getShopId() {
		return shopId;
	}

	public void setShopId(String shopId) {
		this.shopId = shopId;
	}

	public String getCustSysId() {
		return custSysId;
	}

	public void setCustSysId(String custSysId) {
		this.custSysId = custSysId;
	}

	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}

	public String getChaneId() {
		return chaneId;
	}

	public void setChaneId(String chaneId) {
		this.chaneId = chaneId;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
}
