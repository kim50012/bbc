package com.waremec.weixin.thirdparty.action;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.ScopeType;
import com.waremec.weixin.action.WeixinBaseAction;
import com.waremec.weixin.aes.WXBizMsgCrypt;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.thirdparty.aes.AesException;
import com.waremec.weixin.thirdparty.service.ThirdpartyMessageService;

/** 
* @Package com.waremec.weixin.thirdparty.action
* @FileName WeixinThirdpartyAction
* @Description  
* @author naran 
* @date 2017年03月17日 上午09:29:00
*  
*/
@Controller("weixinthirdpartyaction")
@Scope(ScopeType.prototype)
public class WeixinThirdpartyAction extends WeixinBaseAction {

	private static final long serialVersionUID = 1L;
	private final transient Log logger = LogFactory.getLog(WeixinThirdpartyAction.class);
	@Resource
	protected ThirdpartyMessageService thirdpartyMessageService;
	
	
	
	//店铺id
	private String shopId="";
	
	
	/**
	 * 业务接口
	 * @return
	 * @throws AesException 
	 */
	public String thirdpartyCallback() {
		// TODO Auto-generated catch block
		System.out.println("### ~~~ thirdpartyCallback ~~~ ###");
		
		String result = "";
		String echostr = getRequest().getParameter("nonce");// 随机字符串
		String timestamp  	= getRequest().getParameter("timestamp"); //时间戳
		
		String pushAppId = String.valueOf(request.get("pushAppId"));
		
		AppInfo appInfo  = null;
		try {
			 appInfo = weixinService.selectAppInfoByKey(key);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (appInfo == null) {
			request.put("result", "error");
			logger.error("WXThirdpartyAction=00002==============");
			logger.error("key找不到=" + key);
			return SUCCESS;
		}
		
		try {
			String thirdpartyProcessingAndReplyMessage = thirdpartyMessageService.thirdpartyProcessingAndReplyMessage(getRequest(), appInfo, pushAppId);
			
			//加密
			WXBizMsgCrypt pc = new WXBizMsgCrypt(appInfo.getToken(), appInfo.getEncordingAesKey(), appInfo.getAppId());
			result = pc.encryptMsg(thirdpartyProcessingAndReplyMessage, timestamp, echostr);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.put("result", result);
		logger.info("========微信服务器-第三方平台服务器交互END========");
		return SUCCESS;
	}
	
	
	/**
	 * 预授权申请
	 */
	public String getAuthorization(){
		
		Map<String, Object> returns = new HashMap<String, Object>();
		
		//在session获取登录的用户id
		String userId = getBackSessionUserId();
		returns.put("userId", userId);
		
		//获取微信平台信息
		Map<String,Object> queryMap=new HashMap<String,Object>();
		queryMap.put("shopId",shopId);
		queryMap.put("originalAppId", null);
		queryMap.put("sysId", null);
		Map<String,Object> weixinInfo=commonService.select("AdminGroup.weiXinAppInfoSelect", queryMap);
		
		//获取component_verify_ticket
		Map<String, Object> componentVerifyTicket = thirdpartyService.getComponentVerifyTicket(weixinInfo);
		
		Boolean flag = thirdpartyService.checkExpiresIn(String.valueOf(componentVerifyTicket.get("PA_CODE_EXPIRES_IN")), 2);
		
		//检查预授权码
		if(flag){
			returns.put("pre_auth_code", componentVerifyTicket.get("PRE_AUTH_CODE"));
			returns.put("appId", weixinInfo.get("appId"));
		}else {
			//1、获取componentAccessToken
			Map<String, Object> componentAccessToken = thirdpartyService.getComponentAccessToken(componentVerifyTicket, String.valueOf(weixinInfo.get("appSecret")));
			if(!StringUtils.isBlank(String.valueOf(componentAccessToken.get("OUT_ERR_MSG")))){
				//2、获取预授权码
				Map<String, Object> preAuthCode = thirdpartyService.getPreAuthCode(componentAccessToken, weixinInfo);
				returns.put("pre_auth_code", preAuthCode.get("PRE_AUTH_CODE"));
				returns.put("appId", weixinInfo.get("appId"));
			}else {
				logger.error(String.valueOf(componentAccessToken.get("OUT_ERR_MSG")));
			}
		}
		
		renderJSON(returns);
		return NONE;
	}
	
	
	
	public String getShopId() {
		return shopId;
	}

	public void setShopId(String shopId) {
		this.shopId = shopId;
	}
	
};