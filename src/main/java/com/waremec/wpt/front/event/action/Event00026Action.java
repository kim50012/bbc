/**   
* @Title: Event00026Action.java 
* @Package com.waremec.wpt.front.event.action 
* @Description:  
* @author dikim
* @date 2016年8月30日 上午10:14:45 
* @version V1.0   
*/
package com.waremec.wpt.front.event.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.framework.utilities.ListUtil;
import com.waremec.framework.utilities.LogUtils;
import com.waremec.framework.utilities.StringUtil;
import com.waremec.weixin.domain.user.SessionMember;
import com.waremec.wpt.admin.service.CustService;

/** 
 * @Package com.waremec.wpt.front.event.action 
 * @FileName Event00026Action
 * @Description  
 * @author dikim 
 * @date 2016年8月15日 上午10:14:45 
 *  
 */
@Controller("event00026Action")
@Scope(ScopeType.prototype)
public class Event00026Action extends EventBaseAction {

	private static final long serialVersionUID = 1L;
	
	@Resource
	private CustService custService;
	
	public String index() {
		logger.info("index.........");
		long startTime = System.currentTimeMillis();


		jsSdkWithEventStting();
		eventInit();

		Integer eventId = getId();
		Integer shopId = IntegerUtils.valueOf(getRequest().getParameter("shopId"));

		SessionMember sessionMember = getSessionMember();

		if(sessionMember == null){
			//return "index";
		} else {
			shopId = sessionMember.getShopId();
		}

		String fromOpenid = getFromOpenid();
		if(StringUtils.isBlank(fromOpenid)){
			fromOpenid = getSessionOpenid();
		}
		
		//---------------------------------------------------------------
		// PAGE COUNTING
		//---------------------------------------------------------------
		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("EVENT_ID", eventId);
		parmsMap.put("SHOP_ID", shopId);
		parmsMap.put("FROM_OPENID", fromOpenid);
		parmsMap.put("OPENID", getSessionOpenid());
		parmsMap.put("PAGENM", "INDEX");
		Map<String, Object> userInfo = eventService.select("Event.SHOP_EVENT_VIEW_USER_INSERT",parmsMap);
		request.put("userInfo", userInfo);
		//---------------------------------------------------------------
		
		LogUtils.getMethodExecuteTime(startTime);
		return "index";
	}
	public String game() {
		logger.info("game.........");
		long startTime = System.currentTimeMillis();
		
		Integer eventId = getId();
		
		jsSdkWithEventStting();
		eventInit();
		
		SessionMember sessionMember = getSessionMember();
		
		if(sessionMember == null){
			return "index";
		}	

		String fromOpenid = getFromOpenid();
		if(StringUtils.isBlank(fromOpenid)){
			fromOpenid = getSessionOpenid();
		}
		
		Map<String, Object> parmsMap = new HashMap<String, Object>();

		//---------------------------------------------------------------
		// PAGE COUNTING
		//---------------------------------------------------------------
		parmsMap.put("EVENT_ID", eventId);
		parmsMap.put("SHOP_ID", sessionMember.getShopId());
		parmsMap.put("FROM_OPENID", fromOpenid);
		parmsMap.put("OPENID", getSessionOpenid());
		parmsMap.put("PAGENM", "GAME");
		Map<String, Object> userInfo = eventService.select("Event.SHOP_EVENT_VIEW_USER_INSERT",parmsMap);
		//---------------------------------------------------------------
		
		Integer subscribe = (Integer) userInfo.get("SUBSCRIBE");

		if(subscribe == 0){
			request.put("userInfo", userInfo);
			return "index";
		}	
		
		parmsMap.clear();
		parmsMap.put("EVENT_ID", eventId);
		parmsMap.put("FROM_OPENID", getSessionOpenid());
		parmsMap.put("MOBILE", null);
		
		eventService.select("Event.SHOP_EVENT_USER_INSERT",parmsMap);
		
		parmsMap.clear();
		parmsMap.put("EVENT_ID", eventId);
		parmsMap.put("OPENID", getSessionOpenid());
		parmsMap.put("SHOP_ID", sessionMember.getShopId());
		
		Map<String, Object> eventAction = eventService.select("Event.SHOP_EVENT_FOLLOW_ACTION_CHANCE_SELECT",parmsMap);
		request.put("eventAction", eventAction);
		
		LogUtils.getMethodExecuteTime(startTime);
		return "game";
	}
	
	public String gameStart() {
		 
		Integer eventId = getId();
		Integer seqId = IntegerUtils.valueOf(getRequest().getParameter("seqId"));
		
		SessionMember sessionMember = getSessionMember();

		if(sessionMember == null) {
			Map<String, Object> returnMapErr = new HashMap<String, Object>();
			returnMapErr.put("success", false);
			renderJSON(returnMapErr);
			return NONE;
		}
		
		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("EVENT_ID", eventId);
		parmsMap.put("OPENID", getSessionOpenid());
		parmsMap.put("SHOP_ID", sessionMember.getShopId());
		parmsMap.put("SEQID", seqId);
		parmsMap.put("HONGBAO_AMT", 0);
		parmsMap.put("HONGBAO_STS", 1);
		
		eventService.select("Event.SHOP_EVENT_FOLLOW_ACTION_CHANCE_UPDATE",parmsMap);
		 
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("success", true);
		renderJSON(returnMap);
		
		return NONE;
	}
	public String gameResult() {
		 
		Integer eventId = getId();
		Integer seqId = IntegerUtils.valueOf(getRequest().getParameter("seqId"));
		Integer hongbaoAmt = IntegerUtils.valueOf(getRequest().getParameter("hongbaoAmt"));
		
		SessionMember sessionMember = getSessionMember();

		if(sessionMember == null) {
			Map<String, Object> returnMapErr = new HashMap<String, Object>();
			returnMapErr.put("success", false);
			renderJSON(returnMapErr);
			return NONE;
		}
		
		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("EVENT_ID", eventId);
		parmsMap.put("OPENID", getSessionOpenid());
		parmsMap.put("SHOP_ID", sessionMember.getShopId());
		parmsMap.put("SEQID", seqId);
		parmsMap.put("HONGBAO_AMT", hongbaoAmt);
		parmsMap.put("HONGBAO_STS", 2);
		
		eventService.select("Event.SHOP_EVENT_FOLLOW_ACTION_CHANCE_UPDATE",parmsMap);
		 
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("success", true);
		renderJSON(returnMap);
		
		return NONE;
	}
}