/**   
* @Title: GetUserCumulateReturn.java 
* @Package com.waremec.weixin.domain.statistic 
* @Description:  
* @author taebem
* @date 2015年6月24日 下午3:50:07 
* @version V1.0   
*/
package com.waremec.weixin.domain.statistic;

import java.util.List;

import com.waremec.weixin.domain.WeixinReturn;

/** 
 * @Package com.waremec.weixin.domain.statistic 
 * @FileName GetUserCumulateReturn
 * @Description 获取累计用户数据（getusercumulate） - response  
 * @author taebem 
 * @date 2015年6月24日 下午3:50:07 
 *  
 */
public class GetUserCumulateReturn extends WeixinReturn {

	/**  
	* 
	*/
	private List<UserCumulate> list;

	public List<UserCumulate> getList() {
		return list;
	}

	public void setList(List<UserCumulate> list) {
		this.list = list;
	}
}
