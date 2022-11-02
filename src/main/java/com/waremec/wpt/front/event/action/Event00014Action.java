/**   
* @Title: Event00014Action.java 
* @Package com.waremec.wpt.front.event.action 
* @Description:  
* @author taebem
* @date 2015年9月11日 下午1:04:27 
* @version V1.0   
*/
package com.waremec.wpt.front.event.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.ScopeType;

/** 
 * @Package com.waremec.wpt.front.event.action 
 * @FileName Event00014Action
 * @Description  
 * @author taebem 
 * @date 2015年9月11日 下午1:04:27 
 *  
 */
@Controller("event00014Action")
@Scope(ScopeType.prototype)
public class Event00014Action extends EventBaseAction {
	private static final long serialVersionUID = 1L;
	
	public String index(){
		jsSdkStting();
		return "index";
	}
	
	public String businesscenter(){
		jsSdkStting();
		return "businesscenter";
	}
	
	public String centerlife_jianshencenter(){
		jsSdkStting();
		return "centerlife_jianshencenter";
	}
	
	public String centerlife(){
		jsSdkStting();
		return "centerlife";
	}
	
	public String centerlife1(){
		jsSdkStting();
		return "centerlife1";
	}
	
	public String centerlist(){
		jsSdkStting();
		return "centerlist";
	}
	
	public String gohere(){
		jsSdkStting();
		return "gohere";
	}
	
	public String jianshenteacher(){
		jsSdkStting();
		return "jianshenteacher";
	}
	
	public String jieshenqicai(){
		jsSdkStting();
		return "jieshenqicai";
	}
	
	public String meishi(){
		jsSdkStting();
		return "meishi";
	}
	
	public String news_word(){
		jsSdkStting();
		return "news_word";
	}
	
	public String posco_news(){
		jsSdkStting();
		return "posco_news";
	}
	
	public String schedule(){
		jsSdkStting();
		return "schedule";
	}
	
	public String schedule1(){
		jsSdkStting();
		return "schedule1";
	}
	
	public String vip_price(){
		jsSdkStting();
		return "vip_price";
	}
}
