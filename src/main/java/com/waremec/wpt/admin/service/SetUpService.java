package com.waremec.wpt.admin.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.wpt.admin.dao.SetUpDao;
import com.waremec.wpt.admin.domain.AdminShopFileMst;
import com.waremec.wpt.admin.domain.AdminUser;

@Service
public class SetUpService extends CommonServiceImpl implements CommonService{
	@Resource
	private SetUpDao setUpDao;

	/**
	 * @author chenzheng
	 * @param string
	 * @param adminUser
	 * @return 查询区域
	 */
	public AdminUser selectUser(String string,
			AdminUser adminUser) {
		try{
			return setUpDao.selectUser(string, adminUser);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * @author:		chenzheng
	 * @param:		sqlId,updateIn--AdminUser	
	 * @return:		void
	 * @exception:	用户信息--修改
	 */
	public void updateUser(String sqlId, AdminUser updateIn) {
		try {
			setUpDao.updateUser(sqlId, updateIn);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * @author:		chenzheng
	 * @param:		sqlId,saveIn--AdminShopFileMst	
	 * @return:		void
	 * @exception:	用户头像--插入
	 */
	public void insertHeadImg(String sqlId, AdminShopFileMst saveIn) {
		try {
			setUpDao.insertHeadImg(sqlId, saveIn);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

