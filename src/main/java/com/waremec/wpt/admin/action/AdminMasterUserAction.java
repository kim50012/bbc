/**   
 * @Title: AdminMasterUserAction.java 
 * @Package com.waremec.wpt.admin.action 
 * @Description:  
 * @author taebem
 * @date 2015年9月1日 上午10:04:54 
 * @version V1.0   
 */
package com.waremec.wpt.admin.action;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSONObject;
import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.PageData;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.SessionUtils;
import com.waremec.framework.utilities.StringUtil;
import com.waremec.framework.utilities.UploadFileUtil;
import com.waremec.framework.utilities.UploadResult;
import com.waremec.weixin.utils.EncryptUtils;
import com.waremec.wpt.admin.domain.AdminUser;
import com.waremec.wpt.admin.service.SetUpService;
import com.waremec.wpt.admin.service.ShopService;

/**
 * @Package com.waremec.wpt.admin.action
 * @FileName AdminMasterUserAction
 * @Description
 * @author taebem
 * @date 2015年9月1日 上午10:04:54
 * 
 */
@Controller("adminMasterUserAction")
@Scope(ScopeType.prototype)
public class AdminMasterUserAction extends BaseAction {

	private String userId;// 用户id
	private Integer shopId;// 用户id
	private String userNickNm;// 用户昵称
	private String qqId;// 用户qq
	private String sex;// 用户性别
	private String singNm; // 个性签名
	private String imgUrl;// 用户图像URL
	private String oldPwd;
	private String pwd;// 密码

	private File fileEntity;// 存储文件
	private String logoFileName = "";// 存储店铺标志图片的名字
	private String fileSize = "";// FILE_SIZE [文件] 大小 INT
	private String fileType = "";// FILE_TYPE [文件] 文件类型 1图片 2声音 3视频 TINYINT

	private String userIdSearch;
	private String userRealNameSearch;
	private Integer activeSts;
	private String jobType;
	private String shopIdString;

	@Resource
	private SetUpService setUpService;
	@Resource
	private ShopService shopService;

	/** 
	*跳转到用户管理列表
	* @return
	*/
	public String userList() {
		return "userList";
	}

	public String userListFragment() {
		try {
			userId = getBackSessionUserId();
			shopId = getBackSessionShopId();

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("shopId", shopId);
			map.put("pageCurr", pageCurr);
			map.put("pageUnit", pageUnit);
			map.put("userId", userId);
			map.put("userIdSearch", StringUtil.emptyToNull(userIdSearch));
			map.put("userRealNameSearch", StringUtil.emptyToNull(userRealNameSearch));

			List<Map<String, Object>> list = commonService.selectList("AdminSetUp.getUserList", map);

			PageData page = new PageData();
			if (!list.isEmpty()) {
				int totalCount = (Integer) list.get(0).get("TOTAL_COUNT");
				page = new PageData(pageCurr, pageUnit, totalCount, list);
			}

			request.put("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "userListFragment";
	}

	/**
	 * 修改用户状态
	 * 
	 * @return
	 */
	public String modifyUserStatus() {

		boolean success = true;
		String err_msg = "";

		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("userId", userId);
			map.put("activeSts", activeSts);

			Map<String, Object> mapResult = commonService.select("AdminSetUp.updateUser", map);

			String OUT_ERR_MSG = (String) mapResult.get("OUT_ERR_MSG");
			if (!"S".equals(OUT_ERR_MSG)) {
				throw new Exception(OUT_ERR_MSG);
			}

		} catch (Exception e) {
			logger.error(e.getMessage());
			success = false;
			err_msg = e.getMessage();
		}

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("success", success);
		returnMap.put("err_msg", err_msg);
		renderJSON(returnMap);

		return NONE;

	}
	
	/** 
	* 修改用户店铺权限
	* @return
	*/
	public String changeUserShopAuth() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("shopId", shopId);
		map.put("jobType", jobType);
		map.put("shopIdString", shopIdString);
		Map<String, Object> resultMap = commonService.select("AdminSetUp.updateUserShopList", map);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", resultMap);
		renderJSON(returnMap);
		return NONE;
	}

	/** 
	* 获取用户店铺权限列表
	* @return
	*/
	public String getUserShopAuthList() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		jobType = "A";
		map.put("jobType", jobType);
		// 有权限的店铺
		List<Map<String, Object>> listDelete = commonService.selectList("AdminSetUp.getUserShopList", map);
		jobType = "";
		map.put("jobType", jobType);
		//无权限的店铺
		List<Map<String, Object>> listSelect = commonService.selectList("AdminSetUp.getUserShopList", map);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("list1", listDelete);
		returnMap.put("list2", listSelect);
		renderJSON(returnMap);
		return NONE;
	}

	/**
	 * 跳转到修改用户信息页面
	 * 
	 * @return
	 */
	public String userModify() {

		userId = getBackSessionUserId();
		// 根据id查找用户
		AdminUser user = new AdminUser();
		user.setUserId(userId);

		user = (AdminUser) setUpService.selectUser("AdminSetUp.userGet", user);
		request.put("user", user);

		session.put(SessionUtils.BACK_USER_SESSION, user);

		return "userModify";
	}

	/**
	 * 修改密码
	 * 
	 * @return
	 */
	public String updatePassword() {
		boolean success = true;
		String err_msg = "";

		userId = getBackSessionUserId();

		try {
			AdminUser sessionUser = (AdminUser) session.get(SessionUtils.BACK_USER_SESSION);
			oldPwd = EncryptUtils.sha256(oldPwd);
			pwd = EncryptUtils.sha256(pwd);

			if (!sessionUser.getPwd().equals(oldPwd)) {
				throw new Exception("输入的原密码不正确");
			}

			if (oldPwd.equals(pwd)) {
				throw new Exception("原密码和新密码不能相同");
			}

			AdminUser user = new AdminUser();
			user.setUserId(userId);
			user.setPwd(pwd);
			setUpService.updateUser("AdminSetUp.userUpdate", user);

		} catch (Exception e) {
			logger.error(e.getMessage());
			success = false;
			err_msg = e.getMessage();
		}

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("success", success);
		returnMap.put("err_msg", err_msg);
		renderJSON(returnMap);

		return NONE;
	}
	public String checkOldPwd(){
		boolean success = true;
		String err_msg = "";

		userId = getBackSessionUserId();

		try {
			AdminUser sessionUser = (AdminUser) session.get(SessionUtils.BACK_USER_SESSION);
			oldPwd = EncryptUtils.sha256(oldPwd);

			if (!sessionUser.getPwd().equals(oldPwd)) {
				throw new Exception("输入的原密码不正确");
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
			success = false;
			err_msg = e.getMessage();
		}

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("success", success);
		returnMap.put("err_msg", err_msg);
		renderJSON(returnMap);

		return NONE;
	}
	/**
	 * 修改密码
	 * 
	 * @return
	 */
	public String updatePasswordByAdmin() {
		boolean success = true;
		String err_msg = "";

		try {

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("userId", userId);
			map.put("pwd", EncryptUtils.sha256(pwd));

			Map<String, Object> mapResult = commonService.select("AdminSetUp.updateUser", map);

			String OUT_ERR_MSG = (String) mapResult.get("OUT_ERR_MSG");
			if (!"S".equals(OUT_ERR_MSG)) {
				throw new Exception(OUT_ERR_MSG);
			}

		} catch (Exception e) {
			logger.error(e.getMessage());
			success = false;
			err_msg = e.getMessage();
		}

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("success", success);
		returnMap.put("err_msg", err_msg);
		renderJSON(returnMap);

		return NONE;
	}

	/**
	 * 修改用户信息
	 * 
	 * @return
	 */
	public String updateUser() {
		userId = getBackSessionUserId();

		boolean success = true;
		String err_msg = "";

		try {
			AdminUser updateIn = new AdminUser();
			updateIn.setUserId(userId);
			updateIn.setUserNickNm(userNickNm);
			updateIn.setQqId(qqId);
			updateIn.setSex(sex);
			updateIn.setSingNm(singNm);
			setUpService.updateUser("AdminSetUp.userUpdate", updateIn);
		} catch (Exception e) {
			logger.error(e.getMessage());
			success = false;
			err_msg = e.getMessage();
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("success", success);
		returnMap.put("err_msg", err_msg);

		renderJSON(returnMap);

		return NONE;
	}

	/**
	 * 修改用户信息 - 包含头像
	 * 
	 * @return
	 */
	public String updateUserWithHeadIcon() {

		userId = getBackSessionUserId();

		boolean success = true;
		String err_msg = "";

		JSONObject jo = new JSONObject();
		UploadResult result = UploadFileUtil.upload(getRequest(), fileEntity, logoFileName, UploadFileUtil.UPLOAD_SHOP);
		try {
			AdminUser updateIn = new AdminUser();
			updateIn.setUserId(userId);
			updateIn.setUserNickNm(userNickNm);
			updateIn.setQqId(qqId);
			updateIn.setSex(sex);
			updateIn.setSingNm(singNm);

			updateIn.setImgNm(result.getOriginalFilename());
			updateIn.setImgSize(result.getFileSize() + "");
			updateIn.setImgSysNm(result.getDestinationFilename());
			updateIn.setImgUrl(result.getFileUrl());
			setUpService.updateUser("AdminSetUp.userUpdate", updateIn);
		} catch (Exception e) {
			logger.error(e.getMessage());
			success = false;
			err_msg = e.getMessage();
		}
		jo.put("success", success);
		jo.put("err_msg", err_msg);
		renderHtml(jo.toJSONString());
		return NONE;
	}

	/********** getter/setter *************/

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserNickNm() {
		return userNickNm;
	}

	public void setUserNickNm(String userNickNm) {
		this.userNickNm = userNickNm;
	}

	public String getQqId() {
		return qqId;
	}

	public void setQqId(String qqId) {
		this.qqId = qqId;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getSingNm() {
		return singNm;
	}

	public void setSingNm(String singNm) {
		this.singNm = singNm;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public File getFileEntity() {
		return fileEntity;
	}

	public void setFileEntity(File fileEntity) {
		this.fileEntity = fileEntity;
	}

	public String getLogoFileName() {
		return logoFileName;
	}

	public void setLogoFileName(String logoFileName) {
		this.logoFileName = logoFileName;
	}

	public String getFileSize() {
		return fileSize;
	}

	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public String getOldPwd() {
		return oldPwd;
	}

	public void setOldPwd(String oldPwd) {
		this.oldPwd = oldPwd;
	}

	public Integer getShopId() {
		return shopId;
	}

	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}

	public String getUserIdSearch() {
		return userIdSearch;
	}

	public void setUserIdSearch(String userIdSearch) {
		this.userIdSearch = userIdSearch;
	}

	public String getUserRealNameSearch() {
		return userRealNameSearch;
	}

	public void setUserRealNameSearch(String userRealNameSearch) {
		this.userRealNameSearch = userRealNameSearch;
	}

	public Integer getActiveSts() {
		return activeSts;
	}

	public void setActiveSts(Integer activeSts) {
		this.activeSts = activeSts;
	}

	public String getJobType() {
		return jobType;
	}

	public void setJobType(String jobType) {
		this.jobType = jobType;
	}

	public String getShopIdString() {
		return shopIdString;
	}

	public void setShopIdString(String shopIdString) {
		this.shopIdString = shopIdString;
	}

}
