/**   
* @Title: I18NTag.java 
* @Package com.waremec.framework.web.taglib 
* @Description:  
* @author taebem
* @date 2015年5月20日 下午1:18:54 
* @version V1.0   
*/
package com.waremec.framework.web.taglib;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.waremec.framework.utilities.LabelUtil;

/** 
 * @Package com.waremec.framework.web.taglib 
 * @FileName I18NTag
 * @Description  
 * @author taebem 
 * @date 2015年5月20日 下午1:18:54 
 *  
 */
public class I18NTag extends SimpleTagSupport {

	 private final Log logger = LogFactory.getLog(this.getClass());
	
	private String key;
	private String params1 = "";
	private String params2 = "";
	private String params3 = "";
	private String params4 = "";
	private String params5 = "";
	

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getParams1() {
		return params1;
	}

	public void setParams1(String params1) {
		this.params1 = params1;
	}

	public String getParams2() {
		return params2;
	}

	public void setParams2(String params2) {
		this.params2 = params2;
	}

	public String getParams3() {
		return params3;
	}

	public void setParams3(String params3) {
		this.params3 = params3;
	}

	public String getParams4() {
		return params4;
	}

	public void setParams4(String params4) {
		this.params4 = params4;
	}

	public String getParams5() {
		return params5;
	}

	public void setParams5(String params5) {
		this.params5 = params5;
	}

	@Override
	public void doTag() throws JspException, IOException {
		ServletContext servletContext = ((PageContext)this.getJspContext()).getServletContext();
		
		Map<String,String> map = LabelUtil.getLabelMap(servletContext);
		
		String value = map.get(key);
		
		if(StringUtils.isBlank(value)){
			value = key;
		}
		
		if(value.indexOf("{0}") > -1){
			value = value.replaceAll("\\{0\\}", params1);
			if(value.indexOf("{1}") > -1){
				value = value.replaceAll("\\{1\\}", params2);
				if(value.indexOf("{2}") > -1){
					value = value.replaceAll("\\{2\\}", params3);
					if(value.indexOf("{3}") > -1){
						value = value.replaceAll("\\{3\\}", params4);
						if(value.indexOf("{4}") > -1){
							value = value.replaceAll("\\{4\\}", params5);
						}
					}
				}
			}
		}
		 
		getJspContext().getOut().write(value); 
		
	}
	
	 
	
	
}
