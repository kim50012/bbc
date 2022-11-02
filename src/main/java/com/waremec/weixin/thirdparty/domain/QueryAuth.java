/**   
* @Title: QueryAuth.java 
* @Package com.waremec.weixin.thirdparty.domain 
* @Description:  
* @author taebem
* @date 2015年6月3日 上午9:03:15 
* @version V1.0   
*/
package com.waremec.weixin.thirdparty.domain;

/** 
 * @Package com.waremec.weixin.thirdparty.domain 
 * @FileName QueryAuth
 * @Description  使用授权码换取公众号的授权信息 - response
 * @author taebem 
 * @date 2015年6月3日 上午9:03:15 
 *  
 */
public class QueryAuth extends BaseReturn {

	/**  
	* 授权信息
	*/
	private AuthorizationInfo authorization_info;

	public AuthorizationInfo getAuthorization_info() {
		return authorization_info;
	}

	public void setAuthorization_info(AuthorizationInfo authorization_info) {
		this.authorization_info = authorization_info;
	}
	
	
}
