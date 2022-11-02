package com.waremec.wpt.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.wpt.admin.dao.VoteDao;
import com.waremec.wpt.admin.domain.AdminVote;

@Service
public class VoteService extends CommonServiceImpl implements CommonService{

	@Resource
	private VoteDao voteDao;

	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,searchMap--Map
	 * @return:		List<AdminGoods>
	 * @exception:	店铺商品分类一级分类查询
	 */ 
	public List<AdminVote> selectshopGoodsClassMap(String sqlId, Map<String, Object> searchMap) {
		try {
			return voteDao.selectshopGoodsClassMap(sqlId, searchMap);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,searchMap--AdminGoods
	 * @return:		List<AdminGoods>
	 * @exception:	店铺商品分类一级分类查询
	 */
	public List<AdminVote> selectList(String sqlId, AdminVote searchMap) {
		try {
			return voteDao.selectList(sqlId, searchMap);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public AdminVote select(String sqlId, AdminVote searchMap) {
		try {
			return voteDao.select(sqlId, searchMap);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,paramIn--AdminGoods
	 * @return:		void
	 * @exception:	店铺商品分类一保存
	 */
	public void insertDomain(String sqlId, AdminVote paramIn) {
		try {
			voteDao.insertDomain(sqlId, paramIn);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,searchMap--AdminGoods
	 * @return:		List<AdminGoods>
	 * @exception:	店铺商品登记一级分类查询
	 */ 
	public List<AdminVote> selectGoodsClass(String sqlId, AdminVote searchMap) {
		try {
			return voteDao.selectGoodsClass(sqlId, searchMap);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	} 
	public int selectCount(String sqlId, AdminVote searchMap) {
		try {
			return voteDao.selectCount(sqlId, searchMap);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
}
