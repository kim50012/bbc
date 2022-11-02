/**   
 * @Title: Event00001Action.java 
 * @Package com.waremec.wpt.front.event.action 
 * @Description:  
 * @author taebem
 * @date 2015年5月13日 上午9:59:34 
 * @version V1.0   
 */
package com.waremec.wpt.front.event.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.weixin.domain.user.SessionMember;
import com.waremec.wpt.front.domain.RouletteInfo;

/**
 * @Package com.waremec.wpt.front.event.action
 * @FileName Event00001Action
 * @Description
 * @author taebem
 * @date 2015年5月13日 上午9:59:34
 * 
 */

@Controller("event00001Action")
@Scope(ScopeType.prototype)
public class Event00001Action extends EventBaseAction {
  
	public String index() {

		jsSdkStting();

		return "index";
	}
	public String rule() {
		return "rule";
	}
	public String luckyDraw() {
		
		jsSdkStting();
		
		logger.info("-------------------------------");
		SessionMember sessionMember = getSessionMember();
		
		Integer eventId = getId();
		
		boolean isfallowed = false;
		if(sessionMember != null){
			
			isfallowed = true;
			
			Map<String, Object> parmsMap = new HashMap<String, Object>();
			parmsMap.put("SHOP_ID", sessionMember.getShopId());
			parmsMap.put("EVENT_ID", eventId);
			parmsMap.put("CUST_SYS_ID", sessionMember.getCustSysId());
			 
			Map<String, Object> checkingInfo = commonService.select("Event.SHOP_GAME_CHECKING_BY_CUST",parmsMap);
			
			Integer chanceCount = (Integer) checkingInfo.get("EVENT_CUST_CNT");
			
			request.put("checkingInfo", checkingInfo);
			request.put("chanceCount", chanceCount);
			
			/******/
			List<Map<String, Object>> gameItemList = eventService.getGameItemListById(eventId);
			request.put("gameItemList", gameItemList);
			
		}
		
		request.put("eventId", eventId);
		request.put("isfallowed", isfallowed);
		
		
		return "luckyDraw";
	}
	
	public String getRouletteInfo() {
		
		logger.info("-------------------------------");
		SessionMember sessionMember = getSessionMember();
		
		Integer eventId = IntegerUtils.valueOf(getRequest().getParameter("eventId"));
		 
		try {
			if(sessionMember != null){
				
				Map<String, Object> parmsMap = new HashMap<String, Object>();
				parmsMap.put("SHOP_ID", sessionMember.getShopId());
				parmsMap.put("EVENT_ID", getId());
				parmsMap.put("CUST_SYS_ID", sessionMember.getCustSysId());
				
				RouletteInfo rouletteInfo = eventService.getGageActionInfo(parmsMap);
				
				Map<String,Object> rtnMap = new HashMap<String,Object>();
				
				rtnMap.put("success", true);
				rtnMap.put("data", rouletteInfo);
				
				renderJSON(rtnMap);
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			Map<String,Object> rtnMap = new HashMap<String,Object>();
			
			rtnMap.put("success", false);
			rtnMap.put("err_msg", e.getMessage());
			
			renderJSON(rtnMap);
		}
		
		
		return NONE;
	}
}
