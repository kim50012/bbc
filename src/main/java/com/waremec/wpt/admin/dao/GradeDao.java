/**   
* @Title: GradeDao.java 
* @Package com.waremec.wpt.admin.dao 
* @Description:  
* @author taebem
* @date 2015年7月3日 上午8:41:03 
* @version V1.0   
*/
package com.waremec.wpt.admin.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.waremec.framework.dao.CommonDao;
import com.waremec.wpt.admin.domain.AdminGrade;

/** 
 * @Package com.waremec.wpt.admin.dao 
 * @FileName GradeDao
 * @Description  
 * @author taebem 
 * @date 2015年7月3日 上午8:41:03 
 *  
 */
@Repository
public class GradeDao extends CommonDao {

	/** 
	* 新增,修改,删除-等级
	* @param grade
	*/
	public void saveGrade(AdminGrade grade) {
		// TODO Auto-generated method stub
		getSqlMapClientTemplate().insert("Grade.saveGrade", grade);
	}

	/** 
	* 根据店铺ID获取所有等级列表
	* @param shopId
	*/
	public  List<AdminGrade>  selectGradeListByShopId(Integer shopId) {
		// TODO Auto-generated method stub
		return (List<AdminGrade>) getSqlMapClientTemplate().queryForList("Grade.selectGradeListByShopId", shopId);
	}
	
	/** 
	 * 根据ID获取等级
	 * @param grade AdminGrade
	 */
	public  AdminGrade  selectGradeById(AdminGrade grade) {
		// TODO Auto-generated method stub
		return (AdminGrade) getSqlMapClientTemplate().queryForObject("Grade.selectGradeById", grade);
	}
	/** 
	 * 查询出当前创建等级的下一个等级
	 * @param grade AdminGrade
	 */
	public  AdminGrade  selectNextHighLevelGrade(AdminGrade grade) {
		// TODO Auto-generated method stub
		return (AdminGrade) getSqlMapClientTemplate().queryForObject("Grade.selectNextHighLevelGrade", grade);
	}
	/** 
	 * 查询出当前创建等级的上一个等级
	 * @param grade AdminGrade
	 */
	public  AdminGrade  selectPrevLowLevelGrade(AdminGrade grade) {
		// TODO Auto-generated method stub
		return (AdminGrade) getSqlMapClientTemplate().queryForObject("Grade.selectPrevLowLevelGrade", grade);
	}
	 

}
