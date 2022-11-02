/**   
* @Title: AuthorizerInfo.java 
* @Package com.waremec.weixin.thirdparty.domain 
* @Description:  
* @author taebem
* @date 2015年6月3日 上午9:27:01 
* @version V1.0   
*/
package com.waremec.weixin.thirdparty.domain;

/** 
 * @Package com.waremec.weixin.thirdparty.domain 
 * @FileName AuthorizerInfo
 * @Description  授权方信息
 * @author taebem 
 * @date 2015年6月3日 上午9:27:01 
 *  
 */
public class AuthorizerInfo {

	/**  
	* 授权方昵称
	*/
	private String nick_name;
	/**  
	* 授权方头像
	*/
	private String head_img;
	
	/**  
	* 授权方公众号类型
	*/
	private ServiceTypeInfo service_type_info;
	
	/**  
	* 授权方认证类型
	*/
	private VerifyTypeInfo verify_type_info;
	
	/**  
	* 授权方公众号的原始ID
	*/
	private String user_name;
	
	/**  
	* 授权方公众号所设置的微信号，可能为空
	*/
	private String alias;
	
	/**  
	* business_info
	*/
	private BusinessInfo business_info;
	
	/**  
	* 二维码图片的URL，开发者最好自行也进行保存
	*/
	private String qrcode_url;
	

	public String getNick_name() {
		return nick_name;
	}

	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
	}

	public String getHead_img() {
		return head_img;
	}

	public void setHead_img(String head_img) {
		this.head_img = head_img;
	}

	public ServiceTypeInfo getService_type_info() {
		return service_type_info;
	}

	public void setService_type_info(ServiceTypeInfo service_type_info) {
		this.service_type_info = service_type_info;
	}

	public VerifyTypeInfo getVerify_type_info() {
		return verify_type_info;
	}

	public void setVerify_type_info(VerifyTypeInfo verify_type_info) {
		this.verify_type_info = verify_type_info;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getAlias() {
		return alias;
	}

	public void setAlias(String alias) {
		this.alias = alias;
	}

	public BusinessInfo getBusiness_info() {
		return business_info;
	}

	public void setBusiness_info(BusinessInfo business_info) {
		this.business_info = business_info;
	}

	public String getQrcode_url() {
		return qrcode_url;
	}

	public void setQrcode_url(String qrcode_url) {
		this.qrcode_url = qrcode_url;
	}
	
}