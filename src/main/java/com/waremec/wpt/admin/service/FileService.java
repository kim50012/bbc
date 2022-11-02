/**   
 * @Title: FileService.java 
 * @Package com.waremec.wpt.admin.service 
 * @Description:  
 * @author taebem
 * @date 2015年6月17日 下午12:32:43 
 * @version V1.0   
 */
package com.waremec.wpt.admin.service;

import java.util.Arrays;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.wpt.admin.dao.FileDao;

/**
 * @Package com.waremec.wpt.admin.service
 * @FileName FileService
 * @Description
 * @author taebem
 * @date 2015年6月17日 下午12:32:43
 * 
 */
@Service
public class FileService extends CommonServiceImpl implements CommonService {

	private final transient Log logger = LogFactory.getLog(this.getClass());

	@Resource
	private FileDao fileDao;

	public String getRealPath(HttpServletRequest request) {

		String fullPath = "";
		
		String realPath = request.getSession().getServletContext().getRealPath("");

		String type = request.getParameter("type");
		Integer id = IntegerUtils.valueOf(request.getParameter("id"));

//		logger.info("realPath==" + realPath);
//		logger.info("type==" + type);
//		logger.info("id==" + id);
//		logger.info("isValidType==" + isValidType(type));

		if (isValidType(type)) {
			String imgPath = fileDao.selectImgPathById(type, id);
//			logger.info("imgPath==" + imgPath);
			if(StringUtils.isNotBlank(imgPath)){
				fullPath = realPath + imgPath;
				fullPath = fullPath.replaceAll("\\\\", "/");
//				logger.info("fullPath==" + fullPath);
			}
			
		} 

		return fullPath;
	}

	private boolean isValidType(String type) {
		return Arrays.asList("qrcode", "file", "weixin").contains(type);
	}

}
