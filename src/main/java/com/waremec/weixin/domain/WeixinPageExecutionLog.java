/**   
 * @Title: WeixinPageExecutionLog.java 
 * @Package com.waremec.weixin.domain 
 * @Description:  
 * @author taebem
 * @date 2015年8月10日 下午1:19:48 
 * @version V1.0   
 */
package com.waremec.weixin.domain;

import java.util.Date;

/**
 * @Package com.waremec.weixin.domain
 * @FileName WeixinPageExecutionLog
 * @Description
 * @author taebem
 * @date 2015年8月10日 下午1:19:48
 * 
 */
public class WeixinPageExecutionLog {
	private Integer shopId;
	private Date startTime; // 开始时间
	private Long executeTime; // 执行时间
	private String type; //
	private String openid; // 开发者微信号
	private String url;

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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}
