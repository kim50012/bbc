/**   
* @Title: TemplateTag.java 
* @Package com.waremec.framework.web.taglib 
* @Description:  
* @author taebem
* @date 2015年8月7日 下午3:16:34 
* @version V1.0   
*/
package com.waremec.framework.web.taglib;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/** 
 * @Package com.waremec.framework.web.taglib 
 * @FileName TemplateTag
 * @Description  
 * @author taebem 
 * @date 2015年8月7日 下午3:16:34 
 *  
 */
public class TemplateTag extends SimpleTagSupport {

	private final Log logger = LogFactory.getLog(this.getClass());
	
	private String type = "popup";
	private String id = "";
	
	
	
	
	@Override
	public void doTag() throws JspException, IOException {
		// TODO Auto-generated method stub
		StringBuffer sb = new StringBuffer();

		if("popup".equals(type)){
			sb.append("		<!-- ▼ bpopup area " + id + "  -->").append("\n");
			
			sb.append("		<div class='bpopup2' id='" + id + "'>").append("\n");
			sb.append(" 		<div class='bpopupWarp'>").append("\n");
			sb.append(" 			<div class='bpopupHeaderWarp'>").append("\n");
			sb.append(" 				<h3 class='bpopupTitle js-title'></h3>").append("\n");
			sb.append(" 				<div class='bpopupColseWarp'>").append("\n");
			sb.append(" 					<img class='b-close' src='/admin/images/goodsSell/close.png' />").append("\n");
			sb.append(" 				</div>").append("\n");
			sb.append(" 			</div>").append("\n");
			sb.append(" 			<div class=\"bpopupContentWarp\">").append("\n");
			sb.append(" 				<iframe class=\"js-content-iframe\"  width=\"100%\" height=\"100%\" frameBorder=0 scrolling=yes  src=''></iframe>").append("\n");
			sb.append(" 			</div>").append("\n");
			sb.append(" 		</div>").append("\n");
			sb.append(" 	</div>").append("\n");
			sb.append("		<!-- ▲ bpopup area " + id + "  -->").append("\n");
		 
		}
		
		getJspContext().getOut().write(sb.toString()); 
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
	
}
