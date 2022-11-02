package com.waremec.weixin.domain.msg.resp;

/**
 * 回复语音消息
 * @author taebem
 */
public class VoiceMessage extends BaseMessage {

	private Voice Voice;

	public Voice getVoice() {
		return Voice;
	}

	public void setVoice(Voice voice) {
		Voice = voice;
	}
	
	
}
