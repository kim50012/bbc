/**   
* @Title: GroupService.java 
* @Package com.waremec.wpt.admin.service 
* @Description:  
* @author taebem
* @date 2015年7月2日 下午4:00:40 
* @version V1.0   
*/
package com.waremec.wpt.admin.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.wpt.admin.dao.GroupDao;
import com.waremec.wpt.admin.domain.AdminGroup;

/** 
 * @Package com.waremec.wpt.admin.service 
 * @FileName GroupService
 * @Description  
 * @author taebem 
 * @date 2015年7月2日 下午4:00:40 
 *  
 */
@Service
public class GroupService extends CommonServiceImpl implements CommonService{

	@Resource
	private GroupDao groupDao;

	/** 
	* 根据用户ID获取公司列表
	* @param userId 用户ID
	* @return 公司列表
	*/
	public List<AdminGroup> getGroupListByUserId(String userId) {
		// TODO Auto-generated method stub
		return groupDao.selectGroupListByUserId(userId);
	}

	/** 
	* 根据公司ID获取公司信息
	* @param companyId 公司ID
	* @return 公司信息
	*/
	public AdminGroup getGroupById(Integer companyId) {
		// TODO Auto-generated method stub
		return groupDao.selectGroupById(companyId); 
	}

	/** 
	* 添加公司信息
	* @param adminGroup
	*/
	public void addGroup(AdminGroup adminGroup) {
		// TODO Auto-generated method stub
		groupDao.insertGroup(adminGroup);
	}
	/** 
	 * 修改公司信息
	 * @param adminGroup
	 */
	public void modifyGroup(AdminGroup adminGroup) {
		// TODO Auto-generated method stub
		groupDao.updateGroup(adminGroup);
	}
}
