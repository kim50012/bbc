/**   
 * @Title: FileDao.java 
 * @Package com.waremec.wpt.admin.dao 
 * @Description:  
 * @author taebem
 * @date 2015年6月17日 下午12:33:12 
 * @version V1.0   
 */
package com.waremec.wpt.admin.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Repository;

import com.waremec.framework.common.exception.ProcedureBizException;
import com.waremec.framework.dao.CommonDao;

/**
 * @Package com.waremec.wpt.admin.dao
 * @FileName FileDao
 * @Description
 * @author taebem
 * @date 2015年6月17日 下午12:33:12
 * 
 */
@Repository
public class FileDao extends CommonDao {

	/** 
	*
	* @param type
	* @param id
	* @return
	*/
	public String selectImgPathById(String type, Integer id) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("type", type);
		map.put("id", id);
		
		Map<String,Object> result = (Map<String,Object>)getSqlMapClientTemplate().queryForObject("File.selectImgPathById", map);
			
		String imgUrl = (String)result.get("IMG_URL");
		return imgUrl;
	}
}
