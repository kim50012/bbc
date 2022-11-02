package com.waremec.framework.common.exception;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class ProcedureBizException extends RuntimeException {

	private final transient Log logger = LogFactory.getLog(this.getClass());
 
	private static final long serialVersionUID = 1L;

	public ProcedureBizException() {
		// TODO Auto-generated constructor stub
	}

	public ProcedureBizException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
		logger.info("ProcedureBizError message=" + message);
	}

	public ProcedureBizException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}

	public ProcedureBizException(String message, Throwable cause) {
		super(message, cause);
		
		// TODO Auto-generated constructor stub
	}

}
