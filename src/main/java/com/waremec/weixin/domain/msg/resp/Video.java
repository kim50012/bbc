package com.waremec.weixin.domain.msg.resp;

public class Video {
	//通过上传多媒体文件，得到的id
	private String MediaId;
	//视频消息的标题
	private String Title;
	//视频消息的描述
	private String Description;

	public String getMediaId() {
		return MediaId;
	}

	public void setMediaId(String mediaId) {
		MediaId = mediaId;
	}

	public String getTitle() {
		return null == Title ? "" : Title;
	}

	public void setTitle(String title) {
		Title = title;
	}

	public String getDescription() {
		return null == Description ? "" : Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

}
