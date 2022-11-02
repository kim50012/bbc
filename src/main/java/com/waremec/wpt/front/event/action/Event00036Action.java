/**   
* @Title: Event00036Action.java 
* @Package com.waremec.wpt.front.event.action 
* @Description:  
* @author dikim
* @date 2017年1月24日 下午4:42:13 
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
import com.waremec.framework.utilities.LogUtils;
import com.waremec.weixin.domain.user.SessionMember;
import com.waremec.wpt.front.domain.SessionSkin;
import com.waremec.wpt.admin.service.CustService;

/** 
 * @Package com.waremec.wpt.front.event.action 
 * @FileName Event00036Action
 * @Description  
 * @author taebem 
 * @date 2015年5月26日 下午4:42:13 
 *  
 */
@Controller("event00036Action")
@Scope(ScopeType.prototype)
public class Event00036Action extends EventBaseAction {

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
			SessionMember sessionMember = getSessionMember();

			if(sessionMember == null){
				return "nosession";
			}

			SessionSkin sessionSkin = getSessionSkin();
			
			//---------------------------------------------------------------
			// PAGE COUNTING
			//---------------------------------------------------------------
			siteCounting(getId(), sessionSkin.getShopId(), getFromOpenid(), getSessionOpenid(), "INDEX");
			//---------------------------------------------------------------
			
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
		siteCounting(getId(), sessionSkin.getShopId(), getFromOpenid(), getSessionOpenid(), "STARTGAME");
		//---------------------------------------------------------------
		
		Map<String, Object> parmsMap  = new HashMap<String,Object>();
		if(StringUtils.isNotEmpty(getFromOpenid())){
			
			parmsMap.clear();
			parmsMap.put("EVENT_ID", eventId);
			parmsMap.put("OPENID", getSessionOpenid());
			
			Map<String, Object> userSummary = eventService.select("Event.EVENT_00007_POINT_GET_SUM",parmsMap);
			request.put("userSummary", userSummary);
			
			request.put("friendYN", "Y");
			
		}else{
			
			parmsMap.clear();
			parmsMap.put("EVENT_ID", eventId);
			parmsMap.put("OPENID", getSessionOpenid());
			
			Map<String, Object> userSummary = eventService.select("Event.EVENT_00007_POINT_GET_SUM",parmsMap);
			request.put("userSummary", userSummary);
			
			request.put("friendYN", "N");
			
		}
		
		List<Map<String, Object>> gameItemList = eventService.getGameItemListById(eventId);
		request.put("gameItemList", gameItemList);
		
		return "event";
		
	}

	public String eventResult(){
		
		Integer eventId = getId();	
	 
		Map<String, Object> parmsMap = new HashMap<String, Object>();
		
		parmsMap.clear();
		parmsMap.put("EVENT_ID", eventId);
		parmsMap.put("OPENID", getSessionOpenid());
		parmsMap.put("FROM_OPENID", getFromOpenid());
		parmsMap.put("POINT_TYPE", 2);
		
		Map<String, Object> resultMap = eventService.select("Event.EVENT_POINT_INSERT",parmsMap);

		Integer angle = (Integer)resultMap.get("ANGLE");
		Integer outPoint = (Integer)resultMap.get("OUT_POINT");
		String success = (String)resultMap.get("SUCCESS");
		Integer prizeType = (Integer)resultMap.get("PRIZE_TYPE");
		
		
		Map<String,Object> rtnMap = new HashMap<String,Object>();
		rtnMap.put("outPoint", outPoint);
		rtnMap.put("angle", angle);
		rtnMap.put("success", success);
		rtnMap.put("prizeType", prizeType);
		
		renderJSON(rtnMap);
		
		return NONE;
		
	}
	 
	public boolean isClosed(){
		// TODO Auto-generated method stub
		boolean closed = true;
		try {
			Date currentDate = new Date();
			Date deadline = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse("2017-01-18 23:59:59");
			closed = currentDate.getTime() > deadline.getTime();
		} catch (ParseException e) {
			 
		}
		
		return closed;
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