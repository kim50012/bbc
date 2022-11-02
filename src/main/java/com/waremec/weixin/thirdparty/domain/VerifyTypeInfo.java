/**   
* @Title: VerifyTypeInfo.java 
* @Package com.waremec.weixin.thirdparty.domain 
* @Description:  
* @author taebem
* @date 2015年6月3日 上午9:31:02 
* @version V1.0   
*/
package com.waremec.weixin.thirdparty.domain;

/** 
 * @Package com.waremec.weixin.thirdparty.domain 
 * @FileName VerifyTypeInfo
 * @Description  
 * @author taebem 
 * @date 2015年6月3日 上午9:31:02 
 *  
 */
public class VerifyTypeInfo {
	/**  
	* 授权方认证类型 
	* <ul>
	*  <li>-1 代表未认证</li>
	*  <li>0 代表微信认证</li>
	*  <li>1 代表新浪微博认证</li>
	*  <li>2 代表腾讯微博认证</li>
	*  <li>3 代表已资质认证通过但还未通过名称认证</li>
	*  <li>4 代表已资质认证通过、还未通过名称认证，但通过了新浪微博认证</li>
	*  <li>5 代表已资质认证通过、还未通过名称认证，但通过了腾讯微博认证</li>
	* </ul>
	*/
	private Integer id;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
}
