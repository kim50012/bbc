/**   
* @Title: UserDao.java 
* @Package com.waremec.wpt.admin.dao 
* @Description:  
* @author taebem
* @date 2015年7月2日 下午4:09:22 
* @version V1.0   
*/
package com.waremec.wpt.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.waremec.framework.dao.CommonDao;
import com.waremec.wpt.admin.domain.AdminUser;

/** 
 * @Package com.waremec.wpt.admin.dao 
 * @FileName UserDao
 * @Description  
 * @author taebem 
 * @date 2015年7月2日 下午4:09:22 
 *  
 */
@Repository
@SuppressWarnings("unchecked")
public class UserDao extends CommonDao {

	/** 
	*
	* @param userId
	* @return
	*/
	@SuppressWarnings("deprecation")
	public AdminUser selectAdminUserById(String userId) {
		// TODO Auto-generated method stub
		return (AdminUser)getSqlMapClientTemplate().queryForObject("User.selectAdminUserById",userId);
	}
	
	/** 
	* 根据用户userAuth 获取BBS系统新注册用户列表
	* @param Map
	* @return 用户列表
	*/
	@SuppressWarnings("deprecation")
	public List<Map<String, Object>> selectList(String sqlId, Map<String, Object> searchMap) {
		return (List<Map<String, Object>>)getSqlMapClientTemplate().queryForList(sqlId, searchMap);
	}
}
