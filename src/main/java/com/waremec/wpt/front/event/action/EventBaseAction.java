/**   
* @Title: EventBaseAction.java 
* @Package com.waremec.wpt.front.event.action 
* @Description:  
* @author taebem
* @date 2015年5月13日 上午10:23:41 
* @version V1.0   
*/
package com.waremec.wpt.front.event.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.framework.utilities.SessionUtils;
import com.waremec.weixin.action.WeixinBaseAction;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.domain.OpenidPair;
import com.waremec.weixin.domain.ShareInfo;
import com.waremec.weixin.domain.WeixinPageExecutionLog;
import com.waremec.weixin.domain.user.SessionMember;
import com.waremec.weixin.thread.ExecutionLoggingThread;
import com.waremec.weixin.utils.Constants;
import com.waremec.weixin.utils.Oauth2Utils;
import com.waremec.weixin.utils.WeixinSignUtils;
import com.waremec.wpt.front.domain.SessionSkin;
import com.waremec.wpt.front.service.EventService;
import com.waremec.wpt.front.service.MainService;

/** 
 * @Package com.waremec.wpt.front.event.action 
 * @FileName EventBaseAction
 * @Description  
 * @author taebem 
 * @date 2015年5月13日 上午10:23:41 
 *  
 */
public class EventBaseAction extends WeixinBaseAction {

	private static final long serialVersionUID = 1L;
	
	protected final transient Log logger = LogFactory.getLog(EventBaseAction.class);
	
	protected static final String EVENT_STATUS = "eventStatus";
	
	public static final Integer EVENT_ERROR			= -1;
	public static final Integer EVENT_NO_START 		= 0;
	public static final Integer EVENT_IN_PROCESS 	= 1;
	public static final Integer EVNET_ENDED 		= 2;
	
	@Resource
	protected EventService eventService;
	private MainService mainService;
	
	
	protected Integer getEventStatus(String eventStartDate, String eventEndDate){
		
		SimpleDateFormat sdf  = new SimpleDateFormat("yyyyMMddHHmmss");
		try {
			Date startDate = sdf.parse(eventStartDate);
			Date endDate = sdf.parse(eventEndDate);
			Date now = new Date();
			
			if(now.getTime() < startDate.getTime()){
				return EVENT_NO_START;
			}else if(endDate.getTime() < now.getTime()){
				return EVNET_ENDED;
			}else{
				return EVENT_IN_PROCESS;
			}
			
		} catch (ParseException e) {
			logger.error(e.getMessage());
			return EVENT_ERROR;
		}
		
	}
	
	protected boolean hasNoStarted(Integer status){
		return status == EVENT_NO_START;
	}
	
	protected boolean hasInProcess(Integer status){
		return status == EVENT_IN_PROCESS;
	}
	
	protected boolean hasEnded(Integer status){
		return status == EVNET_ENDED;
	}
	
	
	protected Integer getId() {
		String path = getRequest().getServletPath();
		path = path.replaceAll("/front/event/", "");
		path = path.substring(0, path.indexOf("/"));
		Integer eventId = Integer.valueOf(path);
//		logger.info("eventId22===" + eventId); 
		return eventId;
	}
	
	protected void jsSdkWithEventStting() {
		
		 Date startTime =new Date();
		
//		logger.info("==================jsSdkWithEventStting start ===========================");
		 String currentUrl = getFullUrl();
		 Integer shopId 	= IntegerUtils.valueOf(getRequest().getParameter("shopId"));  
		 Integer eventId	= getId();
		 SessionSkin sessionSkin = super.getSessionSkin();
		 if(shopId == null){
			 shopId = sessionSkin.getShopId();
		 }
		 
		 String openid =  getSessionOpenid();
		 
		 if(shopId != null){
			 try {
				 AppInfo appInfo = weixinService.selectAppInfoByShopId(shopId);
				 String ticket = weixinService.getApiTicket(appInfo);
				 if (StringUtils.isNotEmpty(ticket)) {
					 //生产jssdk签名
					request.put("signInfo", WeixinSignUtils.sign(ticket, currentUrl));
				}
				request.put("appInfo", appInfo);
				session.put("appInfo", appInfo);
				session.put("currentUrl", currentUrl);
				//share info setting
				ShareInfo shareInfo = new ShareInfo();
				
				
				
				String shareUrl = Oauth2Utils.getEventShareLinkUrl(appInfo, currentUrl,openid,eventId);
				String shareTitle = "";
				String shareDesc = "";
				String shareImgUrl = "";
				 
					/*if(StringUtils.isNotEmpty(openid)){
						shareUrl = Oauth2Utils.getShareLinkUrl(appInfo, currentUrl,openid);
					}else{
						shareUrl = Oauth2Utils.getShareLinkUrl(appInfo, currentUrl);
					}*/
					shareTitle = sessionSkin.getShopName();
					shareDesc = sessionSkin.getShopName();
					shareImgUrl = appInfo.getDomain() +  sessionSkin.getShopLogoImgUrl();
				 
				shareInfo.setTitle(shareTitle);
				shareInfo.setDesc(shareDesc);
				shareInfo.setImgUrl(shareImgUrl);	
				shareInfo.setLink(shareUrl);
				
				logger.info("======================shareUrl======================");
				logger.info(shareUrl);
				logger.info("======================shareUrl======================");
				
				request.put("shareInfo", shareInfo);
				
				request.put("fromOpenid", getFromOpenid());
				
			} catch (Exception e) {
				// TODO: handle exception
				logger.error("jsSdkStting error:" + e.getMessage());
			}
		 }
	 
		 long executeTime = System.currentTimeMillis() - startTime.getTime();
		logger.info("jsSdkWithEventStting executeTime==="+ executeTime );
		WeixinPageExecutionLog log = new WeixinPageExecutionLog();
		log.setShopId(shopId);
		log.setStartTime(startTime);
		log.setExecuteTime(executeTime);
		log.setOpenid(openid);
		log.setType("jsSdkWithEventStting");
		log.setUrl(currentUrl);
		Thread thread = new Thread(new ExecutionLoggingThread(weixinService,Constants.LogType.SHARE_SETTIONG, log));
		thread.start();
		logger.info("==================jsSdkWithEventStting end ===========================");

	}
	
	/**
	 * 分享信息中包含openid
	 */
	protected void jsSdkXjWithEventStting() {
		
		 Date startTime =new Date();
		
//		logger.info("==================jsSdkWithEventStting start ===========================");
		 String currentUrl = getFullUrl();
		 Integer shopId 	= IntegerUtils.valueOf(getRequest().getParameter("shopId"));  
		 Integer eventId	= getId();
		 SessionSkin sessionSkin = super.getSessionSkin();
		 if(shopId == null){
			 shopId = sessionSkin.getShopId();
		 }
		 
		 String openid =  getSessionOpenid();
		 
		 if(shopId != null){
			 try {
				 AppInfo appInfo = weixinService.selectAppInfoByShopId(shopId);
				 String ticket = weixinService.getApiTicket(appInfo);
				 if (StringUtils.isNotEmpty(ticket)) {
					request.put("signInfo", WeixinSignUtils.sign(ticket, currentUrl));
				}
				request.put("appInfo", appInfo);
				session.put("appInfo", appInfo);
				session.put("currentUrl", currentUrl);
				//share info setting
				ShareInfo shareInfo = new ShareInfo();
				Map<String, Object> map = new HashMap<String, Object>();
				// 查找同意openid发的分享信息条数
				map.put("openid",openid);
					List<Map<String, Object>>fxList = eventService.selectList("Event.EVENT_00021_PERSONFX_SELECT",map);
				System.out.println("-============================="+fxList.get(0).get("num")+"-===============");
				Integer jlNum=(Integer)fxList.get(0).get("num");
				if(fxList.size()>0&&fxList.get(0).get("num")!=null&&((Integer)fxList.get(0).get("num")).intValue()>=0)	 jlNum=(Integer)fxList.get(0).get("num");
				//jlNum++;
				request.put("jlNum", jlNum);
				//分享链接后追加信息最大数的作为参数
				String shareUrl = Oauth2Utils.getEventShareLinkUrl(appInfo, currentUrl,openid,eventId,jlNum);
				String shareTitle = "";
				String shareDesc = "";
				String shareImgUrl = "";
				 
					/*if(StringUtils.isNotEmpty(openid)){
						shareUrl = Oauth2Utils.getShareLinkUrl(appInfo, currentUrl,openid);
					}else{
						shareUrl = Oauth2Utils.getShareLinkUrl(appInfo, currentUrl);
					}*/
					shareTitle = sessionSkin.getShopName();
					shareDesc = sessionSkin.getShopName();
					shareImgUrl = appInfo.getDomain() +  sessionSkin.getShopLogoImgUrl();
				 
				shareInfo.setTitle(shareTitle);
				shareInfo.setDesc(shareDesc);
				shareInfo.setImgUrl(shareImgUrl);	
				shareInfo.setLink(shareUrl);
				
				logger.info("======================shareUrl======================");
				logger.info(shareUrl);
				logger.info("======================shareUrl======================");
				
				request.put("shareInfo", shareInfo);
				
				request.put("fromOpenid", getFromOpenid());
				
			} catch (Exception e) {
				// TODO: handle exception
				logger.error("jsSdkStting error:" + e.getMessage());
			}
		 }
	 
		 long executeTime = System.currentTimeMillis() - startTime.getTime();
		logger.info("jsSdkWithEventStting executeTime==="+ executeTime );
		WeixinPageExecutionLog log = new WeixinPageExecutionLog();
		log.setShopId(shopId);
		log.setStartTime(startTime);
		log.setExecuteTime(executeTime);
		log.setOpenid(openid);
		log.setType("jsSdkWithEventStting");
		log.setUrl(currentUrl);
		Thread thread = new Thread(new ExecutionLoggingThread(weixinService,Constants.LogType.SHARE_SETTIONG, log));
		thread.start();
		logger.info("==================jsSdkWithEventStting end ===========================");

	}
	
	/**
	 * 分享信息中不含openid
	 */
	protected void jsSdkWithEventSttingNotOpenid() {
		 Date startTime =new Date();
		 
		logger.info("==================jsSdkWithEventSttingNotOpenid start ===========================");
		//获得URL
		String currentUrl = getFullUrl();
		//获取店铺ID
		Integer shopId 	= IntegerUtils.valueOf(getRequest().getParameter("shopId"));
		//获取活动ID
		Integer eventId	= getId();
		SessionSkin sessionSkin = super.getSessionSkin();
		if(shopId == null){
			shopId = sessionSkin.getShopId();
		}
		
		String openid =  getSessionOpenid();
		
		if(shopId != null){
			try {
				AppInfo appInfo = weixinService.selectAppInfoByShopId(shopId);
				String ticket = weixinService.getApiTicket(appInfo);
				
				if (StringUtils.isNotEmpty(ticket)) {
					request.put("signInfo", WeixinSignUtils.sign(ticket, currentUrl));
				}
				request.put("appInfo", appInfo);
				
				//share info setting
				ShareInfo shareInfo = new ShareInfo();
				String shareUrl = Oauth2Utils.getEventShareLinkUrl(appInfo, currentUrl,"EMPTY",eventId);
				String shareTitle = "";
				String shareDesc = "";
				String shareImgUrl = "";
				
				shareTitle = sessionSkin.getShopName();
				shareDesc = sessionSkin.getShopName();
				shareImgUrl = appInfo.getDomain() +  sessionSkin.getShopLogoImgUrl();
				
				shareInfo.setTitle(shareTitle);
				shareInfo.setDesc(shareDesc);
				shareInfo.setImgUrl(shareImgUrl);	
				shareInfo.setLink(shareUrl);
				
				logger.info("======================shareUrl======================");
				logger.info(shareUrl);
				logger.info("======================shareUrl======================");
				
				request.put("shareInfo", shareInfo);
				
				request.put("fromOpenid", getFromOpenid());
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				logger.error("jsSdkStting error:" + e.getMessage());
			}
		}
		
		long executeTime = System.currentTimeMillis() - startTime.getTime();
		logger.info("jsSdkWithEventSttingNotOpenid executeTime==="+ executeTime );
		WeixinPageExecutionLog log = new WeixinPageExecutionLog();
		log.setShopId(shopId);
		log.setStartTime(startTime);
		log.setExecuteTime(executeTime);
		log.setOpenid(openid);
		log.setType("jsSdkWithEventSttingNotOpenid");
		log.setUrl(currentUrl);
		Thread thread = new Thread(new ExecutionLoggingThread(weixinService,Constants.LogType.SHARE_SETTIONG, log));
		thread.start();
		logger.info("==================jsSdkWithEventSttingNotOpenid end ===========================");
		
	}

	protected String getFromOpenid(){
		
		String fromOpenid = null;
		OpenidPair openidPair =(OpenidPair) session.get(SessionUtils.SESSION_OPENID_PAIR);
		if(openidPair != null && !openidPair.getFromOpenid().equals(openidPair.getOpenid())){
			fromOpenid = openidPair.getFromOpenid();
		} 
		
		logger.info("getFromOpenid() fromOpenid=====" + fromOpenid); 
		return fromOpenid;
	}
	protected String getFromOpenidOri(){
		
		String fromOpenid = null;
		OpenidPair openidPair =(OpenidPair) session.get(SessionUtils.SESSION_OPENID_PAIR);
		if(openidPair != null){
			fromOpenid = openidPair.getFromOpenid();
		} 
		
		logger.info("getFromOpenid() fromOpenid=====" + fromOpenid); 
		return fromOpenid;
	}
	protected String getSessionOpenid(){
		String openid = (String)session.get(SessionUtils.SESSION_OPENID);
		return openid;
	}
	
	
	protected static boolean isValidTimeRange() {
		// TODO Auto-generated method stub
		Calendar calendar = Calendar.getInstance();
		Integer hour = calendar.get(Calendar.HOUR_OF_DAY);
	 
		return hour >=8 && hour <= 23;
		
	}
	
	
	protected void  eventInit() {
		// TODO Auto-generated method stub
		logger.info("------------eventInit-------------------");
		SessionMember sessionMember = getSessionMember();
		
		Integer eventId = getId();
		
		String openid 	= (String)getSession().getAttribute(SessionUtils.SESSION_OPENID);
		
		boolean isfallowed = false;
		if(sessionMember != null){
			isfallowed = true;
		}else{
			if(StringUtils.isNotBlank(openid)){
				sessionMember = weixinUserService.getSessionMemberById(openid);
				
				if(sessionMember != null){
					isfallowed = true;
					  SessionSkin sessionSkin = mainService.getSessionSkinByShopId(sessionMember.getShopId());
					  session.put(SessionUtils.SESSION_SKIN, sessionSkin);
					  session.put(SessionUtils.SESSION_MEMEBER, sessionMember);
				}
			}
		}
		
		///获取转发源用户信息
		String fromOpenid = getFromOpenid();
		String fromCustHeadImgUrl = "";
		String fromCustNickNm 	  = "";
		boolean existFromOpenid = false;
		if(StringUtils.isNotEmpty(fromOpenid)){
			existFromOpenid = true;
			Map<String, Object> parmsMap = new HashMap<String, Object>();
			parmsMap.put("OPENID", fromOpenid);
			Map<String, Object> eventCustInfo = commonService.select("Event.getEventCustInfoByOpenId",parmsMap);
			
			if(eventCustInfo != null && !eventCustInfo.isEmpty()){
				fromCustHeadImgUrl = (String) eventCustInfo.get("WX_IF_HEADIMGURL");
				fromCustNickNm 	= (String) eventCustInfo.get("WX_IF_NICK_NM");
				
				if(StringUtils.isNotEmpty(fromCustNickNm)){
					existFromOpenid = true;
				}
			}
		}
		
		logger.info("eventId==============" + eventId);
		logger.info("openid===============" + openid);
		logger.info("isfallowed===========" + isfallowed);
		logger.info("existFromOpenid======" + existFromOpenid);
		logger.info("fromOpenid===========" + fromOpenid);
		logger.info("fromCustHeadImgUrl===" + fromCustHeadImgUrl);
		logger.info("fromCustNickNm=======" + fromCustNickNm);

		request.put("eventId", eventId);
		request.put("openid", openid);
		request.put("isfallowed", isfallowed);
		request.put("existFromOpenid", existFromOpenid);
		request.put("fromOpenid", fromOpenid);
		request.put("fromCustHeadImgUrl", fromCustHeadImgUrl);
		request.put("fromCustNickNm", fromCustNickNm);
	}
	
	
	
}
