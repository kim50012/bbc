/**   
* @Title: Event00021Action.java 
* @Package com.waremec.wpt.front.event.action 
* @Description:  
* @version V1.0   
*/
package com.waremec.wpt.front.event.action;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSONObject;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.DateUtil;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.framework.utilities.LogUtils;
import com.waremec.framework.utilities.SessionUtils;
import com.waremec.framework.utilities.UploadFileUtil;
import com.waremec.framework.utilities.UploadResult;
import com.waremec.weixin.domain.user.SessionMember;
import com.waremec.wpt.admin.service.CustService;
import com.waremec.wpt.front.domain.SessionSkin;
import com.waremec.wpt.front.event.domain.Angle;

/** 
 * @Package com.waremec.wpt.front.event.action 
 * @FileName Event00020Action
 * @Description  
 *  
 */
@Controller("event00021Action")
@Scope(ScopeType.prototype)
public class Event00021Action extends EventBaseAction {
	private static final long serialVersionUID = 1L;
	private static final int EVENT_TYPE_IS_FIRST = 1;
	private static final int EVENT_TYPE_TODAY = 2;
	private static final int EVENT_ENABLE_FRIENDS = 3;
	private File fileEntity1;
	private File fileEntity2;
	private File fileEntity3;
	private File fileEntity4;
	private File fileEntity5;
	private String logoFileName1 ;
	private String logoFileName2 ;
	private String logoFileName3;
	private String logoFileName4;
	private String logoFileName5;
	private String	 cust_nm;
	private String birthday;
	private Integer adr_province_id;
	private Integer adr_city_id;
	private String adr_detail;
	private String adr_zip;
	private String mobile_no;
	private String email;
	private String reason;
	private String fileUrl1;

	private int custSysId;
	private Integer loginFlag;
	private Integer shopId;
	private Integer bbsType;
	private String bbsIdRg;
	private int bbsId;
	
	private String openId;
	private String custNm;
	private String city;
	private String dist;
	private String addr;
	private String postal;
	private String bYear;
	private String bMon;
	private String bDay;
	private String mobile;
	private String eMail;
	private String cmt;	
	private int imgId1;
	private int imgId2;
	private int imgId3;
	private int imgId4;
	private int imgId5;
	
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
		Integer type=1;
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

	public String eventmain(){
		Map<String,Object> map= new HashMap<String,Object>();
		map.put("PAGEID", 0);
		eventService.insert("Event.EVENT_00021_PAGE_INSERT", map);
		return "eventmain";
	}
	
	public String page01(){
		Map<String,Object> map= new HashMap<String,Object>();
		map.put("PAGEID", 1);
		eventService.insert("Event.EVENT_00021_PAGE_INSERT", map);
		return "page01";
	}
	
	public String page02(){
		Map<String,Object> map= new HashMap<String,Object>();
		map.put("PAGEID", 2);
		eventService.insert("Event.EVENT_00021_PAGE_INSERT", map);
		return "page02";
	}
	
	public String page03(){
		Map<String,Object> map= new HashMap<String,Object>();
		map.put("PAGEID", 3);
		eventService.insert("Event.EVENT_00021_PAGE_INSERT", map);
		return "page03";
	}
	public String page04(){
		return "page04";
	}
	public String page05(){
		return "page05";
	}
	//大转盘逻辑
	
	

	/////////////////////////////////////////////////////////
	// ST Version 2 new Site by dikim on 20160725
	

	public String dsStoryMain(){
		return "dsStoryMain";
	}

	public String dsStoryReq(){

		jsSdkStting();
		
		custSysId=0;
		
		SessionMember sessionMember = getSessionMember();
		if(sessionMember!=null){
			custSysId=sessionMember.getCustSysId();
		}
		loginFlag = 0;
		if (sessionMember != null) {
			loginFlag = 1;
		}		
		request.put("custSysId", custSysId);
		request.put("bbsType", bbsType);
		request.put("loginFlag", loginFlag);
		
		return "dsStoryReq";
	}

	public String dsStoryReqSave(){

		SessionMember sessionMember = getSessionMember();
		
		int intCustSysId = 0;
				
		if (sessionMember != null) {
			intCustSysId = sessionMember.getCustSysId();
			openId = sessionMember.getOpenid(); 
		}
		
		String ret="success";
		
		try{
			Map<String,Object> map=new HashMap<String, Object>();

			map.put("shopId",shopId);
			map.put("openId",openId);
			map.put("custSysId",intCustSysId);
			map.put("custNm",custNm);
			map.put("city",city);
			map.put("dist",dist);
			map.put("addr",addr);
			map.put("postal",postal);
			map.put("bYear",bYear);
			map.put("bMon",bMon);
			map.put("bDay",bDay);
			map.put("mobile",mobile);
			map.put("eMail",eMail);
			map.put("cmt",cmt);
			map.put("imgId1",imgId1);
			map.put("imgId2",imgId2);
			map.put("imgId3",imgId3);
			map.put("imgId4",imgId4);
			map.put("imgId5",imgId5);
			
			
			Map<String,Object> mapResult = commonService.select("Event.EVENT_00021_REQ_INSERT", map);
			
			String outErr = (String) mapResult.get("OUT_ERR_MSG");
			if(outErr.equals("E")){
				ret = "fail";
			}
		}catch(Exception e){
			e.printStackTrace();
			ret = "fail";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("ret", ret);
		renderJSON(returnMap);
		return NONE;
	}

	public String dsStoryList(){
		

		long startTime = System.currentTimeMillis();
		
		jsSdkStting();
		
		custSysId=0;
		bbsType=11;	//테스트 이후 11로 변경 대상 무료시식 BBS TYPE 은 11 임
		
		SessionMember sessionMember = getSessionMember();
		if(sessionMember!=null){
			custSysId=sessionMember.getCustSysId();
		}
		loginFlag = 0;
		if (sessionMember != null) {
			loginFlag = 1;
		}
		int pageCurr = IntegerUtils.valueOf(getRequest().getParameter("pageCurr"),1);
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("SHOP_ID", shopId);
		map.put("USER_ID", custSysId);
		map.put("BBS_ID", null);
		map.put("BBS_STS", 2);
		map.put("START_DT", null);
		map.put("END_DT", null);
		map.put("TITLE", null);
		map.put("PAGE_CURR", 1);
		map.put("PAGE_UINT", pageCurr*5);
		map.put("ORDERBY", null);
		map.put("BBS_TYPE", bbsType);
		
		map.put("PARENT_ID", 0);
		List<Map<String, Object>> publishList= commonService.selectList("BBS.SHOP_BBS_CONTENT_LIST_SELECT_NEW", map);
		
		map.put("PAGE_UINT", 99999);
		map.put("PARENT_ID", 1);
		List<Map<String, Object>> replyList= commonService.selectList("BBS.SHOP_BBS_CONTENT_LIST_SELECT_NEW", map);
		
		//request.put("list", list);
		request.put("publishList", publishList);
		request.put("replyList", replyList);
		
		if(publishList.size()>0){
			int totalCount=(Integer)(publishList.get(0).get("TOTAL_PARENT"));
			int totalPage=totalCount%5==0?totalCount/5:totalCount/5+1;
			request.put("pageCount", totalPage);
		}else{
			request.put("pageCount", 0);
		}
		request.put("custSysId", custSysId);
		request.put("bbsType", bbsType);
		request.put("loginFlag", loginFlag);
		
		map.put("CUST_SYS_ID", custSysId);
		map.put("SHOP_ID", shopId);
    	Map<String,Object> custMap = commonService.select("BBS.getCustDetail",map);
    	
    	String nickName = "无名氏";
    	if(custMap!=null){
    		nickName = custMap.get("CUST_NICK_NM").toString();
    	}
		
    	request.put("nickName", nickName);
    	request.put("pageCurr", pageCurr);
		LogUtils.getMethodExecuteTime(startTime);
		
		
		return "dsStoryList";
	}
	

	public String dsStoryNextList(){
		
		custSysId=0;
		
		SessionMember sessionMember = getSessionMember();
		if(sessionMember!=null){
			custSysId=sessionMember.getCustSysId();
		}
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("SHOP_ID", shopId);
		map.put("USER_ID", custSysId);
		map.put("BBS_ID", null);
		map.put("BBS_STS", 2);
		map.put("START_DT", null);
		map.put("END_DT", null);
		map.put("TITLE", null);
		map.put("PAGE_CURR", pageCurr);
		map.put("PAGE_UINT", pageUnit);
		map.put("ORDERBY", null);
		map.put("PARENT_ID", 0);
		map.put("BBS_TYPE", bbsType);
		
		List<Map<String, Object>> list= commonService.selectList("BBS.SHOP_BBS_CONTENT_LIST_SELECT_NEW", map);
		if(list.size()>0){
			int listSize=list.size();
			int totalCount=(Integer)(list.get(0).get("TOTAL_PARENT"));
			int totalPage=totalCount%pageUnit==0?totalCount/pageUnit:totalCount/pageUnit+1;
			if(pageCurr<totalPage){
				renderJSON(list);
			}else if(pageCurr==totalPage){
				int lastPageCount=totalCount%pageUnit;
				if(lastPageCount==1){
					List<Map<String, Object>> lastPageList=new ArrayList<Map<String, Object>>();
					lastPageList.add(list.get(listSize-1));
					renderJSON(lastPageList);
				}else if(lastPageCount==2){
					List<Map<String, Object>> lastPageList=new ArrayList<Map<String, Object>>();
					lastPageList.add(list.get(listSize-2));
					lastPageList.add(list.get(listSize-1));
					renderJSON(lastPageList);
				}else if(lastPageCount==3){
					List<Map<String, Object>> lastPageList=new ArrayList<Map<String, Object>>();
					lastPageList.add(list.get(listSize-3));
					lastPageList.add(list.get(listSize-2));
					lastPageList.add(list.get(listSize-1));
					renderJSON(lastPageList);
				}else if(lastPageCount==4){
					List<Map<String, Object>> lastPageList=new ArrayList<Map<String, Object>>();
					lastPageList.add(list.get(listSize-4));
					lastPageList.add(list.get(listSize-3));
					lastPageList.add(list.get(listSize-2));
					lastPageList.add(list.get(listSize-1));
					renderJSON(lastPageList);
				}else if(lastPageCount==0){
					List<Map<String, Object>> lastPageList=new ArrayList<Map<String, Object>>();
					lastPageList.add(list.get(listSize-5));
					lastPageList.add(list.get(listSize-4));
					lastPageList.add(list.get(listSize-3));
					lastPageList.add(list.get(listSize-2));
					lastPageList.add(list.get(listSize-1));
					renderJSON(lastPageList);
				}
			}else{
				List<Map<String, Object>> listEmpty=new ArrayList<Map<String, Object>>();
				renderJSON(listEmpty);
			}
			request.put("pageCount", totalPage);
		}else{
				List<Map<String, Object>> listEmpty=new ArrayList<Map<String, Object>>();
				renderJSON(listEmpty);
		}
		
		return NONE;
	}	
	

	public String dsStoryNextListReply(){

		custSysId=0;
		
		SessionMember sessionMember = getSessionMember();
		if(sessionMember!=null){
			custSysId=sessionMember.getCustSysId();
		}
		
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("SHOP_ID", shopId);
		map.put("BBS_ID_RG", bbsIdRg);
		map.put("CUST_SYS_ID", custSysId);
		
		
		List<Map<String, Object>> list= commonService.selectList("BBS.SHOP_BBS_CONTENT_LIST_SELECT_REPLY", map);
		if(list.size()>0){
			renderJSON(list);
		}else{
				List<Map<String, Object>> listEmpty=new ArrayList<Map<String, Object>>();
				renderJSON(listEmpty);
		}
		
		return NONE;
	}		
	
	

	public String dsStoryView(){

		jsSdkStting();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("SHOP_ID", shopId);
		map.put("BBS_ID", bbsId);
		map.put("BBS_STS", 2);
		SessionMember sessionMember = getSessionMember();
		loginFlag = 0;
		if (sessionMember != null) {
			loginFlag = 1;
		}
		if(sessionMember!=null){
			custSysId=sessionMember.getCustSysId();
		}else{
			custSysId=0;
		}
		map.put("USER_ID", custSysId);
		//detail
		Map<String,Object> detail= commonService.select("BBS.SHOP_BBS_CONTENT_LIST_SELECT_NEW", map);
		request.put("detail", detail);
		//review list
		map.put("PAGE_CURR", 1);
		map.put("PAGE_UINT",10);
		map.put("BBS_PARENT_ID", bbsId);
		map.put("BBS_ID", null);

		List<Map<String, Object>> replyList= commonService.selectList("BBS.SHOP_BBS_CONTENT_LIST_SELECT_NEW", map);
		request.put("replyList", replyList);
		//bbsLikeList
		map.put("BBS_ID", bbsId);
		List<Map<String, Object>> likeList= commonService.selectList("NewsFeedNongshim.bbsLikeList", map);
		request.put("likeList", likeList);
		
		if(replyList.size()>0){
			int totalCount=(Integer)(replyList.get(0).get("NUM"));
			int totalPage=totalCount%10==0?totalCount/10:totalCount/10+1;
			request.put("pageCount", totalPage);
		}else{
			request.put("pageCount", 0);
		}
		request.put("loginFlag", loginFlag);
		request.put("bbsType", detail.get("BBS_TYPE").toString());
		
		return "dsStoryView";
	}

	public String dsStoryWrite(){

		jsSdkStting();
		SessionSkin sessionSkin = getSessionSkin();
		loginFlag = 0;
		if (sessionSkin != null) {
			loginFlag = 1;
		}
		request.put("loginFlag", loginFlag);
		request.put("bbsType", bbsType);
		
		return "dsStoryWrite";
	}

	public String dsStoryCmt(){
		return "dsStoryCmt";
	}	
	
	// ED Version 2 new Site by dikim on 20160725
	/////////////////////////////////////////////////////////
	
	
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
			
			Map<String, Object> resultMap = eventService.select("Event.EVENT_00021_POINT_CHECK",parmsMap);
			
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
			
			Map<String, Object> userSummary = eventService.select("Event.EVENT_00021_POINT_GET_SUM",parmsMap);
			
			request.put("userSummary", userSummary);
			
			parmsMap.clear();
			parmsMap.put("EVENT_ID", eventId);
			parmsMap.put("OPENID", getFromOpenid());
			List<Map<String, Object>> friendsList = eventService.selectList("Event.EVENT_00021_POINT_FRIENDS_LIST",parmsMap);
			request.put("friendsList", friendsList);
			
			parmsMap.clear();
			parmsMap.put("EVENT_ID", eventId);
			parmsMap.put("OPENID", getSessionOpenid());
			parmsMap.put("FROM_OPENID", getFromOpenid());
			parmsMap.put("TYPE", EVENT_ENABLE_FRIENDS);
			
			Map<String, Object> checkItem = eventService.select("Event.EVENT_00021_POINT_CHECK",parmsMap);
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
			
			Map<String, Object> userSummary = eventService.select("Event.EVENT_00021_POINT_GET_SUM",parmsMap);
			request.put("userSummary", userSummary);
			
			parmsMap.clear();
			parmsMap.put("EVENT_ID", eventId);
			parmsMap.put("OPENID", getSessionOpenid());
			List<Map<String, Object>> friendsList = eventService.selectList("Event.EVENT_00021_POINT_FRIENDS_LIST",parmsMap);
			request.put("friendsList", friendsList);
			
			
			parmsMap.clear();
			parmsMap.put("EVENT_ID", eventId);
			parmsMap.put("OPENID", getSessionOpenid());
			parmsMap.put("TYPE", EVENT_TYPE_TODAY);
			
			Map<String, Object> checkItem = eventService.select("Event.EVENT_00021_POINT_CHECK",parmsMap);
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
			
			eventService.select("Event.EVENT_00021_POINT_INSERT",parmsMap);
		
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
			
			Map<String, Object> userSummary = eventService.select("Event.EVENT_00021_POINT_GET_SUM",parmsMap);
			
			request.put("userSummary", userSummary);
			
			parmsMap.clear();
			parmsMap.put("EVENT_ID", eventId);
			parmsMap.put("OPENID", getFromOpenid());
			List<Map<String, Object>> friendsList = eventService.selectList("Event.EVENT_00021_POINT_FRIENDS_LIST",parmsMap);
			request.put("friendsList", friendsList);
			
			parmsMap.clear();
			parmsMap.put("EVENT_ID", eventId);
			parmsMap.put("OPENID", getSessionOpenid());
			parmsMap.put("FROM_OPENID", getFromOpenid());
			parmsMap.put("TYPE", EVENT_ENABLE_FRIENDS);
			
			Map<String, Object> checkItem = eventService.select("Event.EVENT_00021_POINT_CHECK",parmsMap);
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
			
			Map<String, Object> userSummary = eventService.select("Event.EVENT_00021_POINT_GET_SUM",parmsMap);
			request.put("userSummary", userSummary);
			
			parmsMap.clear();
			parmsMap.put("EVENT_ID", eventId);
			parmsMap.put("OPENID", getSessionOpenid());
			List<Map<String, Object>> friendsList = eventService.selectList("Event.EVENT_00021_POINT_FRIENDS_LIST",parmsMap);
			request.put("friendsList", friendsList);
			
			
			parmsMap.clear();
			parmsMap.put("EVENT_ID", eventId);
			parmsMap.put("OPENID", getSessionOpenid());
			parmsMap.put("TYPE", EVENT_TYPE_TODAY);
			
			Map<String, Object> checkItem = eventService.select("Event.EVENT_00021_POINT_CHECK",parmsMap);
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
			return new Angle(16, angle);
		} else if (angle >= 95 && angle <= 130) {
			return new Angle(500, angle);
		} else if (angle >= 140 && angle <= 175) {
			return new Angle(-1000, angle);
		} else if (angle >= 185 && angle <= 220) {
			return new Angle(50, angle);
		} else if (angle >= 230 && angle <= 265) {
			return new Angle(-16, angle);
		} else if (angle >= 275 && angle <= 310) {
			return new Angle(-500, angle);
		} else if (angle >= 320 && angle <= 355) {
			return new Angle(1000, angle);
		} else {
			return getAngle();
		}
	}
	
public String todayEnable(){
		
		@SuppressWarnings("unused")
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
		
		Map<String, Object> checkItem = eventService.select("Event.EVENT_00021_POINT_CHECK",parmsMap);
		
		Integer cnt 		= (Integer)checkItem.get("CNT");
		Integer totalPoint 	= (Integer)checkItem.get("TOTAL_POINT");
		Integer obtainCnt 	=  (Integer)checkItem.get("OBTAIN_CNT");
		Integer selfCnt 	=  (Integer)checkItem.get("SELF_CNT"); 
		if(selfCnt > 0){
			Map<String,Object> rtnMap = new HashMap<String,Object>();
			
			String msg4500 = "<div class='result4500' ><img alt='' src='/front/event/00007/images/participated/img_congratulation.png'  ></div> "
					+"<div class='result4500Close' ><img alt='' src='/front/event/00007/images/participated/btn_4500_close.png'  ></div>";
			
			rtnMap.put("type", 2016);
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
			Random rand = new Random();
			String flag="2016-06-17 20:17:00";
			Date bal=DateUtil.parseToDate(flag,DateUtil.DEFAULT_DATETIME_FORMAT_SEC);	
			if(obtainCnt > 28||new Date().before(bal)){//已经28个人中奖不允许其他人中奖
				System.out.println("======================非中奖区=================");
				if(0>totalPoint){
					angle = new Angle(1000, rand.nextInt(35) + 320);
				}else if(3016<totalPoint){
					angle = new Angle(-1000, rand.nextInt(35) + 140);
				}else if(totalPoint.intValue() % 50 <=16 &&totalPoint.intValue() % 50>0 ){
					angle = getAngle() ;
					while(angle.getPoint().intValue() == 16){
						angle = getAngle() ;
					}
					int total=angle.getPoint().intValue() + totalPoint.intValue();
					if(2016==total){
						if(angle.getPoint().intValue()==500){
							angle = new Angle(-50, rand.nextInt(35) + 5);
						}else{
							angle = new Angle(500, rand.nextInt(35) + 95);
						}
					}
				}else{
					angle = getAngle() ;
					while(angle.getPoint().intValue()== -16){
						angle = getAngle() ;
					}
					int total=angle.getPoint().intValue() + totalPoint.intValue();
						if(2016==total){
							if(angle.getPoint().intValue()==500){
								angle = new Angle(-50, rand.nextInt(35) + 5);
							}else{
								angle = new Angle(500, rand.nextInt(35) + 95);
							}
						}
				}
			}else{
				if(1016==totalPoint){
					angle = new Angle(1000, rand.nextInt(35) + 320);
				}else if(0>totalPoint){
					angle = new Angle(1000, rand.nextInt(35) + 320);
				}else if(3016<totalPoint){
					angle = new Angle(-1000, rand.nextInt(35) + 140);
				}else if(totalPoint.intValue() % 50 <=16 &&totalPoint.intValue() % 50>0 ){
					angle = getAngle() ;
					while(angle.getPoint().intValue() == 16){
						angle = getAngle() ;
					}
				}else{
					angle = getAngle() ;
						while(angle.getPoint().intValue()== -16){
						angle = getAngle() ;
					}
				}
			}
		} 
		
		parmsMap.clear();
		parmsMap.put("EVENT_ID", eventId);
		parmsMap.put("OPENID", getSessionOpenid());
		parmsMap.put("FROM_OPENID", getFromOpenid());
		parmsMap.put("POINT_TYPE", 2);
		parmsMap.put("POINT", angle.getPoint());

		Map<String, Object> resultMap = eventService.select("Event.EVENT_00021_POINT_INSERT",parmsMap);
		
		Map<String,Object> rtnMap = new HashMap<String,Object>();
		rtnMap.put("type", resultMap.get("out_type"));
		rtnMap.put("angle", angle);
		
		renderJSON(rtnMap);
		
		return NONE;
		 
	}

	 
	public String savePoint11(){
		 
//		boolean success = true;
//		String err_msg = "";
		
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
		
		
		Map<String, Object> resultMap = eventService.select("Event.EVENT_00021_POINT_INSERT",parmsMap);
		
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
		Date deadline = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse("2016-06-28 13:59:59");
		closed = currentDate.getTime() > deadline.getTime();
	} catch (ParseException e) {
		 
	}
	
	return closed;
}
	public String  application_06(){
		return "application_06";
	}
	public String  application_07(){
		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("sId", 110000);
		List<Map<String, Object>> cityMap  = eventService.selectList("Event.dash_address", parmsMap);
		request.put("citymap", cityMap);
		return "application_07";
	}
	public String  application_08(){
		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("cust_nm", cust_nm);
		parmsMap.put("adr_province_id", adr_province_id);
		parmsMap.put("adr_city_id", adr_city_id);
		parmsMap.put("adr_detail", adr_detail);
		parmsMap.put("adr_zip", adr_zip);
		parmsMap.put("birthday", birthday);
		parmsMap.put("mobile_no", mobile_no);
		parmsMap.put("email", email);
		request.put("temp", parmsMap);
		return "application_08";
	}
	
	
	
	public String uploadWithUserIcon(){
		SessionMember sessionMember = getSessionMember();
		Integer eventId = getId();
		boolean success = true;
		String err_msg = "";
		JSONObject jo = new JSONObject();
		try {
			Map<String, Object> parmsMap = new HashMap<String, Object>();
			if(fileEntity1!=null && logoFileName1!=null){
				UploadResult result = UploadFileUtil.upload(getRequest(), fileEntity1, logoFileName1, UploadFileUtil.UPLOAD_SHOP);
				parmsMap.put("fileUrl1", result.getFileUrl());
			}
			if(fileEntity2!=null && logoFileName2!=null){
				UploadResult result = UploadFileUtil.upload(getRequest(), fileEntity2, logoFileName2, UploadFileUtil.UPLOAD_SHOP);
				parmsMap.put("fileUrl2", result.getFileUrl());
			}
			if(fileEntity3!=null && logoFileName3!=null){
				UploadResult result = UploadFileUtil.upload(getRequest(), fileEntity3, logoFileName3, UploadFileUtil.UPLOAD_SHOP);
				parmsMap.put("fileUrl3", result.getFileUrl());
			}
			if(fileEntity4!=null && logoFileName4!=null){
				UploadResult result = UploadFileUtil.upload(getRequest(), fileEntity4, logoFileName4, UploadFileUtil.UPLOAD_SHOP);
				parmsMap.put("fileUrl4", result.getFileUrl());
			}
			if(fileEntity5!=null && logoFileName5!=null){
				UploadResult result = UploadFileUtil.upload(getRequest(), fileEntity5, logoFileName5, UploadFileUtil.UPLOAD_SHOP);
				parmsMap.put("fileUrl5", result.getFileUrl());
			}
			parmsMap.put("shopId", sessionMember.getShopId());
			parmsMap.put("cust_sys_id", sessionMember.getCustSysId());
			parmsMap.put("event_id", eventId);
			parmsMap.put("cust_nm", cust_nm);
			parmsMap.put("adr_province_id", adr_province_id);
			parmsMap.put("adr_city_id", adr_city_id);
			parmsMap.put("adr_detail", adr_detail);
			parmsMap.put("adr_zip", adr_zip);
			parmsMap.put("birthday", birthday);
			parmsMap.put("mobile_no", mobile_no);
			parmsMap.put("email", email);
			parmsMap.put("reason", reason);
			Map<String, Object> resultMap = eventService.select("Event.SHOP_EVENT_ENTRY_USER_INSERT",parmsMap);
			if(resultMap.get("OUT_ERR_MSG").toString().trim().equals("E")){
				success = false;
				err_msg = "保存信息错误..";
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
			success = false;
			err_msg = e.getMessage();
		}
		jo.put("success", success);
		jo.put("err_msg", err_msg);
		renderHtml(jo.toJSONString());
		return NONE;
	}

	
	public String getBbsIdRg() {
		return bbsIdRg;
	}
	public void setBbsIdRg(String bbsIdRg) {
		this.bbsIdRg = bbsIdRg;
	}
	public String getCust_nm() {
		return cust_nm;
	}
	public void setCust_nm(String cust_nm) {
		this.cust_nm = cust_nm;
	}
	public Integer getAdr_province_id() {
		return adr_province_id;
	}
	public void setAdr_province_id(Integer adr_province_id) {
		this.adr_province_id = adr_province_id;
	}
	public Integer getAdr_city_id() {
		return adr_city_id;
	}
	public void setAdr_city_id(Integer adr_city_id) {
		this.adr_city_id = adr_city_id;
	}
	public String getAdr_detail() {
		return adr_detail;
	}
	public void setAdr_detail(String adr_detail) {
		this.adr_detail = adr_detail;
	}
	public String getAdr_zip() {
		return adr_zip;
	}
	public void setAdr_zip(String adr_zip) {
		this.adr_zip = adr_zip;
	}
	public String getMobile_no() {
		return mobile_no;
	}
	public void setMobile_no(String mobile_no) {
		this.mobile_no = mobile_no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public CustService getCustService() {
		return custService;
	}
	public void setCustService(CustService custService) {
		this.custService = custService;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getFileUrl1() {
		return fileUrl1;
	}
	public void setFileUrl1(String fileUrl1) {
		this.fileUrl1 = fileUrl1;
	}
	public File getFileEntity2() {
		return fileEntity2;
	}
	public void setFileEntity2(File fileEntity2) {
		this.fileEntity2 = fileEntity2;
	}
	public File getFileEntity3() {
		return fileEntity3;
	}
	public void setFileEntity3(File fileEntity3) {
		this.fileEntity3 = fileEntity3;
	}
	public File getFileEntity4() {
		return fileEntity4;
	}
	public void setFileEntity4(File fileEntity4) {
		this.fileEntity4 = fileEntity4;
	}
	public File getFileEntity5() {
		return fileEntity5;
	}
	public void setFileEntity5(File fileEntity5) {
		this.fileEntity5 = fileEntity5;
	}
	public File getFileEntity1() {
		return fileEntity1;
	}
	public void setFileEntity1(File fileEntity1) {
		this.fileEntity1 = fileEntity1;
	}
	public String getLogoFileName1() {
		return logoFileName1;
	}
	public void setLogoFileName1(String logoFileName1) {
		this.logoFileName1 = logoFileName1;
	}
	public String getLogoFileName2() {
		return logoFileName2;
	}
	public void setLogoFileName2(String logoFileName2) {
		this.logoFileName2 = logoFileName2;
	}
	public String getLogoFileName3() {
		return logoFileName3;
	}
	public void setLogoFileName3(String logoFileName3) {
		this.logoFileName3 = logoFileName3;
	}
	public String getLogoFileName4() {
		return logoFileName4;
	}
	public void setLogoFileName4(String logoFileName4) {
		this.logoFileName4 = logoFileName4;
	}
	public String getLogoFileName5() {
		return logoFileName5;
	}
	public void setLogoFileName5(String logoFileName5) {
		this.logoFileName5 = logoFileName5;
	}


	public int getCustSysId() {
		return custSysId;
	}
	public void setCustSysId(int custSysId) {
		this.custSysId = custSysId;
	}
	public Integer getLoginFlag() {
		return loginFlag;
	}
	public void setLoginFlag(Integer loginFlag) {
		this.loginFlag = loginFlag;
	}
	public Integer getShopId() {
		return shopId;
	}
	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}
	public Integer getBbsType() {
		return bbsType;
	}
	public void setBbsType(Integer bbsType) {
		this.bbsType = bbsType;
	}
	public int getBbsId() {
		return bbsId;
	}
	public void setBbsId(int bbsId) {
		this.bbsId = bbsId;
	}
	public String getOpenId() {
		return openId;
	}
	public void setOpenId(String openId) {
		this.openId = openId;
	}
	public String getCustNm() {
		return custNm;
	}
	public void setCustNm(String custNm) {
		this.custNm = custNm;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getDist() {
		return dist;
	}
	public void setDist(String dist) {
		this.dist = dist;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getPostal() {
		return postal;
	}
	public void setPostal(String postal) {
		this.postal = postal;
	}
	public String getBYear() {
		return bYear;
	}
	public void setBYear(String bYear) {
		this.bYear = bYear;
	}
	public String getBMon() {
		return bMon;
	}
	public void setBMon(String bMon) {
		this.bMon = bMon;
	}
	public String getBDay() {
		return bDay;
	}
	public void setBDay(String bDay) {
		this.bDay = bDay;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getEMail() {
		return eMail;
	}
	public void setEMail(String eMail) {
		this.eMail = eMail;
	}
	public String getCmt() {
		return cmt;
	}
	public void setCmt(String cmt) {
		this.cmt = cmt;
	}
	public int getImgId1() {
		return imgId1;
	}
	public void setImgId1(int imgId1) {
		this.imgId1 = imgId1;
	}
	public int getImgId2() {
		return imgId2;
	}
	public void setImgId2(int imgId2) {
		this.imgId2 = imgId2;
	}
	public int getImgId3() {
		return imgId3;
	}
	public void setImgId3(int imgId3) {
		this.imgId3 = imgId3;
	}
	public int getImgId4() {
		return imgId4;
	}
	public void setImgId4(int imgId4) {
		this.imgId4 = imgId4;
	}
	public int getImgId5() {
		return imgId5;
	}
	public void setImgId5(int imgId5) {
		this.imgId5 = imgId5;
	}


	
}
