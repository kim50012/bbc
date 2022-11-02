/**   
* @Title: SendTemplateMessageReturn.java 
* @Package com.waremec.weixin.domain.template 
* @Description:  
* @author taebem
* @date 2015年5月8日 下午5:06:17 
* @version V1.0   
*/
package com.waremec.weixin.domain.template;

import com.waremec.weixin.domain.WeixinReturn;

/** 
 * @Package com.waremec.weixin.domain.template 
 * @FileName SendTemplateMessageReturn
 * @Description  
 * @author taebem 
 * @date 2015年5月8日 下午5:06:17 
 *  
 */
public class SendTemplateMessageReturn extends WeixinReturn {

	private Long msgid;

	public Long getMsgid() {
		return msgid;
	}

	public void setMsgid(Long msgid) {
		this.msgid = msgid;
	}
	
	
}
