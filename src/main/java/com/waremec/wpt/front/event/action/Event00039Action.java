/**   
* @Title: Event00039Action.java 
* @Package com.waremec.wpt.front.event.action 
* @Description:  
* @author taebem
* @date 2015年5月26日 下午4:42:13 
* @version V1.0   
*/
package com.waremec.wpt.front.event.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.framework.utilities.LogUtils;
import com.waremec.weixin.domain.user.SessionMember;
import com.waremec.wpt.front.domain.SessionSkin;
import com.waremec.wpt.admin.service.CustService;

/** 
 * @Package com.waremec.wpt.front.event.action 
 * @FileName Event00039Action
 * @Description  
 * @author taebem 
 * @date 2015年5月26日 下午4:42:13 
 *  
 */
@Controller("event00039Action")
@Scope(ScopeType.prototype)
public class Event00039Action extends EventBaseAction {

	private static final long serialVersionUID = 1L;

	private static final int EVENT_TYPE_IS_FIRST = 1;
	private static final int EVENT_TYPE_TODAY = 2;
	private static final int EVENT_ENABLE_FRIENDS = 3;
	@Resource
	private CustService custService;

	public String index() {
		long startTime = System.currentTimeMillis();
		try {

			jsSdkWithEventStting();
			eventInit();
			
			SessionSkin sessionSkin = getSessionSkin();

			//---------------------------------------------------------------
			// PAGE COUNTING
			//---------------------------------------------------------------
			siteCounting(getId(), sessionSkin.getShopId(), getFromOpenid(), getSessionOpenid(), "INDEX");
			//---------------------------------------------------------------
			
//			if(sessionMember == null){
//				
//			}
//			else {
//				
//			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		LogUtils.getMethodExecuteTime(startTime);
		return "index";
	}

	
	public String event() {
		
		jsSdkWithEventStting();
		eventInit();
		
		SessionSkin sessionSkin = getSessionSkin();
		
		Integer eventId = getId();
		
		//---------------------------------------------------------------
		// PAGE COUNTING
		//---------------------------------------------------------------
		siteCounting(getId(), sessionSkin.getShopId(), getFromOpenid(), getSessionOpenid(), "EVENT");
		//---------------------------------------------------------------

		Map<String, Object> parmsMap  = new HashMap<String,Object>();

		parmsMap.clear();
		parmsMap.put("EVENT_ID", eventId);
		parmsMap.put("FROM_OPENID", getFromOpenid());
		parmsMap.put("OPENID", getSessionOpenid());
		parmsMap.put("SHOP_ID", sessionSkin.getShopId());
		
		Map<String, Object> userEventInfo = eventService.select("Event.EVENT_CHANCE_SELECT",parmsMap);
		request.put("userEventInfo", userEventInfo);
				
		
		if(StringUtils.isNotEmpty(getFromOpenid())){

			request.put("friendYN", "Y");
			
		}else{
			
			request.put("friendYN", "N");
			
		}
		
		
		return "event";
		
	}
	
	public String eventStart(){

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
		parmsMap.put("FROM_OPENID", getFromOpenid());
		parmsMap.put("OPENID", getSessionOpenid());
		parmsMap.put("SHOP_ID", sessionMember.getShopId());
		parmsMap.put("SEQID", seqId);
		parmsMap.put("HONGBAO_AMT", 0);
		parmsMap.put("HONGBAO_STS", 1);
		
		eventService.select("Event.EVENT_CHANCE_UPDATE",parmsMap);
		 
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("success", true);
		renderJSON(returnMap);
		
		return NONE;
	}
	
	public String eventResult(){

		Integer eventId = getId();
		Integer seqId = IntegerUtils.valueOf(getRequest().getParameter("seqId"));
		Integer eventTime = IntegerUtils.valueOf(getRequest().getParameter("eventTime"));
		Integer eventStage = IntegerUtils.valueOf(getRequest().getParameter("eventStage"));
		
		//eventStage 2:1 Stage, 3:2 Stage, 4:3 Stage
		
		SessionMember sessionMember = getSessionMember();

		if(sessionMember == null) {
			Map<String, Object> returnMapErr = new HashMap<String, Object>();
			returnMapErr.put("success", false);
			renderJSON(returnMapErr);
			return NONE;
		}
		
		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("EVENT_ID", eventId);
		parmsMap.put("FROM_OPENID", getFromOpenid());
		parmsMap.put("OPENID", getSessionOpenid());
		parmsMap.put("SHOP_ID", sessionMember.getShopId());
		parmsMap.put("SEQID", seqId);
		parmsMap.put("HONGBAO_AMT", eventTime);
		parmsMap.put("HONGBAO_STS", eventStage);
		
		eventService.select("Event.EVENT_CHANCE_UPDATE",parmsMap);
		 
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("success", true);
		renderJSON(returnMap);
		
		return NONE;
	}
	
	public String share(){

		SessionSkin sessionSkin = getSessionSkin(); 
		
		//---------------------------------------------------------------
		// PAGE COUNTING
		//---------------------------------------------------------------
		siteCounting(getId(), sessionSkin.getShopId(), getFromOpenid(), getSessionOpenid(), "SHARE");
		//---------------------------------------------------------------
		
		return NONE;
		
	}

	protected void  siteCounting(Integer eventId, Integer shopId, String fromOpenid, String Openid, String pageNm){

		try {

			//---------------------------------------------------------------
			// PAGE COUNTING
			//---------------------------------------------------------------
			Map<String, Object> parmsMap = new HashMap<String, Object>();
			parmsMap.put("EVENT_ID", eventId);
			parmsMap.put("SHOP_ID", shopId);
			parmsMap.put("FROM_OPENID", fromOpenid);
			parmsMap.put("OPENID", Openid);
			parmsMap.put("PAGENM", pageNm);
			eventService.select("Event.SHOP_EVENT_VIEW_USER_INSERT",parmsMap);
			//---------------------------------------------------------------
			
		} catch (Exception e) {
			// TODO: handle exception
			logger.error("siteCounting error:" + e.getMessage());
		}
		
	}	
	
}