/**   
* @Title: SelfmenuInfoReturn.java 
* @Package com.waremec.weixin.domain.menu 
* @Description:  
* @author taebem
* @date 2015年5月21日 上午11:09:22 
* @version V1.0   
*/
package com.waremec.weixin.domain.menu;

import com.waremec.weixin.domain.WeixinReturn;


/** 
 * @Package com.waremec.weixin.domain.menu 
 * @FileName SelfmenuInfoReturn
 * @Description  
 * @author taebem 
 * @date 2015年5月21日 上午11:09:22 
 *  
 */
public class SelfmenuInfoReturn extends WeixinReturn {
	/**  
	* 菜单是否开启，0代表未开启，1代表开启
	*/
	private Integer is_menu_open;
	/**  
	* 菜单信息
	*/
	private SelfmenuInfo selfmenu_info;
	public Integer getIs_menu_open() {
		return is_menu_open;
	}
	public void setIs_menu_open(Integer is_menu_open) {
		this.is_menu_open = is_menu_open;
	}
	public SelfmenuInfo getSelfmenu_info() {
		return selfmenu_info;
	}
	public void setSelfmenu_info(SelfmenuInfo selfmenu_info) {
		this.selfmenu_info = selfmenu_info;
	}
	@Override
	public String toString() {
		return "SelfmenuInfoReturn [is_menu_open=" + is_menu_open + ", selfmenu_info=" + selfmenu_info + "]";
	}
	
	
	
	
}
