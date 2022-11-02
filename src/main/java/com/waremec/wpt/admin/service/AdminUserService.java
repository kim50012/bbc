package com.waremec.wpt.admin.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.wpt.admin.dao.AdminUserDao;
import com.waremec.wpt.admin.domain.AdminUser;

@Service
public class AdminUserService extends CommonServiceImpl implements CommonService {

	
	@Resource
	private AdminUserDao adminUserDao;
	
	public AdminUser getAdminUserByAccount(String account) {
		// TODO Auto-generated method stub
		return adminUserDao.getAdminUserByAccount(account);
	}
	public AdminUser getPmsUserByAccount(String account) {
		// TODO Auto-generated method stub
		return adminUserDao.getPmsUserByAccount(account);
	}
}
