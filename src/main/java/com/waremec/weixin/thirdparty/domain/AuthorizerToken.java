/**   
 * @Title: AuthorizerToken.java 
 * @Package com.waremec.weixin.thirdparty.domain 
 * @Description:  
 * @author taebem
 * @date 2015年6月3日 上午9:10:10 
 * @version V1.0   
 */
package com.waremec.weixin.thirdparty.domain;

/**
 * @Package com.waremec.weixin.thirdparty.domain
 * @FileName AuthorizerToken
 * @Description 获取（刷新）授权公众号的令牌 - response
 * @author taebem
 * @date 2015年6月3日 上午9:10:10
 * 
 */
public class AuthorizerToken extends BaseReturn {

	/**
	 * 授权方令牌
	 */
	private String authorizer_access_token;
	/**
	 * 有效期，为2小时
	 */
	private Integer expires_in;
	/**
	 * 刷新令牌
	 */
	private String authorizer_refresh_token;

	public String getAuthorizer_access_token() {
		return authorizer_access_token;
	}

	public void setAuthorizer_access_token(String authorizer_access_token) {
		this.authorizer_access_token = authorizer_access_token;
	}

	public Integer getExpires_in() {
		return expires_in;
	}

	public void setExpires_in(Integer expires_in) {
		this.expires_in = expires_in;
	}

	public String getAuthorizer_refresh_token() {
		return authorizer_refresh_token;
	}

	public void setAuthorizer_refresh_token(String authorizer_refresh_token) {
		this.authorizer_refresh_token = authorizer_refresh_token;
	}

}
