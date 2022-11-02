package com.waremec.wpt.admin.dao;

import org.springframework.stereotype.Repository;

import com.waremec.framework.dao.CommonDao;
import com.waremec.wpt.admin.domain.AdminShopFileMst;
import com.waremec.wpt.admin.domain.AdminUser;


@Repository
@SuppressWarnings("unchecked")
public class SetUpDao extends CommonDao{
	/**
	 * @author chenzheng
	 * @param string
	 * @param AdminUser
	 * @return 查询用户信息
	 */
	public AdminUser selectUser(String string,
			AdminUser adminUser) {
		return (AdminUser) getSqlMapClientTemplate().queryForObject(string,adminUser);
				
	}
	/**
	 * @author chenzheng
	 * @param void
	 * @param adminUser
	 * @return 用户信息的修改
	 */

	public void updateUser(String sqlId, AdminUser updateIn) {
		
		 getSqlMapClientTemplate().update(sqlId,updateIn);
	}
	/**
	 * @author chenzheng
	 * @param void
	 * @param adminUser
	 * @return 用户信息的修改
	 */

	public void insertHeadImg(String sqlId, AdminShopFileMst saveIn) {
		
		 getSqlMapClientTemplate().insert(sqlId,saveIn);
	}
}
