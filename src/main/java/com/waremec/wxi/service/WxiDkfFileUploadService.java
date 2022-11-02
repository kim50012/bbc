package com.waremec.wxi.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.ServletContext;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.util.ServletContextAware;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.framework.utilities.UploadFileUtil;

@Service
public class WxiDkfFileUploadService extends CommonServiceImpl implements CommonService,ServletContextAware {
	//存储ServletContext
    private ServletContext context=null;
	public JSONObject saveHeadImage(File logo_input,String fileName){
		
		String fileUrl = UploadFileUtil.ROOT + "/" + "DKF" + UploadFileUtil.generateFilePath();
		String targetDirectory = context.getRealPath(fileUrl);
		String targetFileName = generateFileName(fileName,"DKF");
		File target = new File(targetDirectory, targetFileName);
		try {
			FileUtils.copyFile(logo_input, target);
			JSONObject jo = new JSONObject();
			jo.put("fileUrl", fileUrl+targetFileName);
			jo.put("filePath", targetDirectory+"\\"+targetFileName);
			jo.put("resultLogoImg", "success");
	  		return jo;
		} catch (Exception e) {
			e.printStackTrace();
			JSONObject jo = new JSONObject();
			jo.put("resultLogoImg", "验证出现错误，请重新操作！");
			return jo;
		}  
	}
	 private String generateFileName(String fileName,String str) {   
	        SimpleDateFormat sf = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss");  
	        String formatDate = sf.format(new Date());  
	        int random = new Random().nextInt(10000);  
	        int position = fileName.lastIndexOf(".");  
	        String extension = fileName.substring(position);  
	        return str+formatDate + random + extension;  
	    }
	 @Override
	public void setServletContext(ServletContext context) {
		this.context=context;
	}
}
