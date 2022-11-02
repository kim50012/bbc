/**   
* @Title: MoneyTag.java 
* @Package com.waremec.framework.web.taglib 
* @Description:  
* @author taebem
* @date 2015年6月9日 上午10:54:11 
* @version V1.0   
*/
package com.waremec.framework.web.taglib;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/** 
 * @Package com.waremec.framework.web.taglib 
 * @FileName MoneyTag
 * @Description  
 * @author taebem 
 * @date 2015年6月9日 上午10:54:11 
 *  
 */
public class MoneyTag extends SimpleTagSupport {

	//private final Log logger = LogFactory.getLog(this.getClass());
	private Object value;
	private int scale = 2;
	
	@Override
	public void doTag() throws JspException, IOException {
		String returns = "";
		Double dvalue = null;
		if(value != null){
			try {
				
				if (value instanceof BigDecimal) {
					BigDecimal newValue = (BigDecimal) value;
					dvalue = newValue.doubleValue(); 
				}else if (value instanceof Double) {
					dvalue = (Double) value;
				}else if (value instanceof Float) {
					dvalue = Double.parseDouble(String.valueOf((Float) value)) ;
					
				}else if (value instanceof String) {
					dvalue = Double.valueOf((String) value);
					 
				}
				
				if(dvalue != null){
					returns = String.format("%." + scale + "f", dvalue);
				}
				
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		getJspContext().getOut().write(returns); 
	}
	
	public Object getValue() {
		
	 
		return value;
	}
	public void setValue(Object value) {
		this.value = value;
	}
	public int getScale() {
		return scale;
	}
	public void setScale(int scale) {
		this.scale = scale;
	}
	
	
	
	
	
}
