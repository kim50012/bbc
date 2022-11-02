/**   
* @Title: Event00020Action.java 
* @Package com.waremec.wpt.front.event.action 
* @Description:  
* @author taebem
* @date 2015年9月11日 下午1:05:34 
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

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.LogUtils;
import com.waremec.weixin.domain.user.SessionMember;
import com.waremec.wpt.admin.service.CustService;
import com.waremec.wpt.front.domain.SessionSkin;

/** 
 * @Package com.waremec.wpt.front.event.action 
 * @FileName Event00031Action
 * @Description  
 * @author taebem 
 * @date 2015年9月11日 下午1:05:34 
 *  
 */
@Controller("event00031Action")
@Scope(ScopeType.prototype)
public class Event00031Action extends EventBaseAction {

	private static final long serialVersionUID = 1L;

	@Resource
	private CustService custService;

	public String index() {
		long startTime = System.currentTimeMillis();
		
		String returns = "";
		
		try {

			Integer eveId = getId();
			String fromOpenid = getFromOpenidOri();
			
			jsSdkWithEventStting();
			eventInit();
			SessionMember sessionMember = getSessionMember();
			SessionSkin sessionSkin = getSessionSkin();
			
			
			request.put("myResult", "N");
			
			Map<String, Object> parmsMap = new HashMap<String, Object>();
			parmsMap.put("EVENT_ID", eveId);

			if(StringUtils.isBlank(fromOpenid)){//自己页面

				parmsMap.put("FROM_OPENID", getSessionOpenid());
				Map<String, Object> userInfo = eventService.select("Event.SHOP_EVENT_USER_SELECT",parmsMap);
				request.put("userInfo", userInfo);
				
				returns = "index";
				
			} else {
				
				if(fromOpenid.equals(getSessionOpenid())){//自己页面
					request.put("myResult", "Y");
					//---------------------------------------------------------------
					// PAGE COUNTING
					//---------------------------------------------------------------
					siteCounting(eveId, sessionSkin.getShopId(), getFromOpenid(), getSessionOpenid(), "RESULT");
					//---------------------------------------------------------------
					returns = "result";

				} else {

					//---------------------------------------------------------------
					// PAGE COUNTING
					//---------------------------------------------------------------
					siteCounting(eveId, sessionSkin.getShopId(), getFromOpenid(), getSessionOpenid(), "INDEX");
					//---------------------------------------------------------------
					returns = "index"; 
					
				}

				parmsMap.put("FROM_OPENID", getSessionOpenid());
				Map<String, Object> userInfo = eventService.select("Event.SHOP_EVENT_USER_SELECT",parmsMap);
				request.put("userInfo", userInfo);
				
			}
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		LogUtils.getMethodExecuteTime(startTime);
		return returns;
	}
	

	public String result() {
		long startTime = System.currentTimeMillis();
		
		String returns = "";
		
		try {

			Integer eveId = getId();
			String fromOpenid = getFromOpenidOri();
			
			jsSdkWithEventStting();
			eventInit();
			SessionMember sessionMember = getSessionMember();
			SessionSkin sessionSkin = getSessionSkin();
			
			//---------------------------------------------------------------
			// PAGE COUNTING
			//---------------------------------------------------------------
			siteCounting(eveId, sessionSkin.getShopId(), getFromOpenid(), getSessionOpenid(), "RESULT");
			//---------------------------------------------------------------

			request.put("myResult", "Y");
			
			Map<String, Object> parmsMap = new HashMap<String, Object>();
			parmsMap.put("EVENT_ID", eveId);
			parmsMap.put("FROM_OPENID", getSessionOpenid());
			Map<String, Object> userInfo = eventService.select("Event.SHOP_EVENT_USER_SELECT",parmsMap);
			request.put("userInfo", userInfo);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		LogUtils.getMethodExecuteTime(startTime);
		return "result";
	}	
	
	public String soloAction(){

		String sex = getRequest().getParameter("sex");
		String age = getRequest().getParameter("age");
		String survey = getRequest().getParameter("survey");
		Integer eveId = getId();
		
		SessionSkin sessionSkin = getSessionSkin();
		

		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("EVENT_ID", eveId);
		parmsMap.put("FROM_OPENID", getSessionOpenid());
		parmsMap.put("MOBILE", survey);
		
		Map<String, Object> userInfo = eventService.select("Event.SHOP_EVENT_USER_INSERT",parmsMap);
		String firstYn = (String) userInfo.get("FIRST_YN");	

		if(firstYn.equals("N")){
			userInfo.put("SUCCESS", "N");
			renderJSON(userInfo);
			return NONE;
		}
		
		//---------------------------------------------------------------
		// PAGE COUNTING
		//---------------------------------------------------------------
		siteCounting(eveId, sessionSkin.getShopId(), getSessionOpenid(), sex, "SEX");
		siteCounting(eveId, sessionSkin.getShopId(), getSessionOpenid(), age, "AGE");
		siteCounting(eveId, sessionSkin.getShopId(), getSessionOpenid(), survey, "SURVEY");
		//---------------------------------------------------------------
		
		
		userInfo.put("SUCCESS", "S");
		renderJSON(userInfo);
		
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