package com.waremec.wpt.front.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.wpt.front.dao.FavoritesDao;

@Service
public class FavoritesService extends CommonServiceImpl implements CommonService {
	@Resource
	private FavoritesDao favoritesDao;

	public List<Map<String, Object>> selectFavoritesList(String string, Map<String, Object> searchMap) {
		try {
			return favoritesDao.selectFavoritesList(string, searchMap);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public void updateNum(String string, Map<String, Object> map) {
		try {
			favoritesDao.update(string, map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void delete(String string, Map<String, Object> map) {
		try {
			favoritesDao.delete(string, map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}