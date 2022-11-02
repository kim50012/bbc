/**   
* @Title: ElapsedTimeTag.java 
* @Package com.waremec.framework.web.taglib 
* @Description:  
* @author taebem
* @date 2015年6月12日 下午1:44:49 
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
 * @FileName ElapsedTimeTag
 * @Description  经过的时间
 * @author taebem 
 * @date 2015年6月12日 下午1:44:49 
 *  
 */
public class ElapsedTimeTag extends SimpleTagSupport {


	 private final Log logger = LogFactory.getLog(this.getClass());
	
	private Object value;
	private String pattern = "yyyy-MM-dd HH:mm:ss";
	
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
		
		String returns = "";
		Date date = null;
		if(value != null){
			if(value instanceof Date){
				date = (Date) value;
			}else if(value instanceof String){
				try {
					date =   new SimpleDateFormat(pattern).parse((String)value);
				} catch (ParseException e) {
				}
			}
		}
		
		if(date != null){
			long diff = new Date().getTime() - date.getTime();
			
			if(diff > 0 && diff <= 59000){
				returns = (diff /1000) + "秒钟前";
			}else if(diff > 59000 && diff <= 3599000){
				returns = (diff /(1000 * 60)) + "分钟前";
			}else if(diff > 3599000 && diff <= 86399000){
				returns = (diff /(1000 * 60 * 60)) + "小时前";
			}else if(diff > 86399000 && diff <= 172799000){
				returns = "昨天";
			}else if(diff > 172799000){
				returns = (diff /(1000 * 60 * 60 * 24)) + "天前";
			}
		}
		 
		getJspContext().getOut().write(returns); 
	}
}
