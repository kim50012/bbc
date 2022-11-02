package com.waremec.wxi.action;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.ScopeType;
import com.waremec.weixin.action.WeixinBaseAction;
import com.waremec.weixin.aes.AesException;
import com.waremec.weixin.aes.SHA1;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.wxi.service.WxiService;

@Controller("wxiWeixinAction")
@Scope(ScopeType.prototype)
public class WxiWeixinAction extends WeixinBaseAction{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Resource
	private WxiService wxiService;
	
	protected String key = "";

	// 微信接口验证
	private boolean checkSignature(String token) throws AesException {

		// 加密/校验流程如下：
		// 1. 将token、timestamp、nonce三个参数进行字典序排序
		// 2. 将三个参数字符串拼接成一个字符串进行sha1加密
		// 3. 开发者获得加密后的字符串可与signature对比，标识该请求来源于微信
		String signature = getRequest().getParameter("signature");// 微信加密签名，signature结合了开发者填写的token参数和请求中的timestamp参数、nonce参数。
		String timestamp = getRequest().getParameter("timestamp");// 时间戳
		String nonce = getRequest().getParameter("nonce");// 随机数

		String signatureNew = SHA1.getSHA2(token, timestamp, nonce);
		if (signature.equalsIgnoreCase(signatureNew)) {
			return true;
		} else {
			return false;
		}
	}

	public String valid() {

		long startTime = System.currentTimeMillis();

		logger.info("========微信服务器-后台服务器交互开始========");
		String result = "";
		String echostr = getRequest().getParameter("echostr");// 随机字符串
		if (key == null || key.length() != 32) {
			request.put("result", "error");
			logger.error("WX00001==============");
			logger.error("key无效");
			return SUCCESS;
		}
		
		AppInfo appInfo  = null;
		try {
			 appInfo = weixinService.selectAppInfoByKey(key);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 
		if (appInfo == null) {
			request.put("result", "error");
			logger.error("WX00002==============");
			logger.error("公众号信息找不到 key=" + key);
			return SUCCESS;
		}

		if (StringUtils.isEmpty(echostr)) {
			try {
				result = wxiService.processingAndReplyMessage(getRequest(),appInfo);
			} catch (Exception e) {
				logger.error(key);
				logger.error("WX00003==============");
				logger.error(e.getMessage());
				result = "success";
			}
		} 
		else {// 验证URL有效性
			try {
				if (checkSignature(appInfo.getToken())) {
					// logger.debug("echostr==== " + echostr);
					result = echostr;
				} else {
					result = "error";
				}
			} catch (AesException e) {
				logger.error("WX00004==============");
				logger.error(e.getMessage());
				result = "error";
			}
		}
		request.put("result", result);
		logger.info("========微信服务器-后台服务器交互END========");
		long executeTime = System.currentTimeMillis() - startTime;

		logger.info("executeTime=== " + executeTime);
		return SUCCESS;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}
}
