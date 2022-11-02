package com.waremec.weixin.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.waremec.framework.common.exception.ProcedureBizException;
import com.waremec.framework.dao.CommonDao;
import com.waremec.weixin.domain.material.FileItem;

/** 
* @Package com.waremec.weixin.dao 
* @FileName WeixinMediaDao
* @Description  
* @author taebem 
* @date 2015年5月7日 下午4:07:16 
*  
*/
@Repository
public class WeixinMediaDao extends CommonDao {

	@SuppressWarnings({ "unchecked", "deprecation" })
	public Integer insertDownloadedMedia(FileItem item) {
		Map<String,Object> resultmap = (Map<String,Object>) getSqlMapClientTemplate().queryForObject("WeixinMedia.insertDownloadedMedia", item);
		
		if(!resultmap.isEmpty()){
			String OUT_ERR_MSG = (String)resultmap.get("OUT_ERR_MSG");
			Integer fileId = (Integer)resultmap.get("OUT_WFILE_ID");
			
			if(!"S".equals(OUT_ERR_MSG)){
				throw new ProcedureBizException(OUT_ERR_MSG);
			}else{
				return fileId;
			}
		}else{
			throw new ProcedureBizException("存储没有返回数据");
		}
		
	}

}
