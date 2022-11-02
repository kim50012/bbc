/**   
 * @Title: event00003Action.java 
 * @Package com.waremec.wpt.front.event.action 
 * @Description:  
 * @author taebem
 * @date 2015年5月13日 上午9:59:34 
 * @version V1.0   
 */
package com.waremec.wpt.front.event.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.weixin.domain.user.SessionMember;

/**
 * @Package com.waremec.wpt.front.event.action
 * @FileName event00003Action
 * @Description
 * @author taebem
 * @date 2015年5月15日 上午16:11:34
 * 
 */

@Controller("event00003Action")
@Scope(ScopeType.prototype)
public class Event00003Action extends EventBaseAction {
	 
	private static final long serialVersionUID = 1L;
	public String index() {

		jsSdkWithEventStting();
		eventInit();
 
		return "index";
	}
	
	public String participate() {
		
		jsSdkWithEventStting();
		eventInit();
		
		SessionMember sessionMember = getSessionMember();
		Integer eventId = getId();
		
		if(sessionMember != null){
			Map<String, Object> parmsMap = new HashMap<String, Object>();
			parmsMap.put("EVENT_ID", eventId);
			parmsMap.put("EVENT_DT", "2014-01-01");
			parmsMap.put("OPENID", sessionMember.getOpenid());
		 
			List<Map<String, Object>> followUserList = eventService.selectList("Event.EVENT_00003_SHOP_EVENT_FOLLOW_USER_SELECT",parmsMap);
			List<Map<String, Object>> rankingList = null;
			Map<String, Object>	myRanking = null;
			Integer max = 0;
			
			if(!followUserList.isEmpty()){
				myRanking = followUserList.get(followUserList.size() - 1);
				
				if(!myRanking.isEmpty()){
					Integer orderby = (Integer)myRanking.get("ORDERBY");
					if(orderby != 2){
						myRanking = null;
					}
				}
				
				if(myRanking == null){
					rankingList = followUserList;
				}else{
					rankingList = followUserList.subList(0, followUserList.size() - 1);
				}
				
				if(!rankingList.isEmpty()){
					max = (Integer ) rankingList.get(0).get("EVE_FOLLOW_CNT");
				}
			
			}else{
				
			}
			
			
			request.put("max", max);
			request.put("rankingList", rankingList);
			request.put("myRanking", myRanking);
			request.put("followUserList", followUserList);
			
		}
		
		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("EVENT_ID", eventId);
		parmsMap.put("FROM_OPENID", getSessionOpenid());
		
		Map<String,Object> resultmap = eventService.select("Event.SHOP_EVENT_USER_SELECT",parmsMap);
		
		boolean enable = true;
		if(resultmap == null || resultmap.isEmpty()){
			enable =true;
		}else{
			Integer status = (Integer)resultmap.get("STATUS");
			if(status == 0){
				enable = false;
			}else{
				enable = true;
			}
		}
		
		logger.info("enable===" +  enable);
		
		request.put("enable", enable);
		request.put("isClosed", isClosed());
		
		return "participate";
	}
	
	public boolean isClosed(){
		// TODO Auto-generated method stub
		boolean closed = true;
		try {
			Date currentDate = new Date();
			Date deadline = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse("2015-05-22 13:59:59");
			closed = currentDate.getTime() > deadline.getTime();
		} catch (ParseException e) {
			 
		}
		
		return closed;
	}
	
	
	public String saveEventUser() {
		
		logger.info("-------------------------------");
		SessionMember sessionMember = getSessionMember();
		
		Integer eventId = IntegerUtils.valueOf(getRequest().getParameter("eventId"));
		String mobile = getRequest().getParameter("mobile");
		 
		 
		try {
			if(StringUtils.isEmpty(mobile)){
				throw new Exception("mobile is null");
			}
			
			if(sessionMember != null){
				
				Map<String, Object> parmsMap = new HashMap<String, Object>();
				parmsMap.put("EVENT_ID", eventId);
				parmsMap.put("FROM_OPENID", sessionMember.getOpenid());
				parmsMap.put("MOBILE", mobile);
				
				Map<String,Object> resultmap = eventService.select("Event.SHOP_EVENT_USER_INSERT",parmsMap);
				
				boolean success = true;
				if(resultmap == null || resultmap.isEmpty()){
					success =false;
				}else{
					Integer status = (Integer)resultmap.get("STATUS");
					if(status == 0){
						success = true;
					}else{
						success = false;
					}
				}
				
				Map<String,Object> rtnMap = new HashMap<String,Object>();
				rtnMap.put("success", success); 
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
