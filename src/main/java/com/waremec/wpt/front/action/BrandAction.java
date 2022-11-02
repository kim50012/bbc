package com.waremec.wpt.front.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.ScopeType;

@Controller("brandAction")
@Scope(ScopeType.prototype)
public class BrandAction {
	private static final long serialVersionUID = 1L;
	public String brand(){
		return "brand";
	}
	public String brandStoryFirst(){
		return "brandStoryFirst";
	}
	public String brandStorySecond(){
		return "brandStorySecond";
	}
	public String brandStoryThird(){
		return "brandStoryThird";
	}
}
