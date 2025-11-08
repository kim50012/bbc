package com.waremec.framework.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.waremec.framework.dao.CommonDao;


@Service("commonService")
public class CommonServiceImpl implements CommonService {

	protected final transient Log logger = LogFactory.getLog(CommonServiceImpl.class);
	
//	@Resource
	@Resource(name = "mssqlCommonDao")
	protected CommonDao commonDao;
	
	@Resource(name = "oracleCommonDao")
	protected CommonDao oracleCommonDao;


	// ------------- Oracle  관련 -----------------

	@Override
	public List<Map<String, Object>> selectListOracle(Map<String, Object> searchMap) {
		try {
			return oracleCommonDao.selectListOracle(searchMap);
		} catch (Exception e) {
			e.printStackTrace();
			return new ArrayList<Map<String, Object>>();
		}
	}

	@Override
	public List<Map<String, Object>> selectListOracle(String sqlId, Map<String, Object> searchMap) {
		try {
			return oracleCommonDao.selectListOracle(sqlId, searchMap);
		} catch (Exception e) {
			e.printStackTrace();
			return new ArrayList<Map<String, Object>>();
		}
	}
	// ------------- Oracle  관련 -----------------
	
	@Override
	public void insert(Map<String, Object> map) {
		try {
			commonDao.insert(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void insert(String sqlId, Map<String, Object> map) {
		try {
			commonDao.insert(sqlId, map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void update(Map<String, Object> map) {
		try {
			commonDao.update(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void update(String sqlId, Map<String, Object> map) {
		try {
			commonDao.update(sqlId, map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void delete(Map<String, Object> map) {
		try {
			commonDao.delete(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void delete(String sqlId, Map<String, Object> map) {
		try {
			commonDao.delete(sqlId, map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public Map<String, Object> select(Map<String, Object> searchMap) {
		try {
			return commonDao.select(searchMap);
		} catch (Exception e) {
			e.printStackTrace();
			return new HashMap<String, Object>();
		}
	}

	@Override
	public Map<String, Object> select(String sqlId,
			Map<String, Object> searchMap) {
		try {
			return commonDao.select(sqlId, searchMap);
		} catch (Exception e) {
			e.printStackTrace();
			return new HashMap<String, Object>();
		}
	}

	@Override
	public List<Map<String, Object>> selectList(Map<String, Object> searchMap) {
		try {
			return commonDao.selectList(searchMap);
		} catch (Exception e) {
			e.printStackTrace();
			return new ArrayList<Map<String, Object>>();
		}
	}

	@Override
	public List<Map<String, Object>> selectList(String sqlId, Map<String, Object> searchMap) {
		try {
			return commonDao.selectList(sqlId, searchMap);
		} catch (Exception e) {
			e.printStackTrace();
			return new ArrayList<Map<String, Object>>();
		}
	}

	@Override
	public Object selectToObject(String sqlId, Map<String, Object> searchMap) {
		try {
			return commonDao.selectToObject(sqlId, searchMap);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public String selectString(String sqlId, Map searchMap) {
		try {
			return commonDao.selectString(sqlId, searchMap);
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}

	@Override
	public int selectListTotCnt(Map<String, Object> searchMap) {
		try {
			return commonDao.selectListTotCnt(searchMap);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public int selectListTotCnt(String sqlId, Map<String, Object> searchMap) {
		try {
			return commonDao.selectListTotCnt(sqlId, searchMap);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public void selectNoReturn(Map<String, Object> searchMap) {
		try {
			commonDao.selectNoReturn(searchMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void selectNoReturn(String sqlId, Map<String, Object> searchMap) {
		try {
			commonDao.selectNoReturn(sqlId, searchMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	 
}
