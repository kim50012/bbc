/**   
* @Title: DataItem.java 
* @Package com.waremec.weixin.domain.template 
* @Description:  
* @author taebem
* @date 2015年5月8日 下午4:26:26 
* @version V1.0   
*/
package com.waremec.weixin.domain.template;

import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

/** 
 * @Package com.waremec.weixin.domain.template 
 * @FileName DataItem
 * @Description  
 * @author taebem 
 * @date 2015年5月8日 下午4:26:26 
 *  
 */
public class DataItem {

	private String value;
	private String color;
	
	
	public DataItem(String value) {
		this(value, "#173177");
	}
	public DataItem(String value, String color) {
		this.value = value;
		this.color = color;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	
}
