/**   
* @Title: NewsMaterialReturn.java 
* @Package com.waremec.weixin.domain.material 
* @Description  获取永久素材Response - 图文
* @author taebem
* @date 2015年5月7日 上午10:31:23 
* @version V1.0   
*/
package com.waremec.weixin.domain.material;

import java.util.List;

import com.waremec.weixin.domain.WeixinReturn;

/** 
 * @Package com.waremec.weixin.domain.material 
 * @FileName NewsMaterialReturn
 * @Description  
 * @author taebem 
 * @date 2015年5月7日 上午10:31:23 
 *  
 */
public class NewsMaterialReturn extends WeixinReturn {
	/**  
	* news列表
	*/
	private List<NewsItem> news_item;

	public List<NewsItem> getNews_item() {
		return news_item;
	}

	public void setNews_item(List<NewsItem> news_item) {
		this.news_item = news_item;
	} 
}
