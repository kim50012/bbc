/**   
* @Title: SsgSSO.java 
* @Package com.waremec.weixin.domain 
* @Description:  
* @author taebem
* @date 2015年10月21日 上午8:40:20 
* @version V1.0   
*/
package com.waremec.weixin.domain;

/** 
 * @Package com.waremec.weixin.domain 
 * @FileName SsgSSO
 * @Description  
 * @author taebem 
 * @date 2015年10月21日 上午8:40:20 
 *  
 */
public class SsgSSO {
	private Integer shopId;
	private String openid;
	private String ticket;
	private String sign;
	private String timestamp;
	private String url;
	private Integer menuId;
	public Integer getShopId() {
		return shopId;
	}
	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}
	public String getOpenid() {
		return openid;
	}
	public void setOpenid(String openid) {
		this.openid = openid;
	}
	public String getTicket() {
		return ticket;
	}
	public void setTicket(String ticket) {
		this.ticket = ticket;
	}
	public String getSign() {
		return sign;
	}
	public void setSign(String sign) {
		this.sign = sign;
	}
	public String getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Integer getMenuId() {
		return menuId;
	}
	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
	}
	
	
}
