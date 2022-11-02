/**   
* @Title: GetTemplateIdReturn.java 
* @Package com.waremec.weixin.domain.template 
* @Description:  
* @author taebem
* @date 2015年5月8日 下午5:13:08 
* @version V1.0   
*/
package com.waremec.weixin.domain.template;

import com.waremec.weixin.domain.WeixinReturn;

/** 
 * @Package com.waremec.weixin.domain.template 
 * @FileName GetTemplateIdReturn
 * @Description  
 * @author taebem 
 * @date 2015年5月8日 下午5:13:08 
 *  
 */
public class GetTemplateIdReturn extends WeixinReturn {

	private String template_id;

	public String getTemplate_id() {
		return template_id;
	}

	public void setTemplate_id(String template_id) {
		this.template_id = template_id;
	}
	
	
}
