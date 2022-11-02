package com.waremec.weixin.domain.msg.resp;

public class Image {
	// 通过上传多媒体文件，得到的id。
	private String MediaId;

	public Image() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Image(String mediaId) {
		super();
		MediaId = mediaId;
	}

	public String getMediaId() {
		return MediaId;
	}

	public void setMediaId(String mediaId) {
		MediaId = mediaId;
	}
	
}
