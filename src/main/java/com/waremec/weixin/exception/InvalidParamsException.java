/**
 * 
 */
package com.waremec.weixin.exception;

/**
 * @author taebem
 *
 */
public class InvalidParamsException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String field = "";
	 
	public InvalidParamsException(String field) {
		super(field);
		this.field = field;
		// TODO Auto-generated constructor stub
	}

	@Override
	public String getMessage() {
		// TODO Auto-generated method stub
		String message = "参数错误! " + field + "字段必填" ;
	 
		return message;
	}
	
}
