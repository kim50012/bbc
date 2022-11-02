package com.waremec.wpt.admin.action;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.UploadFileUtil;
import com.waremec.weixin.action.WeixinBaseAction;

@Controller("uploadAction")
@Scope(ScopeType.prototype)
public class UploadAction extends WeixinBaseAction {

	private int projectid;  
	private File file; 
	 private String fileFileName;  
	 private String fileContentType;  
	public String upload(){
		
		boolean success = true;
		String err_msg = "";
		
		Integer shopId = getBackSessionShopId();
//		System.out.println("projectid=" +projectid);
//		System.out.println("file=" +file);
//		System.out.println("fileFileName=" +fileFileName);
//		System.out.println("fileContentType=" +fileContentType);
		
		
		String fileUrl = UploadFileUtil.ROOT + "/" + UploadFileUtil.UPLOAD_TMEP + "/"+  shopId + UploadFileUtil.generateFilePath();
		String filePath = getRequest().getSession().getServletContext().getRealPath(fileUrl);

//		logger.debug("filePath=======" + filePath);

		File target = new File(filePath);
		if (!target.exists()) {
			target.mkdirs();
		}
		
		String destinationFilename = UploadFileUtil.generateSystemFilename(shopId +"",fileFileName, UploadFileUtil.UPLOAD_TMEP);
     
		 
		target = new File(filePath, destinationFilename);
		
//		System.out.println("Name===============" + target.getName());
//		System.out.println("filePath===============" + filePath);
//		System.out.println("destinationFilename====" + destinationFilename);
		
		try {
			FileUtils.copyFile(file, target);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String fullPath = filePath + "/" + destinationFilename;
		
		
		String url = "";
		try {
			url = weixinMassService.getWeixinImageUrl(shopId, fullPath);
		} catch (Exception e) {
			// TODO: handle exception
			success = false;
			err_msg = e.getMessage();
		}
		 
		Map<String,Object> returnMap = new HashMap<String,Object>();
		returnMap.put("success", success);
		returnMap.put("err_msg", err_msg);
		returnMap.put("url", url);
		
		renderJSON(returnMap);
		
		return NONE;  
	}
	public int getProjectid() {
		return projectid;
	}
	public void setProjectid(int projectid) {
		this.projectid = projectid;
	}
	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	public String getFileFileName() {
		return fileFileName;
	}
	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}
	public String getFileContentType() {
		return fileContentType;
	}
	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}
	
}
