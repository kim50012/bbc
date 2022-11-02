package com.waremec.wpt.front.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.wpt.admin.domain.AdminCheckIn;
import com.waremec.wpt.admin.domain.AdminCustShop;
import com.waremec.wpt.front.dao.CheckInHistDao;
import com.waremec.wpt.front.domain.FrontCheckInHist;
@Service
public class CheckInHistService extends CommonServiceImpl implements CommonService{
	@Resource
	private CheckInHistDao checkInHistDao;
	/**
	 * @author chenzheng
	 * @param string
	 * @param searchMap
	 * @return 查询用户信息
	 */
	public Map<String,Object> selectCust(String string,
			Map<String,Object> searchMap) {
		try{
			return checkInHistDao.selectCust(string, searchMap);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * @author:		chenzheng
	 * @param:		sqlId,saveIn--frontCheckInHist
	 * @return:		void
	 * @exception:	签到历史--保存
	 */
	public void insertCheckInHist(String sqlId, FrontCheckInHist saveIn) {
		try {
			checkInHistDao.insertCheckInHist(sqlId, saveIn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	/**
	 * @author chenzheng
	 * @param string
	 * @param adminCheckIn
	 * @return 查询签到规则
	 */
	public AdminCheckIn selectCheckIn(String string,
			AdminCheckIn adminCheckIn) {
		try{
			return checkInHistDao.selectCheckIn(string, adminCheckIn);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * @author chenzheng
	 * @param string
	 * @param frontCheckInHist
	 * @return 查询总条数
	 */
	public int selectCount(String string,
			FrontCheckInHist frontCheckInHist) {
		try{
			return checkInHistDao.selectCount(string, frontCheckInHist);
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
	}
	/**
	 * @author:		chenzheng
	 * @param:		sqlId,updateIn--AdminCustShop
	 * @return:		void
	 * @exception:	签到历史--保存
	 */
	public void updatePoint(String sqlId, AdminCustShop updateIn) {
		try {
			checkInHistDao.updatePoint(sqlId, updateIn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	/**
	 * @author chenzheng
	 * @param string
	 * @return 查询签到历史
	 */
	public List<FrontCheckInHist> selectHist(String string,
			FrontCheckInHist frontCheckInHist) {
		try{
			return checkInHistDao.selectHist(string, frontCheckInHist);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * @author chenzheng
	 * @param string
	 * @return 查询签到规则
	 */
	public List<AdminCheckIn> selectMst(String string,
			AdminCheckIn adminCheckIn) {
		try{
			return checkInHistDao.selectMst(string, adminCheckIn);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
}
