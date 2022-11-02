/**   
* @Title: InvalidFieldLengthException.java 
* @Package com.waremec.weixin.exception 
* @Description:  
* @author taebem
* @date 2016年2月23日 上午9:09:57 
* @version V1.0   
*/
package com.waremec.weixin.exception;

/** 
 * @Package com.waremec.weixin.exception 
 * @FileName InvalidFieldLengthException
 * @Description  
 * @author taebem 
 * @date 2016年2月23日 上午9:09:57 
 *  
 */
public class InvalidFieldLengthException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String field = "";
	private Integer length ;
	 
	public InvalidFieldLengthException(String field,Integer length) {
		super(field);
		this.field = field;
		this.length = length;
		// TODO Auto-generated constructor stub
	}

	@Override
	public String getMessage() {
		// TODO Auto-generated method stub
		String message = "参数错误! " + field + "字段长度不能超过" +length+ "字符" ;
	 
		return message;
	}
}
