/**   
* @Title: BaseReturn.java 
* @Package com.waremec.weixin.thirdparty.domain 
* @Description:  
* @author taebem
* @date 2015年6月2日 下午5:30:24 
* @version V1.0   
*/
package com.waremec.weixin.thirdparty.domain;

/** 
 * @Package com.waremec.weixin.thirdparty.domain 
 * @FileName BaseReturn
 * @Description  
 * @author taebem 
 * @date 2015年6月2日 下午5:30:24 
 *  
 */
public class BaseReturn {
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
	
	public BaseReturn() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BaseReturn(int errcode, String errmsg) {
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
}
