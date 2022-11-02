/**   
* @Title: Event00007Action.java 
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
 * @FileName Event00007Action
 * @Description  
 * @author taebem 
 * @date 2015年5月26日 下午4:42:13 
 *  
 */
@Controller("event00030Action")
@Scope(ScopeType.prototype)
public class Event00030Action extends EventBaseAction {

	private static final long serialVersionUID = 1L;

	@Resource
	private CustService custService;

	public String index() {
		long startTime = System.currentTimeMillis();
		try {

			Integer eveId = getId();
			
			jsSdkWithEventStting();
			eventInit();
			SessionMember sessionMember = getSessionMember();
			
			SessionSkin sessionSkin = getSessionSkin();
			
			//---------------------------------------------------------------
			// PAGE COUNTING
			//---------------------------------------------------------------
			siteCounting(eveId, sessionSkin.getShopId(), getFromOpenid(), getSessionOpenid(), "INDEX");
			//---------------------------------------------------------------
			
			Map<String, Object> parmsMap = new HashMap<String, Object>();
			parmsMap.put("EVENT_ID", eveId);
			parmsMap.put("FROM_OPENID", getSessionOpenid());
			
			Map<String, Object> prizeCnt = eventService.select("Event.SHOP_EVENT_USER_SELECT",parmsMap);
			request.put("prizeCnt", prizeCnt);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		LogUtils.getMethodExecuteTime(startTime);
		return "index";
	}
	
	public String survey(){

		String prize = getRequest().getParameter("prize");
		Integer eveId = getId();
	 

		SessionSkin sessionSkin = getSessionSkin();
		

		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("EVENT_ID", eveId);
		parmsMap.put("FROM_OPENID", getSessionOpenid());
		parmsMap.put("MOBILE", null);
		
		Map<String, Object> userInfo = eventService.select("Event.SHOP_EVENT_USER_INSERT",parmsMap);
		String firstYn = (String) userInfo.get("FIRST_YN");	
		

		Map<String,Object> rtnMap = new HashMap<String,Object>();

		if(firstYn.equals("N")){
			rtnMap.put("success", "N");
			renderJSON(rtnMap);
			return NONE;
		}
		
		//---------------------------------------------------------------
		// PAGE COUNTING
		//---------------------------------------------------------------
		siteCounting(eveId, sessionSkin.getShopId(), getSessionOpenid(), prize, "PRIZE");
		//---------------------------------------------------------------
		
		
		rtnMap.put("success", "S");
		renderJSON(rtnMap);
		
		return NONE;
		
	}
	 
	public boolean isClosed(){
		// TODO Auto-generated method stub
		boolean closed = true;
		try {
			Date currentDate = new Date();
			Date deadline = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse("2015-08-26 13:59:59");
			closed = currentDate.getTime() > deadline.getTime();
		} catch (ParseException e) {
			 
		}
		
		return closed;
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