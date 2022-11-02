/**   
* @Title: GetArticleSummaryReturn.java 
* @Package com.waremec.weixin.domain.statistic 
* @Description:  
* @author taebem
* @date 2015年6月25日 上午11:48:08 
* @version V1.0   
*/
package com.waremec.weixin.domain.statistic;

import java.util.List;

import com.waremec.weixin.domain.WeixinReturn;

/** 
 * @Package com.waremec.weixin.domain.statistic 
 * @FileName GetArticleSummaryReturn
 * @Description  获取图文群发每日数据（getarticlesummary） - response
 * @author taebem 
 * @date 2015年6月25日 上午11:48:08 
 *  
 */
public class GetArticleSummaryReturn extends WeixinReturn {

	private List<ArticleSummary> list;

	public List<ArticleSummary> getList() {
		return list;
	}

	public void setList(List<ArticleSummary> list) {
		this.list = list;
	}
	
}
