package com.waremec.weixin.domain.msg;

import net.sf.json.JSONObject;

/**
 * @author jong
 *
 * 
{
    "touser":"OPENID",
    "msgtype":"voice",
    "voice":
    {
      "media_id":"MEDIA_ID"
    }
}
 */
public class VoiceMsg {
	private String touser = "";
	private String mediaId = "";
	public String getTouser() {
		return touser;
	}
	
	public static void main(String[] args) {
		VoiceMsg im = new VoiceMsg("1111","222");
		System.out.println(im.toJsonString());
	}
	
	public void setTouser(String touser) {
		this.touser = touser;
	}
	public String getMediaId() {
		return mediaId;
	}
	public void setMediaId(String mediaId) {
		this.mediaId = mediaId;
	}
	public VoiceMsg() {
		super();
		// TODO Auto-generated constructor stub
	}
	public VoiceMsg(String touser, String mediaId) {
		super();
		this.touser = touser;
		this.mediaId = mediaId;
	}
	
	public JSONObject toJson(){
		JSONObject voice = new JSONObject();
		voice.put("media_id", mediaId);
		
		JSONObject root = new JSONObject();
		root.put("touser", touser);
		root.put("msgtype", "voice");
		root.put("voice", voice);
 
		return root;
	}
	
	public String toJsonString(){
		return toJson().toString();
	}
}
