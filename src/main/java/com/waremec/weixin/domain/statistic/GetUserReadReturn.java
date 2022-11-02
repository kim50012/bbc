/**   
* @Title: GetUserReadReturn.java 
* @Package com.waremec.weixin.domain.statistic 
* @Description:  
* @author taebem
* @date 2015年6月25日 上午11:58:22 
* @version V1.0   
*/
package com.waremec.weixin.domain.statistic;

import java.util.List;

import com.waremec.weixin.domain.WeixinReturn;

/** 
 * @Package com.waremec.weixin.domain.statistic 
 * @FileName GetUserReadReturn
 * @Description  response
 *   获取图文统计数据（getuserread）
 *   获取图文统计分时数据（getuserreadhour）
 * @author taebem 
 * @date 2015年6月25日 上午11:58:22 
 *  
 */
public class GetUserReadReturn extends WeixinReturn {

	private List<UserRead> list;

	public List<UserRead> getList() {
		return list;
	}

	public void setList(List<UserRead> list) {
		this.list = list;
	}
	
	
 }
