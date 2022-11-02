/**   
 * @Title: AdminGroupAction.java 
 * @Package com.waremec.wpt.admin.action 
 * @Description:  
 * @author taebem
 * @date 2015年7月3日 下午9:44:15 
 * @version V1.0   
 */
package com.waremec.wpt.admin.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.SessionUtils;
import com.waremec.wpt.admin.domain.AdminGroup;
import com.waremec.wpt.admin.domain.AdminUser;
import com.waremec.wpt.admin.service.GroupService;
import com.waremec.wpt.admin.service.ShopService;
import com.waremec.wpt.admin.service.UserService;

/**
 * @Package com.waremec.wpt.admin.action
 * @FileName AdminGroupAction
 * @Description
 * @author taebem
 * @date 2015年7月3日 下午9:44:15
 * 
 */
@Controller("adminGroupAction")
@Scope(ScopeType.prototype)
public class AdminGroupAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	
	private String userId = "";
	//店铺id
		private String shopId="";
	//公司ID
		private String g_corp_id="";
		//公司名称
		private String g_corp_nm ="";
		//联系人姓名
		private String contact_nm="";
		//联系人手机号
		private String contact_mobile_no="";
		//联系人邮箱
		private String contact_email="";
		//联系人QQ
		private String contact_qq="";
		//管理用户ID
		private String admin_user_id=userId;
		//创建用户ID
		private String created_user_id=userId;
		//排列顺序号
		private int sort_no=2;
		//更新日期
		private String modified_dt=null;
		//创建日期
		private String created_dt=null;
		//功能
		private String jobType="";
		private String out_corp_id;
		private String out_err_msg;
	
	@Resource
	private ShopService shopService;
	@Resource
	private UserService userService;
	@Resource
	private GroupService groupService;
	
	/** 
	* 跳转到创建公司页面
	* @return
	*/
	public String groupCreate(){
		userId=getBackSessionUserId(); 
		request.put("user", userService.getAdminUserById(userId));
		return "groupCreate";
	}
	
	
	/** 
	* 保存公司信息
	* @return
	*/
	public String save(){
		boolean success = true;
		String err_msg = "";

		userId=getBackSessionUserId();
		
		try{
			AdminGroup group = new AdminGroup();
			
			group.setG_corp_id(g_corp_id);
			group.setG_corp_nm(g_corp_nm);
			group.setContact_email(contact_email);
			group.setContact_mobile_no(contact_mobile_no);
			group.setContact_nm(contact_nm);
			group.setContact_qq(contact_qq);
			group.setCreated_dt(created_dt);
			group.setCreated_user_id(userId);
			group.setModified_dt(modified_dt);
			group.setSort_no(sort_no);
			group.setJobType("I");
			group.setOut_corp_id(out_corp_id);
			group.setOut_err_msg(out_err_msg);
			group.setAdmin_user_id(userId);
			group.setUserId(userId); 
			
			groupService.addGroup(group);
		
		}catch(Exception e){
			logger.error(e.getMessage());
			 success = false;
			 err_msg =e.getMessage();
			
		}
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		returnMap.put("success", success);
		returnMap.put("err_msg", err_msg);

		renderJSON(returnMap);

		return NONE;
	}
	
	public String groupUpdate(){
		userId=getBackSessionUserId();
		//用户查询
		request.put("user", userService.getAdminUserById(userId));
		//根据id查找公司
		request.put("group", groupService.getGroupById(Integer.valueOf(g_corp_id)));
		
		return "groupUpdate";
	}
	
	/** 
	*
	* @return
	*/
	public String chkAuth(){
		
		userId=getBackSessionUserId();
		
		//根据id查找用户
		AdminUser userNum = userService.getAdminUserById(userId);
		request.put("userNum", userNum);
		//根据id查找公司
		List<AdminGroup> groupNum = groupService.getGroupListByUserId(userId);
		
		for (int i = 0; i < groupNum.size(); i++) {
			Integer companyId = Integer.valueOf(groupNum.get(i).getG_corp_id());
			groupNum.get(i).setSubList(shopService.getShopListByGroupId(userId, companyId));
		}
		
		request.put("groupNum", groupNum);
		session.put(SessionUtils.BACK_SHOP_ID_SESSION, shopId);
		
		String ret = "success";
		
		if (shopId.isEmpty()) {
			ret = "fail";
		}
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		renderJSON(returnMap);
		return NONE;
	}
	
	
	public String updateSave(){
		boolean success = true;
		String err_msg = "";
		
		
		userId=getBackSessionUserId();
		try{
			AdminGroup group = new AdminGroup();
			group.setG_corp_id(g_corp_id);
			group.setG_corp_nm(g_corp_nm);
			group.setContact_email(contact_email);
			group.setContact_mobile_no(contact_mobile_no);
			group.setContact_nm(contact_nm);
			group.setContact_qq(contact_qq);
			group.setCreated_dt(created_dt);
			group.setCreated_user_id(created_user_id);
			group.setModified_dt(modified_dt);
			group.setSort_no(sort_no);
			group.setJobType(jobType);
			group.setOut_corp_id(out_corp_id);
			group.setOut_err_msg(out_err_msg);
			group.setAdmin_user_id(admin_user_id);
			
			groupService.modifyGroup(group);
		
		}catch(Exception e){
			logger.error(e.getMessage());
			 success = false;
			 err_msg =e.getMessage();
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();

		returnMap.put("success", success);
		returnMap.put("err_msg", err_msg);

		renderJSON(returnMap);

		return NONE;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getG_corp_id() {
		return g_corp_id;
	}


	public void setG_corp_id(String g_corp_id) {
		this.g_corp_id = g_corp_id;
	}


	public String getG_corp_nm() {
		return g_corp_nm;
	}


	public void setG_corp_nm(String g_corp_nm) {
		this.g_corp_nm = g_corp_nm;
	}


	public String getContact_nm() {
		return contact_nm;
	}


	public void setContact_nm(String contact_nm) {
		this.contact_nm = contact_nm;
	}


	public String getContact_mobile_no() {
		return contact_mobile_no;
	}


	public void setContact_mobile_no(String contact_mobile_no) {
		this.contact_mobile_no = contact_mobile_no;
	}


	public String getContact_email() {
		return contact_email;
	}


	public void setContact_email(String contact_email) {
		this.contact_email = contact_email;
	}


	public String getContact_qq() {
		return contact_qq;
	}


	public void setContact_qq(String contact_qq) {
		this.contact_qq = contact_qq;
	}


	public String getAdmin_user_id() {
		return admin_user_id;
	}


	public void setAdmin_user_id(String admin_user_id) {
		this.admin_user_id = admin_user_id;
	}


	public String getCreated_user_id() {
		return created_user_id;
	}


	public void setCreated_user_id(String created_user_id) {
		this.created_user_id = created_user_id;
	}


	public int getSort_no() {
		return sort_no;
	}


	public void setSort_no(int sort_no) {
		this.sort_no = sort_no;
	}


	public String getModified_dt() {
		return modified_dt;
	}


	public void setModified_dt(String modified_dt) {
		this.modified_dt = modified_dt;
	}


	public String getCreated_dt() {
		return created_dt;
	}


	public void setCreated_dt(String created_dt) {
		this.created_dt = created_dt;
	}


	public String getJobType() {
		return jobType;
	}


	public void setJobType(String jobType) {
		this.jobType = jobType;
	}


	public String getOut_corp_id() {
		return out_corp_id;
	}


	public void setOut_corp_id(String out_corp_id) {
		this.out_corp_id = out_corp_id;
	}


	public String getOut_err_msg() {
		return out_err_msg;
	}


	public void setOut_err_msg(String out_err_msg) {
		this.out_err_msg = out_err_msg;
	}


	public String getShopId() {
		return shopId;
	}


	public void setShopId(String shopId) {
		this.shopId = shopId;
	}
	
	
	
	
}
