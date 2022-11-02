/**   
* @Title: Account.java 
* @Package com.waremec.weixin.domain 
* @Description:  
* @author taebem
* @date 2015年7月3日 上午10:28:31 
* @version V1.0   
*/
package com.waremec.weixin.domain;

/** 
 * @Package com.waremec.weixin.domain 
 * @FileName Account
 * @Description  
 * @author taebem 
 * @date 2015年7月3日 上午10:28:31 
 *  
 */
public class Account {

	private String sysId;
	private String token;
	private String encordingAesKey;
	
	public String getSysId() {
		return sysId;
	}
	public void setSysId(String sysId) {
		this.sysId = sysId;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public String getEncordingAesKey() {
		return encordingAesKey;
	}
	public void setEncordingAesKey(String encordingAesKey) {
		this.encordingAesKey = encordingAesKey;
	}
	
	
}
