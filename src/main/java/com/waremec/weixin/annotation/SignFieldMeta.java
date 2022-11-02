/**   
* @Title: SignFieldMeta.java 
* @Package com.waremec.weixin.annotation 
* @Description:  
* @author taebem
* @date 2015年5月12日 下午3:34:15 
* @version V1.0   
*/
package com.waremec.weixin.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/** 
 * @Package com.waremec.weixin.annotation 
 * @FileName SignFieldMeta
 * @Description  
 * @author taebem 
 * @date 2015年5月12日 下午3:34:15 
 *  
 */
@Retention(RetentionPolicy.RUNTIME) // 注解会在class字节码文件中存在，在运行时可以通过反射获取到
@Target({ElementType.FIELD})//定义注解的作用目标  
public @interface SignFieldMeta {
	
	/** 
	* 是否参加签名
	* @return
	*/
	boolean isSignField() default true;  
	/** 
	* 是否必填  
	* @return
	*/
	boolean isRequired() default true;  
	
	/** 
	* 字段类型
	* @return
	*/
	SignFieldType type() default SignFieldType.String;
}
