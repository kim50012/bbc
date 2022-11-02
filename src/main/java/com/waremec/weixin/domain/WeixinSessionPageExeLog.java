/**   
* @Title: WeixinSessionPageExeLog.java 
* @Package com.waremec.weixin.domain 
* @Description:  
* @author taebem
* @date 2015年8月10日 上午11:54:37 
* @version V1.0   
*/
package com.waremec.weixin.domain;

import java.util.Date;

import com.waremec.weixin.utils.Oauth2Utils;

/** 
 * @Package com.waremec.weixin.domain 
 * @FileName WeixinSessionPageExeLog
 * @Description  
 * @author taebem 
 * @date 2015年8月10日 上午11:54:37 
 *  
 */
public class WeixinSessionPageExeLog {

	private Integer shopId;
	private Date startTime;		// 开始时间
	private Long executeTime;	// 执行时间
	private String openid; 		// 开发者微信号
	private String state; 		// 
	private String url; 		// 发送方帐号（一个OpenID）
	
	public Integer getShopId() {
		return shopId;
	}
	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Long getExecuteTime() {
		return executeTime;
	}
	public void setExecuteTime(Long executeTime) {
		this.executeTime = executeTime;
	}
	public String getOpenid() {
		return openid;
	}
	public void setOpenid(String openid) {
		this.openid = openid;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	 
	
}
