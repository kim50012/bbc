package com.waremec.weixin.dao;

import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Repository;

import com.waremec.framework.common.exception.ProcedureBizException;
import com.waremec.framework.dao.CommonDao;
import com.waremec.framework.utilities.MapUtil;

/** 
* @Package com.waremec.weixin.dao 
* @FileName WeixinLetterDao
* @Description  
* @author taebem 
* @date 2015年5月7日 下午4:07:09 
*  
*/
@Repository
public class WeixinLetterDao extends CommonDao {
	
	@SuppressWarnings({ "unchecked", "deprecation" })
	public Map<String, Object> selectLetterInfoById(Integer letterId) {
		 Map<String, Object> result = (Map<String, Object>) getSqlMapClientTemplate().queryForObject("WeixinLetter.selectLetterInfoById", letterId);
		 
		 if(result.isEmpty()){
			 throw new ProcedureBizException("Letter Info is Empty");
		 }
		 
		return result;
	}
	
	@SuppressWarnings("deprecation")
	public void insertLetter(Map<String, Object> map){
		try {
			getSqlMapClientTemplate().queryForObject("WeixinLetter.insertLetter", map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
