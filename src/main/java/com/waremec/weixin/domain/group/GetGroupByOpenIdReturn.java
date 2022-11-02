/**   
* @Title: GetGroupByOpenIdReturn.java 
* @Package com.waremec.weixin.domain.group 
* @Description:  
* @author taebem
* @date 2015年5月21日 下午3:29:13 
* @version V1.0   
*/
package com.waremec.weixin.domain.group;

import com.waremec.weixin.domain.WeixinReturn;

/** 
 * @Package com.waremec.weixin.domain.group 
 * @FileName GetGroupByOpenIdReturn
 * @Description  查询用户所在分组 - response
 * @author taebem 
 * @date 2015年5月21日 下午3:29:13 
 *  
 */
public class GetGroupByOpenIdReturn extends WeixinReturn {

	/**  
	* 用户所属的groupid
	*/
	private Integer  groupid;

	public Integer getGroupid() {
		return groupid;
	}

	public void setGroupid(Integer groupid) {
		this.groupid = groupid;
	}
	
	
}
