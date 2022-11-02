package com.waremec.wpt.hzm.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.PageData;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.DateUtil;
import com.waremec.framework.utilities.Hzm_StopPageType;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.framework.utilities.SessionUtils;
import com.waremec.framework.utilities.StringUtil;
import com.waremec.weixin.domain.Account;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.service.WeixinService;
import com.waremec.weixin.thirdparty.service.ThirdpartyService;
import com.waremec.wpt.admin.domain.AdminGroup;
import com.waremec.wpt.admin.domain.AdminUser;
import com.waremec.wpt.admin.service.AdminUserService;
import com.waremec.wpt.admin.service.GroupService;
import com.waremec.wpt.admin.service.MenuService;
import com.waremec.wpt.admin.service.ShopService;
import com.waremec.wpt.admin.service.UserService;

@Controller("hzmPortalAction")
@Scope(ScopeType.prototype)
public class Hzm_PortalAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	//用户id
	private String userId = "";
	//公司管理者id
	private String admin_user_id="";
	//店铺创建者Id
	private String createdUserId="";
	//创建用户ID
	private String created_user_id="";
	//公司表公司id
	private String g_corp_id="";
	//店铺表公司id
	private String groupCorpId="";
	//店铺id
	private String shopId="";
	//店铺名称
	private String shopName="";
	private String compId="";
	//保存类型
	private String jobType="";
	//店铺图片
	private String imgLogoPicture="";
	private String sysId="";
	private String originalAppId="";
	private String appId="";
	private String appSecret="";
	private String appUrl="";
	private String token="";
	private String encordingAesKey="";
	private String accountType="";
	private String transferCustomerService="";
	private String serachTitle="";
	
	private String startDate="";
	private String endDate="";
	
	//SET_ID
	private String setId="";
	//模板ID
	private String templateId="";
	
	// 存储当前排序方式
	private String orderBy = "";
	private String descFlag = "";
	private String title = "";
	private String newsId = "";

	
	@Resource
	private AdminUserService adminUserService;
	@Resource
	private MenuService menuService;
	@Resource
	private ShopService shopService;
	@Resource
	private UserService userService;
	@Resource
	private GroupService groupService;
	@Resource
	private WeixinService weixinService;
	@Resource
	protected ThirdpartyService thirdpartyService;
	
	/** 
	* 店铺列表
	* @author: naRan
	* @return 
	*/
	public String hzm_ShopHome(){
		//在session获取登录的用户id
		userId=getBackSessionUserId();
		
		//根据id查找用户
		AdminUser user = userService.getAdminUserById(userId);
		
		//根据用户查找公司
		List<AdminGroup> groupInfo = groupService.getGroupListByUserId(userId);
		
		//查找有权限的店铺
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("userId", userId);
		String jobType = "A";
		queryMap.put("jobType", jobType);
		//获取有权限的店铺列表
		List<Map<String, Object>> shopList = commonService.selectList("AdminSetUp.getUserShopList", queryMap);
		
		if(shopList.size() == 1){
			//查询店铺主页信息
			String serachLinkType = "6";//存储过程店铺主页类型字段
			Map<String, Object> parmsMap = new HashMap<String, Object>();
			parmsMap.put("SHOP_ID", shopList.get(0).get("SHOP_ID"));
			parmsMap.put("USER_ID", null);
			parmsMap.put("LINK_TYPE", IntegerUtils.valueOf(serachLinkType, 2));
			parmsMap.put("PAGE_NM", serachTitle);
			parmsMap.put("PAGE_CURR", pageCurr);
			parmsMap.put("PAGE_UINT", pageUnit);
			parmsMap.put("ORDERBY", null);
			
			List<Map<String, Object>> pageList = commonService.selectList("AdminGoods.LINK_PAGE_LIST_SELECT",parmsMap);
			request.put("pageList", pageList);
			
			//分页信息
			if (!pageList.isEmpty()) {
				PageData page = new PageData();
				int totalCount = IntegerUtils.valueOf(pageList.get(0).get("TOTAL_CNT"));
				page = new PageData(pageCurr,pageUnit, totalCount , pageList);
				request.put("page", page);
			}
		}
		
		request.put("user", user);
		request.put("groupInfo", groupInfo);
		request.put("shopList", shopList); 
		return "hzm_ShopHome";
	}
	
	public String hzm_Main() {
		
		//在session获取登录的用户id
		userId=getBackSessionUserId();
		if(userId == null){
			userId = getRequest().getParameter("userId");//回调地址中的用户id
			Integer backSessionShopId = getBackSessionShopId();
			String authCode = getRequest().getParameter("auth_code");//回调地址中的auth_code
			request.put("callBack", "1");
			request.put("authCode", authCode);
			request.put("backSessionShopId", backSessionShopId);
		}
		
		//查找有权限的店铺
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("userId", userId);
		String jobType = "A";
		queryMap.put("jobType", jobType);
		//获取有权限的店铺列表
		List<Map<String, Object>> shopList = commonService.selectList("AdminSetUp.getUserShopList", queryMap);
		if(shopList.size() == 1){
			
			//把店铺id放入session
			Object obj = session.get(SessionUtils.BACK_SHOP_ID_SESSION);
			if(obj == null){
				session.put(SessionUtils.BACK_SHOP_ID_SESSION, shopList.get(0).get("SHOP_ID"));
			}
			
			//调取检查是否有主页方法
			String pageId = shopService.queryShopSetting(shopList.get(0).get("SHOP_ID").toString(), Hzm_StopPageType.HZM_HOME);
//			String req = this.queryShopSetting(shopList.get(0).get("SHOP_ID").toString(), Hzm_StopPageType.HZM_HOME);
			if(StringUtils.isBlank(pageId)){
				request.put("ret", "fail");
			}else{
				request.put("ret", "success");
				request.put("pageId", pageId);
			}
		}
		return "hzm_Main";
	}
	
	/**
	 * 查询模板
	 * @return
	 */
	public String hzm_ShopTemplate() {
		int shopId = getBackSessionShopId();
		//查询所有模板
		Map<String, Object> queryFriendMap = new HashMap<String, Object>();
		queryFriendMap.put("SEARCH_TYPE", Hzm_StopPageType.SHOP_TEMPLATE);
		List<Map<String, Object>> templateList = commonService.selectList("Blog.getLogTemplateList",queryFriendMap);
		request.put("templateList", templateList);
		
		queryFriendMap.clear();
		
		//查询正在使用的模板
		queryFriendMap.put("SHOP_ID", shopId);
		queryFriendMap.put("SET_ID", Hzm_StopPageType.SHOP_TEMPLATE);
		List<Map<String, Object>> list = commonService.selectList("AdminGoods.SHOP_SETTING_SELECT",queryFriendMap);
		
		if(!list.isEmpty()){
			request.put("templateId", String.valueOf(list.get(0).get("VAL_INT")));
		}
		
		request.put("shopId", shopId);
		return "hzm_ShopTemplate";
	}
	
	/**
	 * 保存模板
	 * @return
	 */
	public String hzm_UpdateSaveShopTemplate(){
		String ret="";
		
		//更新模板
		Map<String, Object> setMap = new HashMap<String, Object>();
		setMap.put("SHOP_ID", shopId);
		setMap.put("SET_ID", Hzm_StopPageType.SHOP_TEMPLATE);
		setMap.put("VAL_INT", templateId);
		List<Map<String, Object>> reqMsg = commonService.selectList("AdminGoods.SHOP_SETTING_INSERT",setMap);
		if(reqMsg != null){
			if("S".equals(reqMsg.get(0).get("OUT_ERR_MSG").toString())){
				ret = "success";
			}else{
				ret = reqMsg.toString();
			}
		}
			
		Map<String,Object> mapResult=new HashMap<String,Object>();
		mapResult.put("result",ret);
		renderJSON(mapResult);
		return NONE;
	}
	
	
	/**
	 * 
	 * @return
	 */
	public String hzm_WeiXinAppInfoSelect(){
		
		Integer backSessionShopId = getBackSessionShopId();
		
		if(backSessionShopId == null){
			String authCode = getRequest().getParameter("authCode");//回调地址中的auth_code
			backSessionShopId = Integer.valueOf(getRequest().getParameter("shopId"));//回调地址中的auth_code
			System.out.println("backSessionShopId===>" +  backSessionShopId);
			Map<String, Object> authorizationWeiXinInfo = thirdpartyService.getAuthorizationWeiXinInfoByauthCode(authCode);
			
			AppInfo appInfoByAppId = weixinService.selectAppInfoByAppId(authorizationWeiXinInfo.get("APPID").toString());
			request.put("AppInfo", appInfoByAppId);
			
		}
		
		//TODO
		//TODO
		//TODO
		//TODO
		//TODO
		AppInfo appInfoByAppId = weixinService.selectAppInfoByShopId(16);
		request.put("AppInfo", appInfoByAppId);
		//TODO
		//TODO
		//TODO
		//TODO
		//TODO
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.clear();
		map.put("shopId",backSessionShopId);
		map.put("originalAppId", null);
		map.put("sysId", null);
		Map<String,Object> mapResult=commonService.select("AdminGroup.weiXinAppInfoSelect", map);
		
		if( mapResult==null){
			try{
				Account account=weixinService.generateAccount();
				request.put("account", account);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else{
			request.put("WXInfo", mapResult);
		}
		return "hzm_WeiXinAppInfoSelect";
	}
	
	/** 
	* 跳转至店铺首页-demo页面
	* @return
	 * @throws ParseException 
	*/
	public String demo(){
		
		Integer shopId = getBackSessionShopId();
		
		if (StringUtils.isBlank(startDate)) {
			try {
				startDate = DateUtil.getAddDay(DateUtil.DEFAULT_DATE, -30).substring(0, 10);
			} catch (ParseException e) {
			}
			endDate = DateUtil.today();
		}
		
		try {
			//查询客户现况总信息
			Map<String,Object> mapAll = new HashMap<String,Object>();
			mapAll.put("shopId", shopId);
			mapAll.put("startDate", StringUtil.emptyToNull(startDate));
			mapAll.put("endDate", StringUtil.emptyToNull(endDate));
			mapAll.put("jobType", "A");
			Map<String,Object> summaryOne = commonService.select("CustCurrent.selectAllCount", mapAll); //查询总数量
			request.put("summaryOne", summaryOne);
			
			//查询图文群发总信息
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("shopId", shopId);
			map.put("beginDate", startDate);
			map.put("endDate", endDate);
			Map<String, Object> summaryTwo = commonService.select("ImgTextSituation.selectAllNum", map);

			request.put("summaryTwo", summaryTwo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.put("startDate", startDate);
		request.put("endDate", endDate);
		return "demo";
	}
	
	//获取图文群发趋势图所需要的信息
	public String getOneMonthMsg() throws ParseException{
		String userId = getBackSessionUserId();
		Integer shopId = getBackSessionShopId();	
		
		if (StringUtils.isBlank(startDate)) {
			try {
				startDate = DateUtil.getAddDay(DateUtil.DEFAULT_DATE, -29).substring(0, 10);
			} catch (ParseException e) {
			}
			endDate = DateUtil.today();
		}
		
				
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("beginDate", StringUtil.emptyToNull(startDate));
		map.put("endDate", StringUtil.emptyToNull(endDate));
		map.put("userId", StringUtil.emptyToNull(userId));
		List<Map<String,Object>> list=commonService.selectList("ImgTextSituation.selectHomePageImgTextList", map);
		
		//得到两个日期之间的所有日期
		Calendar startCalendar = Calendar.getInstance();
        Calendar endCalendar = Calendar.getInstance();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date data = df.parse(startDate);
        Calendar cal=Calendar.getInstance();
        cal.setTime(data);
        cal.add(Calendar.DATE, -1);  //减1天
        Date start =cal.getTime();
        startCalendar.setTime(start);
        Date end = df.parse(endDate);
        endCalendar.setTime(end);
        ArrayList<String> arr = new ArrayList<String>();
        while(true){
            startCalendar.add(Calendar.DAY_OF_MONTH, 1);
            if(startCalendar.getTimeInMillis() <= endCalendar.getTimeInMillis()){//TODO 转数组或是集合
            	arr.add(df.format(startCalendar.getTime()));
        }else{
            break;
        }
       }
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", list);
		returnMap.put("arr", arr);
		renderJSON(returnMap);
		
		
		return NONE;
	}

	
	public String demo2() {
		
		PageData page =  new PageData(2,10, 300 , null);
 
		request.put("page", page);
		
		return "demo2";
	}
	public String demo3() {
		
		PageData page =  new PageData(2,10, 300 , null);
		
		request.put("page", page);
		
		return "demo3";
	}
	
	public String shop() {
		
		 System.out.println(shopId);
		 String ret = "success";
			
		 Map<String, Object> returnMap = new HashMap<String, Object>();
		 returnMap.put("result", ret);
		 renderJSON(returnMap);
		 
		return  "shop";
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getAdmin_user_id() {
		return admin_user_id;
	}
	public void setAdmin_user_id(String admin_user_id) {
		this.admin_user_id = admin_user_id;
	}
	public String getCreatedUserId() {
		return createdUserId;
	}
	public void setCreatedUserId(String createdUserId) {
		this.createdUserId = createdUserId;
	}
	public String getCreated_user_id() {
		return created_user_id;
	}
	public void setCreated_user_id(String created_user_id) {
		this.created_user_id = created_user_id;
	}
	public String getG_corp_id() {
		return g_corp_id;
	}
	public void setG_corp_id(String g_corp_id) {
		this.g_corp_id = g_corp_id;
	}
	public String getGroupCorpId() {
		return groupCorpId;
	}
	public void setGroupCorpId(String groupCorpId) {
		this.groupCorpId = groupCorpId;
	}
	public String getShopId() {
		return shopId;
	}
	public void setShopId(String shopId) {
		this.shopId = shopId;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public String getCompId() {
		return compId;
	}
	public void setCompId(String compId) {
		this.compId = compId;
	}
	public String getJobType() {
		return jobType;
	}
	public void setJobType(String jobType) {
		this.jobType = jobType;
	}
	public String getImgLogoPicture() {
		return imgLogoPicture;
	}
	public void setImgLogoPicture(String imgLogoPicture) {
		this.imgLogoPicture = imgLogoPicture;
	}
	public String getSysId() {
		return sysId;
	}
	public void setSysId(String sysId) {
		this.sysId = sysId;
	}
	public String getOriginalAppId() {
		return originalAppId;
	}
	public void setOriginalAppId(String originalAppId) {
		this.originalAppId = originalAppId;
	}
	public String getAppId() {
		return appId;
	}
	public void setAppId(String appId) {
		this.appId = appId;
	}
	public String getAppSecret() {
		return appSecret;
	}
	public void setAppSecret(String appSecret) {
		this.appSecret = appSecret;
	}
	public String getAppUrl() {
		return appUrl;
	}
	public void setAppUrl(String appUrl) {
		this.appUrl = appUrl;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public String getEncordingAesKey() {
		return encordingAesKey;
	}
	public void setEncordingAesKey(String encordingAesKey) {
		this.encordingAesKey = encordingAesKey;
	}
	public String getAccountType() {
		return accountType;
	}
	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}
	public String getTransferCustomerService() {
		return transferCustomerService;
	}
	public void setTransferCustomerService(String transferCustomerService) {
		this.transferCustomerService = transferCustomerService;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getSerachTitle() {
		return serachTitle;
	}

	public void setSerachTitle(String serachTitle) {
		this.serachTitle = serachTitle;
	}

	public String getSetId() {
		return setId;
	}

	public void setSetId(String setId) {
		this.setId = setId;
	}

	public String getTemplateId() {
		return templateId;
	}

	public void setTemplateId(String templateId) {
		this.templateId = templateId;
	}


}