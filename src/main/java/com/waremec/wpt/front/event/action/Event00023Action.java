/**   
* @Title: Event00021Action.java 
* @Package com.waremec.wpt.front.event.action 
* @Description:  
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
import com.waremec.framework.utilities.SessionUtils;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.domain.user.SessionMember;
import com.waremec.weixin.utils.Oauth2Utils;
import com.waremec.wpt.admin.service.CustService;
import com.waremec.wpt.front.event.domain.Angle;

/** 
 * @Package com.waremec.wpt.front.event.action 
 * @FileName Event00020Action
 * @Description  
 *  
 */
@Controller("event00023Action")
@Scope(ScopeType.prototype)
public class Event00023Action extends EventBaseAction {
	private static final long serialVersionUID = 1L;
	private static final int EVENT_TYPE_IS_FIRST = 1;
	private static final int EVENT_TYPE_TODAY = 2;
	private static final int EVENT_ENABLE_FRIENDS = 3;
	@Resource
	private CustService custService;
	/**
	 * 进入首页保存用户信息
	 * @return
	 */
	public String main(){
		jsSdkWithEventSttingNotOpenid();
		eventInit();
		SessionMember sessionMember = getSessionMember();
		Integer eventId = getId();
		String openid 	= (String)getSession().getAttribute(SessionUtils.SESSION_OPENID);
		System.out.println("sessionMember===========" + sessionMember);
		
		String fromOpenid = getFromOpenid();
		if(StringUtils.isBlank(fromOpenid)){
			Map<String, Object> parmsMap = new HashMap<String, Object>();
			parmsMap.put("EVENT_ID", eventId);
			parmsMap.put("OPENID", getSessionOpenid());
			jsSdkWithEventStting();
			eventInit();
			SessionMember isGz = weixinUserService.getSessionMemberById(openid);
			boolean isflow = false;
			if(isGz != null)isflow=true;
			request.put("isflow", isflow);
			System.out.println("走到了这一步---------------------");
			return "main";
		} 
		Map<String, Object> parmsMap  = new HashMap<String,Object>();
		if(StringUtils.isNotEmpty(getFromOpenid())){
			jsSdkWithEventStting();
			eventInit();
			SessionMember isGz = weixinUserService.getSessionMemberById(openid);
			boolean isflow = false;
			if(isGz != null)isflow=true;
			request.put("isflow", isflow);
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
			parmsMap.put("FROM_OPENID", getFromOpenid());
			
		}else{
			
			if(sessionMember == null){
				jsSdkWithEventSttingNotOpenid();
				eventInit();
				jsSdkStting();
				SessionMember isGz = weixinUserService.getSessionMemberById(openid);
				boolean isflow = false;
				if(isGz != null)isflow=true;
				request.put("isflow", isflow);
				return "main";
			}else{
				jsSdkWithEventStting();
				eventInit();
				SessionMember isGz = weixinUserService.getSessionMemberById(openid);
				boolean isflow = false;
				if(isGz != null)isflow=true;
				request.put("isflow", isflow);
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
			
		}
		 
		return "main";
	}
	/**
	 * 跳转写信页面
	 * @return
	 */
	public String send(){
		SessionMember sessionMember = getSessionMember();
		String urlcs=getRequest().getQueryString();
		/*
		 * 分析是自己还是朋友的查看分享的内容
		 
		if(sessionMember!=null &&urlcs!=null){
			String jlcount=getRequest().getParameter("jlcount");
			session.put("jlcount", jlcount);
			session.put("tempopenid", sessionMember.getOpenid());
			return "friendmain";
		}*/
		Integer eventId = getId();
		//jsSdkXjWithEventStting(); //在这方法里分享链接追加一参数
		eventInit();
		jsSdkStting();
		System.out.println("sessionMember==" + sessionMember);
		
		String fromOpenid = getFromOpenid();
		//当fromopenid没有值
		if(StringUtils.isBlank(fromOpenid)){
			Map<String, Object> parmsMap = new HashMap<String, Object>();
			parmsMap.put("EVENT_ID", eventId);
			parmsMap.put("OPENID", getSessionOpenid());
			//jsSdkXjWithEventStting(); 
			eventInit();
			return "send";
		} 
		Map<String, Object> parmsMap  = new HashMap<String,Object>();
		if(StringUtils.isNotEmpty(getFromOpenid())){
			//jsSdkXjWithEventStting(); 
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
			parmsMap.put("FROM_OPENID", getFromOpenid());
			
		}else{
			
			if(sessionMember == null){
				jsSdkWithEventSttingNotOpenid();
				eventInit();
				jsSdkStting();
				return "send";
			}else{
				//jsSdkXjWithEventStting(); 
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
			
		}
	/*	String jlcount=getRequest().getParameter("jlcount");
		session.put("jlcount", jlcount);
		System.out.println("------------------------------------------------------------------------------------"+session.get("jlcount"));*/
		return "send";
	}
	/**
	 * 保存发信信息
	 * @return
	 */
	public String save(){
		Integer eventId = getId();
		Integer type=2;
		String fromOpenid = getFromOpenid();
		String openid = getSessionOpenid();
		SessionMember sessionMember = getSessionMember();
		Map<String,Object> map= new HashMap<String,Object>();
		Map<String,Object> maps= new HashMap<String,Object>();
		map.put("EVENT_ID", eventId);
		map.put("openId", sessionMember.getOpenid());
		map.put("fromname", getRequest().getParameter("fromname"));
		map.put("fromtext", getRequest().getParameter("fromtext"));
		//增加了一个jlNum字段区分同一openid用户的分享内容
		// 查找同意openid发的分享信息条数
		maps.put("openid", openid);
		List<Map<String, Object>>fxList = eventService.selectList("Event.EVENT_00021_PERSONFX_SELECT",maps);
		Integer jlNum=(Integer)fxList.get(0).get("num");
		System.out.println("-----------------------------------------"+jlNum+"------------------------------");
		if(jlNum == null)
		{
			map.put("jlNum", 1);
		}else
		{
			map.put("jlNum", jlNum+1);
		}
		map.put("type", type);
		map.put("getdate", new Date());
		try {
			eventService.insert("Event.EVENT_00021_INSERT", map);
			map.put("status", "S");
			renderJSON(map);
		} catch (Exception e) {
			map.put("status", "F");
			renderJSON(map);
			e.printStackTrace();
		}
		return NONE;
	}
	
	
	public String friendmessage(){
		SessionMember sessionMember = getSessionMember();
		String fromOpenid = getFromOpenid();
		Map<String,Object> map= new HashMap<String,Object>();
		/*
		 * 分析是自己还是朋友的查看分享的内容
		 */
		/*if(session.get("tempopenid")!=null){*/
		if(fromOpenid == null){
			map.put("fromOpenid", session.get("tempopenid"));
		}else{
			map.put("fromOpenid", fromOpenid);
		}
		map.put("FxBZ",session.get("jlcount"));
		Map<String, Object> message = eventService.select("Event.EVENT_00021_SELECT", map);
		request.put("message", message);
		return "friendmessage";
	}
	//分享朋友后 转发的页面
	public String secfriendmessage(){
		SessionMember sessionMember = getSessionMember();
		String urlcs=getRequest().getQueryString();
		/*
		 * 分析是自己还是朋友的查看分享的内容
		 */
		if(sessionMember!=null &&urlcs!=null){
			String jlcount=getRequest().getParameter("jlcount");
			session.put("jlcount", jlcount);
			session.put("tempopenid", sessionMember.getOpenid());
			System.out.println("==========================="+jlcount+"===================================");
			return "friendmain";
		}
		if(urlcs == null){
			System.out.println("=======================urlce空========================================");
			request.put("fromtext", getRequest().getParameter("fromtext"));
			Integer eventId = getId();
			jsSdkXjWithEventStting(); //在这方法里分享链接追加一参数
			eventInit();
			System.out.println("sessionMember==" + sessionMember);
			return  "secfriendmessage";
		}
		String jlcount=getRequest().getParameter("jlcount");
		session.put("jlcount", jlcount);
		System.out.println("------------------------------------------------------------------------------------"+session.get("jlcount"));
		return "friendmain";
	}
	public String getfriend(){
		return "getfriend";
	}
	
	public String friendrecieved() {
		jsSdkWithEventSttingNotOpenid();
		eventInit();
		String openid 	= (String)getSession().getAttribute(SessionUtils.SESSION_OPENID);
		SessionMember isGz = weixinUserService.getSessionMemberById(openid);
		boolean isflow = false;
		if(isGz != null)isflow=true;
		request.put("isflow", isflow);
		return "friendrecieved";
	}


	

	
}
