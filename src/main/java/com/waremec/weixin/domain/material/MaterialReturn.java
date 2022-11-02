package com.waremec.weixin.domain.material;

import com.waremec.weixin.domain.WeixinReturn;

/** 
* @Package com.waremec.weixin.domain 
* @FileName MaterialReturn
* @Description  
* @author taebem 
* @date 2015年5月25日 上午9:09:19 
*  
*/
public class MaterialReturn extends WeixinReturn {

	/**  
	* 永久素材的media_id
	*/
	private String media_id;

	public String getMedia_id() {
		return media_id;
	}

	public void setMedia_id(String media_id) {
		this.media_id = media_id;
	}
	
}
