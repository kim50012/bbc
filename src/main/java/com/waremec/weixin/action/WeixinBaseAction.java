package com.waremec.weixin.action;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.domain.ShareInfo;
import com.waremec.weixin.domain.WeixinPageExecutionLog;
import com.waremec.weixin.exception.WeixinErrorException;
import com.waremec.weixin.service.WeixinCustomService;
import com.waremec.weixin.service.WeixinGroupService;
import com.waremec.weixin.service.WeixinLetterService;
import com.waremec.weixin.service.WeixinMassService;
import com.waremec.weixin.service.WeixinMediaService;
import com.waremec.weixin.service.WeixinMenuService;
import com.waremec.weixin.service.WeixinMessageService;
import com.waremec.weixin.service.WeixinOrderService;
import com.waremec.weixin.service.WeixinQRCodeService;
import com.waremec.weixin.service.WeixinService;
import com.waremec.weixin.service.WeixinStatisticService;
import com.waremec.weixin.service.WeixinTemplateMessageService;
import com.waremec.weixin.service.WeixinUserService;
import com.waremec.weixin.thirdparty.service.ThirdpartyService;
import com.waremec.weixin.thread.ExecutionLoggingThread;
import com.waremec.weixin.utils.Constants;
import com.waremec.weixin.utils.Oauth2Utils;
import com.waremec.weixin.utils.WeixinSignUtils;
import com.waremec.wpt.front.domain.SessionSkin;

/** 
* @Package com.waremec.weixin.action 
* @FileName WeixinBaseAction
* @Description  
* @author taebem 
* @date 2015年5月7日 下午4:04:47 
*  
*/
public class WeixinBaseAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	protected final transient Log logger = LogFactory.getLog(WeixinBaseAction.class);
	
	/********************************************************/
	
	protected String key = "";
	
	/********************************************************/
	@Resource
	protected WeixinGroupService weixinGroupService;
	@Resource
	protected WeixinLetterService weixinLetterService;
	@Resource
	protected WeixinMenuService weixinMenuService;
	@Resource
	protected WeixinMediaService weixinMediaService;
	@Resource
	protected WeixinMessageService weixinMessageService;
	@Resource
	protected WeixinOrderService weixinOrderService;
	@Resource
	protected WeixinService weixinService;
	@Resource
	protected WeixinTemplateMessageService weixinTemplateMessageService;
	@Resource
	protected WeixinUserService weixinUserService;
	@Resource
	protected WeixinQRCodeService weixinQRCodeService;
	@Resource
	protected WeixinStatisticService weixinStatisticService;
	@Resource
	protected WeixinMassService weixinMassService;
	@Resource
	protected WeixinCustomService weixinCustomService;
	@Resource
	protected ThirdpartyService thirdpartyService;
	
	/********************************************************/

	protected void jsSdkStting() {
		 Date startTime =new Date();
//		logger.info("==================jsSdkStting start ===========================");
		 String currentUrl = getFullUrl();
		 logger.info("currentUrl====" + currentUrl);
		 Integer shopId 	= IntegerUtils.valueOf(getRequest().getParameter("shopId"));
		 Integer letterId   = IntegerUtils.valueOf(getRequest().getParameter("letterId"));
		 
		 SessionSkin sessionSkin = super.getSessionSkin();
		 if(shopId == null){
			 shopId = sessionSkin.getShopId();
		 }
		 
		 String openid = getSessionOpenid();
 		 logger.info("openid====" + openid);
		 
		 if(shopId != null){
			 try {
				 AppInfo appInfo = weixinService.selectAppInfoByShopId(shopId);
				 String ticket = weixinService.getApiTicket(appInfo);
//				 logger.info("ticket=====" + ticket);
				 if (StringUtils.isNotEmpty(ticket)) {
					request.put("signInfo", WeixinSignUtils.sign(ticket, currentUrl));
				}
				request.put("appInfo", appInfo);
				
				//share info setting
				ShareInfo shareInfo = new ShareInfo();
				String shareUrl = "";
				String shareTitle = "";
				String shareDesc = "";
				String shareImgUrl = "";
				if(letterId == null){
					if(StringUtils.isNotEmpty(openid)){
						shareUrl = Oauth2Utils.getShareLinkUrl(appInfo, currentUrl,openid);
					}else{
						shareUrl = Oauth2Utils.getShareLinkUrl(appInfo, currentUrl);
					}
					shareTitle = sessionSkin.getShopName();
					shareDesc = sessionSkin.getShopName();
					shareImgUrl = appInfo.getDomain() + sessionSkin.getShopLogoImgUrl();
				}else{
					Map<String, Object> letterInfo = weixinLetterService.selectLetterInfoById(letterId);
					
					if(StringUtils.isNotEmpty(openid)){
						shareUrl = Oauth2Utils.getLetterLinkUrl(appInfo, letterId, openid);
					}else{
						shareUrl = Oauth2Utils.getLetterLinkUrl(appInfo, letterId, shareImgUrl);
					}
					if(!letterInfo.isEmpty()){
						shareTitle =  (String)letterInfo.get("LETTER_NM");
						shareDesc  =  (String)letterInfo.get("LETTER_BODY");
						shareImgUrl = (String)letterInfo.get("LETTER_IMG_URL");
					}
				}
				shareInfo.setTitle(shareTitle);
				shareInfo.setDesc(shareDesc);
				shareInfo.setImgUrl(shareImgUrl);	
//				shareInfo.setLink(shareUrl);
				shareInfo.setLink(currentUrl);
				
				logger.info("======================shareUrl currentUrl======================");
				logger.info(shareUrl);
				logger.info(currentUrl);
				logger.info("======================shareUrl currentUrl======================");
				
				request.put("shareInfo", shareInfo);
				
				
			} catch (Exception e) {
				// TODO: handle exception
				logger.error("jsSdkStting error:" + e.getMessage());
			}
		 }
	 
//		logger.info("==================jsSdkStting end ===========================");
		 
		long executeTime = System.currentTimeMillis() - startTime.getTime();
		logger.info("jsSdkStting executeTime==="+ executeTime );
		WeixinPageExecutionLog log = new WeixinPageExecutionLog();
		log.setShopId(shopId);
		log.setStartTime(startTime);
		log.setExecuteTime(executeTime);
		log.setOpenid(openid);
		log.setType("jsSdkStting");
		log.setUrl(currentUrl);
		Thread thread = new Thread(new ExecutionLoggingThread(weixinService,Constants.LogType.SHARE_SETTIONG, log));
		thread.start();

	}
	

	protected void jsSdkSttingNormal() {
		 Date startTime =new Date();
//		logger.info("==================jsSdkStting start ===========================");
		 String currentUrl = getFullUrl();
		 logger.info("currentUrl====" + currentUrl);
		 Integer shopId 	= IntegerUtils.valueOf(getRequest().getParameter("shopId"));
		 
		 SessionSkin sessionSkin = super.getSessionSkin();
		 if(shopId == null){
			 shopId = sessionSkin.getShopId();
		 }
		 
		 String openid = getSessionOpenid();
 		 logger.info("openid====" + openid);
		 
		 if(shopId != null){
			 try {
				 AppInfo appInfo = weixinService.selectAppInfoByShopId(shopId);
				 String ticket = weixinService.getApiTicket(appInfo);
//				 logger.info("ticket=====" + ticket);
				 if (StringUtils.isNotEmpty(ticket)) {
					request.put("signInfo", WeixinSignUtils.sign(ticket, currentUrl));
				}
				request.put("appInfo", appInfo);
				
				//share info setting
				ShareInfo shareInfo = new ShareInfo();
				String shareUrl = "";
				String shareTitle = "";
				String shareDesc = "";
				String shareImgUrl = "";

				currentUrl = currentUrl.replace("&", "%26");
				
				String encodedUrl;
				try {
					encodedUrl = URLEncoder.encode(currentUrl, "utf-8");
				} catch (UnsupportedEncodingException e) {
					logger.error(e.getMessage());
					throw new WeixinErrorException(e.getMessage());
				}
				
				encodedUrl = encodedUrl.replace("&", "%26");
				
				String url = "http://bbc.manhuaking.cn/w/t.htm?k="+appInfo.getSysId()+"%26tu="+encodedUrl;
				
				shareUrl = Oauth2Utils.getOauth2SnsapiBaseUrlNormal(appInfo, url, "n");

				String url2 = "http://bbc.manhuaking.cn/w/redirect_uri.htm?redirect_uri=";

				String encodedUrl2;
				try {
					encodedUrl2 = URLEncoder.encode(shareUrl, "utf-8");
				} catch (UnsupportedEncodingException e) {
					logger.error(e.getMessage());
					throw new WeixinErrorException(e.getMessage());
				}
				encodedUrl2 = encodedUrl2.replace("&", "%26");
				
				shareTitle = sessionSkin.getShopName();
				shareDesc = sessionSkin.getShopName();
				shareImgUrl = appInfo.getDomain() + sessionSkin.getShopLogoImgUrl();
				shareInfo.setTitle(shareTitle);
				shareInfo.setDesc(shareDesc);
				shareInfo.setImgUrl(shareImgUrl);
				shareInfo.setLink(url2+encodedUrl2);
				
				logger.info("======================shareUrl currentUrl======================");
				logger.info(shareUrl);
				logger.info(currentUrl);
				logger.info(encodedUrl2);
				logger.info("======================shareUrl currentUrl======================");
				
				request.put("shareInfo", shareInfo);
				
				
			} catch (Exception e) {
				// TODO: handle exception
				logger.error("jsSdkStting error:" + e.getMessage());
			}
		 }
	 
//		logger.info("==================jsSdkStting end ===========================");
		 
		long executeTime = System.currentTimeMillis() - startTime.getTime();
		logger.info("jsSdkStting executeTime==="+ executeTime );
		WeixinPageExecutionLog log = new WeixinPageExecutionLog();
		log.setShopId(shopId);
		log.setStartTime(startTime);
		log.setExecuteTime(executeTime);
		log.setOpenid(openid);
		log.setType("jsSdkStting");
		log.setUrl(currentUrl);
		Thread thread = new Thread(new ExecutionLoggingThread(weixinService,Constants.LogType.SHARE_SETTIONG, log));
		thread.start();

	}
	 
	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}
	
}
