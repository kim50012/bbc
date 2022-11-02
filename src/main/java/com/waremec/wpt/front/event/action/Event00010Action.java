/**   
* @Title: Event00010Action.java 
* @Package com.waremec.wpt.front.event.action 
* @Description:  
* @author taebem
* @date 2015年5月26日 下午4:42:45 
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
import com.waremec.framework.utilities.ListUtil;
import com.waremec.framework.utilities.LogUtils;
import com.waremec.framework.utilities.StringUtil;
import com.waremec.weixin.domain.user.SessionMember;
import com.waremec.wpt.admin.service.CustService;

/** 
 * @Package com.waremec.wpt.front.event.action 
 * @FileName Event00010Action
 * @Description  
 * @author taebem 
 * @date 2015年5月26日 下午4:42:45 
 *  
 */
@Controller("event00010Action")
@Scope(ScopeType.prototype)
public class Event00010Action extends EventBaseAction {

	private static final long serialVersionUID = 1L;

	
	@Resource
	private CustService custService;
	
	public String index() {
		logger.info("index.........");
		
		long startTime = System.currentTimeMillis();
	 
		jsSdkWithEventStting();
		eventInit();

		LogUtils.getMethodExecuteTime(startTime);
		return "index";
	}
	public String detail() {
		long startTime = System.currentTimeMillis();
		
		String returns = "";
		
		Integer eventId = getId();
		String fromOpenid = getFromOpenid();
		
		jsSdkWithEventStting();
		eventInit();
		
		SessionMember sessionMember = getSessionMember();
		
		if(StringUtils.isBlank(fromOpenid)){//自己页面
//		이벤트 참여하기 클릭 시
//		아래 프로시저로 이벤트 참여 USER 등록 후
//		RFC : SHOP_EVENT_USER_INSERT
			Map<String, Object> parmsMap = new HashMap<String, Object>();
			parmsMap.put("EVENT_ID", eventId);
			parmsMap.put("FROM_OPENID", getSessionOpenid());
			parmsMap.put("MOBILE", null);
			
			eventService.select("Event.SHOP_EVENT_USER_INSERT",parmsMap);
			
			parmsMap.clear();
			parmsMap.put("EVENT_ID", eventId);
			parmsMap.put("OPENID", getSessionOpenid());
			parmsMap.put("FROM_OPENID", fromOpenid);
			
			Map<String, Object> ranking = eventService.select("Event.SHOP_EVENT_USER_RANK_SELECT",parmsMap);
			request.put("ranking", ranking);
			
			parmsMap.put("EVENT_ID", eventId);
			parmsMap.put("OPENID", getSessionOpenid());
			parmsMap.put("FROM_OPENID", fromOpenid);
			parmsMap.put("PAGE_CURR", 1);
			parmsMap.put("PAGE_UINT", Integer.MAX_VALUE);
			
			
			List<Map<String, Object>> friendList = eventService.selectList("Event.SHOP_EVENT_USER_RANK_LIST_SELECT",parmsMap);
			request.put("friendList", friendList);
			
			returns = "detail";
		}else{//朋友页面
			Map<String, Object> parmsMap = new HashMap<String, Object>();
			parmsMap.put("EVENT_ID", eventId);
			parmsMap.put("OPENID", getSessionOpenid());
			parmsMap.put("FROM_OPENID", fromOpenid);
			
			Map<String, Object> ranking = eventService.select("Event.SHOP_EVENT_USER_RANK_SELECT",parmsMap);
			request.put("ranking", ranking);
			
			returns = "friend";
		}
		
		LogUtils.getMethodExecuteTime(startTime);
		return returns;
	}
	public String send() {
		 
		Integer eventId = getId();
		String openid  = getRequest().getParameter("openid");
		String fromOpenid = getRequest().getParameter("fromOpenid");
		
		logger.info("||||||||||||||send|||||||||||");
		logger.info("openid======" + openid);
		logger.info("fromOpenid==" + fromOpenid);
		logger.info("<<<<<<<<<<<<<<send>>>>>>>>>>>");
		
		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("EVENT_ID", eventId);
		parmsMap.put("OPENID", openid);
		parmsMap.put("FROM_OPENID", fromOpenid);
		
		eventService.select("Event.SHOP_EVENT_FOLLOW_USER_UNIQUE_INSERT",parmsMap);
		 
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("success", true);
		renderJSON(returnMap);
		
		return NONE;
	}
}