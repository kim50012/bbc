/**   
* @Title: GetAllGroupReturn.java 
* @Package com.waremec.weixin.domain.group 
* @Description:  
* @author taebem
* @date 2015年5月21日 下午3:21:25 
* @version V1.0   
*/
package com.waremec.weixin.domain.group;

import java.util.List;

import com.waremec.weixin.domain.WeixinReturn;

/** 
 * @Package com.waremec.weixin.domain.group 
 * @FileName GetAllGroupReturn
 * @Description  查询所有分组-response
 * @author taebem 
 * @date 2015年5月21日 下午3:21:25 
 *  
 */
public class GetAllGroupReturn extends WeixinReturn {

	/**  
	* 公众平台分组信息列表
	*/
	private List<Group> groups;

	public List<Group> getGroups() {
		return groups;
	}

	public void setGroups(List<Group> groups) {
		this.groups = groups;
	}
	
	
}
