package com.waremec.weixin.domain.msg.resp;

/**
 * 回复图片消息
 * @author taebem
 *
 */
public class ImageMessage extends BaseMessage {

	// 图片
	private Image Image;

	public Image getImage() {
		return Image;
	}

	public void setImage(Image image) {
		Image = image;
	}

}
