package com.waremec.weixin.domain;

/** 
* @Package com.waremec.weixin.domain 
* @FileName ApiTicket
* @Description  
* @author taebem 
* @date 2015年5月25日 上午9:05:28 
*  
*/
public class ApiTicket extends WeixinReturn {

	/**  
	* 公众号用于调用微信JS接口的临时票据
	*/
	private String ticket;
	/**  
	* 有效期
	*/
	private int expires_in;

	public String getTicket() {
		return ticket;
	}

	public void setTicket(String ticket) {
		this.ticket = ticket;
	}

	public int getExpires_in() {
		return expires_in;
	}

	public void setExpires_in(int expires_in) {
		this.expires_in = expires_in;
	}

}
