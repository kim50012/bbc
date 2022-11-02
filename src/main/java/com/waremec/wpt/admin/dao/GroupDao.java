/**   
 * @Title: GroupDao.java 
 * @Package com.waremec.wpt.admin.dao 
 * @Description:  
 * @author taebem
 * @date 2015年7月2日 下午4:09:49 
 * @version V1.0   
 */
package com.waremec.wpt.admin.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.waremec.framework.dao.CommonDao;
import com.waremec.wpt.admin.domain.AdminGroup;

/**
 * @Package com.waremec.wpt.admin.dao
 * @FileName GroupDao
 * @Description
 * @author taebem
 * @date 2015年7月2日 下午4:09:49
 * 
 */
@Repository
public class GroupDao extends CommonDao {

	/** 
	* 根据用户ID获取公司列表
	* @param userId userId 用户ID
	* @return 公司列表
	*/
	public List<AdminGroup> selectGroupListByUserId(String userId) {
		// TODO Auto-generated method stub
		return (List<AdminGroup>)getSqlMapClientTemplate().queryForList("Group.selectGroupListByUserId", userId);
	}

	/** 
	* 根据公司ID获取公司信息
	* @param  companyId 公司ID
	* @return 公司信息
	*/
	public AdminGroup selectGroupById(Integer companyId) {
		// TODO Auto-generated method stub
		return (AdminGroup)getSqlMapClientTemplate().queryForObject("Group.selectGroupById", companyId);
	}

	/** 
	* 添加公司信息
	* @param adminGroup
	*/
	public void insertGroup(AdminGroup adminGroup) {
		// TODO Auto-generated method stub
		getSqlMapClientTemplate().update("Group.insertGroup",adminGroup);
	}
	/** 
	 * 修改公司信息
	 * @param adminGroup
	 */
	public void updateGroup(AdminGroup adminGroup) {
		// TODO Auto-generated method stub
		getSqlMapClientTemplate().update("Group.updateGroup",adminGroup);
	}

}
