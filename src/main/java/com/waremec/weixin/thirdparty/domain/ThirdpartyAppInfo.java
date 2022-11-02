/**   
* @Title: ThirdpartyAppInfo.java 
* @Package com.waremec.weixin.thirdparty.domain 
* @Description:  
* @author taebem
* @date 2015年6月2日 下午5:25:30 
* @version V1.0   
*/
package com.waremec.weixin.thirdparty.domain;

/** 
 * @Package com.waremec.weixin.thirdparty.domain 
 * @FileName ThirdpartyAppInfo
 * @Description  
 * @author taebem 
 * @date 2015年6月2日 下午5:25:30 
 *  
 */
public class ThirdpartyAppInfo {
	private Integer shopId;
	private String appId;
	private String appSecret;
	public Integer getShopId() {
		return shopId;
	}
	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}
	public String getAppId() {
		return appId;
	}
	public void setAppId(String appId) {
		this.appId = appId;
	}
	public String getAppSecret() {
		return appSecret;
	}
	public void setAppSecret(String appSecret) {
		this.appSecret = appSecret;
	}
	
	
}
