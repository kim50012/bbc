/**   
* @Title: CreateGroupReturn.java 
* @Package com.waremec.weixin.domain.group 
* @Description:  
* @author taebem
* @date 2015年5月21日 下午3:08:35 
* @version V1.0   
*/
package com.waremec.weixin.domain.group;

import com.waremec.weixin.domain.WeixinReturn;

/** 
 * @Package com.waremec.weixin.domain.group 
 * @FileName CreateGroupReturn
 * @Description  创建分组-response
 * @author taebem 
 * @date 2015年5月21日 下午3:08:35 
 *  
 */
public class CreateGroupReturn extends WeixinReturn {

	/**  
	* 分组信息
	*/
	private Group group;

	public Group getGroup() {
		return group;
	}

	public void setGroup(Group group) {
		this.group = group;
	}

	@Override
	public String toString() {
		return "CreateGroupReturn [group=" + group + "]";
	}
	
	
}
