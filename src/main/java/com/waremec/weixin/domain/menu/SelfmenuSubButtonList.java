/**   
* @Title: SelfmenuSubButtonList.java 
* @Package com.waremec.weixin.domain.menu 
* @Description:  
* @author taebem
* @date 2015年5月21日 上午11:23:19 
* @version V1.0   
*/
package com.waremec.weixin.domain.menu;

import java.util.List;

/** 
 * @Package com.waremec.weixin.domain.menu 
 * @FileName SelfmenuSubButtonList
 * @Description  子菜单列表
 * @author taebem 
 * @date 2015年5月21日 上午11:23:19 
 *  
 */
public class SelfmenuSubButtonList {

	/**  
	* 子菜单列表
	*/
	private List<SelfmenuSubButton> list;

	public List<SelfmenuSubButton> getList() {
		return list;
	}

	public void setList(List<SelfmenuSubButton> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "SelfmenuSubButtonList [list=" + list + "]";
	}
	
	
	
	
}
