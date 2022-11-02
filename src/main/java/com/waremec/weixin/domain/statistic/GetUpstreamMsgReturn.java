/**   
* @Title: GetUpstreamMsgReturn.java 
* @Package com.waremec.weixin.domain.statistic 
* @Description:  
* @author taebem
* @date 2015年6月25日 上午8:50:06 
* @version V1.0   
*/
package com.waremec.weixin.domain.statistic;

import java.util.List;

import com.waremec.weixin.domain.WeixinReturn;

/** 
 * @Package com.waremec.weixin.domain.statistic 
 * @FileName GetUpstreamMsgReturn
 * @Description  消息分析数据接口 - response
 * @author taebem 
 * @date 2015年6月25日 上午8:50:06 
 *  
 */
public class GetUpstreamMsgReturn extends WeixinReturn {

	private List<UpstreamMsg> list;

	public List<UpstreamMsg> getList() {
		return list;
	}

	public void setList(List<UpstreamMsg> list) {
		this.list = list;
	}
	
	
}
