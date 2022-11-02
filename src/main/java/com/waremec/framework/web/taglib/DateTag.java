/**   
* @Title: DateTag.java 
* @Package com.waremec.framework.web.taglib 
* @Description:  
* @author taebem
* @date 2015年5月20日 下午1:55:31 
* @version V1.0   
*/
package com.waremec.framework.web.taglib;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/** 
 * @Package com.waremec.framework.web.taglib 
 * @FileName DateTag
 * @Description  
 * @author taebem 
 * @date 2015年5月20日 下午1:55:31 
 *  
 */
public class DateTag extends SimpleTagSupport {

	 private final Log logger = LogFactory.getLog(this.getClass());
	
	private Object value;
	private String pattern = "yyyy-MM-dd HH:mm:ss";
	private String parsePattern = "yyyy-MM-dd HH:mm:ss";
	
	private static final String DATE = "yyyy-MM-dd";
	private static final String TIME = "HH:mm:ss";
	private static final String DATETIME = "yyyy-MM-dd HH:mm:ss";
	
	public Object getValue() {
		return value;
	}

	public void setValue(Object value) {
		this.value = value;
	}

	public String getPattern() {
		return pattern;
	}

	public void setPattern(String pattern) {
		this.pattern = pattern;
	}



	@Override
	public void doTag() throws JspException, IOException {
		
		String sdate = "";
		if(value == null){
			 
		}else{
			
			String format = pattern;
			if(pattern.equals("date")){
				format = DATE;
			}else if(pattern.equals("time")){
				format = TIME;
			}else if(pattern.equals("datetime")){
				format = DATETIME;
			}
			
			if(value instanceof Date){
				sdate =  new SimpleDateFormat(format).format(value);
			}else if(value instanceof String){
				try {
					sdate =  new SimpleDateFormat(format).format(new SimpleDateFormat(parsePattern).parse((String)value));
				} catch (ParseException e) {
				}
			}
		}
		 
		getJspContext().getOut().write(sdate); 
	}
	
}
