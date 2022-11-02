package com.waremec.framework.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class BaseDaoImpl<E extends Serializable> extends IbatisGenericDao implements BaseDao<E> {

	protected final Log logger = LogFactory.getLog(super.getClass());
	protected Class<E> entityClass;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public BaseDaoImpl() {
		this.entityClass = ((Class) ((java.lang.reflect.ParameterizedType) super
				.getClass().getGenericSuperclass()).getActualTypeArguments()[0]);
	}

	@Override
	public Class<E> getEntityClass() {
		return  this.entityClass;
	}

	@Override
	public E get(Object id) {
		return super.get(this.entityClass, id);
	}
	
	@Override
	public Map<String,Object> getMap(String sqlID,Object params){
		 return super.getMap(entityClass, sqlID, params);
	 }

	@Override
	public boolean exists(Object id) {
		return super.isExists(this.entityClass, id);
	}

	@Override
	public void insert(E entity) {
		super.insert(this.entityClass,entity);
	}

	@Override
	public void update(E entity) {
		super.update(this.entityClass, entity);
	}

	@Override
	public void delete(Object o) {
		super.remove(o);
	}

	@Override
	public void deleteByPK(Object id) {
		super.removeByPk(this.entityClass, id);
	}

	@Override
	public void deleteByPK(Object[] ids)
	 {
	 if (ids != null)
	     for (Object id : ids)
	      super.removeByPk(this.entityClass, id);
	   }
	
	@Override
	public int count() {
		return 0;
	}


	@Override
	public List<E> findAll() {
		return super.getAll(this.entityClass);
	}
	
	@Override
	public List<E> findAll(E entity)
    {
     return super.getAll(this.entityClass, entity);
   }
	
	@Override
	public List<E> find(Map<String, Object> map)
    {
     return super.find(this.entityClass, map);
   }

	@Override
	public List<E> selectByMap(Map<String, Object> paramMap) {
		return null;
	}

}
