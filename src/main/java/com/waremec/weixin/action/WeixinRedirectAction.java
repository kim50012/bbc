package com.waremec.weixin.action;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.framework.utilities.SessionUtils;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.domain.OpenidPair;
import com.waremec.weixin.domain.WebAccessToken;
import com.waremec.weixin.domain.WeixinSessionPageExeLog;
import com.waremec.weixin.domain.user.SessionMember;
import com.waremec.weixin.domain.user.WXUser;
import com.waremec.weixin.exception.Oauth2Exception;
import com.waremec.weixin.service.SsgSSOService;
import com.waremec.weixin.thread.ExecutionLoggingThread;
import com.waremec.weixin.thread.MenuClickLoggingThread;
import com.waremec.weixin.utils.Constants;
import com.waremec.weixin.utils.Oauth2Utils;
import com.waremec.wpt.front.domain.SessionSkin;
import com.waremec.wpt.front.service.EventService;
import com.waremec.wpt.front.service.MainService;

/** 
* @Package com.waremec.weixin.action 
* @FileName WeixinRedirectAction
* @Description  
* @author taebem 
* @date 2015年5月7日 下午4:05:27 
*  
*/
@Controller("weixinRedirectAction")
@Scope(ScopeType.prototype)
public class WeixinRedirectAction extends WeixinBaseAction {

	private static final long serialVersionUID = 1L;
	@Resource
	private MainService mainService;
	@Resource
	private EventService eventService;
	@Resource
	private SsgSSOService ssgSSOService;
	
	private final transient Log logger = LogFactory.getLog(this.getClass());
	
	/** 
	* 微信跳转链接 - 网页获取用户信息并跳转至目标页面
	* @return
	* @throws Exception
	*/
	public String t() throws Exception {
		
		Date startTime =new Date();
//		logger.info("<<<<<<<<<<<<<<<<<<< transfer method >>>>>>>>>>>>>>>>>>>>");
		session.remove(SessionUtils.SESSION_OPENID_PAIR);
		
		String returns = "redirect_uri";
		
		String key 			= getRequest().getParameter(Oauth2Utils.Params.SYSTEM_ID); 
		String code 		= getRequest().getParameter(Oauth2Utils.Params.CODE); 
		String state 		= getRequest().getParameter(Oauth2Utils.Params.STATE); 
		
		String redirect_uri = "";
		String openid 		= ""; 
		String fromOpenid 	= ""; //分享来源
		
		Integer shopId		= null;
		Integer menuId 		= null;
		Integer ssoId       = null;
		
		try {
			AppInfo appInfo = weixinService.selectAppInfoByKey(key);
			shopId = appInfo.getShopId();
			
//			logger.info("key===========" + key);
//			logger.info("shopId========" + appInfo.getShopId());
			logger.info("code==========" + code);
//			logger.info("state=========" + state);
//			logger.info("appid=========" + appInfo.getAppId());
//			logger.info("openid========" + openid);
			
			
			SessionSkin sessionSkin = mainService.getSessionSkinByShopId(appInfo.getShopId());
			session.put(SessionUtils.SESSION_SKIN, sessionSkin);
//			logger.info("*****************************************");
//			logger.info("sessionSkin=" + sessionSkin.getSkinTypeShop());
//			logger.info("*****************************************");
			
			if(StringUtils.isNotEmpty(code)){//用户同意授权
				//通过code换取网页授权access_token
				String test = "test";
				if (code.equals(test)) {
					SessionMember sessionMember2 = getSessionMember();
					openid = sessionMember2.getOpenid();
				}
				else {
					WebAccessToken webAccessToken = Oauth2Utils.getWebAccessToken(appInfo, code);
					openid = webAccessToken.getOpenid();
				}
				logger.info("openid========" + openid);
				
				session.put(SessionUtils.SESSION_OPENID, openid);
				
				if(StringUtils.isNotEmpty(openid)){
					
					SessionMember sessionMember = getSessionMember();
					//当之前没有session或 session来自其他公众号 则重新建立session
					if(sessionMember == null || !sessionMember.getOpenid().equals(openid)){
						
						if(sessionMember == null){
							logger.info("WXf0001:sessionMember is null.. openid=" + openid);
						}else{
							logger.info("WXf0002:sessionMember not equals new openid..");
							logger.info("WXf0002: old openid=" + sessionMember.getOpenid() + " , new openid=" + openid);
						}
						
						logger.info("WXf0003:get new sessionMember  openid=" + openid);
						
						sessionMember = weixinUserService.getSessionMemberById(openid);
					} 
					
					// 用户信息在数据库中不存在 从新从微信服务器获取用户信息
					if (sessionMember == null) {
						
						logger.info("WXf0004: new sessionMember  is null.. openid=" + openid);
						
						try {
							
							WXUser user = new WXUser();
							user.setSysId(appInfo.getSysId());
							user.setOpenid(openid);
							
							String token = weixinService.getAccessToken(appInfo);
							weixinUserService.userSubscribe(token, user);
							sessionMember = weixinUserService.getSessionMemberById(openid);
						} catch (Exception e) {
							// TODO: handle exception
							logger.error("22222222222 is meiguazhu openid=" + openid );
							logger.error(e.getMessage());
						}
					}
					
					
					//此处sessionMember为空表明 此人没有关注该公众号
					if(sessionMember != null){
						sessionMember.setUserType("WECHAT");
						session.put(SessionUtils.SESSION_MEMEBER, sessionMember);
//						logger.info("*****************************************");
 						logger.info("WXf0005: setting new sessionMember.. openid=" + openid);
//						logger.info("*****************************************");
					}else{
						logger.info("*****************************************");
						logger.info("SESSION_MEMEBER is null, 没有关注该公众号" + "," + openid);
						logger.info("*****************************************");
					}
					
					
					switch (state) {
					case Oauth2Utils.LinkType.LETTER:
						
						logger.info("link type letter.. openid=" + openid);
						
						Integer letterId = IntegerUtils.valueOf(getRequest().getParameter(Oauth2Utils.Params.LETTER_ID));
						fromOpenid = getRequest().getParameter(Oauth2Utils.Params.FROM_OPENID);
						
						Map<String, Object> letterInfo = weixinLetterService.selectLetterInfoById(IntegerUtils.valueOf(letterId));
						redirect_uri = (String)letterInfo.get("LETTER_PAGE_URL");
						
						logger.info("letterId======" + letterId);
						logger.info("fromOpenid====" + fromOpenid);
						logger.info("redirect_uri==" + redirect_uri);
						
						Map<String, Object>  letterSaveMap = new HashMap<String, Object>();
						letterSaveMap.put("LETTER_ID", letterInfo.get("LETTER_ID"));
						letterSaveMap.put("SHOP_ID", letterInfo.get("SHOP_ID"));
						letterSaveMap.put("OPENID", openid);
						
						weixinLetterService.insertLetter(letterSaveMap);
						
						break;
					case Oauth2Utils.LinkType.SHARE:
						logger.info("link type SHARE.. openid=" + openid);
						redirect_uri = getRequest().getParameter(Oauth2Utils.Params.TARGET_URL);
						redirect_uri = URLDecoder.decode(redirect_uri, Oauth2Utils.UTF_8);
						
						fromOpenid 	 = getRequest().getParameter(Oauth2Utils.Params.FROM_OPENID);
						
						logger.info("fromOpenid====" + fromOpenid);
						logger.info("redirect_uri==" + redirect_uri);
						
						break;
					case Oauth2Utils.LinkType.EVENT:
						logger.info("link type EVENT.. openid=" + openid);
						Integer eventId = IntegerUtils.valueOf(getRequest().getParameter(Oauth2Utils.Params.EVENT_ID));
						
						redirect_uri = getRequest().getParameter(Oauth2Utils.Params.TARGET_URL);
						redirect_uri = URLDecoder.decode(redirect_uri, Oauth2Utils.UTF_8);
						
						fromOpenid 	 = getRequest().getParameter(Oauth2Utils.Params.FROM_OPENID);
						
						logger.info("eventId=======" + eventId);
						logger.info("fromOpenid====" + fromOpenid);
						logger.info("redirect_uri==" + redirect_uri);
						
						
						if(StringUtils.isNotBlank(fromOpenid) && fromOpenid.length() > 20 ){
							
							OpenidPair  openidPair = new OpenidPair(openid, fromOpenid);
							
							session.put(SessionUtils.SESSION_OPENID_PAIR, openidPair);
							
							logger.info("from openid setting success.............");
							logger.info(openidPair.toString());
							//2015-09-10 delete
//							Map<String, Object>  saveMap = new HashMap<String, Object>();
//							saveMap.put("EVENT_ID", eventId);
//							saveMap.put("FROM_OPENID", fromOpenid);
//							saveMap.put("OPENID", openid);
//							eventService.insertEventFollowUser(saveMap);
						}
						
						
						break;
					case Oauth2Utils.LinkType.MENU:
						
						logger.info("link type MENU.. openid=" + openid);
						
						menuId = IntegerUtils.valueOf(getRequest().getParameter(Oauth2Utils.Params.MENU_ID));
						redirect_uri = weixinMenuService.getViewUrlById(menuId);
						
						logger.info("menuId========" + menuId);
						logger.info("redirect_uri==" + redirect_uri);
						
						//新世界SSO
						if(redirect_uri.startsWith(SsgSSOService.SSO_FREFIX)){
//							String forwordUrl = redirect_uri.substring(urlPrefix.length());
							
							redirect_uri = ssgSSOService.generateSSOUrl(appInfo,openid,menuId,redirect_uri);
							logger.info("redirect_uri==" + redirect_uri);
						}
						
						try {
							Thread thread = new Thread(new MenuClickLoggingThread(appInfo,openid, menuId + "" ,weixinService));
							thread.start();
						} catch (Exception e) {
							// TODO: handle exception
							logger.error("thread33333333333:" + e.getMessage());
						}
						
						break;
					case Oauth2Utils.LinkType.SSO:
						
						logger.info("link type SSO.. openid=" + openid);
						
						menuId = IntegerUtils.valueOf(getRequest().getParameter(Oauth2Utils.Params.MENU_ID));
						ssoId  = IntegerUtils.valueOf(getRequest().getParameter(Oauth2Utils.Params.SSOID));
						
						logger.info("menuId========" + menuId);
						logger.info("SSOID=========" + ssoId);
//						logger.info("redirect_uri==" + redirect_uri);
						redirect_uri = ssgSSOService.generateSSONoMenuUrl(appInfo,openid,menuId,ssoId);
						logger.info("redirect_uri==" + redirect_uri);
						
						try {
							Thread thread = new Thread(new MenuClickLoggingThread(appInfo,openid, menuId + "" ,weixinService));
							thread.start();
						} catch (Exception e) {
							// TODO: handle exception
							logger.error("thread33333333333:" + e.getMessage());
						}
						
						break;	
					case Oauth2Utils.LinkType.ADVICE:
						logger.info("link type ADVICE.. openid=" + openid);
						
						redirect_uri = getRequest().getParameter(Oauth2Utils.Params.TARGET_URL);
						redirect_uri = URLDecoder.decode(redirect_uri, Oauth2Utils.UTF_8);
						
						logger.info("redirect_uri==" + redirect_uri);
						break;
					case Oauth2Utils.LinkType.NORMAL:
						logger.info("link type NORMAL.. openid=" + openid);
						
						redirect_uri = getRequest().getParameter(Oauth2Utils.Params.TARGET_URL);
						redirect_uri = URLDecoder.decode(redirect_uri, Oauth2Utils.UTF_8);
						
						logger.info("redirect_uri==" + redirect_uri);
						break;
							
					case Oauth2Utils.LinkType.SSO2:
						logger.info("link type SSO2.. openid=" + openid);
						
						String targetUrl = getRequest().getParameter(Oauth2Utils.Params.TARGET_URL);
						targetUrl = URLDecoder.decode(targetUrl, Oauth2Utils.UTF_8);
						
						redirect_uri = ssgSSOService.generateSSO2Url(appInfo, openid, targetUrl);
						
						logger.info("redirect_uri==" + redirect_uri);
						break;
						
					default:
						break;
					}
					
					
				}else{
					logger.error("error000001 openid is null;");
					throw new Oauth2Exception("没有获取到openid");
				}
				
				
			}else{//用户禁止授权
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage());
			returns = "error500";
		}
		
		
		
		
		request.put("redirect_uri", redirect_uri);
		if(StringUtils.isEmpty(redirect_uri)){
			returns = "error404";
			logger.info("redirect_uri is null!!!!!!!!!!!!!!!!!!!!!!!!!! ");
		}
//		logger.info("<<<<<<<<<<<<<<<<<<< transfer method end <<<<<<<<<<<<<<<<");
		
		long executeTime = System.currentTimeMillis() - startTime.getTime();
		logger.info("redirect executeTime==="+ executeTime );
		
		WeixinSessionPageExeLog log = new WeixinSessionPageExeLog();
		log.setShopId(shopId);
		log.setStartTime(startTime);
		log.setExecuteTime(executeTime);
		log.setOpenid(openid);
		log.setState(state);
		log.setUrl(redirect_uri);
		Thread thread = new Thread(new ExecutionLoggingThread(weixinService,Constants.LogType.SESSION_PAGE,log));
		thread.start();
		
		return returns;
		
	}
	
	
	public String rl(){
		
		String redirect_uri = "";
		String fromOpenid = "";
		String openid = "";
		
		// %2F front %2F main %2F main.htm %3F shopId %3D 150 %26 a %3D 1 %26 b %3D 2
//			/ : %2F , ? : %3F , = : %3D , & : %26
		
		try {
			logger.info(URLEncoder.encode("/front/bbc/exc/excDoList.htm?shopId=680&a=1&b=2",Oauth2Utils.UTF_8));
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
//		http://localhost:8002/w/rl.htm?shopId=150&custId=10014&url=%2Ffront%2Fmain%2Fmain.htm%3FshopId%3D150%26a%3D1%26b%3D2
		
		
		Integer eventId = IntegerUtils.valueOf(getRequest().getParameter(Oauth2Utils.Params.EVENT_ID));

		redirect_uri = getRequest().getParameter(Oauth2Utils.Params.TARGET_URL);
		
		fromOpenid 	 = getRequest().getParameter(Oauth2Utils.Params.FROM_OPENID);
		
		logger.info("eventId=======" + eventId);
		logger.info("fromOpenid====" + fromOpenid);
		logger.info("redirect_uri==" + redirect_uri);
		
		
		if(StringUtils.isNotBlank(fromOpenid) && fromOpenid.length() > 20 ){
			
			OpenidPair  openidPair = new OpenidPair(openid, fromOpenid);
			
			session.put(SessionUtils.SESSION_OPENID_PAIR, openidPair);
			
			logger.info("from openid setting success.............");
			logger.info(openidPair.toString());
			
		}
				
		Integer shopId = IntegerUtils.valueOf(getRequest().getParameter("shopId"));
		Integer custId = IntegerUtils.valueOf(getRequest().getParameter("custId"));
		redirect_uri = getRequest().getParameter("url");
		if(StringUtils.isNotEmpty(redirect_uri)){
			try {
				redirect_uri = URLDecoder.decode(redirect_uri, Oauth2Utils.UTF_8);
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			redirect_uri = "/front/bbc/exc/excDoList.htm";
		}
		
		if (redirect_uri.indexOf("shopId=") < 0) {
			if (redirect_uri.indexOf("?") < 0) {
				redirect_uri += "?shopId=" + shopId;
			} else {
				redirect_uri += "&shopId=" + shopId;
			}
		}
		
		
		SessionMember sessionMember = weixinUserService.getSessionMemberByCustId(custId);
		session.put(SessionUtils.SESSION_MEMEBER, sessionMember);
//		redirect_uri = "/front/main/main.htm";
		request.put("redirect_uri", redirect_uri);
		logger.info("redirect_uri=" + redirect_uri);
		// shop skin
		SessionSkin sessionSkin = mainService.getSessionSkinByShopId(sessionMember.getShopId());
		session.put(SessionUtils.SESSION_SKIN, sessionSkin);
		
		session.put(SessionUtils.SESSION_OPENID, sessionMember.getOpenid());
		
		return "redirect_uri";
	}
	
	
	
	public String testuser(){
		
		
		key = "8D6ED58C805242C8BDB129616163CB04";
		String openid= "o1yuEtw1PN5sc6W6Bxd7Q4hty2hY";
		
		AppInfo appInfo = weixinService.selectAppInfoByKey(key);
		String token = weixinService.getAccessToken(appInfo);
		
		// 检查是否是验证用户
		SessionMember sessionMember = weixinUserService.getSessionMemberById(openid);
		logger.info("sessionMember before===" + sessionMember);
		if (sessionMember == null) {
			// 用户信息在数据库中不存在 从新从微信服务器获取用户信息
			WXUser user = new WXUser();
			user.setSysId(appInfo.getSysId());
			user.setOpenid(openid);
		 
			try {
				weixinUserService.userSubscribe(token, user);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			sessionMember = weixinUserService.getSessionMemberById(openid);
			logger.info("sessionMember after===" + sessionMember);
		}
		
		return NONE;
	}
	
	/**
	 * 点击菜单按钮跳转地址 - Old版本 将于2015.07.31日废弃
	 * 
	 * @return
	 * @throws Exception
	 */
	@Deprecated
	public String r() throws Exception {

		logger.info("<<<<<<<<<<<<<<<<<<<<<<<<<<< >>>>>>>>>>>>>>>>>>>>>>>>>>>");

		String code = getRequest().getParameter("code");// 我们要的code
		String key = getRequest().getParameter("k");// key
		String type = getRequest().getParameter("t");// type
		String redirect_uri = getRequest().getParameter("r");
		String state = getRequest().getParameter("state");// type
		String fromOpenid = getRequest().getParameter(Oauth2Utils.Params.FROM_OPENID);
		String appid = "";
		String secret = "";
		String openid = "";
		
		session.remove(SessionUtils.SESSION_OPENID_PAIR);

		if ("TEST".equals(type)) {
			logger.info("is test URL");
			Integer userId = IntegerUtils.valueOf(getRequest().getParameter("u"));
			SessionMember sessionMember = weixinUserService.getSessionMemberByCustId(userId);

			session.put(SessionUtils.SESSION_MEMEBER, sessionMember);
			if(sessionMember != null){
				session.put(SessionUtils.SESSION_OPENID, sessionMember.getOpenid());
				
				if(StringUtils.isNotBlank(fromOpenid) && fromOpenid.length() > 20 ){
					session.put(SessionUtils.SESSION_OPENID_PAIR, new OpenidPair(sessionMember.getOpenid(), fromOpenid));
					logger.info("from opendi setting success.............");
				}
				
			}
//			redirect_uri = "/front/main/main.htm";
			request.put("redirect_uri", redirect_uri);
			logger.info("redirect_uri=" + redirect_uri);
			// shop skin
			SessionSkin sessionSkin = mainService.getSessionSkinByShopId(sessionMember.getShopId());
			session.put(SessionUtils.SESSION_SKIN, sessionSkin);
			
			
			
			
			
			return "redirect_uri";

		}

		AppInfo app = weixinService.selectAppInfoByKey(key);

		appid = app.getAppId();
		secret = app.getAppSecret();

		logger.info("code==============" + code);
		logger.info("key===============" + key);
		logger.info("type==============" + type);
		logger.info("appid=============" + appid);
		logger.info("secret============" + secret);
		logger.info("redirect_uri============" + redirect_uri);
		
		try {
			
			WebAccessToken webAccessToken = Oauth2Utils.getWebAccessToken(app, code);
			openid = webAccessToken.getOpenid();
			
			logger.info("openid============" + openid);
			// 检查是否是验证用户
			SessionMember sessionMember = weixinUserService.getSessionMemberById(openid);
			
			
			
			if (sessionMember == null) {
				// 用户信息在数据库中不存在 从新从微信服务器获取用户信息
				WXUser user = new WXUser();
				user.setSysId(app.getSysId());
				user.setOpenid(openid);
				
				String token = weixinService.getAccessToken(app);
				weixinUserService.userSubscribe(token, user);
				sessionMember = weixinUserService.getSessionMemberById(openid);
			}
			
			// shop skin
			SessionSkin sessionSkin = mainService.getSessionSkinByShopId(sessionMember.getShopId());
			session.put(SessionUtils.SESSION_SKIN, sessionSkin);
			
			sessionMember.setUserType("WECHAT");
			session.put(SessionUtils.SESSION_MEMEBER, sessionMember);
			
			redirect_uri = weixinMenuService.getViewUrlById(Integer.valueOf(redirect_uri));
			logger.info("redirect_uri======" + redirect_uri);
			request.put("redirect_uri", redirect_uri);
		} catch (Exception e) {
			// TODO: handle exception
		logger.info("redirect_uri-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
			e.printStackTrace();
		}
		
		return "redirect_uri";

	}
	
	
	/**
	 * 共享跳转地址 - Old版本 将于2015.07.31日废弃
	 * 
	 * @return
	 * @throws Exception
	 */
	@Deprecated
	public String s() throws Exception {

		logger.info("<<<<<<<<<<<<<<<<<<< share method >>>>>>>>>>>>>>>>>>>>");

		String code 		= getRequest().getParameter("code");// 我们要的code
		String key 			= getRequest().getParameter("k");// key
		String redirect_uri = getRequest().getParameter("u");
		String state 		= getRequest().getParameter("state");// type
		String appid 		= "";
		String secret 		= "";
		String openid 		= "";
		logger.info("redirect_uri======" + redirect_uri);
		redirect_uri = URLDecoder.decode(redirect_uri);
		logger.info("redirect_uri2==" + redirect_uri);
		
		AppInfo app = weixinService.selectAppInfoByKey(key);

		appid = app.getAppId();
		secret = app.getAppSecret();

		logger.info("code==============" + code);
		logger.info("key===============" + key);
		logger.info("appid=============" + appid);
		logger.info("secret============" + secret);
		
		
		WebAccessToken webAccessToken = Oauth2Utils.getWebAccessToken(app, code);
		openid = webAccessToken.getOpenid();
		logger.info("openid==========" + openid);
		if(StringUtils.isNotEmpty(openid)){
			SessionMember sessionMember = weixinUserService.getSessionMemberById(openid);
			if (sessionMember != null) {
				sessionMember.setUserType("WECHAT");
				session.put(SessionUtils.SESSION_MEMEBER, sessionMember);
				logger.info("sessionMember success!!!!!!!!!!!!");
			}else{
				logger.info("sessionMember is null<><><><><><>");
			}
			
		}
		 
		SessionSkin sessionSkin = mainService.getSessionSkinByShopId(app.getShopId());
		session.put(SessionUtils.SESSION_SKIN, sessionSkin);
		logger.info("SessionSkin  setting success");
		
		request.put("redirect_uri", redirect_uri);
		
		logger.info("<<<<<<<<<<<<<<<<<<< share method end >333333333333333>");
		return "redirect_uri";

	}
	
	
	/**
	 * 共享letter跳转地址 - Old版本 将于2015.07.31日废弃
	 * 
	 * @return
	 * @throws Exception
	 */
	@Deprecated
	public String letter() throws Exception {
		
		logger.info("<<<<<<<<<<<<<<<<<<< letter method >>>>>>>>>>>>>>>>>>>>");
		
		String code 		= getRequest().getParameter("code");// 我们要的code
		String key 			= getRequest().getParameter("key");// key
		String letterId     = getRequest().getParameter("letterId");
		String state 		= getRequest().getParameter("state");// type
		String appid 		= "";
		String secret 		= "";
		String openid 		= ""; 
		String redirect_uri = "";
		
		AppInfo app = weixinService.selectAppInfoByKey(key);
		
		appid = app.getAppId();
		secret = app.getAppSecret();
		
		logger.info("code==============" + code);
		logger.info("key===============" + key);
		logger.info("shopId============" + app.getShopId());
		logger.info("letterId==========" +letterId);
		logger.info("state=============" +state);
		logger.info("appid=============" + appid);
		logger.info("secret============" + secret);
 
		
		WebAccessToken webAccessToken = Oauth2Utils.getWebAccessToken(app, code);
		openid = webAccessToken.getOpenid();
		logger.info("openid============" + openid);
		if(StringUtils.isNotEmpty(openid)){
			request.put("openid", openid);
			
			Map<String, Object> letterInfo = weixinLetterService.selectLetterInfoById(IntegerUtils.valueOf(letterId));
			redirect_uri = (String)letterInfo.get("LETTER_PAGE_URL");
			
			request.put("redirect_uri", redirect_uri);
			
			Map<String, Object>  letterSaveMap = new HashMap<String, Object>();
			letterSaveMap.put("LETTER_ID", letterInfo.get("LETTER_ID"));
			letterSaveMap.put("SHOP_ID", letterInfo.get("SHOP_ID"));
			letterSaveMap.put("OPENID", openid);
			
			weixinLetterService.insertLetter(letterSaveMap);
			
			SessionMember sessionMember = getSessionMember();
			if(sessionMember == null || !sessionMember.getOpenid().equals(openid)){
				sessionMember = weixinUserService.getSessionMemberById(openid);
			} 
			
			if(sessionMember != null){
				session.put(SessionUtils.SESSION_MEMEBER, sessionMember);
				logger.info("*****************************************");
				logger.info("SESSION_MEMEBER=" + sessionMember.toString());
				logger.info("*****************************************");
			}else{
				logger.info("*****************************************");
				logger.info("SESSION_MEMEBER IS NULL");
				logger.info("*****************************************");
			}
		}else{
			logger.equals("openid is null;");
		}
		
		
		SessionSkin sessionSkin = mainService.getSessionSkinByShopId(app.getShopId());
		session.put(SessionUtils.SESSION_SKIN, sessionSkin);
		logger.info("*****************************************");
		logger.info("sessionSkin=" + sessionSkin.toString());
		logger.info("*****************************************");
		
		logger.info("redirect_uri======" + redirect_uri);
		logger.info("<<<<<<<<<<<<<<<<<<< letter method end >333333333333333>");
		
//		getRequest().getRequestDispatcher(redirect_uri).forward(getRequest(), getResponse());
		
		return "redirect_uri";
		
	}

	
	/** 
	* 通知跳转地址 - Old版本 将于2015.05.31日废弃
	* @return
	* @throws Exception
	*/
	@Deprecated
	public String advice() throws Exception {
		
		logger.info("<<<<<<<<<<<<<<<<<<< advice method >>>>>>>>>>>>>>>>>>>>");
		
		String code 		= getRequest().getParameter("code");// 我们要的code
		String key 			= getRequest().getParameter("key");// key
		String state 		= getRequest().getParameter("state");// type
		String redirect_uri = getRequest().getParameter("url");
		String openid 		= ""; 
		
		redirect_uri = URLDecoder.decode(redirect_uri, "utf-8");
		
		AppInfo appInfo = weixinService.selectAppInfoByKey(key);
		
		logger.info("code==============" + code);
		logger.info("key===============" + key);
		logger.info("shopId============" + appInfo.getShopId());
		logger.info("redirect_uri======" + redirect_uri);
		logger.info("state=============" + state);
		logger.info("appid=============" + appInfo.getAppId());
		logger.info("secret============" + appInfo.getAppSecret());
		
		WebAccessToken webAccessToken = Oauth2Utils.getWebAccessToken(appInfo, code);
		openid = webAccessToken.getOpenid();
		logger.info("openid============" + openid);
		request.put("redirect_uri", redirect_uri);
		if(StringUtils.isNotEmpty(openid)){
			
			SessionMember sessionMember = getSessionMember();
			if(sessionMember == null || !sessionMember.getOpenid().equals(openid)){
				sessionMember = weixinUserService.getSessionMemberById(openid);
			} 
			
			if(sessionMember != null){
				session.put(SessionUtils.SESSION_MEMEBER, sessionMember);
				logger.info("*****************************************");
				logger.info("SESSION_MEMEBER=" + sessionMember.toString());
				logger.info("*****************************************");
			}else{
				logger.info("*****************************************");
				logger.info("SESSION_MEMEBER IS NULL");
				logger.info("*****************************************");
			}
		}else{
			logger.equals("openid is null;");
		}
		
		
		SessionSkin sessionSkin = mainService.getSessionSkinByShopId(appInfo.getShopId());
		session.put(SessionUtils.SESSION_SKIN, sessionSkin);
		logger.info("*****************************************");
		logger.info("sessionSkin=" + sessionSkin.toString());
		logger.info("*****************************************");
		
		logger.info("redirect_uri======" + redirect_uri);
		logger.info("<<<<<<<<<<<<<<<<<<< advice method end >444444>");
		
//		getRequest().getRequestDispatcher(redirect_uri).forward(getRequest(), getResponse());
		
		return "redirect_uri";
		
	}
	
	
	
 
	@Deprecated
	public String r2() throws Exception {

		logger.info("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<,r2>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		// 第一步：用户同意授权，获取code
		String code 		= getRequest().getParameter("code");// 我们要的code
		String key 			= getRequest().getParameter("k");// key
		String type 		= getRequest().getParameter("t");// type
		String redirect_uri = getRequest().getParameter("r");
		String state 		= getRequest().getParameter("state");// type

		logger.info("code==========" + code);
		logger.info("key===========" + key);
		logger.info("type==========" + type);
		logger.info("state=========" + state);
		logger.info("redirect_uri==" + redirect_uri);

		if (StringUtils.isEmpty(code)) {
			throw new Exception("code is null");
		}
		if (StringUtils.isEmpty(key)) {
			throw new Exception("key is null");
		}

		AppInfo appInfo = weixinService.selectAppInfoByKey(key);

		// 第二步：通过code换取网页授权access_token
		WebAccessToken webAccessToken = Oauth2Utils.getWebAccessToken(appInfo, code);
		logger.info("webAccessToken=" + webAccessToken);
		String openid = webAccessToken.getOpenid();

		if (StringUtils.isNotEmpty(webAccessToken.getAccess_token())) {
			// 第三步：刷新access_token（如果需要）
			webAccessToken = Oauth2Utils.refreshToken(appInfo, webAccessToken.getRefresh_token());
			logger.info("webAccessToken2=" + webAccessToken);

			// 第四步：拉取用户信息(需scope为 snsapi_userinfo)
			String result = Oauth2Utils.getSnsUserinfo(webAccessToken.getAccess_token(), webAccessToken.getOpenid());
			logger.info("result==" + result);
		}

		request.put("redirect_uri", "/front/main/main.htm");
		return "redirect_uri";

	}
	
	

	public String userInfo() throws Exception {
		
		logger.info("<<<<<<<<<<<<<<<<<<< userInfo method >>>>>>>>>>>>>>>>>>>>");
		
		String returns = "redirect_uri";
		
		String key 			= getRequest().getParameter(Oauth2Utils.Params.SYSTEM_ID); 
		String code 		= getRequest().getParameter(Oauth2Utils.Params.CODE); 
		String state 		= getRequest().getParameter(Oauth2Utils.Params.STATE); 
		
		String redirect_uri = "";
		String openid 		= ""; 
		String fromOpenid 	= ""; //分享来源
		
		try {
			AppInfo appInfo = weixinService.selectAppInfoByKey(key);
			
			logger.info("key===========" + key);
			logger.info("shopId========" + appInfo.getShopId());
			logger.info("code==========" + code);
			logger.info("state=========" + state);
			logger.info("appid=========" + appInfo.getAppId());
			logger.info("openid========" + openid);
			
			
			SessionSkin sessionSkin = mainService.getSessionSkinByShopId(appInfo.getShopId());
			session.put(SessionUtils.SESSION_SKIN, sessionSkin);
			logger.info("*****************************************");
			logger.info("sessionSkin=" + sessionSkin.getSkinTypeShop());
			logger.info("*****************************************");
			
			if(StringUtils.isNotEmpty(code)){//用户同意授权
				
				logger.info("==========用户同意授权===========");
				//通过code换取网页授权access_token
				WebAccessToken webAccessToken = Oauth2Utils.getWebAccessToken(appInfo, code);
				openid = webAccessToken.getOpenid();
				logger.info("openid========" + openid);
				
				session.put(SessionUtils.SESSION_OPENID, openid);
				
				if(StringUtils.isNotEmpty(openid)){
					if (StringUtils.isNotEmpty(webAccessToken.getAccess_token())) {
//						// 第三步：刷新access_token（如果需要）
//						webAccessToken = Oauth2Utils.refreshToken(appInfo, webAccessToken.getRefresh_token());
//						logger.info("webAccessToken2=" + webAccessToken);

						// 第四步：拉取用户信息(需scope为 snsapi_userinfo)
						String result = Oauth2Utils.getSnsUserinfo(webAccessToken.getAccess_token(), webAccessToken.getOpenid());
						logger.info("result==" + result);
					}	
				}else{
					logger.error("openid is null;");
					throw new Oauth2Exception("没有获取到openid");
				}
				
			}else{//用户禁止授权
				logger.info("==========用户禁止授权===========");
			}
		} catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage());
			returns = "error500";
		}
		
		redirect_uri = "http://www.baidu.com";
		
		request.put("redirect_uri", redirect_uri);
		if(StringUtils.isEmpty(redirect_uri)){
			returns = "error404";
			logger.info("redirect_uri is null!!!!!!!!!!!!!!!!!!!!!!!!!! ");
		}
		logger.info("<<<<<<<<<<<<<<<<<<< userInfo method end <<<<<<<<<<<<<<<<");
		
		return returns;
		
	}
	

	public String redirect_uri() throws Exception {
		String redirect_uri	= getRequest().getParameter("redirect_uri"); 
		request.put("redirect_uri", redirect_uri);
		return "redirect_uri";
		
	}

}
