/**   
* @Title: FuncscopeCategory.java 
* @Package com.waremec.weixin.thirdparty.domain 
* @Description:  
* @author taebem
* @date 2015年6月3日 上午8:54:46 
* @version V1.0   
*/
package com.waremec.weixin.thirdparty.domain;

/** 
 * @Package com.waremec.weixin.thirdparty.domain 
 * @FileName FuncscopeCategory
 * @Description  公众号授权给开发者的权限集
 * @author taebem 
 * @date 2015年6月3日 上午8:54:46 
 *  
 */
public class FuncscopeCategory {

	/**  
	* 权限集id
	*/
	private CategoryType funcscope_category;

	public CategoryType getFuncscope_category() {
		return funcscope_category;
	}

	public void setFuncscope_category(CategoryType funcscope_category) {
		this.funcscope_category = funcscope_category;
	}
	
}
