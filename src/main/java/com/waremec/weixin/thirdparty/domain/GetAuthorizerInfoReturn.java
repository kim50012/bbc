/**   
* @Title: GetAuthorizerInfoReturn.java 
* @Package com.waremec.weixin.thirdparty.domain 
* @Description:  
* @author taebem
* @date 2015年6月3日 上午9:18:42 
* @version V1.0   
*/
package com.waremec.weixin.thirdparty.domain;

/** 
 * @Package com.waremec.weixin.thirdparty.domain 
 * @FileName GetAuthorizerInfoReturn
 * @Description  获取授权方的账户信息 - response
 * @author taebem 
 * @date 2015年6月3日 上午9:18:42 
 *  
 */
public class GetAuthorizerInfoReturn extends BaseReturn {

	/**  
	* 授权方信息
	*/
	private AuthorizerInfo authorizer_info;
	
	/**  
	* 授权信息
	*/
	private AuthorizationInfo2 authorization_info;
	

	public AuthorizerInfo getAuthorizer_info() {
		return authorizer_info;
	}

	public void setAuthorizer_info(AuthorizerInfo authorizer_info) {
		this.authorizer_info = authorizer_info;
	}

	public AuthorizationInfo2 getAuthorization_info() {
		return authorization_info;
	}

	public void setAuthorization_info(AuthorizationInfo2 authorization_info) {
		this.authorization_info = authorization_info;
	}

}