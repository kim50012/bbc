/**   
* @Title: SelfmenuNewsInfo.java 
* @Package com.waremec.weixin.domain.menu 
* @Description:  
* @author taebem
* @date 2015年5月21日 上午11:34:29 
* @version V1.0   
*/
package com.waremec.weixin.domain.menu;

import java.util.List;

/** 
 * @Package com.waremec.weixin.domain.menu 
 * @FileName SelfmenuNewsInfo
 * @Description  
 * @author taebem 
 * @date 2015年5月21日 上午11:34:29 
 *  
 */
public class SelfmenuNewsInfo {

	/**  
	* 图文消息的信息列表
	*/
	private List<SelfmenuNewsItem> list;

	public List<SelfmenuNewsItem> getList() {
		return list;
	}

	public void setList(List<SelfmenuNewsItem> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "SelfmenuNewsInfo [list=" + list + "]";
	}
	
	
	
}
