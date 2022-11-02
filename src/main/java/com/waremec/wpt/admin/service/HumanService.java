package com.waremec.wpt.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.wpt.admin.dao.HumanDao;
import com.waremec.wpt.admin.domain.AdminHuman;

@Service
public class HumanService extends CommonServiceImpl implements CommonService{

	@Resource
	private HumanDao humanDao;

	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,searchMap--Map
	 * @return:		List<AdminGoods>
	 * @exception:	演讲管理一查询
	 */ 
	public List<AdminHuman> getListDomain(String sqlId, AdminHuman searchMap) {
		
		try {
			return humanDao.getListDomain(sqlId, searchMap);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public AdminHuman getDomain(String sqlId, AdminHuman searchMap) {
		
		try {
			return humanDao.getDomain(sqlId, searchMap);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public Map<String, Object> getList(String sqlId, Map<String, Object> searchMap) {
		
		try {
			return humanDao.getList(sqlId, searchMap);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public void insertDomain(String sqlId, AdminHuman paramIn) {
		humanDao.insertDomain(sqlId, paramIn);	 
	} 
	public int getListCount(String sqlId, AdminHuman searchMap) {
		try {
			return humanDao.getListCount(sqlId, searchMap);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
}
