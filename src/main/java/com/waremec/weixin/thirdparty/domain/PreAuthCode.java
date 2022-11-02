/**   
 * @Title: PreAuthCode.java 
 * @Package com.waremec.weixin.thirdparty.domain 
 * @Description:  
 * @author taebem
 * @date 2015年6月2日 下午5:40:55 
 * @version V1.0   
 */
package com.waremec.weixin.thirdparty.domain;

/**
 * @Package com.waremec.weixin.thirdparty.domain
 * @FileName PreAuthCode
 * @Description
 * @author taebem
 * @date 2015年6月2日 下午5:40:55
 * 
 */
public class PreAuthCode extends BaseReturn {

	/**  
	* 预授权码
	*/
	private String pre_auth_code;
	/**  
	* 有效期，为20分钟
	*/
	private Integer expires_in;

	public String getPre_auth_code() {
		return pre_auth_code;
	}

	public void setPre_auth_code(String pre_auth_code) {
		this.pre_auth_code = pre_auth_code;
	}

	public Integer getExpires_in() {
		return expires_in;
	}

	public void setExpires_in(Integer expires_in) {
		this.expires_in = expires_in;
	}

}
