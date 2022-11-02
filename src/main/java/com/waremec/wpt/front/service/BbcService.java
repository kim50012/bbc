package com.waremec.wpt.front.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.wpt.admin.domain.AdminGoods;
import com.waremec.wpt.front.dao.BbcDao;
import com.waremec.wpt.front.domain.BbcAtrClbBbd;
import com.waremec.wpt.front.domain.SessionSkin;

@Service
public class BbcService extends CommonServiceImpl implements CommonService{
	@Resource
	private BbcDao bbcDao;

	public SessionSkin getSessionSkinByShopId(Integer shopId) {
		// TODO Auto-generated method stub
		return bbcDao.getSessionSkinByShopId(shopId);
	}
	
	

	public List<BbcAtrClbBbd> selectBbcAtrClbBbd(String sqlId, Map<String, Object> searchMap) {
		try {
			return bbcDao.selectBbcAtrClbBbd(sqlId, searchMap);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	

	public BbcAtrClbBbd selectBbcAtrClbBbdOne(String sqlId, Map<String, Object> searchMap) {
		try {
			return bbcDao.selectBbcAtrClbBbdOne(sqlId, searchMap);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
}
