package com.waremec.weixin.domain.msg.resp;

/**
 * 回复视频消息
 * @author taebem
 *
 */
public class VideoMessage extends BaseMessage {

	private Video Video;

	public Video getVideo() {
		return Video;
	}

	public void setVideo(Video video) {
		Video = video;
	}
	
	
}
