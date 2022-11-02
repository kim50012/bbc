package com.waremec.framework.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * GenericDao DAO层泛型接口，定义基本的DAO功能
 * 
 * 
 * @param <T>
 *            实体类
 * @param <PK>
 *            主键类，必须实现Serializable接口
 * 
 */
public interface BaseDao<E extends Serializable> {

	Class<E> getEntityClass();

	E get(Object pk);

	boolean exists(Object pk); 

	void insert(E entity);

	void update(E entity);

	void delete(Object paramObject);
	
	void deleteByPK(Object primaryKey);

	int count();
	
	List<E> findAll();
	
	List<E> findAll(E paramE);
	
	List<E> selectByMap(Map<String, Object> paramMap);

	Map<String, Object> getMap(String sqlID, Object params);

	void deleteByPK(Object[] ids);

	List<E> find(Map<String, Object> map);

	

}