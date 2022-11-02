/**   
 * @Title: AuthorizationInfo.java 
 * @Package com.waremec.weixin.thirdparty.domain 
 * @Description:  
 * @author taebem
 * @date 2015年6月3日 上午8:57:53 
 * @version V1.0   
 */
package com.waremec.weixin.thirdparty.domain;

import java.util.List;

/**
 * @Package com.waremec.weixin.thirdparty.domain
 * @FileName AuthorizationInfo
 * @Description 授权信息
 * @author taebem
 * @date 2015年6月3日 上午8:57:53
 * 
 */
public class AuthorizationInfo {

	/**  
	* 授权方appid
	*/
	private String authorizer_appid;

	/**  
	 * 授权方令牌（在授权的公众号具备API权限时，才有此返回值）
	 */
	private String authorizer_access_token;
	
	/**  
	 * 有效期（在授权的公众号具备API权限时，才有此返回值）
	 */
	private Integer expires_in;
	
	/**  
	 * 刷新令牌（在授权的公众号具备API权限时，才有此返回值），
	 * <br/>刷新令牌主要用于公众号第三方平台获取和刷新已授权用户的access_token，
	 * <br/>只会在授权时刻提供，请妥善保存。 一旦丢失，只能让用户重新授权，才能再次拿到新的刷新令牌
	 */
	private String authorizer_refresh_token;
	
	/**  
	 * 公众号授权给开发者的权限集列表（请注意，当出现用户已经将消息与菜单权限集授权给了某个第三方，
	 * <br/>再授权给另一个第三方时，由于该权限集是互斥的，后一个第三方的授权将去除此权限集，
	 * <br/>开发者可以在返回的func_info信息中验证这一点，避免信息遗漏），1到8分别代表：
	 * <ol>
	 *  <li>消息与菜单权限集</li>
	 *  <li>用户管理权限集</li>
	 *  <li>帐号管理权限集</li>
	 *  <li>网页授权权限集</li>
	 *  <li>微信小店权限集</li>
	 *  <li>多客服权限集</li>
	 *  <li>业务通知权限集</li>
	 *  <li>微信卡券权限集</li>
	 * </ol>
	 */
	List<FuncscopeCategory> func_info;

	public String getAuthorizer_appid() {
		return authorizer_appid;
	}

	public void setAuthorizer_appid(String authorizer_appid) {
		this.authorizer_appid = authorizer_appid;
	}

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

	public List<FuncscopeCategory> getFunc_info() {
		return func_info;
	}

	public void setFunc_info(List<FuncscopeCategory> func_info) {
		this.func_info = func_info;
	}
	
}
