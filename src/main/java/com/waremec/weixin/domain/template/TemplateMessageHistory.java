/**   
* @Title: TemplateMessageHistory.java 
* @Package com.waremec.weixin.domain.template 
* @Description:  
* @author taebem
* @date 2015年5月12日 上午9:49:20 
* @version V1.0   
*/
package com.waremec.weixin.domain.template;

import com.waremec.weixin.cons.TemplateMessageAdvice;

/** 
 * @Package com.waremec.weixin.domain.template 
 * @FileName TemplateMessageHistory
 * @Description  
 * @author taebem 
 * @date 2015年5月12日 上午9:49:20 
 *  
 */
public class TemplateMessageHistory {

	private Integer id;
	private Integer shopId;
	private String templateShortId;
	private Integer type;
	private String openid;
	private Long messageId;
	private String content;
	
	
	
	
	public TemplateMessageHistory() { 
	}
	
	/**
	 * 创建一个新的实例 TemplateMessageHistory.
	 *
	 * @param shopId
	 * @param advice
	 * @param openid
	 * @param messageId
	 */
	 
	public TemplateMessageHistory(Integer shopId, TemplateMessageAdvice advice, String openid, Long messageId) {
		this.shopId = shopId;
		this.templateShortId = advice.getId();
		this.type = advice.getType();
		this.openid = openid;
		this.messageId = messageId;
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getShopId() {
		return shopId;
	}
	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}
	public String getTemplateShortId() {
		return templateShortId;
	}
	public void setTemplateShortId(String templateShortId) {
		this.templateShortId = templateShortId;
	}
	public String getOpenid() {
		return openid;
	}
	public void setOpenid(String openid) {
		this.openid = openid;
	}
	public Long getMessageId() {
		return messageId;
	}
	public void setMessageId(Long messageId) {
		this.messageId = messageId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}


	public Integer getType() {
		return type;
	}


	public void setType(Integer type) {
		this.type = type;
	}
	
}
