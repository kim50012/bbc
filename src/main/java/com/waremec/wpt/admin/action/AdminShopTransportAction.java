package com.waremec.wpt.admin.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.PageData;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.framework.utilities.MapUtil;
import com.waremec.framework.utilities.StringUtil;
import com.waremec.wpt.admin.common.domain.Combo;
import com.waremec.wpt.admin.common.service.ComboService;
import com.waremec.wpt.admin.domain.AdminMap;
import com.waremec.wpt.admin.service.ShopService;
import com.waremec.wpt.admin.service.TransportService;

@Controller("adminShopTransportAction")
@Scope(ScopeType.prototype)
public class AdminShopTransportAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	@Resource
	private TransportService transportService;
	// 店铺id
	private Integer shopId;

	// [运费模板] 运费模板ID TRANS_SHEET_ID
	private String transSheetId = "";
	// [运费模板] 运费模板名称 TRANS_SHEET_NM
	private String transSheetName = "";
	// Tree Level 省市等级区分
	private String areaLevel = "";
	// Tree Level 省市等级区分
	private String areaParentId = "";
	// 指定区域
	private String area = "";
	// 运费
	private String transFee = "";
	// 运费续费
	private String transFeeAdd = "";
	// 调用存储过程的类型
	private String jobType = "";
	// 地区id(市)
	private String toAreaId = null;
	// 地区id(省)
	private String toAreaParentId = null;
	// 是否默认运费1：是 2：否
	private String isDefault = "";
	// 创建时间
	private String createdDt = "";
	// 创建时间
	private String modifiedDt = "";
	// 用于存储实际每页多少条数据
	private String pageEntity = "";
	// 0：使用 1：删除
	private String isDelete = "";
	// 判断 单选框状态
	private String areaValue = "";
	// 所有运费
	private String moneyAll = "";
	// 配送区域名称
	private String areaName = "";
	// [运费模板] 出发地点ID（市）
	private String fromAreaId;
	// [运费模板] 出发地点ID(省)
	private String fromAreaIdSheng;
	// [运费值] 1快递 2EMS 3平邮
	public String transTypeId;
	// map 市
	public String areaId = "";
	// 判断条件：LIST:查询列表 BYID:点击编辑
	private String flag = "";

	//

	@Resource
	private ComboService comboService;
	@Resource
	private ShopService shopService;
	
	/** 
	* 跳转到运费标准管理页面
	* @return
	*/
	public String sheetList() {
		// 查询出模板列表
		shopId = getBackSessionShopId();
		
		List<Combo> sheetComboList = comboService.getSheetListCombo(shopId);
		request.put("sheetComboList", sheetComboList);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("shopId", shopId);
		map.put("transSheetId", StringUtil.emptyToNull(transSheetId));
		map.put("transSheetName", StringUtil.emptyToNull(transSheetName));
		map.put("flag", "LIST");
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		List<Map<String, Object>> sheetList = commonService.selectList("AdminTransportSheet.transportSheetSel", map);
		if (!sheetList.isEmpty()) {
			for (int i = 0; i < sheetList.size(); i++) {
				MapUtil.convertClob2String(sheetList.get(i));
			}
		}
		request.put("sheetList", sheetList);
		 
		PageData page = new PageData();
		if (!sheetList.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(sheetList.get(0).get("TOTAL_CNT"));
			page = new PageData(pageCurr,pageUnit, totalCount , sheetList);
		}
		
		request.put("page", page);
		
		// t.setSubList(map);
		return "sheetList";
	}
	
	public String sheetListFragment() {
		// 查询出模板列表
		shopId = getBackSessionShopId();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("shopId", shopId);
		map.put("transSheetId", StringUtil.emptyToNull(transSheetId));
		map.put("transSheetName", StringUtil.emptyToNull(transSheetName));
		map.put("flag", "LIST");
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		List<Map<String, Object>> sheetList = commonService.selectList("AdminTransportSheet.transportSheetSel", map);
		if (!sheetList.isEmpty()) {
			for (int i = 0; i < sheetList.size(); i++) {
				MapUtil.convertClob2String(sheetList.get(i));
			}
		}
		request.put("sheetList", sheetList);
		 
		PageData page = new PageData();
		if (!sheetList.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(sheetList.get(0).get("TOTAL_CNT"));
			page = new PageData(pageCurr,pageUnit, totalCount , sheetList);
		}
		
		request.put("page", page);
		
		// t.setSubList(map);
		return "sheetListFragment";
	}

		/** 
		*  打开新建运费模板页面
		* @return
		*/
		public String createSheet() {
			shopId = getBackSessionShopId();
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("areaParentId", StringUtil.emptyToNull(areaParentId));
			map.put("areaLevl", 1);
			
			List<Map<String, Object>> provinceList = commonService.selectList("AdminTransportSheet.shengAll", map);
			
			request.put("provinceList", provinceList);
			
			return "createSheet";
		}
 
		// 运费模板创建
		public String save() {
			shopId = getBackSessionShopId();
			String ret = "success";
			try {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("shopId", shopId);
				map.put("transSheetId", transSheetId);
				map.put("fromAreaId", fromAreaId);
				map.put("transTypeId", transTypeId);
				map.put("toAreaId", toAreaId);
				map.put("toAreaParentId", toAreaParentId);
				map.put("isDefault", 2);
				map.put("transFee", transFee);
				map.put("transFeeAdd", transFeeAdd);
				map.put("modifiedDt", StringUtil.emptyToNull(modifiedDt));
				map.put("createdDt", createdDt);
				map.put("transSheetName", transSheetName);
				map.put("area", area);
				map.put("jobType", jobType);
				map.put("isDelete", 0);
				Map<String, Object> save = commonService.select("AdminTransportSheet.TRANSPORT_INSERT", map);
			} catch (Exception e) {
				e.printStackTrace();
				ret = "fail";
			}
			Map<String, Object> returnMap = new HashMap<String, Object>();
			returnMap.put("result", ret);
			renderJSON(returnMap);

			return NONE;
		}
		
		/** 
		*打开修改运费模板页面
		* @return
		*/
		public String modifySheet() {
			shopId = getBackSessionShopId();
			
		
			
			// 根据id查找运费模板
			Map<String, Object> map3 = new HashMap<String, Object>();
			map3.put("shopId", shopId);
			map3.put("transSheetId", transSheetId);
			map3.put("flag", "BYID");
			map3.put("pageCurr", pageCurr);
			map3.put("pageUnit", pageUnit);
			List<Map<String, Object>> transportList = commonService.selectList("AdminTransportSheet.transportSheetSel", map3);
			request.put("transportList", transportList);
			
			Integer provinceId = (Integer)transportList.get(0).get("PROVINCE_ID");
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("areaParentId", StringUtil.emptyToNull(areaParentId));
			map.put("areaLevl", 1);
			List<Map<String, Object>> provinceList = commonService.selectList("AdminTransportSheet.shengAll", map);
			request.put("provinceList", provinceList);
			
			AdminMap adminMap = new AdminMap();
			adminMap.setAreaParentId(provinceId + "");
			adminMap.setAreaLevel("2");
			List<AdminMap> cityList = shopService.selectAdminMapByID("Shop.getAdminMapById", adminMap) ;
			request.put("cityList", cityList);
			
			return "modifySheet";
		}
	
	
	
	public String deleteSheet() {
		shopId = getBackSessionShopId();
		
		boolean success = true;
		String err_msg = "";
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("shopId", shopId);
			map.put("transSheetId", transSheetId);
			map.put("jobType", "D");
			commonService.select("AdminTransportSheet.TRANSPORT_INSERT", map);
		} catch (Exception e) {
			logger.error(e.getMessage());
			success = false;
			err_msg = e.getMessage();
		}
		
		 Map<String,Object> rtnMap = new HashMap<String,Object>();
			
		 rtnMap.put("success", success);
		 rtnMap.put("err_msg", err_msg);
		 
		 renderJSON(rtnMap);
		 
		return NONE;
	}
	
	public String areaList(){
		shopId = getBackSessionShopId();
		Integer type = IntegerUtils.valueOf(getRequest().getParameter("type"));
		Integer areaParentId = IntegerUtils.valueOf(getRequest().getParameter("areaParentId"));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("areaParentId", areaParentId);
		List<Map<String, Object>> areaList ;
		
		if(type == 0){
			areaList = commonService.selectList("AdminTransportSheet.updateNOSheng", map);
		}else{
			areaList = commonService.selectList("AdminTransportSheet.updateNOShi", map);
		}
		
		request.put("areaList", areaList);
		
		return "areaList";
	}
	public String areaModifyList(){
		
		shopId = getBackSessionShopId();
		Integer type = IntegerUtils.valueOf(getRequest().getParameter("type"));
		//Integer areaParentId = IntegerUtils.valueOf(getRequest().getParameter("areaParentId"));
		
		List<Map<String, Object>> areaList;
		if(type == 0){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("areaParentId", areaParentId);
			areaList = commonService.selectList("AdminTransportSheet.updateNOSheng", map);
		}else{
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("areaParentId", areaParentId);
			map.put("areaId", areaId);
			areaList = commonService.selectList("AdminTransportSheet.updateNOShi", map);
		}
		
		request.put("areaList", areaList);
		
		Map<String, Object> map3 = new HashMap<String, Object>();
		map3.put("shopId", shopId);
		map3.put("transSheetId", transSheetId);
		map3.put("flag", "BYID");
		map3.put("pageCurr", pageCurr);
		map3.put("pageUnit", pageUnit);
		List<Map<String, Object>> transport = commonService.selectList("AdminTransportSheet.transportSheetSel", map3);
		request.put("transport", transport);
		
		return "areaModifyList";
	}
	/////////////////////////////////////////////////////

	/*public String transportSheet() {
		// 查询出模板列表
		shopId = getBackSessionShopId();
		
		List<Combo> sheetComboList = comboService.getSheetListCombo(shopId);
		request.put("sheetComboList", sheetComboList);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("shopId", shopId);
		map.put("transSheetId", StringUtil.emptyToNull(transSheetId));
		map.put("flag", "LIST");
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		List<Map<String, Object>> sheetList = commonService.selectList("AdminTransportSheet.transportSheetSel", map);
		if (!sheetList.isEmpty()) {
			for (int i = 0; i < sheetList.size(); i++) {
				MapUtil.convertClob2String(sheetList.get(i));
			}
		}
		request.put("sheetList", sheetList);
		 
		PageData page = new PageData();
		if (!sheetList.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(sheetList.get(0).get("TOTAL_CNT"));
			page = new PageData(pageCurr,pageUnit, totalCount , sheetList);
		}
		
		request.put("page", page);
				
		return "transportSheet";
	}

	// 打开新建页面
	public String transportSheetCreate() {
		shopId = getBackSessionShopId();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("areaParentId", StringUtil.emptyToNull(areaParentId));
		map.put("areaLevl", 1);
		
		List<Map<String, Object>> provinceList = commonService.selectList("AdminTransportSheet.shengAll", map);
		
		request.put("provinceList", provinceList);
		
		return "transportSheetCreate";
	}

	

	// 打开修改页面
	public String transportSheetUpdate() {
		shopId = getBackSessionShopId();
		// 加载区域信息
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("areaParentId", null);
		map.put("areaLevl", 1);
		List<Map<String, Object>> shengAll = commonService.selectList("AdminTransportSheet.shengAll", map);
		request.put("shengAll", shengAll);

		// 得到出发地点对应的省份Id
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("shopId", shopId);
		map2.put("transSheetId", transSheetId);
		map2.put("fromAreaId", fromAreaId);
		List<Map<String, Object>> shiAll = commonService.selectList("AdminTransportSheet.fromAreaIdSel", map2);
		request.put("shiAll", shiAll);
		// 根据id查找运费模板
		Map<String, Object> map3 = new HashMap<String, Object>();
		map3.put("shopId", shopId);
		map3.put("transSheetId", transSheetId);
		map3.put("flag", "BYID");
		map3.put("pageCurr", pageCurr);
		map3.put("pageUnit", pageUnit);
		List<Map<String, Object>> transport = commonService.selectList("AdminTransportSheet.transportSheetSel", map3);
		request.put("transport", transport);

		return "transportSheetUpdate";
	}

	public String checkSheng() {
		shopId = getBackSessionShopId();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("areaParentId", areaParentId);
		List<Map<String, Object>> list = commonService.selectList("AdminTransportSheet.updateNOSheng", map);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", list);
		renderJSON(returnMap);

		return NONE;
	}

	public String checkShi() {
		shopId = getBackSessionShopId();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("areaParentId", areaParentId);
		map.put("areaId", StringUtil.emptyToNull(areaId));
		List<Map<String, Object>> list = commonService.selectList("AdminTransportSheet.updateNOShi", map);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", list);
		renderJSON(returnMap);

		return NONE;
	}

	public String update() {
		shopId = getBackSessionShopId();
		String ret = "success";
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("shopId", shopId);
			map.put("transSheetId", transSheetId);
			map.put("fromAreaId", fromAreaId);
			map.put("transTypeId", transTypeId);
			map.put("toAreaId", toAreaId);
			map.put("toAreaParentId", toAreaParentId);
			map.put("isDefault", 2);
			map.put("transFee", transFee);
			map.put("transFeeAdd", transFeeAdd);
			map.put("modifiedDt", modifiedDt);
			map.put("createdDt", createdDt);
			transSheetName = new String(transSheetName.getBytes("ISO-8859-1"), "UTF-8");
			map.put("transSheetName", transSheetName);
			map.put("area", area);
			map.put("jobType", "U");
			map.put("isDelete", 0);
			Map<String, Object> update = commonService.select("AdminTransportSheet.TRANSPORT_INSERT", map);

		} catch (Exception e) {
			e.printStackTrace();
			ret = "fail";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);

		renderJSON(returnMap);

		return NONE;
	}

	public String delete() {
		shopId = getBackSessionShopId();
		String ret = "success";
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("shopId", shopId);
			map.put("transSheetId", transSheetId);
			jobType = "D";
			map.put("jobType", jobType);
			Map<String, Object> delete = commonService.select("AdminTransportSheet.TRANSPORT_INSERT", map);
		} catch (Exception e) {
			e.printStackTrace();
			ret = "fail";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);

		renderJSON(returnMap);

		return NONE;
	}*/

	public Integer getShopId() {
		return shopId;
	}

	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}

	public String getTransSheetId() {
		return transSheetId;
	}

	public void setTransSheetId(String transSheetId) {
		this.transSheetId = transSheetId;
	}

	public String getAreaLevel() {
		return areaLevel;
	}

	public void setAreaLevel(String areaLevel) {
		this.areaLevel = areaLevel;
	}

	public String getJobType() {
		return jobType;
	}

	public void setJobType(String jobType) {
		this.jobType = jobType;
	}

	public String getAreaParentId() {
		return areaParentId;
	}

	public void setAreaParentId(String areaParentId) {
		this.areaParentId = areaParentId;
	}

	public String getAreaValue() {
		return areaValue;
	}

	public void setAreaValue(String areaValue) {
		this.areaValue = areaValue;
	}

	public String getTransFee() {
		return transFee;
	}

	public void setTransFee(String transFee) {
		this.transFee = transFee;
	}

	public String getTransTypeId() {
		return transTypeId;
	}

	public void setTransTypeId(String transTypeId) {
		this.transTypeId = transTypeId;
	}

	public String getToAreaId() {
		return toAreaId;
	}

	public void setToAreaId(String toAreaId) {
		this.toAreaId = toAreaId;
	}

	public String getToAreaParentId() {
		return toAreaParentId;
	}

	public void setToAreaParentId(String toAreaParentId) {
		this.toAreaParentId = toAreaParentId;
	}

	public String getTransFeeAdd() {
		return transFeeAdd;
	}

	public void setTransFeeAdd(String transFeeAdd) {
		this.transFeeAdd = transFeeAdd;
	}

	public String getIsDefault() {
		return isDefault;
	}

	public void setIsDefault(String isDefault) {
		this.isDefault = isDefault;
	}

	public String getCreatedDt() {
		return createdDt;
	}

	public void setCreatedDt(String createdDt) {
		this.createdDt = createdDt;
	}

	public String getModifiedDt() {
		return modifiedDt;
	}

	public void setModifiedDt(String modifiedDt) {
		this.modifiedDt = modifiedDt;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getTransSheetName() {
		return transSheetName;
	}

	public void setTransSheetName(String transSheetName) {
		this.transSheetName = transSheetName;
	}

	public String getPageEntity() {
		return pageEntity;
	}

	public void setPageEntity(String pageEntity) {
		this.pageEntity = pageEntity;
	}

	public String getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}

	public String getMoneyAll() {
		return moneyAll;
	}

	public void setMoneyAll(String moneyAll) {
		this.moneyAll = moneyAll;
	}

	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public String getFromAreaId() {
		return fromAreaId;
	}

	public void setFromAreaId(String fromAreaId) {
		this.fromAreaId = fromAreaId;
	}

	public String getFromAreaIdSheng() {
		return fromAreaIdSheng;
	}

	public void setFromAreaIdSheng(String fromAreaIdSheng) {
		this.fromAreaIdSheng = fromAreaIdSheng;
	}

	public String getAreaId() {
		return areaId;
	}

	public void setAreaId(String areaId) {
		this.areaId = areaId;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

}
