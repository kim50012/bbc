package com.waremec.wpt.domain;

public class MessageDomain {
	public static final String SUCCESS = "S";
	public static final String ERROR = "E";
	public static final String WARNNING = "W";
	private String type;
	private String code;
	private String message;
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
}
