/**   
* @Title: ShortUrlReturn.java 
* @Package com.waremec.weixin.domain 
* @Description:  
* @author taebem
* @date 2015年5月21日 下午6:05:21 
* @version V1.0   
*/
package com.waremec.weixin.domain.qrcode;

import com.waremec.weixin.domain.WeixinReturn;

/** 
 * @Package com.waremec.weixin.domain 
 * @FileName ShortUrlReturn
 * @Description  
 * @author taebem 
 * @date 2015年5月21日 下午6:05:21 
 *  
 */
public class ShortUrlReturn extends WeixinReturn {

	/**  
	* 短链接
	*/
	private String short_url;

	public String getShort_url() {
		return short_url;
	}

	public void setShort_url(String short_url) {
		this.short_url = short_url;
	}
	
	
}
