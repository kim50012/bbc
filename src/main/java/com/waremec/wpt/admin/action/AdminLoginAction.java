package com.waremec.wpt.admin.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.LabelUtil;
import com.waremec.framework.utilities.SessionUtils;
import com.waremec.framework.utilities.StringUtil;
import com.waremec.framework.utilities.UploadFileUtil;
import com.waremec.framework.utilities.UploadResult;
import com.waremec.weixin.utils.EncryptUtils;
import com.waremec.wpt.admin.domain.AdminUser;
import com.waremec.wpt.admin.service.AdminUserService;

@Controller("adminLoginAction")
@Scope(ScopeType.prototype)
public class AdminLoginAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	private String account;
	private String password;

	private File file;
	private String fileContentType;
	private String fileFileName;

	private File[] files; // 上传的文件
	private String[] filesContentType; // 文件类型
	private String[] filesFileName; // 文件名称
	// /// 保存用户所需的变量//////
	private File logo_input = null;
	private String userId = "";
	private String userNickName = "";
	private String userRealName = "";
	private String wxOpendIdU = "";
	private String email = "";
	private String mobileNo = "";
	private String qqId = "";
	private String pwd = "";
	private String sex = "";
	private String singName = "";
	private String logoFileName = "";
	@Resource
	private AdminUserService adminUserService;

	public String index() {

		session.clear();

		return INDEX;
	}

	public String scheduler() {
		return "scheduler";
	}

	public String play() {
		return "play";
	}

	public String login() {

//		session.clear();
		if(session.get(SessionUtils.BACK_USER_SESSION) != null){
			session.remove(SessionUtils.BACK_USER_SESSION);
			
		}
		if(session.get(SessionUtils.BACK_SHOP_ID_SESSION) != null){
			session.remove(SessionUtils.BACK_SHOP_ID_SESSION);
		}
		
		LabelUtil.setLanguage(LabelUtil.getCurrentLanguage());
		return "login";
	}

	public String logout() throws IOException {
		session.clear();
		getResponse().sendRedirect("/admin/login/login.htm");
		return NONE;
	}

	public String upload() {
		return "upload";
	}

	// 保存用户的注册信息
	public String saveUser() {
		String ret = "SUCCESS";
		// 判断信息，判断操作是否成功。
		if (logo_input == null) {
			JSONObject jo = new JSONObject();
			jo.put("resultLogoImg", "请选择店铺Logo图片");
			renderHtml(jo.toString());
			return NONE;
		}
		try {

			UploadResult result = UploadFileUtil.upload(getRequest(), logo_input, logoFileName, UploadFileUtil.UPLOAD_LOGO);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("userId", StringUtil.emptyToNull(userId));
			map.put("userNickName", StringUtil.emptyToNull(userNickName));
			map.put("userRealName", StringUtil.emptyToNull(userRealName));
			map.put("wxOpendIdU",StringUtil.emptyToNull(wxOpendIdU));
			map.put("email", StringUtil.emptyToNull(email));
			map.put("mobileNo", StringUtil.emptyToNull(mobileNo));
			map.put("qqId", StringUtil.emptyToNull(qqId));
			map.put("pwd", EncryptUtils.sha256(pwd));
			map.put("sex", StringUtil.emptyToNull(sex));
			map.put("singName", StringUtil.emptyToNull(singName));
			map.put("logoFileName", logoFileName);
			map.put("fileName", result.getOriginalFilename());
			map.put("fileSize", result.getFileSize() + "");
			map.put("fileSysName", result.getDestinationFilename());
			map.put("fileUrl", result.getFileUrl());
			map.put("fileType", result.getFileExt());
			map.put("jobType", "I");
			map.put("wxIdU",  StringUtil.emptyToNull(wxOpendIdU));
			map.put("compId", null);
			map.put("shopId", null);
			map.put("activeSts", 0);
			map.put("imgId", null);
			map.put("modifiedDate", null);
			map.put("userAuth", null);
			map.put("createdDate", new Date());
			Map<String, Object> mapResult = commonService.select("Login.saveUser", map);
			String outUserId = (String) mapResult.get("OUT_USER_ID");
			if (outUserId == "" || outUserId == null) {
				ret = "FAIL";
			}
		} catch (Exception e) {
			e.printStackTrace();
			ret = "FAIL";
		}
		JSONObject jo = new JSONObject();
		jo.put("result", ret);
		renderHtml(jo.toString());
		return NONE;
	}

	// 验证账号，昵称等是否重复
	public String proveUser() {
		String ret = "success";
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("userId", StringUtil.emptyToNull(userId));
			map.put("userNickName", StringUtil.emptyToNull(userNickName));
			map.put("wxOpendIdU", StringUtil.emptyToNull(wxOpendIdU));
			map.put("email", StringUtil.emptyToNull(email));
			map.put("mobileNo", StringUtil.emptyToNull(mobileNo));
			Map<String, Object> mapResult = commonService.select("Login.proveUser", map);
			// String userFlag=(String) mapResult.get("USER_ID");
			if (mapResult == null || mapResult.isEmpty()) {
				ret = "fail";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			ret = "fail";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		renderJSON(returnMap);
		return NONE;
	}

	public String uploadFile() {
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");

		System.out.println("myFile=" + file.getName());
		System.out.println(" this.getFileFileName()=" + this.getFileFileName());
		String uuid = UUID.randomUUID().toString().toUpperCase();
		String fileName = uuid + ".jpg";
		System.out.println(" uuid=" + uuid);
		try {
			// 基于myFile创建一个文件输入流
			InputStream is = new FileInputStream(file);
			// 设置上传文件目录
			String uploadPath = ServletActionContext.getServletContext().getRealPath("/admin/upload");
			System.out.println("uploadPath=" + uploadPath);
			// 设置目标文件
			File toFile = new File(uploadPath, fileName);
			// 创建一个输出流
			OutputStream os = new FileOutputStream(toFile);
			// 设置缓存
			byte[] buffer = new byte[1024];
			int length = 0;
			// 读取myFile文件输出到toFile文件中
			while ((length = is.read(buffer)) > 0) {
				os.write(buffer, 0, length);
			}
			System.out.println("上传文件名" + fileName);
			System.out.println("上传文件类型" + fileContentType);
			// 关闭输入流
			is.close();
			// 关闭输出流
			os.close();

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("error", "success");
			jsonObject.put("msg", "上传成功");
			jsonObject.put("imgurl", "/admin/upload/" + fileName);
			renderHtml(jsonObject.toString());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("error", "");
			jsonObject.put("msg", "上传成功");
			jsonObject.put("imgurl", "ddd");
			renderHtml(jsonObject.toString());
		}

		return NONE;
	}

	public String uploadFile2() {
		System.out.println(">>>>>>>>>>>>>>>uploadFile2 >>>>>>>>>>>>>>>>>>>>>");
		// TODO: handle exception

		System.out.println("filesContentType.length====> " + filesContentType.length);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("error", "");
		jsonObject.put("msg", "上传成功");
		jsonObject.put("imgurl", "ddd");
		renderJSON(jsonObject.toString());

		return NONE;
	}

	public String loginCheck(){

		boolean success = true;
		String err_msg = "";
		AdminUser adminUser=new AdminUser();
		try{
			adminUser = (AdminUser)adminUserService.getAdminUserByAccount(account);
			if (adminUser != null) {
				session.put(SessionUtils.BACK_USER_SESSION, adminUser);
			}
			password=EncryptUtils.sha256(password);	
		}catch (Exception e){
			logger.error(e.getMessage());
			success = false;
			err_msg = e.getMessage();
		}
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("success", success);
		returnMap.put("err_msg", err_msg);
		returnMap.put("user", adminUser);
		returnMap.put("password", password);
		renderJSON(returnMap);
		return NONE;
	}

	
	public String loginold() {

//		session.clear();
		
		if(session.get(SessionUtils.BACK_USER_SESSION) != null){
			session.remove(SessionUtils.BACK_USER_SESSION);
			
		}
		if(session.get(SessionUtils.BACK_SHOP_ID_SESSION) != null){
			session.remove(SessionUtils.BACK_SHOP_ID_SESSION);
		}
		
		LabelUtil.setLanguage(LabelUtil.getCurrentLanguage());
		return "loginold";
	}
	
	
	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public File[] getFiles() {
		return files;
	}

	public void setFiles(File[] files) {
		this.files = files;
	}

	public String[] getFilesContentType() {
		return filesContentType;
	}

	public void setFilesContentType(String[] filesContentType) {
		this.filesContentType = filesContentType;
	}

	public String[] getFilesFileName() {
		return filesFileName;
	}

	public void setFilesFileName(String[] filesFileName) {
		this.filesFileName = filesFileName;
	}

	public File getLogo_input() {
		return logo_input;
	}

	public void setLogo_input(File logo_input) {
		this.logo_input = logo_input;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserNickName() {
		return userNickName;
	}

	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}

	public String getUserRealName() {
		return userRealName;
	}

	public void setUserRealName(String userRealName) {
		this.userRealName = userRealName;
	}

	public String getWxOpendIdU() {
		return wxOpendIdU;
	}

	public void setWxOpendIdU(String wxOpendIdU) {
		this.wxOpendIdU = wxOpendIdU;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getQqId() {
		return qqId;
	}

	public void setQqId(String qqId) {
		this.qqId = qqId;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getSingName() {
		return singName;
	}

	public void setSingName(String singName) {
		this.singName = singName;
	}

	public String getLogoFileName() {
		return logoFileName;
	}

	public void setLogoFileName(String logoFileName) {
		this.logoFileName = logoFileName;
	}

}
