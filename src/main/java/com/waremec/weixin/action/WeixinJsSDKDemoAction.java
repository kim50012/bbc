package com.waremec.weixin.action;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.utils.WeixinSignUtils;
 
/** 
* @Package com.waremec.weixin.action 
* @FileName WeixinJsSDKDemoAction
* @Description  
* @author taebem 
* @date 2015年5月7日 下午4:04:51 
*  
*/
@Controller("weixinJsSDKDemoAction")
@Scope(ScopeType.prototype)
public class WeixinJsSDKDemoAction extends WeixinBaseAction{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private final transient Log logger = LogFactory.getLog(this.getClass());
	

	public String demo() throws Exception{
		 String url = getFullUrl();
		 logger.info("url====" + url);
		 Integer shopId  =  IntegerUtils.valueOf(getRequest().getParameter("shopId"));
		try {
			AppInfo appInfo = weixinService.selectAppInfoByShopId(shopId);
			String ticket = weixinService.getApiTicket(appInfo);
			  logger.info("ticket=====" + ticket);
			if (StringUtils.isNotEmpty(ticket)) {
				request.put("signInfo", WeixinSignUtils.sign(ticket, url));
			}
			request.put("appInfo", appInfo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
 
		return "demo"; 
	}
	
}
