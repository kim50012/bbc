/**   
* @Title: UserBatchReturn.java 
* @Package com.waremec.weixin.domain.user 
* @Description:  
* @author taebem
* @date 2015年9月7日 下午12:54:01 
* @version V1.0   
*/
package com.waremec.weixin.domain.user;

import java.util.List;

import com.waremec.weixin.domain.WeixinReturn;

/** 
 * @Package com.waremec.weixin.domain.user 
 * @FileName UserBatchReturn
 * @Description  批量获取用户基本信息 - response
 * @author taebem 
 * @date 2015年9月7日 下午12:54:01 
 *  
 */
public class UserBatchReturn  extends WeixinReturn {

	private List<UserReturn> user_info_list;

	public List<UserReturn> getUser_info_list() {
		return user_info_list;
	}

	public void setUser_info_list(List<UserReturn> user_info_list) {
		this.user_info_list = user_info_list;
	}

	 
	
	
}
