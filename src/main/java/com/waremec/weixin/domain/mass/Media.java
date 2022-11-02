package com.waremec.weixin.domain.mass;

/**
 * 根据OpenID列表群发 POST数据封装类
 * @author taebem
 *
 */
public class Media {

	/**
	 * 用于群发的图文消息的media_id
	 * 是否必须 是
	 */
	private String media_id;
	
	public Media() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Media(String media_id) {
		super();
		this.media_id = media_id;
	}

	public String getMedia_id() {
		return media_id;
	}

	public void setMedia_id(String media_id) {
		this.media_id = media_id;
	}
	
	
}
