/**   
 * @Title: ExecutionLog.java 
 * @Package com.waremec.weixin.domain 
 * @Description:  
 * @author taebem
 * @date 2015年8月10日 上午10:35:03 
 * @version V1.0   
 */
package com.waremec.weixin.domain;

import java.util.Date;

/**
 * @Package com.waremec.weixin.domain
 * @FileName ExecutionLog
 * @Description
 * @author taebem
 * @date 2015年8月10日 上午10:35:03
 * 
 */
public class ExecutionLog {
	private String sysId;
	private Integer shopId;
	private Date startTime;// 开始时间
	private Long executeTime;// 执行时间
	private String toUserName; // 开发者微信号
	private String fromUserName; // 发送方帐号（一个OpenID）
	private String createTime; // 消息创建时间 （整型）
	private String msgType; // 消息类型
	private String event;// 事件类型
	private String eventKey;// 事件KEY值
	private String msgId;// 消息id，64位整型
	public String getSysId() {
		return sysId;
	}
	public void setSysId(String sysId) {
		this.sysId = sysId;
	}
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
	public String getToUserName() {
		return toUserName;
	}
	public void setToUserName(String toUserName) {
		this.toUserName = toUserName;
	}
	public String getFromUserName() {
		return fromUserName;
	}
	public void setFromUserName(String fromUserName) {
		this.fromUserName = fromUserName;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getMsgType() {
		return msgType;
	}
	public void setMsgType(String msgType) {
		this.msgType = msgType;
	}
	public String getEvent() {
		return event;
	}
	public void setEvent(String event) {
		this.event = event;
	}
	public String getEventKey() {
		return eventKey;
	}
	public void setEventKey(String eventKey) {
		this.eventKey = eventKey;
	}
	public String getMsgId() {
		return msgId;
	}
	public void setMsgId(String msgId) {
		this.msgId = msgId;
	}
	
}
