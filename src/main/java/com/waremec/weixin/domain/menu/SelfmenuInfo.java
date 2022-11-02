/**   
* @Title: SelfmenuInfo.java 
* @Package com.waremec.weixin.domain.menu 
* @Description:  
* @author taebem
* @date 2015年5月21日 上午11:10:39 
* @version V1.0   
*/
package com.waremec.weixin.domain.menu;

import java.util.List;

/** 
 * @Package com.waremec.weixin.domain.menu 
 * @FileName SelfmenuInfo
 * @Description  
 * @author taebem 
 * @date 2015年5月21日 上午11:10:39 
 *  
 */
public class SelfmenuInfo {

	/**  
	* 菜单按钮
	*/
	private List<SelfmenuButton> button;

	public List<SelfmenuButton> getButton() {
		return button;
	}

	public void setButton(List<SelfmenuButton> button) {
		this.button = button;
	}

	@Override
	public String toString() {
		return "SelfmenuInfo [button=" + button + "]";
	}
	
	
	
	
}
