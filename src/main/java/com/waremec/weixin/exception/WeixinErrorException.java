package com.waremec.weixin.exception;

import com.waremec.weixin.domain.WeixinReturn;
import com.waremec.weixin.utils.ErrorCode;

public class WeixinErrorException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	
	private Integer errcode;
	private String errmsg;
	
	public WeixinErrorException(Integer errcode, String errmsg) {
		super(errmsg);
		this.errcode = errcode; 
		this.errmsg = errmsg;
	}
	
	public WeixinErrorException(WeixinReturn weixinReturn) {
		super();
		this.errcode = weixinReturn.getErrcode(); 
		this.errmsg = weixinReturn.getErrmsg();
	}

	public WeixinErrorException(String errmsg) {
		super();
		this.errcode = null; 
		this.errmsg = errmsg;
	}

	@Override
	public String getMessage() {
		// TODO Auto-generated method stub
		String message = "";
		if(errcode != null){
			String desc = ErrorCode.getDesc(errcode);
			message = "微信接口调用失败!\n" + desc + "\n[" + errcode + "]" + errmsg ;
		}else{
			message = "微信接口调用失败!\n" + errmsg ;
		}
		return message;
	}

}
