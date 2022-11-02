/**   
* @Title: WeixinGroupService.java 
* @Package com.waremec.weixin.service 
* @Description:  
* @author taebem
* @date 2015年5月22日 上午11:16:28 
* @version V1.0   
*/
package com.waremec.weixin.service;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;

/** 
 * @Package com.waremec.weixin.service 
 * @FileName WeixinGroupService
 * @Description  
 * @author taebem 
 * @date 2015年5月22日 上午11:16:28 
 *  
 */
@Service
public class WeixinGroupService extends CommonServiceImpl implements CommonService{

	private final transient Log logger = LogFactory.getLog(this.getClass());
	public WeixinGroupService() {
		logger.info("***********WeixinGroupService*************");
	}
	
}
