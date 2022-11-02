package com.waremec.sample.servcice;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.service.WeixinMenuService;
import com.waremec.weixin.service.WeixinService;

public class TestService {

	@SuppressWarnings("resource")
	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("classpath*:spring/applicationContext*.xml");
		
		WeixinMenuService weiXinMenuService = ac.getBean(WeixinMenuService.class);
		WeixinService weixinService = ac.getBean(WeixinService.class);
		AppInfo appInfo= weixinService.selectAppInfoByKey("8D6ED58C805242C8BDB129616163CB04");
		weixinService.getAccessToken(appInfo);
		
//		AppInfo app= weixinService.selectAppInfoByKey("8D6ED58C805242C8BDB129616163CB04");
//		
//		try {
//			weiXinMenuService.uploadMenus(150,app);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
//		System.out.println(weiXinMenuService.getViewUrlById(10014));
		
		
		
//		CommonService commonService = (CommonService)ac.getBean("commonService");
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("v_USER_ID", ""); 
//		List<Map<String, Object>>  list = new ArrayList<Map<String,Object>>();
//		list=commonService.selectList("Master.getGroupList", map);
//		ListUtil.printListMap(list);
		/*
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", "1");
		map.put("v_AGE", "222");
		
	 
		
		commonService.selectNoReturn("Sample.SP_TEST1", map);
		
		List<Map<String,Object>> list = (List<Map<String,Object>>)map.get("presult");
		
		Map<String,Object> mmap = list.get(0);
		
		Date ddate = (Date)mmap.get("SDATE");
		Integer age = (Integer)mmap.get("AGE");
		
		System.out.println(ddate.getHours() );
		System.out.println(age);
	 */
	 
 
		System.out.println(">>>>>>>>>");
		
	}
}
