/**   
* @Title: AuthorizationInfo2.java 
* @Package com.waremec.weixin.thirdparty.domain 
* @Description:  
* @author taebem
* @date 2015年6月3日 上午9:41:00 
* @version V1.0   
*/
package com.waremec.weixin.thirdparty.domain;

import java.util.List;

/** 
 * @Package com.waremec.weixin.thirdparty.domain 
 * @FileName AuthorizationInfo2
 * @Description  获取授权方的账户信息 - 授权信息
 * @author taebem 
 * @date 2015年6月3日 上午9:41:00 
 *  
 */
public class AuthorizationInfo2 {

	/**  
	* 授权方appid
	*/
	private String appid;
	
	/**  
	 * 公众号授权给开发者的权限集列表（请注意，当出现用户已经将消息与菜单权限集授权给了某个第三方，
	 * <br/>再授权给另一个第三方时，由于该权限集是互斥的，后一个第三方的授权将去除此权限集，
	 * <br/>开发者可以在返回的func_info信息中验证这一点，避免信息遗漏），1到9分别代表：
	 * <ol>
	 *  <li>消息与菜单权限集</li>
	 *  <li>用户管理权限集</li>
	 *  <li>帐号管理权限集</li>
	 *  <li>网页授权权限集</li>
	 *  <li>微信小店权限集</li>
	 *  <li>多客服权限集</li>
	 *  <li>业务通知权限集</li>
	 *  <li>微信卡券权限集</li>
	 *  <li>微信扫一扫权限集</li>
	 * </ol>
	 */
	List<FuncscopeCategory> func_info;
}
