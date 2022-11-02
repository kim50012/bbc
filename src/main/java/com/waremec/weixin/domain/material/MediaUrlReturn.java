package com.waremec.weixin.domain.material;

import com.waremec.weixin.domain.WeixinReturn;

/**
 * 上传图文消息素材 -response
 * @author taebem
 *
 */
public class MediaUrlReturn extends WeixinReturn {
 
	
	private String url;
	
	public MediaUrlReturn() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public MediaUrlReturn(int errcode, String errmsg) {
		super(errcode,errmsg);
	}
	

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Override
	public String toString() {
		return "MediaUrlReturn [url=" + url+" ]";
	}

	 
	

	 
}
