package com.waremec.weixin.domain.qrcode;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import com.waremec.weixin.domain.WeixinReturn;

/** 
* @Package com.waremec.weixin.domain.qrcode 
* @FileName QRTicketReturn
* @Description  创建二维码ticket - response
* @author taebem 
* @date 2015年5月25日 上午10:10:47 
*  
*/
public class QRTicketReturn extends WeixinReturn {

	/**  
	* 获取的二维码ticket，凭借此ticket可以在有效时间内换取二维码。
	*/
	private String ticket;  
	/**  
	* 二维码的有效时间，以秒为单位。最大不超过604800。
	*/
	private Integer expire_seconds; 
	/**  
	* 二维码图片解析后的地址，开发者可根据该地址自行生成需要的二维码图片
	*/
	private String url;  
	
	public String getTicket() {
		return ticket;
	}
	public void setTicket(String ticket) {
		this.ticket = ticket;
	}
	public Integer getExpire_seconds() {
		return expire_seconds;
	}
	public void setExpire_seconds(Integer expire_seconds) {
		this.expire_seconds = expire_seconds;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	 
	public String getQrcodeUrl() {
		String url = "";
		try {
			String ticket2 = URLEncoder.encode(ticket,"utf-8");
			url = "https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=" + ticket2;
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return url;
		
	}
 
	@Override
	public String toString() {
		return "QRTicketReturn [ticket=" + ticket + ", expire_seconds=" + expire_seconds + ", url=" + url + "]";
	}


	
}
