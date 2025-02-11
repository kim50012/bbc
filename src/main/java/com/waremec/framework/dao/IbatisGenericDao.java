package com.waremec.framework.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.util.Assert;

import com.waremec.framework.common.Page;

public class IbatisGenericDao extends SqlMapClientDaoSupport{
    public static final String DOT = ".";
    public static final String SQLID_INSERT = ".insert";
    public static final String SQLID_UPDATE = ".update";
    public static final String SQLID_UPDATE_PK = ".updateByPK";
    public static final String SQLID_DELETE = ".delete";
    public static final String SQLID_DELETE_PK = ".deleteByPK";
    public static final String SQLID_DELETE_CRITERIA = ".deleteByCriteria";
    public static final String SQLID_TRUNCATE = ".truncate";
    public static final String SQLID_EXISTS = ".exists";
    public static final String SQLID_EXISTS_PK = ".existsByPK";
    public static final String SQLID_SELECT = ".select";
    public static final String SQLID_SELECT_PK = ".selectByPK";
    public static final String SQLID_SELECT_MAP = ".selectByMap";
    public static final String SQLID_SELECT_SQL = ".selectBySql";
    public static final String SQLID_SELECT_FK = ".selectByFk";
    public static final String SQLID_SELECT_PAGE = ".selectPage";
    public static final String SQLID_COUNT = ".count";
    public static final String SQLID_COUNT_MAP = ".countByMap";
    public static final String SQLID_PAGE_COUNT = ".pageCount";
    public static final String SQLID_PAGE_QUERY = ".pageQuery";
    public static final String SQLID_SELECT_CRITERIA = ".selectByCriteria";
    public static final String SQLID_COUNT_CRITERIA = ".countByCriteria";
    protected Log logger = LogFactory.getLog(super.getClass());

    @SuppressWarnings("unchecked")
    public <E> E get(Class<E> entityClass, Object id){
	Assert.notNull(id, "id must not null.");
	Object o = getSqlMapClientTemplate().queryForObject(entityClass.getSimpleName() + SQLID_SELECT_PK, id);
	return (E) o;
    }

    @SuppressWarnings("unchecked")
    public <E> Map<String, Object> getMap(Class<E> entityClass, String sqlID, Object params){
	return (Map<String, Object>) getSqlMapClientTemplate().queryForObject(entityClass.getSimpleName() + DOT + sqlID, params);
    }

    public <E> boolean isExists(Class<E> entityClass, Object id){
	Assert.notNull(id, "id must not null.");
	Boolean exists = (Boolean) getSqlMapClientTemplate().queryForObject(entityClass.getSimpleName() + SQLID_EXISTS_PK, id);
	return Boolean.TRUE.equals(exists);
    }

    public void insert(Object o){
	insert(o.getClass().getSimpleName() + SQLID_INSERT, o);
    }

    public <E> Object insert(Class<E> entityClass, Object entity){
	return insert(entityClass.getSimpleName() + SQLID_INSERT, entity);
    }

    public Object insert(String sql, Object entity){
	Assert.notNull(sql);
	logger.debug(sql);
	return getSqlMapClientTemplate().insert(sql, entity);
    }

    public void update(Object o){
	update(o.getClass().getSimpleName() + SQLID_UPDATE, o);
    }

    public <E> int update(Class<E> entityClass, Object entity){
	return update(entityClass.getSimpleName() + SQLID_UPDATE, entity);
    }

    public int update(String sql, Object entity){
	Assert.notNull(sql);
	logger.debug(sql);
	return super.getSqlMapClientTemplate().update(sql, entity);
    }

    public void remove(Object o){
	remove(o.getClass().getSimpleName() + SQLID_DELETE, o);
    }

    public int remove(String sql, Object values){
	return getSqlMapClientTemplate().delete(sql, values);
    }

    public <E> void removeByPk(Class<E> entityClass, Object id){
	getSqlMapClientTemplate().delete(entityClass.getSimpleName() + SQLID_DELETE_PK, id);
    }

    public Page pagedQuery(String sql, int pageNo, Object values){
	return pagedQuery(sql, pageNo, 10, values);
    }

    public Page pagedQuery(String sql, int pageNo, int pageSize, Object values){
	String countSql = "select count(*) from (" + sql + ") xCount";
	return pagedQuery(sql, countSql, pageNo, pageSize, values);
    }

    @SuppressWarnings("rawtypes")
    public Page pagedQuery(String sql, String countSql, int pageNo, int pageSize, Object values){
	Assert.notNull(sql, "sql must not null");
	Assert.notNull(countSql, "countSql must not null");
	Assert.isTrue(pageNo >= 1, "pageNo should start from 1");
	int totalCount = getTotalCount(countSql, values);
	if (totalCount < 1)
	    return new Page();
	List list = new ArrayList();
	list = findBySql(sql, pageNo, pageSize, values);
	pageNo = Page.getTotalPageNo(pageNo, pageSize, totalCount);
	int startIndex = Page.getStartOfPage(pageNo, pageSize);
	return new Page(startIndex, totalCount, pageSize, list);
    }

    public int getTotalCount(String sql, Object values){
	Integer totalCount = (Integer) getSqlMapClientTemplate().queryForObject(sql, values);
	return totalCount.intValue();
    }

    @SuppressWarnings("rawtypes")
    public List findBySql(String sql, int pageNo, int pageSize){
	return findBySql(sql, pageNo, pageSize, null);
    }

    @SuppressWarnings("rawtypes")
    public List findBySql(String sql, int pageNo, int pageSize, Object values){
	int startIndex = (pageNo - 1) * pageSize;
	return getSqlMapClientTemplate().queryForList(sql, values, startIndex, pageSize);
    }

    public <E> List<E> getAll(Class<E> entityClass){
	return getAll(entityClass, null);
    }

    @SuppressWarnings("unchecked")
    public <E> List<E> getAll(Class<E> entityClass, Object entity){
	return getAll(entityClass.getSimpleName() + SQLID_SELECT, entity);
    }

    @SuppressWarnings("rawtypes")
    public List getAll(String sql, Object entity){
	Assert.notNull(sql, "sql must not null.");
	logger.debug(sql);
	return getSqlMapClientTemplate().queryForList(sql, entity);
    }

    @SuppressWarnings("unchecked")
    public <E> List<E> find(Class<E> entityClass, Map<String, Object> map){
	if (map == null) {
	    return getSqlMapClientTemplate().queryForList(entityClass.getSimpleName() + SQLID_SELECT, null);
	}
	return getSqlMapClientTemplate().queryForList(entityClass.getSimpleName() + SQLID_SELECT_MAP, map);
    }
}
