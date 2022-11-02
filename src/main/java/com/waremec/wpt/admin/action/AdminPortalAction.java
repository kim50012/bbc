package com.waremec.wpt.admin.action;

import java.io.UnsupportedEncodingException;
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
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.framework.utilities.SessionUtils;
import com.waremec.framework.utilities.StringUtil;
import com.waremec.weixin.domain.Account;
import com.waremec.weixin.service.WeixinService;
import com.waremec.wpt.admin.domain.AdminGroup;
import com.waremec.wpt.admin.domain.AdminShop;
import com.waremec.wpt.admin.domain.AdminUser;
import com.waremec.wpt.admin.domain.Menu;
import com.waremec.wpt.admin.service.AdminUserService;
import com.waremec.wpt.admin.service.GroupService;
import com.waremec.wpt.admin.service.MenuService;
import com.waremec.wpt.admin.service.ShopService;
import com.waremec.wpt.admin.service.UserService;

@Controller("adminPortalAction")
@Scope(ScopeType.prototype)
public class AdminPortalAction extends BaseAction {

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
	
	
	private String startDate="";
	private String endDate="";
	
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
	
	
	public String weiXinAppInfoSave() throws UnsupportedEncodingException{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("shopId",shopId);
		map.put("originalAppId", originalAppId);
		map.put("sysId", sysId);
		map.put("compName", shopName);
		map.put("appId", appId);
		map.put("appSecret", appSecret);
		map.put("url", appUrl);
		map.put("token", token);
		map.put("encordingAesKey", encordingAesKey);
		map.put("accountType", accountType);
		map.put("transferCustomerService", transferCustomerService);
		map.put("jobType", jobType);
		Map<String,Object> mapResult = commonService.select("AdminGroup.weiXinAppInfoSave", map);
		String ret = "success";
		if(mapResult.isEmpty()){
			ret="fail";
		}else{
			String errMsg=(String) mapResult.get("OUT_ERR_MSG");
			if("S".equals(errMsg)){
				ret="success";
			}else{
				ret="fail";
			}
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		renderJSON(returnMap);
		return NONE;
	}
	/**
	 * 
	 * @return
	 */
	public String weiXinAppInfoSelect(){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId",shopId);
		map.put("originalAppId", null);
		map.put("sysId", null);
		Map<String,Object> mapResult=commonService.select("AdminGroup.weiXinAppInfoSelect", map);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		String ret="success";
		if( mapResult==null){
			try{
				Account account=weixinService.generateAccount();
				returnMap.put("account", account);
			}catch(Exception e){
				e.printStackTrace();
			}
			ret="success1";
		}else{
			ret="success";
			returnMap.put("map", mapResult);
		}
		returnMap.put("result", ret);
		renderJSON(returnMap);
		return NONE;
	}
	
	
	
	/** 
	* 跳转至店铺选择列表页面
	* @return
	*/
	public String home(){
		
		userId=getBackSessionUserId();
		
		getRequest().getSession().removeAttribute(SessionUtils.BACK_SHOP_ID_SESSION);
		
		//根据id查找用户
		AdminUser user = userService.getAdminUserById(userId);
		request.put("user", user);
		
		//根据id查找公司
		List<AdminGroup> grouplist = groupService.getGroupListByUserId(userId) ;
		for (int i = 0; i < grouplist.size(); i++) {
			Integer companyId = Integer.valueOf(grouplist.get(i).getG_corp_id());
			grouplist.get(i).setSubList(shopService.getShopListByGroupId(userId, companyId));
		}

		request.put("grouplist", grouplist); 
		return "home";
	}
	
	
	/** 
	* 跳转至店铺首页
	* @return
	*/
	public String main() {
		
		 Integer shopId = getBackSessionShopId();
		
		 List<Menu> menulist = menuService.getMenuTree(shopId,"admin");
		 request.put("menulist", menulist);
		 
		 AdminShop shopInfo = new AdminShop();
		 shopInfo.setShopId(shopId + "");
		 shopInfo = shopService.selectAdminShop("Shop.selectAdminShop", shopInfo);
		 request.put("shopInfo", shopInfo);
		 
		return "main";
	}
	
	
	/** 
	* 跳转至店铺首页-demo页面
	* @return
	 * @throws ParseException 
	*/
	public String demo(){
		
		String userId = getBackSessionUserId();
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

	 
	
	 

}
