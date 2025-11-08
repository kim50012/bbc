package com.waremec.framework.service;

import java.util.List;
import java.util.Map;


/**
 * @author jong
 *
 */
public interface CommonService {

	/**
	 * @param map
	 */
	void insert(Map<String, Object> map);

	/**
	 * @param sqlId
	 * @param map
	 */
	void insert(String sqlId, Map<String, Object> map);

	/**
	 * @param map
	 */
	void update(Map<String, Object> map);

	/**
	 * @param sqlId
	 * @param map
	 */
	void update(String sqlId, Map<String, Object> map);

	/**
	 * @param map
	 */
	void delete(Map<String, Object> map);

	/**
	 * @param sqlId
	 * @param map
	 */
	void delete(String sqlId, Map<String, Object> map);
	
	void selectNoReturn(Map<String, Object> searchMap);
	
	void selectNoReturn(String sqlId, Map<String, Object> searchMap);

	/**
	 * @param searchMap
	 * @return
	 */
	Map<String, Object> select(Map<String, Object> searchMap);

	/**
	 * @param sqlId
	 * @param searchMap
	 * @return
	 */
	/**
	 * @param sqlId
	 * @param searchMap
	 * @return
	 */
	Map<String, Object> select(String sqlId, Map<String, Object> searchMap);

	/**
	 * @param searchMap
	 * @return
	 */
	List<Map<String, Object>> selectList(Map<String, Object> searchMap);

	/**
	 * @param sqlId
	 * @param searchMap
	 * @return
	 */
	List<Map<String, Object>> selectList(String sqlId, Map<String, Object> searchMap);

	/**
	 * @param sqlId
	 * @param searchMap
	 * @return
	 */
	Object selectToObject(String sqlId, Map<String, Object> searchMap);

	/**
	 * @param sqlId
	 * @param searchMap
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	String selectString(String sqlId, Map searchMap);
	
	
	int selectListTotCnt(Map<String, Object> searchMap) ;
	
	int selectListTotCnt(String sqlId, Map<String, Object> searchMap);

	// ------------------- Oracle  관련 ---------------------//
	List<Map<String, Object>> selectListOracle(Map<String, Object> searchMap);
	List<Map<String, Object>> selectListOracle(String sqlId, Map<String, Object> searchMap);
	// ------------------- Oracle  관련 ---------------------//

	 
}