/**   
* @Title: ServiceTypeInfo.java 
* @Package com.waremec.weixin.thirdparty.domain 
* @Description:  
* @author taebem
* @date 2015年6月3日 上午9:30:09 
* @version V1.0   
*/
package com.waremec.weixin.thirdparty.domain;

/** 
 * @Package com.waremec.weixin.thirdparty.domain 
 * @FileName ServiceTypeInfo
 * @Description  授权方公众号类型
 * @author taebem 
 * @date 2015年6月3日 上午9:30:09 
 *  
 */
public class ServiceTypeInfo {

	/**  
	* 授权方公众号类型，0代表订阅号，1代表由历史老帐号升级后的订阅号，2代表服务号
	*/
	private Integer id;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	
}
