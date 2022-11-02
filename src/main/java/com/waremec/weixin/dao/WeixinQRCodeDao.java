/**   
 * @Title: WeixinQRCodeDao.java 
 * @Package com.waremec.weixin.dao 
 * @Description:  
 * @author taebem
 * @date 2015年6月15日 下午3:03:41 
 * @version V1.0   
 */
package com.waremec.weixin.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.waremec.framework.common.exception.ProcedureBizException;
import com.waremec.framework.dao.CommonDao;
import com.waremec.weixin.domain.qrcode.QRCodeDomain;
import com.waremec.weixin.utils.Constants;

/**
 * @Package com.waremec.weixin.dao
 * @FileName WeixinQRCodeDao
 * @Description
 * @author taebem
 * @date 2015年6月15日 下午3:03:41
 * 
 */
@Repository
public class WeixinQRCodeDao extends CommonDao {

	/** 
	 *  获取下一个场景值ID
	 * @param qrCodeDomain
	 * @return Integer 
	 * 		scene_id 临时二维码 1000000 ~ 2147483647
	 *  			永久二维码 1 ~ 100000
	 */
	@SuppressWarnings({ "unchecked", "deprecation" })
	public Integer selectNextSceneId(QRCodeDomain qrCodeDomain) {
		try {
			
			Map<String,Object> result = (Map<String,Object>)getSqlMapClientTemplate().queryForObject("WeixinQRCode.selectNextSceneId", qrCodeDomain);
			
			Integer sceneId = (Integer)result.get("SCENE_ID");
			
			if(Constants.QrcodeType.QR_SCENE.equals(qrCodeDomain.getQrcodeType())){
				if(sceneId < 1000000){
					sceneId += 1000000;
				}
			}
			
			return sceneId;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	/** 
	*  保存二维码
	* @param qrCodeDomain
	* @return
	*/
	@SuppressWarnings({ "deprecation", "unchecked" })
	public Integer insertQRCode(QRCodeDomain qrCodeDomain) {
		Map<String,Object> result = (Map<String,Object>)getSqlMapClientTemplate().queryForObject("WeixinQRCode.insertQRCode", qrCodeDomain);
		
		Integer qrcodeId = (Integer)result.get("OUT_QRCODE_ID");
		String OUT_ERR_MSG = (String)result.get("OUT_ERR_MSG");
		
		if(!"S".equals(OUT_ERR_MSG)){
			throw new ProcedureBizException(OUT_ERR_MSG);
		}
		
		return qrcodeId;
	}
	
	/** 
	* 修改二维码
	* @param qrCodeDomain
	*/
	@SuppressWarnings({ "deprecation", "unchecked" })
	public void updateQRCode(QRCodeDomain qrCodeDomain) {
		Map<String,Object> result = (Map<String,Object>)getSqlMapClientTemplate().queryForObject("WeixinQRCode.updateQRCode", qrCodeDomain);
		
//		Integer qrcodeId = (Integer)result.get("OUT_QRCODE_ID");
		String OUT_ERR_MSG = (String)result.get("OUT_ERR_MSG");
		
		if(!"S".equals(OUT_ERR_MSG)){
			throw new ProcedureBizException(OUT_ERR_MSG);
		}
	}
	
	/** 
	* 删除二维码
	* @param qrCodeDomain
	*/
	@SuppressWarnings({ "deprecation", "unchecked" })
	public void deleteQRCode(QRCodeDomain qrCodeDomain) {
		Map<String,Object> result = (Map<String,Object>)getSqlMapClientTemplate().queryForObject("WeixinQRCode.deleteQRCode", qrCodeDomain);
		
//		Integer qrcodeId = (Integer)result.get("OUT_QRCODE_ID");
		String OUT_ERR_MSG = (String)result.get("OUT_ERR_MSG");
		
		if(!"S".equals(OUT_ERR_MSG)){
			throw new ProcedureBizException(OUT_ERR_MSG);
		}
	}
	/** 
	*
	* @param shopId
	* @return
	*/
	@SuppressWarnings("deprecation")
	public String selectShopLogoRealPath(Integer shopId) {
		String path = (String)getSqlMapClientTemplate().queryForObject("WeixinQRCode.selectShopLogoRealPath", shopId);
		return path;
	}
	
}
