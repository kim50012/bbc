/**   
* @Title: Event00008Action.java 
* @Package com.waremec.wpt.front.event.action 
* @Description:  
* @author taebem
* @date 2015年5月26日 下午4:42:22 
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

import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.framework.utilities.ListUtil;
import com.waremec.framework.utilities.LogUtils;
import com.waremec.framework.utilities.MapUtil;
import com.waremec.framework.utilities.StringUtil;
import com.waremec.weixin.domain.user.SessionMember;
import com.waremec.wpt.front.domain.SessionSkin;

/** 
 * @Package com.waremec.wpt.front.event.action 
 * @FileName Event00008Action
 * @Description  
 * @author taebem 
 * @date 2015年5月26日 下午4:42:22 
 *  
 */
@Controller("event00008Action")
@Scope(ScopeType.prototype)
public class Event00008Action extends EventBaseAction {

	private static final long serialVersionUID = 1L;

	
	private static final String QRCODE_KEY_1 = "1InQMV6hmlJCpEeL4H1f3M4owMlOdlKT"; 
	private static final String QRCODE_KEY_2 = "425lbREZhDmwe9wfvwP7kU8CL7PY9Qpk";
	private static final String QRCODE_KEY_3 = "Q0GHzICzOxr91Es2Lvs3FDzVenFy3uq9";
	private static final String QRCODE_KEY_4 = "JGQ58i1FwRnXMTPsAogZSTR3OTC0PWeM";
	private static final String QRCODE_KEY_5 = "LeHshv4dxLtpLzMW6QO35D5xvuSqeZMr";
	/**
	 * @author:wangbin
	 * 加载国家列表
	 * @return 
	 */
	public String showCountryData(){
		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("shopId", getRequest().getParameter("shopId"));
		parmsMap.put("natName", StringUtil.emptyToNull(getRequest().getParameter("natName")));
		
		List<Map<String,Object>>  list= commonService.selectList("Event.EVENT_00008_NATIONALITY_MST_SELECT",parmsMap);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		ListUtil.convertClob2String(list);
//		ListUtil.printListMap(newsList);
		returnMap.put("list",list);
		renderJSON(returnMap);
		return NONE;
	}
	//保存参加活动的客户信息
	public String saveCustMsg(){
		SessionMember sessionMember = getSessionMember();
		Map<String,Object> map= new HashMap<String,Object>();
		map.put("shopId", getRequest().getParameter("shopId"));
		map.put("parId", null);
		map.put("openId", sessionMember.getOpenid());
		map.put("natId", getRequest().getParameter("countryId"));
		map.put("flightNoArrive", getRequest().getParameter("arriveNum"));
		map.put("flightDateArrive", getRequest().getParameter("arriveDate"));
		map.put("flightNoDep", getRequest().getParameter("leaveNum"));
		map.put("flightDateDep", getRequest().getParameter("leaveDate"));
		map.put("passPortName", getRequest().getParameter("passportName"));
		Map<String,Object> returnResult = commonService.select("Event.EVENT_00008_PARTAKE_INSERT", map);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result",returnResult);
		renderJSON(returnMap);
		return NONE;
	}
	
	
	
	public String index() {
		jsSdkWithEventSttingNotOpenid();
		eventInit();
		
		SessionMember sessionMember = getSessionMember();
		Integer shopId 	= IntegerUtils.valueOf(getRequest().getParameter("shopId"));  
		if(shopId == null){
			SessionSkin sessionSkin = getSessionSkin();
			shopId = sessionSkin.getShopId();
		}
		
		String qr = getRequest().getParameter("qr");
		Integer scanType = null;
		if(StringUtils.isNotBlank(qr)){
			if(QRCODE_KEY_1.equals(qr)){
				scanType = 1;
			}else if(QRCODE_KEY_2.equals(qr)){
				scanType = 2;
			}else if(QRCODE_KEY_3.equals(qr)){
				scanType = 3;
			}else if(QRCODE_KEY_4.equals(qr)){
				scanType = 4;
			}else if(QRCODE_KEY_5.equals(qr)){
				scanType = 5;
			}
		}
		
		
		System.out.println("qrcode===" + scanType);
		
		
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		paramsMap.put("SHOP_ID", shopId);
		paramsMap.put("OPENID", sessionMember.getOpenid());
		if(scanType != null){
			paramsMap.put("SCAN_TYPE", scanType);
			
			eventService.select("Event.EVENT_00008_QR_HIST_INSERT",paramsMap);
		}
		
		
		Map<String, Object> scan  =  eventService.select("Event.EVENT_00008_QR_HIST_SELECT",paramsMap);
		request.put("scan", scan);
		
		return "index";
	}
	
	
	
	
	public String index2() {
		jsSdkStting();
		Integer eventId = getId();
		
		jsSdkWithEventSttingNotOpenid();
		eventInit();
		
		SessionMember sessionMember = getSessionMember();
		int loginFlag = 0;
		if (sessionMember != null) {
			loginFlag = 1;
		}
		String codeTurnFlag = "0";
		codeTurnFlag = getRequest().getParameter("codeTurnFlag");
		request.put("codeTurnFlag",codeTurnFlag);
		if(sessionMember != null){
			if(codeTurnFlag == "1" || "1".equals(codeTurnFlag)){
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("openId",sessionMember.getOpenid());
				map.put("shopId", sessionMember.getShopId());
				List<Map<String,Object>> list = commonService.selectList("Event.EVENT_00008_PARTAKE_SELECT",map);
				Map<String,Object> mapReturn = list.get(0); 
				request.put("mapReturn", mapReturn);
			}
		}
		
		request.put("loginFlag", loginFlag);
		return "index2";
	}
	
	public String participate() {
		 
		Integer eventId = getId();
		String openid  = getRequest().getParameter("openid");
		
		logger.info("||||||||||||||participate8|||||||||||");
		logger.info("openid======" + openid);
		logger.info("<<<<<<<<<<<<<<participate8>>>>>>>>>>>");
		
		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("EVENT_ID", eventId);
		parmsMap.put("FROM_OPENID", openid);
		parmsMap.put("MOBILE", null);
		
		eventService.select("Event.SHOP_EVENT_USER_INSERT",parmsMap);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("openId", openid);
		map.put("shopId", getRequest().getParameter("shopId"));
		List<Map<String,Object>> list = commonService.selectList("Event.EVENT_00008_PARTAKE_SELECT",map);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("success", true);
		returnMap.put("list", list);
		renderJSON(returnMap);
		
		return NONE;
	}
	
	
	public String detail(){
//		long startTime = System.currentTimeMillis();
		Integer eventId = getId();
		jsSdkStting();
		jsSdkWithEventSttingNotOpenid();
		eventInit();

		SessionMember sessionMember = getSessionMember();
		if(sessionMember != null){
			Boolean participated = eventService.haveParticipatedInEvent(eventId, getSessionOpenid());
			if(!participated){
				request.put("flag", 0);
				return "detail";
			}
			
			
			Map<String, Object> parmsMap = new HashMap<String, Object>();
			parmsMap.put("SHOP_ID", sessionMember.getShopId());
			parmsMap.put("OPENID", sessionMember.getOpenid());
			
			Map<String, Object> prizeMst = eventService.select("Event.EVENT_00008_QR_HIST_SELECT",parmsMap);
			
			MapUtil.printMap(prizeMst);
			request.put("prizeMst", prizeMst);
//			OPENID	PRIZE_DT	SCAN_TYPE_1	SCAN_TYPE_2	SCAN_TYPE_3	SCAN_TYPE_4	PRIZE_REMAINING_CNT
//			odMFxs32123iFoQT5vyWw0o_9GDw	2015-09-18 16:42:24.347	1	1	1	1	299
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("openId", sessionMember.getOpenid());
			map.put("shopId", sessionMember.getShopId());
			List<Map<String,Object>> list = commonService.selectList("Event.EVENT_00008_PARTAKE_SELECT",map);
			Integer registerFlag = (Integer) list.get(0).get("REGISTER_FLAG");
			request.put("flag", registerFlag);
		}else{
			logger.error("event00007 sessionMember is null!!!!!!!!!!!!!!!!!");
			request.put("flag", 0);
		}
		
//		LogUtils.getMethodExecuteTime(startTime);
		return "detail";
	}
	
	
	public String scratched() {
		 
		Integer shopId 	= IntegerUtils.valueOf(getRequest().getParameter("shopId"));  
		String openid  = getRequest().getParameter("openid");
		logger.info("||||||||||||||scratched|||||||||||");
		logger.info("openid======" + openid);
		
		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("SHOP_ID", shopId);
		parmsMap.put("OPENID", openid);
		
		eventService.select("Event.EVENT_00008_QR_PRIZE_UPDATE",parmsMap);
		 
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("success", true);
		renderJSON(returnMap);
		
		return NONE;
	}
	

	public String paging(){
		long startTime = System.currentTimeMillis();
		jsSdkStting();
		jsSdkWithEventSttingNotOpenid();
		eventInit();
		
		int pageNo = IntegerUtils.valueOf(getRequest().getParameter("pageNo"),1);
		int scrollTop = IntegerUtils.valueOf(getRequest().getParameter("scrollTop"),0);
		
		logger.info("scrollTop==" + scrollTop);

		List<Integer> data = new ArrayList<Integer>();
		
		for(int i = 1; i <=  pageNo * 10; i++){
			data.add(i);
		}
		request.put("data", data);
		
		LogUtils.getMethodExecuteTime(startTime);
		return "paging";
	}
	public String pagingf(){
		long startTime = System.currentTimeMillis();
		
		
//		jsSdkWithEventSttingNotOpenid();
//		eventInit();
		
		int pageNo = IntegerUtils.valueOf(getRequest().getParameter("pageNo"),1);
		
		logger.info("pageNo==" + pageNo);
		
		int pageSize = 10;
		
		Map<String,Object> returnMap = new HashMap<String,Object>();
		returnMap.put("pageNo", pageNo); 
		
		List<Integer> data = new ArrayList<Integer>();
		
		for(int i = 1; i <=10; i++){
			data.add((pageNo - 1) * (pageSize) + i);
		}
		
		returnMap.put("data", data);
		
		LogUtils.getMethodExecuteTime(startTime);
		
		renderJSON(returnMap);
		return NONE;
	}
	
}
