/**   
* @Title: GetUserShareReturn.java 
* @Package com.waremec.weixin.domain.statistic 
* @Description:  
* @author taebem
* @date 2015年6月25日 下午12:39:45 
* @version V1.0   
*/
package com.waremec.weixin.domain.statistic;

import java.util.List;

import com.waremec.weixin.domain.WeixinReturn;

/** 
 * @Package com.waremec.weixin.domain.statistic 
 * @FileName GetUserShareReturn
 * @Description  response
 *   获取图文分享转发分时数据（getusersharehour）
 *   获取图文分享转发数据（getusershare）
 * @author taebem 
 * @date 2015年6月25日 下午12:39:45 
 *  
 */
public class GetUserShareReturn extends WeixinReturn {

	private List<UserShare> list;

	public List<UserShare> getList() {
		return list;
	}

	public void setList(List<UserShare> list) {
		this.list = list;
	}
	
}
