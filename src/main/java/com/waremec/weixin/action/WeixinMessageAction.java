package com.waremec.weixin.action;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.RandomUtils;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.utils.WeixinMessageUtils;

/** 
* @Package com.waremec.weixin.action 
* @FileName WeixinMessageAction
* @Description  
* @author taebem 
* @date 2015年5月7日 下午4:05:03 
*  
*/
@Controller("weixinMessageAction")
@Scope(ScopeType.prototype)
public class WeixinMessageAction extends WeixinBaseAction {

	private static final long serialVersionUID = 1L;

	private final transient Log logger = LogFactory.getLog(this.getClass());
	
	 
	public String send(){

		logger.info("<<<<<<<<<<<<<<<<<<<<send>>>>>>>>>>>>>>>>>>>>");

		String type = getRequest().getParameter("type"); 
		String openid = getRequest().getParameter("openid"); 
		Integer custSysId = Integer.valueOf(getRequest().getParameter("custSysId")); 
		String textMessage = getRequest().getParameter("textMessage");// type
		
		Integer shopId =  getBackSessionShopId();
		
		logger.info("shopId=" + shopId);
		logger.info(type);
		logger.info(custSysId);
		logger.info(openid);
		logger.info(textMessage);
		
		AppInfo appInfo = weixinService.selectAppInfoByShopId(shopId);
		String token = weixinService.getAccessToken(appInfo);
		
		try {
			WeixinMessageUtils.sendTextMsg(token, openid, textMessage);
		} catch (Exception e) {
			logger.error(e.getMessage());
			Map<String,Object> returnMap = new HashMap<String,Object>();
			returnMap.put("success", false);
			returnMap.put("errmsg", e.getMessage());
			
			renderJSON(returnMap);
			
			return NONE;
			
		}
		
		
		
		Map<String,Object> saveMap = new HashMap<String,Object>();
		saveMap.put("SYS_ID", appInfo.getSysId());
		saveMap.put("MSG_ID", RandomUtils.generateRandomDateString());
		saveMap.put("FROM_TYPE", 2);
		saveMap.put("FROM_USER", openid);
		saveMap.put("TO_USER", "admin");
		saveMap.put("MSG_TYPE", "text");
		saveMap.put("RECEIVE_DT", new Date());
		saveMap.put("CONTENT", textMessage);
		saveMap.put("MEDIA_ID", null);
		saveMap.put("PIC_URL", null);
		saveMap.put("FORMAT", null);
		saveMap.put("THUMB_MEDIA_ID", null);
		saveMap.put("LOCATION_X", null);
		saveMap.put("LOCATION_Y", null);
		saveMap.put("SCALE", null);
		saveMap.put("LABEL", null);
		saveMap.put("LINK_TITLE", null);
		saveMap.put("LINK_DES", null);
		saveMap.put("LINK_URL", null);
		
		try {
			
			Integer id = weixinMessageService.saveSendLogging(saveMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		Map<String,Object> returnMap = new HashMap<String,Object>();
		returnMap.put("success", true);
		
		renderJSON(returnMap);
		
		return NONE;
 
	}

	 

}
