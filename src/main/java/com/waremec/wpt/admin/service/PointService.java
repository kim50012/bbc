package com.waremec.wpt.admin.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.wpt.admin.dao.PointDao;
import com.waremec.wpt.admin.domain.AdminPoint;
@Service
public class PointService  extends CommonServiceImpl implements CommonService{
	@Resource
	private PointDao pointDao;
	/**
	 * @author WANGBIN
	 * @param string  
	 * @param adminPoint
	 * @return 积分ID
	 */
	public String savePoint(String string, AdminPoint adminPoint) {
		try{
			return pointDao.savePoint(string,adminPoint);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}	
	}
	/**
	 * @author wangbin
	 * @param string
	 * @param adminPoint
	 * @return 积分规则的集合。
	 */
	public List<AdminPoint> selectPointList(String string,
			AdminPoint adminPoint) {
		try{
			return pointDao.selectPointList(string,adminPoint);
		}catch(Exception e){
			return null;
		}
	}
	/**
	 * @author wangbin
	 * @param string
	 * @param adminPoint
	 * @return	要修改的那个积分规则
	 */
	public AdminPoint selectPoint(String string,
			AdminPoint adminPoint) {
		try{
			return pointDao.selectPoint(string,adminPoint);
		}catch(Exception e){
			return null;	
		}
	}
	/**
	 * @author wangbin
	 * @param string
	 * @param adminPoint
	 * @return 返回修改的积分规则的ID
	 */
	public String updatePoint(String string, AdminPoint adminPoint) {
		try{
			return pointDao.updatePoint(string,adminPoint);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * @author wangbin
	 * @param string
	 * @param adminPoint
	 * 	删除积分规则。
	 */
	public void deletePoint(String string, AdminPoint adminPoint)throws Exception {
		pointDao.deletePoint(string,adminPoint);
	}
}
