package com.waremec.weixin.domain.material;

import java.util.List;

/** 
* @Package com.waremec.weixin.domain.material 
* @FileName NewsItemContent
* @Description  一个图文条目下的news列表
* @author taebem 
* @date 2015年5月7日 上午10:12:40 
*  
*/
public class NewsItemContent {

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
