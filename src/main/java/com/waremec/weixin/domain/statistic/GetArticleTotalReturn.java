/**   
* @Title: GetArticleTotalReturn.java 
* @Package com.waremec.weixin.domain.statistic 
* @Description:  
* @author taebem
* @date 2015年6月25日 下午12:43:15 
* @version V1.0   
*/
package com.waremec.weixin.domain.statistic;

import java.util.List;

import com.waremec.weixin.domain.WeixinReturn;

/** 
 * @Package com.waremec.weixin.domain.statistic 
 * @FileName GetArticleTotalReturn
 * @Description  获取图文群发总数据（getarticletotal）  - response
 * @author taebem 
 * @date 2015年6月25日 下午12:43:15 
 *  
 */
public class GetArticleTotalReturn extends WeixinReturn {

	private List<ArticleTotal> list;

	public List<ArticleTotal> getList() {
		return list;
	}

	public void setList(List<ArticleTotal> list) {
		this.list = list;
	}
	
}
