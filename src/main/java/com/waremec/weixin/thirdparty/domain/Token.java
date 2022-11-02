/**   
 * @Title: Token.java 
 * @Package com.waremec.weixin.thirdparty.domain 
 * @Description:  
 * @author taebem
 * @date 2015年6月2日 下午5:32:00 
 * @version V1.0   
 */
package com.waremec.weixin.thirdparty.domain;

/**
 * @Package com.waremec.weixin.thirdparty.domain
 * @FileName Token
 * @Description
 * @author taebem
 * @date 2015年6月2日 下午5:32:00
 * 
 */
public class Token extends BaseReturn {

	/**  
	* 第三方平台access_token
	*/
	private String component_access_token;
	/**  
	* 有效期
	*/
	private Integer expires_in;

	public String getComponent_access_token() {
		return component_access_token;
	}

	public void setComponent_access_token(String component_access_token) {
		this.component_access_token = component_access_token;
	}

	public Integer getExpires_in() {
		return expires_in;
	}

	public void setExpires_in(Integer expires_in) {
		this.expires_in = expires_in;
	}

}
