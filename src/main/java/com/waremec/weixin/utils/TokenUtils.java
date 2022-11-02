/**   
* @Title: TokenUtils.java 
* @Package com.waremec.weixin.utils 
* @Description:  
* @author taebem
* @date 2015年5月21日 下午2:38:20 
* @version V1.0   
*/
package com.waremec.weixin.utils;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.service.WeixinService;

/** 
 * @Package com.waremec.weixin.utils 
 * @FileName TokenUtils
 * @Description  
 * @author taebem 
 * @date 2015年5月21日 下午2:38:20 
 *  
 */
public class TokenUtils {
	
	
	private static final transient Log logger = LogFactory.getLog(TokenUtils.class);
	
	static{
		logger.info("===============TokenUtils======================");
	}
	
	public static ApplicationContext ac = new ClassPathXmlApplicationContext("classpath*:spring/applicationContext*.xml");
	
	
	public static String getToken(String sysId){
		WeixinService weixinService = ac.getBean(WeixinService.class);
		AppInfo appInfo = weixinService.selectAppInfoByKey(sysId);
		String token = weixinService.getAccessToken(appInfo);
		
		logger.info("token==" + token);
		
		return token;
	}
	public static String getToken(Integer shopId){
		WeixinService weixinService = ac.getBean(WeixinService.class);
		AppInfo appInfo = weixinService.selectAppInfoByShopId(shopId);
		String token = weixinService.getAccessToken(appInfo);
		
		logger.info("token==" + token);
		return token;
	}
	public static String getToken(AppInfo appInfo){
		WeixinService weixinService = ac.getBean(WeixinService.class);
		String token = weixinService.getAccessToken(appInfo);
		logger.info("token==" + token);
		return token;
	}
	 

}
