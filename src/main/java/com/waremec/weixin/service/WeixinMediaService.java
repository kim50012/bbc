package com.waremec.weixin.service;

import java.awt.Image;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.framework.utilities.UploadFileUtil;
import com.waremec.weixin.cons.DownloadFileType;
import com.waremec.weixin.dao.WeixinMediaDao;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.domain.material.FileItem;
import com.waremec.weixin.utils.WeixinFileUtils;
import com.waremec.weixin.utils.WeixinMediaUtils;


/** 
* @Package com.waremec.weixin.service 
* @FileName WeixinMediaService
* @Description  
* @author taebem 
* @date 2015年5月7日 下午4:06:27 
*  
*/
@Service
public class WeixinMediaService extends CommonServiceImpl implements CommonService {

	private final transient Log logger = LogFactory.getLog(this.getClass());
	
	@Resource
	private WeixinService weixinService;
	@Resource
	private WeixinMediaDao weixinMediaDao;
	
	public String uploadVideoMaterial(Integer shopId,File file, String title,String introduction){
		String token = weixinService.getAccessToken(shopId);
		return WeixinMediaUtils.addVideoMaterial(token, file.getAbsolutePath(), title, introduction);
	}
	/** 
	* 保存下载下来的media信息
	* @param map
	* @return
	*/
	public Integer insertDownloadedMedia(FileItem item ) {
		// TODO Auto-generated method stub
		return weixinMediaDao.insertDownloadedMedia(item);
	}
	
	/** 
	*
	* @param request
	* @param shopId
	* @param mediaId
	* @param fileType
	* @param custSysId
	* @return
	*/
	public FileItem downloadFile(HttpServletRequest request, Integer shopId, String mediaId, DownloadFileType fileType, Integer custSysId){
		FileItem item = new FileItem();
		
		String filePath = UploadFileUtil.getUploadPath(request, UploadFileUtil.UPLOAD_WEIXIN);
		String fileUrl = UploadFileUtil.getUploadUrl(request, UploadFileUtil.UPLOAD_WEIXIN);
		AppInfo appInfo = weixinService.selectAppInfoByShopId(shopId);
		String token = weixinService.getAccessToken(appInfo);
		
		filePath = WeixinMediaUtils.downloadMedia(token,fileType, mediaId, filePath);
		
		File file = new File(filePath);
		fileUrl += file.getName();
		
		item.setShopId(shopId);
		item.setMedia_id(mediaId);
		item.setFileType(fileType.getType());
		item.setFileName(file.getName());
		item.setFileSysName(file.getName());
		item.setFileSize(FileUtils.sizeOf(file));
		item.setFullUrl(fileUrl);
		item.setCustSysId(custSysId);
		
		if(fileType == DownloadFileType.IMAGE){
			try {
				Image src = ImageIO.read(file);// 构造Image对象
				item.setImageWidth(src.getWidth(null));// 得到源图宽
				item.setImageHeight(src.getHeight(null));// 得到源图长
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			
		}else if(fileType == DownloadFileType.VOICE){
			item.setDuration(WeixinFileUtils.getAmrDuration(file));
		}else{
		}
		
		Integer fileId = insertDownloadedMedia(item);
		item.setFileId(fileId);
		
		return item;
	}
	
}