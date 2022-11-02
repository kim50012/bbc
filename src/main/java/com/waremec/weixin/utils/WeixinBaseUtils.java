/**   
* @Title: WeixinBaseUtils.java 
* @Package com.waremec.weixin.utils 
* @Description:  
* @author taebem
* @date 2015年5月22日 上午9:18:27 
* @version V1.0   
*/
package com.waremec.weixin.utils;

/** 
 * @Package com.waremec.weixin.utils 
 * @FileName WeixinBaseUtils
 * @Description  
 * @author taebem 
 * @date 2015年5月22日 上午9:18:27 
 *  
 */
public abstract class WeixinBaseUtils {

	protected static String getInterfaceUrl(String url, String access_token){
		return url.replaceAll("ACCESS_TOKEN", access_token);
	}
}
