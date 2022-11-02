/**   
* @Title: HttpClientException.java 
* @Package com.waremec.weixin.exception 
* @Description:  
* @author taebem
* @date 2015年5月15日 下午4:50:08 
* @version V1.0   
*/
package com.waremec.weixin.exception;

/** 
 * @Package com.waremec.weixin.exception 
 * @FileName HttpClientException
 * @Description  
 * @author taebem 
 * @date 2015年5月15日 下午4:50:08 
 *  
 */
public class HttpClientException extends RuntimeException {

 

	public HttpClientException() {
		// TODO Auto-generated constructor stub
	}
	 
	public HttpClientException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}


	public HttpClientException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}

	 

	public HttpClientException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

	 
	public HttpClientException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
		// TODO Auto-generated constructor stub
	}

}
