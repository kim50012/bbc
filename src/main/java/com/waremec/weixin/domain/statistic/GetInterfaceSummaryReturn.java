/**   
* @Title: GetInterfaceSummaryReturn.java 
* @Package com.waremec.weixin.domain.statistic 
* @Description:  
* @author taebem
* @date 2015年6月24日 下午4:25:15 
* @version V1.0   
*/
package com.waremec.weixin.domain.statistic;

import java.util.List;

import com.waremec.weixin.domain.WeixinReturn;

/** 
 * @Package com.waremec.weixin.domain.statistic 
 * @FileName GetInterfaceSummaryReturn
 * @Description  获取接口分析数据（getinterfacesummary）  - response
 * @author taebem 
 * @date 2015年6月24日 下午4:25:15 
 *  
 */
public class GetInterfaceSummaryReturn extends WeixinReturn {

	private List<InterfaceSummary> list;

	public List<InterfaceSummary> getList() {
		return list;
	}

	public void setList(List<InterfaceSummary> list) {
		this.list = list;
	}
	
}
