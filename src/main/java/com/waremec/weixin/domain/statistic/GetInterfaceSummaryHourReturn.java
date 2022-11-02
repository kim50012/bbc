/**   
* @Title: GetInterfaceSummaryHourReturn.java 
* @Package com.waremec.weixin.domain.statistic 
* @Description:  
* @author taebem
* @date 2015年6月24日 下午4:25:54 
* @version V1.0   
*/
package com.waremec.weixin.domain.statistic;

import java.util.List;

import com.waremec.weixin.domain.WeixinReturn;

/** 
 * @Package com.waremec.weixin.domain.statistic 
 * @FileName GetInterfaceSummaryHourReturn
 * @Description  获取接口分析分时数据（getinterfacesummaryhour）   - response
 * @author taebem 
 * @date 2015年6月24日 下午4:25:54 
 *  
 */
public class GetInterfaceSummaryHourReturn extends WeixinReturn {

	private List<InterfaceSummaryHour> list;

	public List<InterfaceSummaryHour> getList() {
		return list;
	}

	public void setList(List<InterfaceSummaryHour> list) {
		this.list = list;
	}
	
	
}
