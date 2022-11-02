package com.waremec.wxi.action;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.ScopeType;
import com.waremec.weixin.action.WeixinAction;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.domain.user.UserReturn;
import com.waremec.weixin.utils.EncryptUtils;
import com.waremec.wxi.dao.WxiDao;


@Controller("servicesAction")
@Scope(ScopeType.prototype)
public class ServicesAction extends WeixinAction{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private final transient Log logger = LogFactory.getLog(this.getClass());
	
	
	@Resource
	private WxiDao wxiDao;
	
	
	public String validation(){
		String hzmIfId = getRequest().getParameter("hzmIfId");
		String hzmIfPw = getRequest().getParameter("hzmIfPw");
		String shopId = getRequest().getParameter("shopId");
		String openid = getRequest().getParameter("openid");
		String sign = 	getRequest().getParameter("sign");

		UserReturn userInfo = null;
		
		try {
			AppInfo appInfo = weixinService.selectAppInfoByShopId(Integer.valueOf(shopId));
			
			userInfo = wxiDao.userInfoToIF(appInfo.getSysId(), openid);
			
			if(userInfo == null){
				throw new Exception("USER NO AUTH");
			}
			
			if (!hzmIfId.equals(appInfo.getIfUserId()) || !hzmIfPw.equals(appInfo.getIfPassword())) {
				throw new Exception("USER PASS ERROR"); 
			} 
			
			String sha256 = EncryptUtils.sha256(
					"hzmIfId=" + appInfo.getIfUserId() + 
					"&hzmIfPw=" + appInfo.getIfPassword() +
					"&shopId=" + appInfo.getShopId() + 
					"&openid=" + userInfo.getOpenid() + 
					"&key=" + appInfo.getIfSignKey());

			if(!sign.equals(sha256)){
				throw new Exception("SIGN ERROR");
			}
			
			userInfo.setErrmsg("");
		} catch (Exception e) {
			// TODO: handle exception
			userInfo = new UserReturn();
			userInfo.setErrcode(1);
			userInfo.setErrmsg(e.getMessage()); 
			
		}
		
		renderJSON(userInfo);
		return NONE;
		
		 
	}
 
}
