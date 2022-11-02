package com.waremec.wpt.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.waremec.framework.dao.CommonDao;
import com.waremec.wpt.admin.common.domain.Combo;

@Repository
public class ComboDao extends CommonDao {
	public List<Combo> findList(Map<String, Object> map){
		return  (List<Combo> ) this.getSqlMapClientTemplate().queryForList("Combo.findList", map);
	}
}
