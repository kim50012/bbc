package com.waremec.weixin.domain;

/** 
* @Package com.waremec.weixin.domain 
* @FileName WeixinReturn
* @Description  微信接口返回值  - 共同
* @author taebem 
* @date 2015年5月25日 上午9:03:58 
*  
*/
public class WeixinReturn {

	/**  
	* 错误码
	*/
	private int errcode  ;
	/**  
	* 错误信息
	*/
	private String errmsg ;
	
	public boolean isSeccess(){
		return (errcode == 0);
	}
	
	public boolean isError(){
		return !isSeccess();
	}
	
	public WeixinReturn() {
		super();
		// TODO Auto-generated constructor stub
	}
	public WeixinReturn(int errcode, String errmsg) {
		super();
		this.errcode = errcode;
		this.errmsg = errmsg;
	}
	public int getErrcode() {
		return errcode;
	}
	public void setErrcode(int errcode) {
		this.errcode = errcode;
	}
	public String getErrmsg() {
		return errmsg;
	}
	public void setErrmsg(String errmsg) {
		this.errmsg = errmsg;
	}
	@Override
	public String toString() {
		return "WeixinReturn [errcode=" + errcode + ", errmsg=" + errmsg + "]";
	}
	
}
