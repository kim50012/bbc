package com.waremec.wpt.front.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.waremec.framework.dao.CommonDao;
import com.waremec.wpt.front.domain.Counter;
import com.waremec.wpt.front.domain.PageUrlType;

@Repository
@SuppressWarnings("unchecked")
public class CounterDao extends CommonDao{

	public void saveCounter(Counter counter) {
		// TODO Auto-generated method stub
		
		getSqlMapClientTemplate().queryForObject("Counter.saveCounter",counter);
	}
	
	public List<PageUrlType> getPageUrlType() {
		// TODO Auto-generated method stub
		
		return (List<PageUrlType>) getSqlMapClientTemplate().queryForList("Counter.selectPageUrlType");
	}
	 
}
