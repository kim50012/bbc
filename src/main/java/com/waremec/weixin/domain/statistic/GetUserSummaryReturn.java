/**   
* @Title: GetUserSummaryReturn.java 
* @Package com.waremec.weixin.domain.statistic 
* @Description:  
* @author taebem
* @date 2015年6月24日 下午1:39:56 
* @version V1.0   
*/
package com.waremec.weixin.domain.statistic;

import java.util.List;

import com.waremec.weixin.domain.WeixinReturn;

/** 
 * @Package com.waremec.weixin.domain.statistic 
 * @FileName GetUserSummaryReturn
 * @Description  获取用户增减数据（getusersummary) - response
 * @author taebem 
 * @date 2015年6月24日 下午1:39:56 
 *  
 */
public class GetUserSummaryReturn extends WeixinReturn {

	/**  
	* 
	*/
	private List<UserSummary> list;

	public List<UserSummary> getList() {
		return list;
	}

	public void setList(List<UserSummary> list) {
		this.list = list;
	}
	
	
}
