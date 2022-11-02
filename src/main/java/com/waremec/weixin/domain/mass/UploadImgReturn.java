/**   
* @Title: UploadImgReturn.java 
* @Package com.waremec.weixin.domain.mass 
* @Description:  
* @author taebem
* @date 2015年8月11日 上午9:17:46 
* @version V1.0   
*/
package com.waremec.weixin.domain.mass;

import com.waremec.weixin.domain.WeixinReturn;

/** 
 * @Package com.waremec.weixin.domain.mass 
 * @FileName UploadImgReturn
 * @Description  
 * @author taebem 
 * @date 2015年8月11日 上午9:17:46 
 *  
 */
public class UploadImgReturn extends WeixinReturn {

	private String url;

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Override
	public String toString() {
		return "UploadImgReturn [url=" + url + ", getErrcode()=" + getErrcode() + ", getErrmsg()=" + getErrmsg() + "]";
	}
	
}
