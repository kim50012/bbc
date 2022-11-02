/**   
* @Title: GradeService.java 
* @Package com.waremec.wpt.admin.service 
* @Description:  
* @author taebem
* @date 2015年7月3日 上午8:40:08 
* @version V1.0   
*/
package com.waremec.wpt.admin.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.wpt.admin.dao.GradeDao;
import com.waremec.wpt.admin.domain.AdminGrade;

/** 
 * @Package com.waremec.wpt.admin.service 
 * @FileName GradeService
 * @Description  
 * @author taebem 
 * @date 2015年7月3日 上午8:40:08 
 *  
 */
@Service
public class GradeService extends CommonServiceImpl implements CommonService {

	@Resource
	private GradeDao gradeDao;
	
	
	/** 
	* 根据店铺ID获取所有等级列表
	* @param shopId
	* @return
	*/
	public List<AdminGrade> getGradeListByShopId(Integer shopId){
		return gradeDao.selectGradeListByShopId(shopId);
	}
	
	
	/** 
	 * 根据ID获取等级
	 * @param grade AdminGrade
	 */
	public  AdminGrade  getGradeById(AdminGrade grade) {
		// TODO Auto-generated method stub
		return gradeDao.selectGradeById(grade);
	}
	
	
	/** 
	 * 查询出当前创建等级的下一个等级
	 * @param grade AdminGrade
	 */
	public  AdminGrade  getNextHighLevelGrade(AdminGrade grade) {
		// TODO Auto-generated method stub
		return  gradeDao.selectNextHighLevelGrade(grade);
	}
	/** 
	 * 查询出当前创建等级的上一个等级
	 * @param grade AdminGrade
	 */
	public  AdminGrade  getPrevLowLevelGrade(AdminGrade grade) {
		// TODO Auto-generated method stub
		return gradeDao.selectPrevLowLevelGrade(grade);
	}
	
	
	/** 
	* 新增等级
	* @param grade
	*/
	public void addGrade(AdminGrade grade){
		
		grade.setJobType("I");
		gradeDao.saveGrade(grade);
	}
	/** 
	 * 修改等级
	 * @param grade
	 */
	public void modifyGrade(AdminGrade grade){
		grade.setJobType("U");
		gradeDao.saveGrade(grade);
	}
	/** 
	 * 删除等级
	 * @param grade
	 */
	public void deleteGrade(AdminGrade grade){
		grade.setJobType("U");
		gradeDao.saveGrade(grade);
	}
	
}
