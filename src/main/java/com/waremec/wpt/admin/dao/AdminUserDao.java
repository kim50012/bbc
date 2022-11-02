package com.waremec.wpt.admin.dao;

import org.springframework.stereotype.Repository;

import com.waremec.framework.dao.CommonDao;
import com.waremec.wpt.admin.domain.AdminUser;

@Repository
public class AdminUserDao extends CommonDao {
  

	public AdminUser getAdminUserByAccount(String account) {
		// TODO Auto-generated method stub
		return (AdminUser) getSqlMapClientTemplate().queryForObject("AdminUser.getAdminUserByAccount", account);
	}
	public AdminUser getPmsUserByAccount(String account) {
		// TODO Auto-generated method stub
		return (AdminUser) getSqlMapClientTemplate().queryForObject("AdminUser.getPmsUserByAccount", account);
	}
	
}
