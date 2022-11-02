/**   
* @Title: Event00033Action.java 
* @Package com.waremec.wpt.front.event.action 
* @Description:  
* @author naRan
* @date 2011年1月20日 
* @version V1.0   
*/
package com.waremec.wpt.front.event.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.PageData;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.MapUtil;
import com.waremec.weixin.domain.user.SessionMember;
//import com.waremec.wpt.admin.domain.AdminOrders;

/** 
 * @Package com.waremec.wpt.front.event.action 
 * @FileName Event00012Action
 * @Description  
 * @author taebem 
 * @date 2015年9月11日 下午1:04:07 
 *  
 */
@Controller("event00033Action")
@Scope(ScopeType.prototype)
public class Event00033Action extends EventBaseAction {
	private static final long serialVersionUID = 1L;

	public String index() {
		//long startTime = System.currentTimeMillis();
		try {
			//
			jsSdkWithEventSttingNotOpenid();
			eventInit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			logger.error("Event00033Action.index!!!!" + e.getMessage());
		}
		
//		Integer eventId = getId();
//		String openid = getSessionOpenid();
//		String fromOpenid = getFromOpenid();
		

		//LogUtils.getMethodExecuteTime(startTime);
		return "index";
	}
	
	public String detail() {
		//long startTime = System.currentTimeMillis();
		try {
			jsSdkWithEventStting();
			eventInit();
		} catch (Exception e) {
			// TODO: handle exceptions
			logger.error("Event00033Action.index!!!!!" + e.getMessage());
		}

		Integer eventId = getId();
		String openid = getSessionOpenid();
		String fromOpenid = getFromOpenid();
		
		if(StringUtils.isBlank(fromOpenid)){//自己页面
			SessionMember sessionMember = getSessionMember();
			if(sessionMember != null){
				//判断是否已经参加活动
				Boolean participated = eventService.haveParticipatedInEvent(eventId, openid);
				if(!participated){
					try {
						jsSdkWithEventSttingNotOpenid();
					} catch (Exception e) {
						// TODO: handle exception
						e.printStackTrace();
						logger.error("Event00033Action.index!!!!" + e.getMessage());
					}
					return "index";
				}
			}
		} 
		
		
		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("EVENT_ID", eventId);
		parmsMap.put("FROM_OPENID", fromOpenid);
		parmsMap.put("OPENID", openid);
		
		Map<String, Object> diceMst = eventService.select("Event.EVENT_00012_DICE_SELECT",parmsMap);
		
		System.err.println("SELECT DICE=" + diceMst.get("DICE"));
		System.err.println("SELECT SPOT_ORG=" + diceMst.get("SPOT_ORG"));
		System.err.println("SELECT SPOT_CUR=" + diceMst.get("SPOT_CUR"));
		
		MapUtil.printMap(diceMst);
		
		request.put("diceMst", diceMst);
		
		
		pageCurr = 1;
		pageUnit = 3;
		
		parmsMap.put("pageCurr", pageCurr);
		parmsMap.put("pageUnit", pageUnit);
		
		List<Map<String, Object>> friendList = eventService.selectList("Event.EVENT_00012_DICE_LIST_SELECT",parmsMap);
		
		PageData page = new PageData();
		if (!friendList.isEmpty()) {
			int totalCount = (Integer) friendList.get(0).get("TOTAL_COUNT");
			page = new PageData(pageCurr,pageUnit, totalCount , friendList);
			System.out.println("totalCount=" + totalCount);
			
			
			request.put("pageing", getPageing(pageCurr,5,totalCount));
		}
		
		request.put("page", page);
		
		//LogUtils.getMethodExecuteTime(startTime);
		return "detail";
	}
	public String friend() {
		pageUnit = 3;
		
		Integer eventId = getId();
		String openid = getSessionOpenid();
		String fromOpenid = getFromOpenid();
		
		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("EVENT_ID", eventId);
		parmsMap.put("FROM_OPENID", fromOpenid);
		parmsMap.put("OPENID", openid);
		
		parmsMap.put("pageCurr", pageCurr);
		parmsMap.put("pageUnit", pageUnit);
		
		List<Map<String, Object>> friendList = eventService.selectList("Event.EVENT_00012_DICE_LIST_SELECT",parmsMap);
		
		PageData page = new PageData();
		if (!friendList.isEmpty()) {
			int totalCount = (Integer) friendList.get(0).get("TOTAL_COUNT");
			page = new PageData(pageCurr,pageUnit, totalCount , friendList);
			System.out.println("totalCount=" + totalCount);
			
			
			request.put("pageing", getPageing(pageCurr,5,totalCount));
		}
		
		request.put("page", page);
		
		return "friend";
	}
	
	private List<Integer> getPageing(int pageNo, int pageSize,int totalCount){
		List<Integer> returns = new ArrayList<Integer>();
		
		
		Integer page = (pageNo % pageSize == 0) ?  pageNo / pageSize - 1 :  pageNo / pageSize;
//		Integer mod = pageNo % pageSize;
		Integer totalPage = (totalCount % 3 == 0) ?  totalCount / 3 :  totalCount / 3 + 1;
		
		String log = "";
		
		for(int i = 1; i <= pageSize; i++){
			int aa = page * pageSize + i;
			System.out.println("aa=" + aa + ", totalPage=" + totalPage);
			if(page * pageSize + i <= totalPage){
				returns.add(page * pageSize + i);
				log += page * pageSize + i + ",";
			}
		}
		
		
		System.out.println("pageNo=" + pageNo + "==>" + log);
		return returns;
	}
	
	
	public String participate() {
		 
		Integer eventId = getId();
		String openid  = getRequest().getParameter("openid");
		
		logger.info("||||||||||||||participate12|||||||||||");
		logger.info("openid======" + openid);
		logger.info("<<<<<<<<<<<<<<participate12>>>>>>>>>>>");
		
		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("EVENT_ID", eventId);
		parmsMap.put("FROM_OPENID", openid);
		parmsMap.put("MOBILE", null);
		
		eventService.select("Event.SHOP_EVENT_USER_INSERT",parmsMap);
		 
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("success", true);
		renderJSON(returnMap);
		
		return NONE;
	}
	
	public String getDice() {
		boolean success = true;
		String err_msg = "";
		
		Integer eventId = getId();
		String openid = getSessionOpenid();
		String fromOpenid = getFromOpenid();
		
		if(StringUtils.isBlank(openid)){
			openid  = getRequest().getParameter("openid");
		}
		if(StringUtils.isBlank(fromOpenid)){
			fromOpenid  = StringUtils.trimToNull(getRequest().getParameter("fromOpenid"));
		}
		 
		logger.info("aaaa fromOpenid=" + fromOpenid);
		logger.info("aaaa openid=" + openid);
		
		Map<String, Object> diceMst = new HashMap<String, Object>();
		
		try {
			
			Map<String, Object> parmsMap = new HashMap<String, Object>();
			parmsMap.put("EVENT_ID", eventId);
			parmsMap.put("FROM_OPENID", fromOpenid);
			parmsMap.put("OPENID", openid);
			
			logger.info("11111111111111111111");
			diceMst = eventService.select("Event.EVENT_00012_DICE_INSERT",parmsMap);
			MapUtil.printMap(diceMst);
			 logger.info("2222222222222222222");
			
			System.err.println("INSERT DICE=" + diceMst.get("DICE"));
			System.err.println("INSERT SPOT_ORG=" + diceMst.get("SPOT_ORG"));
			System.err.println("INSERT SPOT_CUR=" + diceMst.get("SPOT_CUR"));
		} catch (Exception e) {
			logger.error(e.getMessage());
			success = false;
			err_msg = e.getMessage();
		}

		 Map<String,Object> rtnMap = new HashMap<String,Object>();
			
		 rtnMap.put("success", success);
		 rtnMap.put("err_msg", err_msg);
		 rtnMap.put("data", diceMst);
		 
		 renderJSON(rtnMap);
		
		return NONE;
	}
	
}
