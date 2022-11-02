/**   
* @Title: WeixinScanUtils.java 
* @Package com.waremec.weixin.utils 
* @Description:  
* @author taebem
* @date 2015年12月31日 上午8:44:30 
* @version V1.0   
*/
package com.waremec.weixin.utils;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/** 
 * @Package com.waremec.weixin.utils 
 * @FileName WeixinScanUtils
 * @Description  
 * @author taebem 
 * @date 2015年12月31日 上午8:44:30 
 *  
 */
public class WeixinScanUtils extends WeixinBaseUtils {

	private static final transient Log logger = LogFactory.getLog(WeixinMessageUtils.class);

	/******************** 接口地址定义  *********************/
	
	/**
	 * 获取商户信息接口 
	 */
	private static final String SCAN_MERCHANTINFO_GET_URL = "https://api.weixin.qq.com/scan/merchantinfo/get?access_token=ACCESS_TOKEN";

	public static void main(String[] args) {
		String token = TokenUtils.getToken(8);
		logger.info("token==" + token);
		
		logger.info("********************************************************");
		String info = getScanMerchantinfo(token); 
		logger.info(info);
	}
	
	/**
	 * <h1>获取商户信息</h1>
	 * 
	 * 使用该接口，商户可获取账号下的类目与号段等信息。
	 * 
	 * @param access_token
	 * @return
	 */
	public static String getScanMerchantinfo(String access_token) {
		String url = getInterfaceUrl(SCAN_MERCHANTINFO_GET_URL, access_token);
		return HttpClientUtils.requestGet(url);
	}
}
