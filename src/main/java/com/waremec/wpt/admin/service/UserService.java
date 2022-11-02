/**   
* @Title: UserService.java 
* @Package com.waremec.wpt.admin.service 
* @Description:  
* @author taebem
* @date 2015年7月2日 下午3:59:40 
* @version V1.0   
*/
package com.waremec.wpt.admin.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.wpt.admin.dao.UserDao;
import com.waremec.wpt.admin.domain.AdminUser;

/** 
 * @Package com.waremec.wpt.admin.service 
 * @FileName UserService
 * @Description  
 * @author taebem 
 * @date 2015年7月2日 下午3:59:40 
 *  
 */
@Service
public class UserService  extends CommonServiceImpl implements CommonService{

	@Resource
	private UserDao userDao;

	/** 
	* 根据用户ID 获取用户信息
	* @param userId 用户ID 
	* @return 用户信息
	*/
	public AdminUser getAdminUserById(String userId) {
		// TODO Auto-generated method stub
		return userDao.selectAdminUserById(userId);
	}
	
	
	/** 
	* 根据用户userAuth 获取BBS系统新注册用户列表
	* @param Map
	* @return 用户列表
	*/
	public List<Map<String, Object>> getAdminUserList(String sqlId, Map<String, Object> searchMap) {
		try {
			return userDao.selectList(sqlId, searchMap);
		} catch (Exception e) {
			e.printStackTrace();
			return new ArrayList<Map<String, Object>>();
		}
	}
}
