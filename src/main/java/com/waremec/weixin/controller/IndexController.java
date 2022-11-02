/**   
 * @Title: IndexController.java 
 * @Package com.waremec.weixin.controller 
 * @Description:  
 * @author taebem
 * @date 2015年5月20日 下午3:05:57 
 * @version V1.0   
 */
package com.waremec.weixin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.waremec.framework.utilities.SessionUtils;

/**
 * @Package com.waremec.weixin.controller
 * @FileName IndexController
 * @Description
 * @author taebem
 * @date 2015年5月20日 下午3:05:57
 * 
 */
@Controller
public class IndexController {
	 @RequestMapping("/index/{username}")
	    public String index(@PathVariable("username") String username, HttpSession session) {
		 String shopId = (String )session.getAttribute(SessionUtils.BACK_SHOP_ID_SESSION);
		System.out.println("shopId====" + shopId);
		System.out.println("username====" + username);
	        return "index";
	    }
}
