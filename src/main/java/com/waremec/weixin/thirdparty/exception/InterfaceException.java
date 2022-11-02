/**   
* @Title: InterfaceException.java 
* @Package com.waremec.weixin.thirdparty.exception 
* @Description:  
* @author taebem
* @date 2015年6月2日 下午5:34:04 
* @version V1.0   
*/
package com.waremec.weixin.thirdparty.exception;

import com.waremec.weixin.thirdparty.domain.BaseReturn;

/** 
 * @Package com.waremec.weixin.thirdparty.exception 
 * @FileName InterfaceException
 * @Description  
 * @author taebem 
 * @date 2015年6月2日 下午5:34:04 
 *  
 */
public class InterfaceException extends RuntimeException {


	/**  
	* 
	*/
	private static final long serialVersionUID = 1L;
	
	private Integer errcode;
	private String errmsg;
	
	public InterfaceException(Integer errcode, String errmsg) {
		super(errmsg);
		this.errcode = errcode; 
		this.errmsg = errmsg;
		// TODO Auto-generated constructor stub
	}
	
	public InterfaceException(BaseReturn baseReturn) {
		super();
		this.errcode = baseReturn.getErrcode(); 
		this.errmsg = baseReturn.getErrmsg();	
		// TODO Auto-generated constructor stub
	}

	public InterfaceException(String errmsg) {
		// TODO Auto-generated constructor stub
		super();
		this.errcode = null; 
		this.errmsg = errmsg;
	}

	@Override
	public String getMessage() {
		// TODO Auto-generated method stub
		String message = "";
		if(errcode != null){
			message = "微信接口调用失败! errcode：[" + errcode + "],errmsg=[" + errmsg + "]" ;
		}else{
			message = "微信接口调用失败! errmsg=[" + errmsg + "]" ;
		}
		return message;
	}
}
