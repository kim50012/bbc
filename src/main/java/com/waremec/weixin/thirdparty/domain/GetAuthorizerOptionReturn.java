/**   
* @Title: GetAuthorizerOptionReturn.java 
* @Package com.waremec.weixin.thirdparty.domain 
* @Description:  
* @author taebem
* @date 2015年6月3日 上午9:47:53 
* @version V1.0   
*/
package com.waremec.weixin.thirdparty.domain;

/** 
 * @Package com.waremec.weixin.thirdparty.domain 
 * @FileName GetAuthorizerOptionReturn
 * @Description  获取授权方的选项设置信息 - response
 * @author taebem 
 * @date 2015年6月3日 上午9:47:53 
 *  
 */
public class GetAuthorizerOptionReturn extends BaseReturn {

	/**  
	* 授权公众号appid
	*/
	private String authorizer_appid;
	/**  
	* 选项名称
	*/
	private String option_name;
	/**  
	* 选项值
	*/
	private String option_value;
	public String getAuthorizer_appid() {
		return authorizer_appid;
	}
	public void setAuthorizer_appid(String authorizer_appid) {
		this.authorizer_appid = authorizer_appid;
	}
	public String getOption_name() {
		return option_name;
	}
	public void setOption_name(String option_name) {
		this.option_name = option_name;
	}
	public String getOption_value() {
		return option_value;
	}
	public void setOption_value(String option_value) {
		this.option_value = option_value;
	}
	
}
