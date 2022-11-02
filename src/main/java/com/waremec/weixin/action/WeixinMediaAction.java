package com.waremec.weixin.action;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.framework.utilities.UploadFileUtil;
import com.waremec.weixin.cons.DownloadFileType;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.domain.material.FileItem;
import com.waremec.weixin.domain.user.SessionMember;
import com.waremec.weixin.utils.WeixinFileUtils;
import com.waremec.weixin.utils.WeixinMediaUtils;

/** 
* @Package com.waremec.weixin.action 
* @FileName WeixinMediaAction
* @Description  
* @author taebem 
* @date 2015年5月7日 下午4:04:59 
*  
*/
@Controller("weixinMediaAction")
@Scope(ScopeType.prototype)
public class WeixinMediaAction extends WeixinBaseAction {
	

	/**  
	* 
	*/
	private static final long serialVersionUID = 1L;

	/*public String download() {
		
		try {
			SessionMember sessionMember = getSessionMember();

			String filePath = UploadFileUtil.getUploadPath(getRequest(), UploadFileUtil.UPLOAD_WEIXIN);
			String fileUrl = UploadFileUtil.getUploadUrl(getRequest(), UploadFileUtil.UPLOAD_WEIXIN);

			Integer shopId = IntegerUtils.valueOf(getRequest().getParameter("shopId"));
			
			AppInfo appInfo = weixinService.selectAppInfoByShopId(shopId);
			String mediaId = getRequest().getParameter("mediaId");
			Integer fileType = IntegerUtils.valueOf(getRequest().getParameter("fileType"));
			
			logger.info("filePath======" + filePath);
			logger.info("shopId========" + shopId);
			logger.info("mediaId=======" + mediaId);

			String token = weixinService.getAccessToken(appInfo);

			filePath = WeixinMediaUtils.downloadMedia(token,DownloadFileType.get(fileType), mediaId, filePath);
			
			if (StringUtils.isEmpty(filePath)) {
				throw new Exception("从微信服务器下载文件失败");
			}

			File file = new File(filePath);
			fileUrl += file.getName();
			
			Map<String, Object> flieMap = new HashMap<String, Object>();
			
			flieMap.put("SHOP_ID", appInfo.getShopId());
			flieMap.put("WFILE_NM", file.getName());
			flieMap.put("WFILE_SYS_NM", file.getName());
			if(file.getName().endsWith("jpg")){
				flieMap.put("WFILE_TYPE", 1);
				flieMap.put("WFILE_DURATION", null);
			}else if(file.getName().endsWith("amr")){
				flieMap.put("WFILE_TYPE", 2);
				flieMap.put("WFILE_DURATION", WeixinFileUtils.getAmrDuration(file));
			}else{
				flieMap.put("WFILE_TYPE", 3);
				flieMap.put("WFILE_DURATION", null);
			}
			flieMap.put("WFILE_SIZE", FileUtils.sizeOf(file));
			flieMap.put("FULL_URL", fileUrl);
			if(sessionMember != null){
				flieMap.put("CUST_SYS_ID", sessionMember.getCustSysId());
			}else{
				flieMap.put("CUST_SYS_ID", null);
			}
			
			Integer fileId = weixinMediaService.insertDownloadedMedia(flieMap);
			
			Map<String, Object> returns = new HashMap<String, Object>();

			returns.put("success", true);
			returns.put("mediaId", mediaId);
			returns.put("fileId", fileId);
			returns.put("fileUrl", fileUrl);
			renderJSON(returns);
		
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			Map<String, Object> returns = new HashMap<String, Object>();

			returns.put("success", false);
			returns.put("err_msg", e.getMessage());
			renderJSON(returns);
		}
		
		

		return NONE;
	}*/
	
	
	public String download() {
		
		try {
			SessionMember sessionMember = getSessionMember();

			Integer shopId = IntegerUtils.valueOf(getRequest().getParameter("shopId"));
			String mediaId = getRequest().getParameter("mediaId");
			Integer fileType = IntegerUtils.valueOf(getRequest().getParameter("fileType"));
			Integer custSysId = null;
			if(sessionMember != null){
				custSysId = sessionMember.getCustSysId();
			}
			
			FileItem fileItme = weixinMediaService.downloadFile(getRequest(), shopId, mediaId, DownloadFileType.get(fileType), custSysId);
			
		         
			
			Map<String, Object> returns = new HashMap<String, Object>();

			returns.put("success", true);
			returns.put("data", fileItme);
			renderJSON(returns);
		
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			Map<String, Object> returns = new HashMap<String, Object>();

			returns.put("success", false);
			returns.put("err_msg", e.getMessage());
			renderJSON(returns);
		}
		
		

		return NONE;
	}

}
