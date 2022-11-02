/**   
* @Title: Event00035Action.java 
* @Package com.waremec.wpt.front.event.action 
* @Description:大韩航空 春节活动
* @author naRan
* @date 2011年1月22日 
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
import com.waremec.weixin.domain.user.SessionMember;
import com.waremec.weixin.domain.user.WXUser;
import com.waremec.weixin.service.WeixinUserService;
import com.waremec.wpt.front.domain.SessionSkin;

@Controller("event00035Action")
@Scope(ScopeType.prototype)
public class Event00035Action extends EventBaseAction {
	
	
	private static final long serialVersionUID = 1L;
	private static final int EVENT_ENABLE_FRIENDS = 3;
	
	@Resource
	private WeixinUserService weixinUserService;
	

	public String index() {
		try {
			jsSdkWithEventStting();
			eventInit();

			SessionSkin sessionSkin = getSessionSkin();
			
			WXUser user = weixinUserService.getUserInfoByOpenid(getSessionOpenid());
			if(user != null){
				request.put("userInfo", user);
			}

			//---------------------------------------------------------------
			// 计数器
			//---------------------------------------------------------------
			siteCounting(getId(), sessionSkin.getShopId(), getFromOpenid(), getSessionOpenid(), "INDEX");
			//---------------------------------------------------------------
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Event00035Action.index!!!!" + e.getMessage());
		}
		
		return "index";
	}
	
	/**
	 * 跳转到我的游戏页面
	 * @return
	 */
	public String eventMain(){

		jsSdkWithEventStting();
		eventInit();
		
		String req = null;
		
		String m = getRequest().getParameter("main");
		
		Integer eventId = getId();
		String openid = getSessionOpenid();
		String fromId = getFromOpenid();

//		try {
//			jsSdkWithEventStting();
//			eventInit();
//		} catch (Exception e) {
//			logger.error("Event00035Action.index!!!!!" + e.getMessage());
//		}
//		
		Map<String, Object> queryMap  = new HashMap<String,Object>();
		
		//检查是不是朋友分享的
		if(StringUtils.isNotEmpty(fromId)){
			logger.info("11111111111111111111111111111111111111111111111111111");
			//检查是否是分享页面过来的
			if(StringUtils.isNotBlank(m)){
				logger.info("22222222222222222222222222222222222222222222222222222");
				queryMap.clear();
				queryMap.put("EVENT_ID", eventId);
				queryMap.put("OPENID", openid);
				Map<String, Object> mainInfo = eventService.select("Event.EVENT_00007_POINT_GET_SUM",queryMap);
				
				
				logger.info("mainInfo===>"+mainInfo.toString());
				
				if(mainInfo.get("IS_FIRST").equals("Y")){
					request.put("mainInfo", mainInfo);
					//第一次进游戏，无自己目的地
					WXUser user = weixinUserService.getUserInfoByOpenid(openid);
					if(user != null){
						request.put("userInfo", user);
					}
					req = "eventMain";
				} else {
					//非第一次，已有自己目的地
					request.put("mainInfo", mainInfo);
					List<Map<String, Object>> friendsList = eventService.selectList("Event.EVENT_00007_POINT_FRIENDS_LIST",queryMap);
					request.put("friendsList", friendsList);
					
					req = "myInfo";
				}
				
			} else {
				logger.info("333333333333333333333333333333333333333333333333333333333333");
				if(StringUtils.isNotEmpty(fromId) && StringUtils.isNotEmpty(openid)){//别人分享，openid和FromOpenid同时存在
					logger.info("4444444444444444444444444444444444444444444444444444");
					queryMap.clear();
					
					queryMap.put("EVENT_ID", eventId);
//					queryMap.put("OPENID", openid);
					queryMap.put("OPENID", fromId);
					
					Map<String, Object> firiendDestination = eventService.select("Event.EVENT_00007_POINT_GET_SUM",queryMap);
					//好友的朋友列表
					List<Map<String, Object>> friendsList = eventService.selectList("Event.EVENT_00007_POINT_FRIENDS_LIST",queryMap);
					request.put("firiendDestination", firiendDestination);
					request.put("friendsList", friendsList);
					request.put("fromOpenid", fromId);
					
					//自己的目的地
					queryMap.clear();
					queryMap.put("EVENT_ID", eventId);
//					queryMap.put("OPENID", fromId);
					queryMap.put("OPENID", openid);
					
					Map<String, Object> mainDestination = eventService.select("Event.EVENT_00007_POINT_GET_SUM",queryMap);
					request.put("mainDestination", mainDestination);
					
					req =  "friendShare";

				}else {
					logger.info("555555555555555555555555555555555555555555555555555555555555555555555555");
					queryMap.clear();
					queryMap.put("EVENT_ID", eventId);
					queryMap.put("OPENID", openid);
					Map<String, Object> mainInfo = eventService.select("Event.EVENT_00007_POINT_GET_SUM",queryMap);
					if(mainInfo.get("IS_FIRST").equals("Y")){
						//第一次进游戏，无自己目的地
						WXUser user = weixinUserService.getUserInfoByOpenid(openid);
						if(user != null){
							request.put("userInfo", user);
						}
						req = "eventMain";
					} else {
						//非第一次，已有自己目的地
						request.put("mainInfo", mainInfo);
						List<Map<String, Object>> friendsList = eventService.selectList("Event.EVENT_00007_POINT_FRIENDS_LIST",queryMap);
						request.put("friendsList", friendsList);
						
						req = "myInfo";
					}
				}

			}
			
		}else{
			//用户信息
			if(StringUtils.isNotBlank(openid)){
				//检查是否玩过游戏，如果玩过跳转到游戏结果页面
				queryMap.put("EVENT_ID", eventId);
				queryMap.put("OPENID", openid);
				Map<String, Object> mainInfo = eventService.select("Event.EVENT_00007_POINT_GET_SUM",queryMap);
				if(mainInfo.get("IS_FIRST").equals("Y")){
					//第一次进游戏，无自己目的地
					WXUser user = weixinUserService.getUserInfoByOpenid(openid);
					
					if(user != null){
						request.put("userInfo", user);
					}
					
					req = "eventMain";
				} else {
					//非第一次，已有自己目的地
					request.put("mainInfo", mainInfo);

					List<Map<String, Object>> friendsList = eventService.selectList("Event.EVENT_00007_POINT_FRIENDS_LIST",queryMap);
					request.put("friendsList", friendsList);
					
					req = "myInfo";
				}
				
			} else {
				req = "nosession";
			}
		}
		
		SessionSkin sessionSkin = getSessionSkin();
		//---------------------------------------------------------------
		// 计数器
		//---------------------------------------------------------------
		siteCounting(getId(), sessionSkin.getShopId(), getFromOpenid(), getSessionOpenid(), "INDEX");
		
		return req;
	}
	
	/**
	 * 获取随机数
	 * @return
	 */
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
		//随机数
		Map<String, Object> queryMap  = new HashMap<String,Object>();
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		if(StringUtils.isNotEmpty(getFromOpenid())){
			logger.info("帮朋友的~!帮朋友的~!帮朋友的~!帮朋友的~!帮朋友的~!帮朋友的~!");
			//帮朋友的
			queryMap.clear();
			queryMap.put("EVENT_ID", eventId);
			queryMap.put("OPENID", getSessionOpenid());
			queryMap.put("FROM_OPENID", getFromOpenid());
			queryMap.put("TYPE", EVENT_ENABLE_FRIENDS);
			
			//调取获得随机数的存储过程
			Map<String, Object> mainInfo = eventService.select("Event.EVENT_POINT_INSERT",queryMap);
			
			logger.info("mainInfo=======>"+mainInfo.toString());
			
			returnMap.put("mainInfo", mainInfo);
			
		}else{
			//自己的
			logger.info("自己的~!自己的~!自己的~!自己的~!自己的~!自己的~!");
			queryMap.clear();
			queryMap.put("EVENT_ID", eventId);
			queryMap.put("OPENID", getSessionOpenid());
			//调取获得随机数的存储过程
			Map<String, Object> mainInfo = eventService.select("Event.EVENT_POINT_INSERT",queryMap);
			returnMap.put("mainInfo", mainInfo);
			
		}
		
		renderJSON(returnMap);
		return NONE;
		
	};
	
	/**
	 * 跳转到自己的页面并且显示朋友列表
	 */
	public String myInfo(){
//		logger.info("myInfo");
		String req = null;
		String m = getRequest().getParameter("main");
		
		jsSdkWithEventStting();
		eventInit();
		
		SessionSkin sessionSkin = getSessionSkin();
		Integer eventId = getId();
		String openid = getSessionOpenid();
		String fromId = getFromOpenid();
		
		Map<String, Object> queryMap  = new HashMap<String,Object>();
		if(StringUtils.isNotEmpty(fromId)){
			//检查是否是分享页面过来的
			if(StringUtils.isNotBlank(m)){
				queryMap.clear();
				queryMap.put("EVENT_ID", eventId);
				queryMap.put("OPENID", openid);
				Map<String, Object> mainInfo = eventService.select("Event.EVENT_00007_POINT_GET_SUM",queryMap);
				if(mainInfo.get("IS_FIRST").equals("Y")){
					//第一次进游戏，无自己目的地
					WXUser user = weixinUserService.getUserInfoByOpenid(openid);
					if(user != null){
						request.put("userInfo", user);
					}
					req = "eventMain";
				} else {
					//非第一次，已有自己目的地
					request.put("mainInfo", mainInfo);
					List<Map<String, Object>> friendsList = eventService.selectList("Event.EVENT_00007_POINT_FRIENDS_LIST",queryMap);
					request.put("friendsList", friendsList);
					
					req = "myInfo";
				}
				
			} else {
				if(StringUtils.isNotEmpty(fromId) && StringUtils.isNotEmpty(openid)){//别人分享，openid和FromOpenid同时存在
					queryMap.clear();
					
					queryMap.put("EVENT_ID", eventId);
					queryMap.put("OPENID", fromId);
					
					Map<String, Object> firiendDestination = eventService.select("Event.EVENT_00007_POINT_GET_SUM",queryMap);
					//好友的朋友列表
					List<Map<String, Object>> friendsList = eventService.selectList("Event.EVENT_00007_POINT_FRIENDS_LIST",queryMap);
					request.put("firiendDestination", firiendDestination);
					request.put("friendsList", friendsList);
					request.put("fromOpenid", fromId);
					
					//自己的目的地
					queryMap.clear();
					queryMap.put("EVENT_ID", eventId);
					queryMap.put("OPENID", openid);
					
					Map<String, Object> mainDestination = eventService.select("Event.EVENT_00007_POINT_GET_SUM",queryMap);
					request.put("mainDestination", mainDestination);
					
					req =  "friendShare";

				}else {
					queryMap.clear();
					queryMap.put("EVENT_ID", eventId);
					queryMap.put("OPENID", openid);
					Map<String, Object> mainInfo = eventService.select("Event.EVENT_00007_POINT_GET_SUM",queryMap);
					if(mainInfo.get("IS_FIRST").equals("Y")){
						//第一次进游戏，无自己目的地
						WXUser user = weixinUserService.getUserInfoByOpenid(openid);
						if(user != null){
							request.put("userInfo", user);
						}
						req = "eventMain";
					} else {
						//非第一次，已有自己目的地
						request.put("mainInfo", mainInfo);
						List<Map<String, Object>> friendsList = eventService.selectList("Event.EVENT_00007_POINT_FRIENDS_LIST",queryMap);
						request.put("friendsList", friendsList);
						
						req = "myInfo";
					}
				}

			}
			
		}else{
			//用户信息
			if(StringUtils.isNotBlank(openid)){
				//检查是否玩过游戏，如果玩过跳转到游戏结果页面
				queryMap.put("EVENT_ID", eventId);
				queryMap.put("OPENID", openid);
				Map<String, Object> mainInfo = eventService.select("Event.EVENT_00007_POINT_GET_SUM",queryMap);
				if(mainInfo.get("IS_FIRST").equals("Y")){
					//第一次进游戏，无自己目的地
					WXUser user = weixinUserService.getUserInfoByOpenid(openid);
					
					if(user != null){
						request.put("userInfo", user);
					}
					
					req = "eventMain";
				} else {
					//非第一次，已有自己目的地
					request.put("mainInfo", mainInfo);

					List<Map<String, Object>> friendsList = eventService.selectList("Event.EVENT_00007_POINT_FRIENDS_LIST",queryMap);
					request.put("friendsList", friendsList);
					
					req = "myInfo";
				}
				
			} else {
				req = "nosession";
			}
		}
		
		//---------------------------------------------------------------
		// 计数器
		//---------------------------------------------------------------
		siteCounting(getId(), sessionSkin.getShopId(), getFromOpenid(), getSessionOpenid(), "MYINFO");
		//---------------------------------------------------------------
		
		return req;
		
	}

	/**
	 * 分享页面计数器
	 */
	
	public String share(){
		SessionSkin sessionSkin = getSessionSkin(); 
		//---------------------------------------------------------------
		// 计数器
		//---------------------------------------------------------------
		siteCounting(getId(), sessionSkin.getShopId(), getFromOpenid(), getSessionOpenid(), "SHARE");
		//---------------------------------------------------------------
		return NONE;
	}
	
	public String participate() {
		 
		Integer eventId = getId();
		String openid  = getRequest().getParameter("openid");
		
		logger.info("||||||||||||||participate12|||||||||||");
		logger.info("openid======>" + openid);
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
	
	//计数器
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
