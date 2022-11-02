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
import java.util.Random;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.framework.utilities.LogUtils;
import com.waremec.weixin.domain.user.SessionMember;
import com.waremec.wpt.admin.service.CustService;
import com.waremec.wpt.front.event.domain.Angle;

/** 
 * @Package com.waremec.wpt.front.event.action 
 * @FileName Event00007Action
 * @Description  
 * @author taebem 
 * @date 2015年5月26日 下午4:42:13 
 *  
 */
@Controller("event00007Action")
@Scope(ScopeType.prototype)
public class Event00007Action extends EventBaseAction {

	private static final long serialVersionUID = 1L;

	private static final int EVENT_TYPE_IS_FIRST = 1;
	private static final int EVENT_TYPE_TODAY = 2;
	private static final int EVENT_ENABLE_FRIENDS = 3;
	@Resource
	private CustService custService;
	
	public String index() {
		long startTime = System.currentTimeMillis();
		try {
			
			jsSdkWithEventSttingNotOpenid();
			eventInit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
//		jsSdkStting();

		LogUtils.getMethodExecuteTime(startTime);
		return "index";
	}
	
	
	public String participate() {
		
		SessionMember sessionMember = getSessionMember();
		
		Integer eventId = getId();
		
		System.out.println("sessionMember==" + sessionMember);
		
	/*	if(5 > 1){
			jsSdkWithEventSttingNotOpenid();
			eventInit();
			return "participate";
		}
		*/
		
		String fromOpenid = getFromOpenid();
		if(StringUtils.isBlank(fromOpenid)){
			Map<String, Object> parmsMap = new HashMap<String, Object>();
			parmsMap.put("EVENT_ID", eventId);
			parmsMap.put("OPENID", getSessionOpenid());
			parmsMap.put("TYPE", EVENT_TYPE_IS_FIRST);
			
			Map<String, Object> resultMap = eventService.select("Event.EVENT_00007_POINT_CHECK",parmsMap);
			
			String isFirst = (String)resultMap.get("SUCCESS");
			
			if("Y".equals(isFirst)){
				jsSdkWithEventSttingNotOpenid();
				eventInit();
				return "participate";
			}
		} 
			
		Map<String, Object> parmsMap  = new HashMap<String,Object>();
		if(StringUtils.isNotEmpty(getFromOpenid())){
			jsSdkWithEventStting();
			eventInit();
			
			if(sessionMember != null){
				//获取自己信息
				Map<String,Object> user = new HashMap<String, Object>();
				user.put("SHOP_ID", sessionMember.getShopId());
				user.put("CUST_SYS_ID", sessionMember.getCustSysId());
				user = custService.selectChat("Cust.getChat", user);
				request.put("user", user);
			}
			
			parmsMap.clear();
			parmsMap.put("EVENT_ID", eventId);
			parmsMap.put("OPENID", getFromOpenid());
			
			Map<String, Object> userSummary = eventService.select("Event.EVENT_00007_POINT_GET_SUM",parmsMap);
			
			request.put("userSummary", userSummary);
			
			parmsMap.clear();
			parmsMap.put("EVENT_ID", eventId);
			parmsMap.put("OPENID", getFromOpenid());
			List<Map<String, Object>> friendsList = eventService.selectList("Event.EVENT_00007_POINT_FRIENDS_LIST",parmsMap);
			request.put("friendsList", friendsList);
			
			parmsMap.clear();
			parmsMap.put("EVENT_ID", eventId);
			parmsMap.put("OPENID", getSessionOpenid());
			parmsMap.put("FROM_OPENID", getFromOpenid());
			parmsMap.put("TYPE", EVENT_ENABLE_FRIENDS);
			
			Map<String, Object> checkItem = eventService.select("Event.EVENT_00007_POINT_CHECK",parmsMap);
			request.put("checkItem", checkItem);
			
		}else{
			
			if(sessionMember == null){
				jsSdkWithEventSttingNotOpenid();
				eventInit();
				return "participate";
			}else{
				jsSdkWithEventStting();
				eventInit();
			}
			
			 //获取自己信息
			Map<String,Object> user = new HashMap<String, Object>();
			user.put("SHOP_ID", sessionMember.getShopId());
			user.put("CUST_SYS_ID", sessionMember.getCustSysId());
			user = custService.selectChat("Cust.getChat", user);
			request.put("user", user);
			
			parmsMap.clear();
			parmsMap.put("EVENT_ID", eventId);
			parmsMap.put("OPENID", getSessionOpenid());
			
			Map<String, Object> userSummary = eventService.select("Event.EVENT_00007_POINT_GET_SUM",parmsMap);
			request.put("userSummary", userSummary);
			
			parmsMap.clear();
			parmsMap.put("EVENT_ID", eventId);
			parmsMap.put("OPENID", getSessionOpenid());
			List<Map<String, Object>> friendsList = eventService.selectList("Event.EVENT_00007_POINT_FRIENDS_LIST",parmsMap);
			request.put("friendsList", friendsList);
			
			
			parmsMap.clear();
			parmsMap.put("EVENT_ID", eventId);
			parmsMap.put("OPENID", getSessionOpenid());
			parmsMap.put("TYPE", EVENT_TYPE_TODAY);
			
			Map<String, Object> checkItem = eventService.select("Event.EVENT_00007_POINT_CHECK",parmsMap);
			request.put("checkItem", checkItem);
			
		}
		 
		List<Map<String, Object>> gameItemList = eventService.getGameItemListById(eventId);
		request.put("gameItemList", gameItemList);
		 
		return "participated";
		
	}
	public String participated() {
		
		jsSdkWithEventStting();
		eventInit();
		
		SessionMember sessionMember = getSessionMember();
		
		Integer eventId = getId();
		
		System.out.println("sessionMember==" + sessionMember);
		
		String fromOpenid = getFromOpenid();
		if(StringUtils.isBlank(fromOpenid)){
			Map<String, Object> parmsMap = new HashMap<String, Object>();
			parmsMap.put("EVENT_ID", eventId);
			parmsMap.put("OPENID", getSessionOpenid());
			parmsMap.put("POINT_TYPE", EVENT_TYPE_IS_FIRST);
			parmsMap.put("POINT", 300);
			
			eventService.select("Event.EVENT_00007_POINT_INSERT",parmsMap);
		
		} 
		
		Map<String, Object> parmsMap  = new HashMap<String,Object>();
		if(StringUtils.isNotEmpty(getFromOpenid())){
			if(sessionMember != null){
				//获取自己信息
				Map<String,Object> user = new HashMap<String, Object>();
				user.put("SHOP_ID", sessionMember.getShopId());
				user.put("CUST_SYS_ID", sessionMember.getCustSysId());
				user = custService.selectChat("Cust.getChat", user);
				request.put("user", user);
			}
			
			parmsMap.clear();
			parmsMap.put("EVENT_ID", eventId);
			parmsMap.put("OPENID", getFromOpenid());
			
			Map<String, Object> userSummary = eventService.select("Event.EVENT_00007_POINT_GET_SUM",parmsMap);
			
			request.put("userSummary", userSummary);
			
			parmsMap.clear();
			parmsMap.put("EVENT_ID", eventId);
			parmsMap.put("OPENID", getFromOpenid());
			List<Map<String, Object>> friendsList = eventService.selectList("Event.EVENT_00007_POINT_FRIENDS_LIST",parmsMap);
			request.put("friendsList", friendsList);
			
			parmsMap.clear();
			parmsMap.put("EVENT_ID", eventId);
			parmsMap.put("OPENID", getSessionOpenid());
			parmsMap.put("FROM_OPENID", getFromOpenid());
			parmsMap.put("TYPE", EVENT_ENABLE_FRIENDS);
			
			Map<String, Object> checkItem = eventService.select("Event.EVENT_00007_POINT_CHECK",parmsMap);
			request.put("checkItem", checkItem);
		}else{
			
			//获取自己信息
			Map<String,Object> user = new HashMap<String, Object>();
			user.put("SHOP_ID", sessionMember.getShopId());
			user.put("CUST_SYS_ID", sessionMember.getCustSysId());
			user = custService.selectChat("Cust.getChat", user);
			request.put("user", user);
			
			parmsMap.clear();
			parmsMap.put("EVENT_ID", eventId);
			parmsMap.put("OPENID", getSessionOpenid());
			
			Map<String, Object> userSummary = eventService.select("Event.EVENT_00007_POINT_GET_SUM",parmsMap);
			request.put("userSummary", userSummary);
			
			parmsMap.clear();
			parmsMap.put("EVENT_ID", eventId);
			parmsMap.put("OPENID", getSessionOpenid());
			List<Map<String, Object>> friendsList = eventService.selectList("Event.EVENT_00007_POINT_FRIENDS_LIST",parmsMap);
			request.put("friendsList", friendsList);
			
			
			parmsMap.clear();
			parmsMap.put("EVENT_ID", eventId);
			parmsMap.put("OPENID", getSessionOpenid());
			parmsMap.put("TYPE", EVENT_TYPE_TODAY);
			
			Map<String, Object> checkItem = eventService.select("Event.EVENT_00007_POINT_CHECK",parmsMap);
			request.put("checkItem", checkItem);
			
		}
		
		List<Map<String, Object>> gameItemList = eventService.getGameItemListById(eventId);
		request.put("gameItemList", gameItemList);
		
		return "participated";
		
	}
	
	
	public  Angle getAngle() {
		// TODO Auto-generated method stub
		// getAngle
		Random rand = new Random();
		int angle = rand.nextInt(360);

		// 1 [5,40] -50
		// 2 [50,85] 10
		// 3 [95,130] 500
		// 4 [140,175] -1000
		// 5 [185,220] 50
		// 6 [230,265] -10
		// 7 [275,310] -500
		// 8 [320,355] +1000

		if (angle >= 5 && angle <= 40) {
			return new Angle(-50, angle);
		} else if (angle >= 50 && angle <= 85) {
			return new Angle(10, angle);
		} else if (angle >= 95 && angle <= 130) {
			return new Angle(500, angle);
		} else if (angle >= 140 && angle <= 175) {
			return new Angle(-1000, angle);
		} else if (angle >= 185 && angle <= 220) {
			return new Angle(50, angle);
		} else if (angle >= 230 && angle <= 265) {
			return new Angle(-10, angle);
		} else if (angle >= 275 && angle <= 310) {
			return new Angle(-500, angle);
		} else if (angle >= 320 && angle <= 355) {
			return new Angle(1000, angle);
		} else {
			return getAngle();
		}
	}
	
	public String todayEnable(){
		
		boolean enable = false;
		
		Integer eventId = getId();	
	 
		Map<String, Object> parmsMap = new HashMap<String, Object>();
		if(StringUtils.isNotEmpty(getFromOpenid())){
			parmsMap.put("EVENT_ID", eventId);
			parmsMap.put("OPENID", getSessionOpenid());
			parmsMap.put("FROM_OPENID", getFromOpenid());
			parmsMap.put("TYPE", EVENT_ENABLE_FRIENDS);
		}else{
			parmsMap.put("EVENT_ID", eventId);
			parmsMap.put("OPENID", getSessionOpenid());
			parmsMap.put("TYPE", EVENT_TYPE_TODAY);
		}
		
		Map<String, Object> checkItem = eventService.select("Event.EVENT_00007_POINT_CHECK",parmsMap);
		
		
		  
//			SELECT CNT = @CNT
//			  , TOTAL_POINT = DBO.fn_GET_EVENT_7_AMONT(@FROM_OPENID)    
//			  , OBTAIN_CNT = (SELECT COUNT(*) FROM EVENT_00007_4500)
//			  ,  SELF_CNT = (SELECT COUNT(*) FROM EVENT_00007_4500 WHERE OPENID = @FROM_OPENID)
//		
		Integer cnt 		= (Integer)checkItem.get("CNT");
		Integer totalPoint 	= (Integer)checkItem.get("TOTAL_POINT");
		Integer obtainCnt 	=  (Integer)checkItem.get("OBTAIN_CNT");
		Integer selfCnt 	=  (Integer)checkItem.get("SELF_CNT"); 
		
		if(selfCnt > 0){
			Map<String,Object> rtnMap = new HashMap<String,Object>();
			
			String msg4500 = "<div class='result4500' ><img alt='' src='/front/event/00007/images/participated/img_congratulation.png'  ></div> "
					+"<div class='result4500Close' ><img alt='' src='/front/event/00007/images/participated/btn_4500_close.png'  ></div>";
			
			rtnMap.put("type", 4500);
			rtnMap.put("msg4500", msg4500);
			
			renderJSON(rtnMap);
			return NONE;
		}
		
		if(cnt > 0){
			Map<String,Object> rtnMap = new HashMap<String,Object>();
			rtnMap.put("type", 0);
			renderJSON(rtnMap);
			return NONE;
		}
		
		
		Angle angle = null;
		if(selfCnt < 1){
			if(obtainCnt >= 5){//已经5个人中奖不允许其他人中奖
				Random rand = new Random();
				int point = rand.nextInt(360);
				if(totalPoint < 3500 ){
					angle = getAngle();
				}else if(totalPoint >= 3500 && totalPoint < 4000){
					angle = new Angle(-500, rand.nextInt(35) + 275);
				}else if(totalPoint >= 4000 && totalPoint < 4500){
					angle = new Angle(1000, rand.nextInt(35) + 320);
				}else if(totalPoint > 4500 && totalPoint <= 5500){
					angle = new Angle(500, rand.nextInt(35) + 95);
				}else if(totalPoint > 5500){
					angle = getAngle();
				}  
			}else{
				angle = getAngle() ;
			}
		} 
		
		parmsMap.clear();
		parmsMap.put("EVENT_ID", eventId);
		parmsMap.put("OPENID", getSessionOpenid());
		parmsMap.put("FROM_OPENID", getFromOpenid());
		parmsMap.put("POINT_TYPE", 2);
		parmsMap.put("POINT", angle.getPoint());
//		Map<String, Object> resultMap = eventService.select("Event.EVENT_00007_POINT_INSERT",parmsMap);
		eventService.select("Event.EVENT_00007_POINT_INSERT",parmsMap);
		
//		Integer type = (Integer)resultMap.get("OUT_TYPE");
		
		Map<String,Object> rtnMap = new HashMap<String,Object>();
		rtnMap.put("type", 1);
		rtnMap.put("angle", angle);
		
		renderJSON(rtnMap);
		
		return NONE;
		 
		  
	}
	 
	public String savePoint11(){
		 
		boolean success = true;
		String err_msg = "";
		
		Integer eventId = getId();	
		
		Integer itemId = IntegerUtils.valueOf(getRequest().getParameter("itemId"));
		Integer point = IntegerUtils.valueOf(getRequest().getParameter("point"));
		
		
		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("EVENT_ID", eventId);
		parmsMap.put("OPENID", getSessionOpenid());
		parmsMap.put("FROM_OPENID", getFromOpenid());
		parmsMap.put("ITEM_ID", itemId);
		parmsMap.put("POINT_TYPE", 2);
		parmsMap.put("POINT", point);
		
		
		Map<String, Object> resultMap = eventService.select("Event.EVENT_00007_POINT_INSERT",parmsMap);
		
		Integer type = (Integer)resultMap.get("OUT_TYPE");
		
		Map<String,Object> rtnMap = new HashMap<String,Object>();
		
		rtnMap.put("success", true);
		rtnMap.put("type", type);
		
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

}