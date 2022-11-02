/**   
 * @Title: WeixinQRCodeService.java 
 * @Package com.waremec.weixin.service 
 * @Description:  
 * @author taebem
 * @date 2015年6月15日 下午3:02:53 
 * @version V1.0   
 */
package com.waremec.weixin.service;

import java.awt.Image;
import java.io.File;
import java.io.IOException;
import java.util.Calendar;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.framework.utilities.UploadFileUtil;
import com.waremec.weixin.dao.WeixinQRCodeDao;
import com.waremec.weixin.domain.qrcode.QRCodeDomain;
import com.waremec.weixin.domain.qrcode.QRTicketReturn;
import com.waremec.weixin.utils.Constants;
import com.waremec.weixin.utils.WeixinQRCodeUtils;

/**
 * @Package com.waremec.weixin.service
 * @FileName WeixinQRCodeService
 * @Description
 * @author taebem
 * @date 2015年6月15日 下午3:02:53
 * 
 */
@Service
public class WeixinQRCodeService extends CommonServiceImpl implements CommonService {

	private final transient Log logger = LogFactory.getLog(this.getClass());

	@Resource
	private WeixinService weixinService;
	@Resource
	private WeixinQRCodeDao weixinQRCodeDao;

	/**
	 * 保存二维码
	* @param shopId
	* @param qrcodeType
	* @param request
	* @param logoFile logo图片
	* @return
	*/
	public Integer createQRCode(Integer shopId, String qrcodeType, HttpServletRequest request, String logoFile) {
		
		QRCodeDomain qrCodeDomain = new QRCodeDomain();
		
		qrCodeDomain.setShopId(shopId);
		qrCodeDomain.setQrcodeType(qrcodeType);
		
		Integer sceneId = weixinQRCodeDao.selectNextSceneId(qrCodeDomain);
		
		
		String token = weixinService.getAccessToken(shopId);
		
		
		String filepath = UploadFileUtil.getUploadPath(request, UploadFileUtil.UPLOAD_QRCODE) ;
		String fileUrl = UploadFileUtil.getUploadUrl(request, UploadFileUtil.UPLOAD_QRCODE);
		String filename = UploadFileUtil.generateSystemFilename("你好.jpg", UploadFileUtil.UPLOAD_QRCODE) ;//只需要扩展名而已
		//文件显示web路径
		fileUrl += filename; 
		
		Calendar calendar = Calendar.getInstance();//二维码的有效期
		
		QRTicketReturn qrTicket = null;
		
		if(Constants.QrcodeType.QR_SCENE.equals(qrcodeType)){//临时二维码
			//调用接口获取二维码信息
			qrTicket = WeixinQRCodeUtils.createQrcode(token,sceneId, null); 
			//计算有效期
			calendar.setTimeInMillis(calendar.getTime().getTime() + qrTicket.getExpire_seconds() * 1000);
			
		}else{//永久二维码
			qrTicket = WeixinQRCodeUtils.createLimitQrcode(token,sceneId); 
			//设置有效期 -至2300年
			calendar.set(Calendar.YEAR, 2300);
		}
		
		if(qrTicket != null){
			//文件保存的系统路径
			filepath = WeixinQRCodeUtils.makeQRCode(qrTicket.getUrl(), WeixinQRCodeUtils.QRCodeSize.SIZE344, filepath, filename, logoFile);
			
			qrCodeDomain.setSceneId(sceneId);
			qrCodeDomain.setExpireDate(calendar.getTime());
			qrCodeDomain.setTicket(qrTicket.getTicket());
			qrCodeDomain.setWxUrl(qrTicket.getUrl());
			qrCodeDomain.setFullUrl(fileUrl);
			try {
				Image src = ImageIO.read(new File(filepath));// 构造Image对象
				qrCodeDomain.setWidth(src.getWidth(null));// 得到源图宽
				qrCodeDomain.setHeight(src.getHeight(null));// 得到源图长
				src = null;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		
			qrCodeDomain.setCreatedId(111);
		}
		
		Integer qrCodeId = weixinQRCodeDao.insertQRCode(qrCodeDomain);
		
		return qrCodeId;
	}

	/**
	 * 修改二维码
	 * 
	 * @param qrCodeDomain
	 */
	public void updateQRCode(QRCodeDomain qrCodeDomain) {
		weixinQRCodeDao.updateQRCode(qrCodeDomain);
	}

	/**
	 * 删除二维码
	 * 
	 * @param qrCodeDomain
	 */
	public void deleteQRCode(QRCodeDomain qrCodeDomain) {
		weixinQRCodeDao.deleteQRCode(qrCodeDomain);
	}

	/** 
	* 获取商店的logo图片的物理路径
	* @param request
	* @param shopId
	* @return
	*/
	public String getShopLogoRealPath(HttpServletRequest request, Integer shopId) {
		String fullPath = "";
		
		String realPath = request.getSession().getServletContext().getRealPath("");
		String imgPath = weixinQRCodeDao.selectShopLogoRealPath(shopId);
 
		fullPath = realPath + imgPath;
		fullPath = fullPath.replaceAll("\\\\", "/");
		logger.info("fullPath==" + fullPath);
		
		File file = new File(fullPath);
		if(!file.exists()){
			fullPath = "";
		}
			 
		return fullPath;
	}

}
