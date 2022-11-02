/**   
* @Title: MediaButton.java 
* @Package com.waremec.weixin.domain.menu 
* @Description:  
* @author taebem
* @date 2015年5月21日 下午1:48:11 
* @version V1.0   
*/
package com.waremec.weixin.domain.menu;

/** 
 * @Package com.waremec.weixin.domain.menu 
 * @FileName MediaButton
 * @Description  media_id类型和view_limited类型
 * @author taebem 
 * @date 2015年5月21日 下午1:48:11 
 *  
 */
public class MediaButton  extends Button {
	 /**  
	* 菜单的响应动作类型:media_id类型和view_limited类型
	*/
	private String type;  
	 /**  
	* 调用新增永久素材接口返回的合法media_id
	*/
	private String media_id;
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getMedia_id() {
		return media_id;
	}
	public void setMedia_id(String media_id) {
		this.media_id = media_id;
	}  
	 
}
