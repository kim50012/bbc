package com.waremec.wpt.front.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.wpt.front.dao.CartDao;
@Service
public class CartService extends CommonServiceImpl implements CommonService{
	@Resource
	private CartDao cartDao;

	public List<Map<String,Object>> selectCartList(String string,
			Map<String,Object> searchMap) {
		try{
			return cartDao.selectCartList(string, searchMap);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	public void updateNum(String string,
			Map<String, Object> map) {
		try{
			cartDao.update(string, map);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void delete(String string,
			Map<String, Object> map) {
		try{
			cartDao.update(string, map);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
}
