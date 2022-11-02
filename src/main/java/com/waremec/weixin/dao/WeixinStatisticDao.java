/**   
 * @Title: WeixinStatisticDao.java 
 * @Package com.waremec.weixin.dao 
 * @Description:  
 * @author taebem
 * @date 2015年6月24日 下午1:49:15 
 * @version V1.0   
 */
package com.waremec.weixin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.waremec.framework.dao.CommonDao;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.domain.statistic.ArticleDetail;
import com.waremec.weixin.domain.statistic.ArticleSummary;
import com.waremec.weixin.domain.statistic.ArticleTotal;
import com.waremec.weixin.domain.statistic.InterfaceSummary;
import com.waremec.weixin.domain.statistic.InterfaceSummaryHour;
import com.waremec.weixin.domain.statistic.UpstreamMsg;
import com.waremec.weixin.domain.statistic.UserCumulate;
import com.waremec.weixin.domain.statistic.UserRead;
import com.waremec.weixin.domain.statistic.UserShare;
import com.waremec.weixin.domain.statistic.UserSummary;

/**
 * @Package com.waremec.weixin.dao
 * @FileName WeixinStatisticDao
 * @Description
 * @author taebem
 * @date 2015年6月24日 下午1:49:15
 * 
 */
@Repository
public class WeixinStatisticDao extends CommonDao {

//	private static int LOG_SIZE = 2000;
//	private final transient Log logger = LogFactory.getLog(this.getClass());
	
	private static  final String SYS_ID = "sysId";
	private static  final String ITEM = "item";
	private static  final String DETAIL = "detail";

	/**
	 * 用户分析数据接口 - 保存用户增减数据
	 * @param appInfo 公众账号信息
	 * @param list List<UserSummary> 用户增减数据列表
	 */
	@SuppressWarnings("deprecation")
	public void insertUserSummary(AppInfo appInfo, List<UserSummary> list) {
		Map<String, Object> map = new HashMap<String, Object>();

		for (int i = 0; i < list.size(); i++) {

			map.clear();
			map.put(SYS_ID, appInfo.getSysId());
			map.put(ITEM, list.get(i));

			super.getSqlMapClientTemplate().insert("WeixinStatistic.insertUserSummary", map);
//			if (((i + 1) % LOG_SIZE == 0) || (i + 1 == list.size())) {
//				logger.info("insertUserSummary DB inserted " + (i + 1) + " rows");
//			}
		}

//		logger.info("insertUserSummary DB total inserted " + list.size() + " rows");
	}

	/**
	 * 用户分析数据接口 - 保存累计用户数据
	 * @param appInfo 公众账号信息
	 * @param list List<UserCumulate> 累计用户数据列表
	 */
	@SuppressWarnings("deprecation")
	public void insertUserCumulate(AppInfo appInfo, List<UserCumulate> list) {
		Map<String, Object> map = new HashMap<String, Object>();

		for (int i = 0; i < list.size(); i++) {

			map.clear();
			map.put(SYS_ID, appInfo.getSysId());
			map.put(ITEM, list.get(i));

			super.getSqlMapClientTemplate().insert("WeixinStatistic.insertUserCumulate", map);
//			if (((i + 1) % LOG_SIZE == 0) || (i + 1 == list.size())) {
//				logger.info("insertUserCumulate DB inserted " + (i + 1) + " rows");
//			}
		}

//		logger.info("insertUserCumulate DB total inserted " + list.size() + " rows");

	}

	
	/**
	 * 图文分析数据接口 - 保存图文群发每日数据
	 * @param appInfo 公众账号信息
	 * @param list List<ArticleSummary> 图文群发每日数据列表
	 */
	@SuppressWarnings("deprecation")
	public void insertArticleSummary(AppInfo appInfo, List<ArticleSummary> list) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		for (int i = 0; i < list.size(); i++) {
			
			map.clear();
			map.put(SYS_ID, appInfo.getSysId());
			map.put(ITEM, list.get(i));
			
			super.getSqlMapClientTemplate().insert("WeixinStatistic.insertArticleSummary", map);
//			if (((i + 1) % LOG_SIZE == 0) || (i + 1 == list.size())) {
//				logger.info("insertArticleSummary DB inserted " + (i + 1) + " rows");
//			}
		}
		
//		logger.info("insertArticleSummary DB total inserted " + list.size() + " rows");
		
	}
	/**
	 * 图文分析数据接口 - 保存图文群发总数据
	 * @param appInfo 公众账号信息
	 * @param list List<ArticleTotal> 图文群发总数据列表
	 */
	@SuppressWarnings("deprecation")
	public void insertArticleTotal(AppInfo appInfo, List<ArticleTotal> list) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		for (int i = 0; i < list.size(); i++) {
			
			ArticleTotal item = list.get(i);
			
			List<ArticleDetail> details = item.getDetails();
			
			for (int j = 0; j < details.size(); j++) {
				
				map.clear();
				map.put(SYS_ID, appInfo.getSysId());
				map.put(ITEM, item);
				map.put(DETAIL, details.get(j));
				
				super.getSqlMapClientTemplate().insert("WeixinStatistic.insertArticleTotal", map);
			}
			
//			if (((i + 1) % LOG_SIZE == 0) || (i + 1 == list.size())) {
//				logger.info("insertArticleTotal DB inserted " + (i + 1) + " rows");
//			}
		}
		
//		logger.info("insertArticleTotal DB total inserted " + list.size() + " rows");
		
	}
	/**
	 * 图文分析数据接口 - 保存图文统计数据
	 * @param appInfo 公众账号信息
	 * @param list List<UserRead> 图文统计数据列表
	 */
	@SuppressWarnings("deprecation")
	public void insertUserRead(AppInfo appInfo, List<UserRead> list) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		for (int i = 0; i < list.size(); i++) {
			
			map.clear();
			map.put(SYS_ID, appInfo.getSysId());
			map.put(ITEM, list.get(i));
			
			super.getSqlMapClientTemplate().insert("WeixinStatistic.insertUserRead", map);
//			if (((i + 1) % LOG_SIZE == 0) || (i + 1 == list.size())) {
//				logger.info("insertUserRead DB inserted " + (i + 1) + " rows");
//			}
		}
		
//		logger.info("insertUserRead DB total inserted " + list.size() + " rows");
		
	}
	/**
	 * 图文分析数据接口 - 保存图文统计分时数据
	 * @param appInfo 公众账号信息
	 * @param list List<UserRead> 图文统计分时数据列表
	 */
	@SuppressWarnings("deprecation")
	public void insertUserReadHour(AppInfo appInfo, List<UserRead> list) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		for (int i = 0; i < list.size(); i++) {
			
			map.clear();
			map.put(SYS_ID, appInfo.getSysId());
			map.put(ITEM, list.get(i));
			
			super.getSqlMapClientTemplate().insert("WeixinStatistic.insertUserReadHour", map);
//			if (((i + 1) % LOG_SIZE == 0) || (i + 1 == list.size())) {
//				logger.info("insertUserReadHour DB inserted " + (i + 1) + " rows");
//			}
		}
		
//		logger.info("insertUserReadHour DB total inserted " + list.size() + " rows");
		
	}
	
	/**
	 * 图文分析数据接口 - 保存图文分享转发数据
	 * @param appInfo 公众账号信息
	 * @param list List<UserShare> 图文分享转发数据列表
	 */
	@SuppressWarnings("deprecation")
	public void insertUserShare(AppInfo appInfo, List<UserShare> list) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		for (int i = 0; i < list.size(); i++) {
			
			map.clear();
			map.put(SYS_ID, appInfo.getSysId());
			map.put(ITEM, list.get(i));
			
			super.getSqlMapClientTemplate().insert("WeixinStatistic.insertUserShare", map);
//			if (((i + 1) % LOG_SIZE == 0) || (i + 1 == list.size())) {
//				logger.info("insertUserShare DB inserted " + (i + 1) + " rows");
//			}
		}
		
//		logger.info("insertUserRinsertUserShareeadHour DB total inserted " + list.size() + " rows");
		
	}
	/**
	 * 图文分析数据接口 - 保存图文分享转发分时数据
	 * @param appInfo 公众账号信息
	 * @param list List<UserShare> 图文分享转发分时数据列表
	 */
	@SuppressWarnings("deprecation")
	public void insertUserShareHour(AppInfo appInfo, List<UserShare> list) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		for (int i = 0; i < list.size(); i++) {
			
			map.clear();
			map.put(SYS_ID, appInfo.getSysId());
			map.put(ITEM, list.get(i));
			
			super.getSqlMapClientTemplate().insert("WeixinStatistic.insertUserShareHour", map);
//			if (((i + 1) % LOG_SIZE == 0) || (i + 1 == list.size())) {
//				logger.info("insertUserShareHour DB inserted " + (i + 1) + " rows");
//			}
		}
		
//		logger.info("insertUserShareHour DB total inserted " + list.size() + " rows");
		
	}
	
	

	/**
	 * 消息分析数据接口 - 保存消息发送概况数据
	 * @param appInfo 公众账号信息
	 * @param list List<UpstreamMsg> 消息发送概况数据列表
	 */
	@SuppressWarnings("deprecation")
	public void insertUpstreamMsg(AppInfo appInfo, List<UpstreamMsg> list) {
		Map<String, Object> map = new HashMap<String, Object>();

		for (int i = 0; i < list.size(); i++) {

			map.clear();
			map.put(SYS_ID, appInfo.getSysId());
			map.put(ITEM, list.get(i));

			super.getSqlMapClientTemplate().insert("WeixinStatistic.insertUpstreamMsg", map);
//			if (((i + 1) % LOG_SIZE == 0) || (i + 1 == list.size())) {
//				logger.info("insertUpstreamMsg DB inserted " + (i + 1) + " rows");
//			}
		}

//		logger.info("insertUpstreamMsg DB total inserted " + list.size() + " rows");

	}

	/**
	 * 消息分析数据接口 -  保存消息分送分时数据
	 * @param appInfo 公众账号信息
	 * @param list List<UpstreamMsg> 消息分送分时数据列表
	 */
	@SuppressWarnings("deprecation")
	public void insertUpstreamMsgHour(AppInfo appInfo, List<UpstreamMsg> list) {
		Map<String, Object> map = new HashMap<String, Object>();

		for (int i = 0; i < list.size(); i++) {

			map.clear();
			map.put(SYS_ID, appInfo.getSysId());
			map.put(ITEM, list.get(i));

			super.getSqlMapClientTemplate().insert("WeixinStatistic.insertUpstreamMsgHour", map);
//			if (((i + 1) % LOG_SIZE == 0) || (i + 1 == list.size())) {
//				logger.info("insertUpstreamMsgHour DB inserted " + (i + 1) + " rows");
//			}
		}

//		logger.info("insertUpstreamMsgHour DB total inserted " + list.size() + " rows");

	}

	/**
	 * 消息分析数据接口 - 保存消息发送周数据 
	 * @param appInfo 公众账号信息
	 * @param list List<UpstreamMsg> 消息发送周数据列表
	 */
	@SuppressWarnings("deprecation")
	public void insertUpstreamMsgWeek(AppInfo appInfo, List<UpstreamMsg> list) {
		Map<String, Object> map = new HashMap<String, Object>();

		for (int i = 0; i < list.size(); i++) {

			map.clear();
			map.put(SYS_ID, appInfo.getSysId());
			map.put(ITEM, list.get(i));

			super.getSqlMapClientTemplate().insert("WeixinStatistic.insertUpstreamMsgWeek", map);
//			if (((i + 1) % LOG_SIZE == 0) || (i + 1 == list.size())) {
//				logger.info("insertUpstreamMsgWeek DB inserted " + (i + 1) + " rows");
//			}
		}

//		logger.info("insertUpstreamMsgWeek DB total inserted " + list.size() + " rows");

	}

	/**
	 * 消息分析数据接口 - 保存消息发送月数据 
	 * @param appInfo 公众账号信息
	 * @param list List<UpstreamMsg> 消息发送月数据列表 
	 */
	@SuppressWarnings("deprecation")
	public void insertUpstreamMsgMonth(AppInfo appInfo, List<UpstreamMsg> list) {
		Map<String, Object> map = new HashMap<String, Object>();

		for (int i = 0; i < list.size(); i++) {

			map.clear();
			map.put(SYS_ID, appInfo.getSysId());
			map.put(ITEM, list.get(i));

			super.getSqlMapClientTemplate().insert("WeixinStatistic.insertUpstreamMsgMonth", map);
//			if (((i + 1) % LOG_SIZE == 0) || (i + 1 == list.size())) {
//				logger.info("insertUpstreamMsgMonth DB inserted " + (i + 1) + " rows");
//			}
		}

//		logger.info("insertUpstreamMsgMonth DB total inserted " + list.size() + " rows");

	}

	/**
	 * 消息分析数据接口 - 保存消息发送分布数据
	 * @param appInfo 公众账号信息
	 * @param list List<UpstreamMsg> 消息发送分布数据列表
	 */
	@SuppressWarnings("deprecation")
	public void insertUpstreamMsgDist(AppInfo appInfo, List<UpstreamMsg> list) {
		Map<String, Object> map = new HashMap<String, Object>();

		for (int i = 0; i < list.size(); i++) {

			map.clear();
			map.put(SYS_ID, appInfo.getSysId());
			map.put(ITEM, list.get(i));

			super.getSqlMapClientTemplate().insert("WeixinStatistic.insertUpstreamMsgDist", map);
//			if (((i + 1) % LOG_SIZE == 0) || (i + 1 == list.size())) {
//				logger.info("insertUpstreamMsgDist DB inserted " + (i + 1) + " rows");
//			}
		}

//		logger.info("insertUpstreamMsgDist DB total inserted " + list.size() + " rows");

	}

	/**
	 * 消息分析数据接口 - 保存消息发送分布周数据
	 * @param appInfo 公众账号信息
	 * @param list List<UpstreamMsg> 消息发送分布周数据列表
	 */ 
	@SuppressWarnings("deprecation")
	public void insertUpstreamMsgDistWeek(AppInfo appInfo, List<UpstreamMsg> list) {
		Map<String, Object> map = new HashMap<String, Object>();

		for (int i = 0; i < list.size(); i++) {

			map.clear();
			map.put(SYS_ID, appInfo.getSysId());
			map.put(ITEM, list.get(i));

			super.getSqlMapClientTemplate().insert("WeixinStatistic.insertUpstreamMsgDistWeek", map);
//			if (((i + 1) % LOG_SIZE == 0) || (i + 1 == list.size())) {
//				logger.info("insertUpstreamMsgDistWeek DB inserted " + (i + 1) + " rows");
//			}
		}

//		logger.info("insertUpstreamMsgDistWeek DB total inserted " + list.size() + " rows");

	}

	/**
	 * 消息分析数据接口 - 保存消息发送分布月数据
	 * @param appInfo 公众账号信息
	 * @param list List<UpstreamMsg> 消息发送分布月数据列表
	 */
	@SuppressWarnings("deprecation")
	public void insertUpstreamMsgDistMonth(AppInfo appInfo, List<UpstreamMsg> list) {
		Map<String, Object> map = new HashMap<String, Object>();

		for (int i = 0; i < list.size(); i++) {

			map.clear();
			map.put(SYS_ID, appInfo.getSysId());
			map.put(ITEM, list.get(i));

			super.getSqlMapClientTemplate().insert("WeixinStatistic.insertUpstreamMsgDistMonth", map);
//			if (((i + 1) % LOG_SIZE == 0) || (i + 1 == list.size())) {
//				logger.info("insertUpstreamMsgDistMonth DB inserted " + (i + 1) + " rows");
//			}
		}

//		logger.info("insertUpstreamMsgDistMonth DB total inserted " + list.size() + " rows");

	}
	
	/**
	 * 接口分析数据接口 - 保存接口分析数据
	 * @param appInfo 公众账号信息
	 * @param list List<InterfaceSummary> 接口分析数据列表
	 */
	@SuppressWarnings("deprecation")
	public void insertInterfaceSummary(AppInfo appInfo, List<InterfaceSummary> list) {
		Map<String, Object> map = new HashMap<String, Object>();

		for (int i = 0; i < list.size(); i++) {

			map.clear();
			map.put(SYS_ID, appInfo.getSysId());
			map.put(ITEM, list.get(i));

			super.getSqlMapClientTemplate().insert("WeixinStatistic.insertInterfaceSummary", map);
//			if (((i + 1) % LOG_SIZE == 0) || (i + 1 == list.size())) {
//				logger.info("insertInterfaceSummary DB inserted " + (i + 1) + " rows");
//			}
		}

//		logger.info("insertInterfaceSummary DB total inserted " + list.size() + " rows");

	}

	/**
	 * 接口分析数据接口 -保存接口分析分时数据
	 * @param appInfo 公众账号信息
	 * @param list List<InterfaceSummaryHour> 接口分析分时数据列表
	 */
	@SuppressWarnings("deprecation")
	public void insertInterfaceSummaryHour(AppInfo appInfo, List<InterfaceSummaryHour> list) {
		Map<String, Object> map = new HashMap<String, Object>();

		for (int i = 0; i < list.size(); i++) {

			map.clear();
			map.put(SYS_ID, appInfo.getSysId());
			map.put(ITEM, list.get(i));

			super.getSqlMapClientTemplate().insert("WeixinStatistic.insertInterfaceSummaryHour", map);
//			if (((i + 1) % LOG_SIZE == 0) || (i + 1 == list.size())) {
//				logger.info("insertInterfaceSummaryHour DB inserted " + (i + 1) + " rows");
//			}
		}

//		logger.info("insertInterfaceSummaryHour DB total inserted " + list.size() + " rows");

	}
	
	@SuppressWarnings("deprecation")
	public void insertShareTotal(AppInfo appInfo, List<ArticleTotal> list) {
		Map<String, Object> map = new HashMap<String, Object>();
		for (int i = 0; i < list.size(); i++) {
			ArticleTotal item = list.get(i);
			List<ArticleDetail> details = item.getDetails();
			for (int j = 0; j < details.size(); j++) {
				map.clear();
				map.put(SYS_ID, appInfo.getSysId());
				map.put(ITEM, item);
				map.put(DETAIL, details.get(j));
				super.getSqlMapClientTemplate().insert("WeixinStatistic.insertShareTotal", map);
			}
			
		}
		
	}
	
	
}
