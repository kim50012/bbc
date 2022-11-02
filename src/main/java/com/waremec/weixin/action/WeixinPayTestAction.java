package com.waremec.weixin.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.ScopeType;

@Controller("weixinPayTestAction")
@Scope(ScopeType.prototype)
public class WeixinPayTestAction extends WeixinBaseAction { }
