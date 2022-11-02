package com.waremec.wpt.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.wpt.admin.dao.CustDao;
import com.waremec.wpt.admin.domain.AdminCustShop;
import com.waremec.wpt.admin.domain.AdminGrade;
import com.waremec.wpt.admin.domain.AdminMap;
import com.waremec.wpt.admin.domain.AdminWxMessageInfoEtc;
@Service
public class CustService extends CommonServiceImpl implements CommonService{
	@Resource
	private CustDao custDao;
	/**
	 * @author chenzheng
	 * @param string
	 * @param searchMap
	 * @return 查询用户信息
	 */
	public List<Map<String,Object>> selectCustList(String string,
			Map<String,Object> searchMap) {
		try{
			return custDao.selectCustList(string, searchMap);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * @author chenzheng
	 * @param string
	 * @param adminMap
	 * @return 查询区域
	 */
	public List<AdminMap> selectMapList(String string,
			AdminMap adminMap) {
		try{
			return custDao.selectMapList(string, adminMap);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * @author chenzheng
	 * @param string
	 * @param adminCustShop
	 * @return 根据用户id查询等级
	 */
	public AdminCustShop selectGardeById(String string,
			AdminCustShop adminCustShop) {
		try{
			return custDao.selectGradeById(string, adminCustShop);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * @author chenzheng
	 * @param string
	 * @param adminCustShop
	 * 更新操作
	 */
	public void updateCustShop(String string,
			AdminCustShop adminCustShop) throws Exception {
		
			custDao.updateCustShop(string, adminCustShop);
		}
	/**
	 * @author chenzheng
	 * @param string
	 * @param adminCustShop
	 * @return 查询总条数
	 */
	public int selectCount(String string,
			AdminCustShop adminCustShop) {
		try{
			return custDao.selectCount(string, adminCustShop);
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
	}
	/**
	 * @author chenzheng
	 * @param string
	 * @param adminMap
	 * @return 查询区域
	 */
	public List<AdminGrade> selectGrade(String string,
			AdminGrade adminGrade) {
		try{
			return custDao.selectGrade(string, adminGrade);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * @author chenzheng
	 * @param string
	 * @param searchMap
	 * @return 查询一个用户信息
	 */
	public Map<String,Object> selectChat(String string,
			Map<String,Object> searchMap) {
		try{
			return custDao.selectChat(string, searchMap);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * @author chenzheng
	 * @param string
	 * @param searchMap
	 * @return 查询用户信息
	 */
	public List<Map<String,Object>> selectChatList(String string,
			Map<String,Object> searchMap) {
		try{
			return custDao.selectChatList(string, searchMap);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * @author chenzheng
	 * @param string
	 * @param adminWxMessageInfoEtc
	 * 插入操作
	 */
	public void insertWxMessageInfoEtc(String string,
			AdminWxMessageInfoEtc adminWxMessageInfoEtc) throws Exception {
		
			custDao.insertWxMessageInfoEtc(string, adminWxMessageInfoEtc);
		}
	/**
	 * @author chenzheng
	 * @param string
	 * @param adminWxMessageInfoEtc
	 * 更新操作
	 */
	public void updateWxMessageInfoEtc(String string,
			AdminWxMessageInfoEtc adminWxMessageInfoEtc) throws Exception {
		
			custDao.updateWxMessageInfoEtc(string, adminWxMessageInfoEtc);
		}
	/**
	 * @author chenzheng
	 * @param string
	 * @param AdminWxMessageInfoEtc
	 * @return 根据用户id查询
	 */
	public int selectById(String string,
			AdminWxMessageInfoEtc adminWxMessageInfoEtc) {
		try{
			return custDao.selectById(string, adminWxMessageInfoEtc);
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
	}
	public void modifyCustInfo(Map<String, Object> saveMap) {
		// TODO Auto-generated method stub
		custDao.modifyCustInfo(saveMap);
	}
}

