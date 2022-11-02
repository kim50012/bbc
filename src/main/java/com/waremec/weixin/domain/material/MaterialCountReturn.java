package com.waremec.weixin.domain.material;

import com.waremec.weixin.domain.WeixinReturn;

/** 
* @Package com.waremec.weixin.domain 
* @FileName MaterialCountReturn
* @Description  获取素材总数Response
* @author taebem 
* @date 2015年5月7日 上午10:23:33 
*  
*/
public class MaterialCountReturn extends WeixinReturn {

	/**  
	* 语音总数量
	*/
	private int voice_count;
	/**  
	* 视频总数量
	*/
	private int video_count;
	/**  
	* 图片总数量
	*/
	private int image_count;
	/**  
	* 图文总数量
	*/
	private int news_count;

	public int getVoice_count() {
		return voice_count;
	}

	public void setVoice_count(int voice_count) {
		this.voice_count = voice_count;
	}

	public int getVideo_count() {
		return video_count;
	}

	public void setVideo_count(int video_count) {
		this.video_count = video_count;
	}

	public int getImage_count() {
		return image_count;
	}

	public void setImage_count(int image_count) {
		this.image_count = image_count;
	}

	public int getNews_count() {
		return news_count;
	}

	public void setNews_count(int news_count) {
		this.news_count = news_count;
	}

	@Override
	public String toString() {
		return "MaterialCountReturn [voice_count=" + voice_count + ", video_count=" + video_count + ", image_count=" + image_count + ", news_count="
				+ news_count + "]";
	}
	
	

}
