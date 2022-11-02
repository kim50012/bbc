/**   
* @Title: WeixinStatisticService.java 
* @Package com.waremec.weixin.service 
* @Description:  
* @author taebem
* @date 2015年6月24日 下午1:48:43 
* @version V1.0   
*/
package com.waremec.weixin.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.weixin.dao.WeixinStatisticDao;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.domain.statistic.ArticleSummary;
import com.waremec.weixin.domain.statistic.ArticleTotal;
import com.waremec.weixin.domain.statistic.InterfaceSummary;
import com.waremec.weixin.domain.statistic.InterfaceSummaryHour;
import com.waremec.weixin.domain.statistic.UpstreamMsg;
import com.waremec.weixin.domain.statistic.UserCumulate;
import com.waremec.weixin.domain.statistic.UserRead;
import com.waremec.weixin.domain.statistic.UserShare;
import com.waremec.weixin.domain.statistic.UserSummary;
import com.waremec.weixin.exception.StatisticIFRequestParamsException;
import com.waremec.weixin.utils.WeixinStatisticUtils;

/** 
 * @Package com.waremec.weixin.service
 * @FileName WeixinStatisticService
 * @Description  
 * @author taebem 
 * @date 2015年6月24日 下午1:48:43 
 *  
 */
@Service
public class WeixinStatisticService extends CommonServiceImpl implements CommonService{

//	private final transient Log logger = LogFactory.getLog(this.getClass());
	
	
	
	@Resource
	private WeixinStatisticDao weixinStatisticDao;
	
	@Resource
	private WeixinService weixinService;
	
	/** 
	* 判断数据统计接口调用参数正确性
	* @param begin_date 获取数据的起始日期，begin_date和end_date的差值需小于“最大时间跨度”（比如最大时间跨度为1时，begin_date和end_date的差值只能为0，才能小于1），否则会报错
	* @param end_date 获取数据的结束日期，end_date允许设置的最大值为昨日
	* @param maxRange 最大时间跨度
	*/
	private void checkInputDate(String begin_date, String end_date,Integer maxRange){
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
			
			if(begin_date == null || end_date == null){
				throw new ParseException("",0);
			}
			
			Date startDate = sdf.parse(begin_date);
			Date endDate = sdf.parse(end_date);

			Calendar c = Calendar.getInstance();
			c.add(Calendar.DATE, -1);
			Date maximumDate = c.getTime();
			
			
			if(startDate.getTime() > endDate.getTime()){
				throw new StatisticIFRequestParamsException(StatisticIFRequestParamsException.StartDateGreaterEndDateError);
			}else if(endDate.getTime() > maximumDate.getTime()){
				throw new StatisticIFRequestParamsException(StatisticIFRequestParamsException.EndDateMaximumValueError);
			}else{
				int range = (int) ((endDate.getTime() - startDate.getTime()) / (3600 * 24 * 1000 ) + 1);
				
				if(range > maxRange){
					throw new StatisticIFRequestParamsException(StatisticIFRequestParamsException.DateRangeError, maxRange);
				}
			}
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			throw new StatisticIFRequestParamsException(StatisticIFRequestParamsException.DateFormatError);
		}
	}
	
	
	/************************************************************************************/
	/*******************************    用户分析数据接口      *******************************/
	/************************************************************************************/
	
	/** 
	* 与微信公众后台同步用户增减数据数据 - 最大时间跨度 7
	* @param appInfo 公众账号信息
	* @param begin_date 获取数据的起始日期
	* @param end_date 获取数据的结束日期，end_date允许设置的最大值为昨日
	*/
	public void syncUserSummary(AppInfo appInfo, String begin_date, String end_date){
		checkInputDate(begin_date, end_date, 7);
		
		String token = weixinService.getAccessToken(appInfo);
		
		List<UserSummary> list = WeixinStatisticUtils.getUserSummary(token,begin_date,end_date);
		
		weixinStatisticDao.insertUserSummary(appInfo, list);
	}
	
	/** 
	* 与微信公众后台同步累计用户数据 - 最大时间跨度 7
	* @param appInfo 公众账号信息
	* @param begin_date 获取数据的起始日期
	* @param end_date 获取数据的结束日期，end_date允许设置的最大值为昨日
	*/
	public void syncUserCumulate(AppInfo appInfo, String begin_date, String end_date){
		checkInputDate(begin_date, end_date, 7);
		
		String token = weixinService.getAccessToken(appInfo);
		
		List<UserCumulate> list = WeixinStatisticUtils.getUserCumulate(token,begin_date,end_date);
		
		weixinStatisticDao.insertUserCumulate(appInfo, list);
	}
	
	/************************************************************************************/
	/*******************************    图文分析数据接口      *******************************/
	/************************************************************************************/
	/** 
	* 与微信公众后台同步图文群发每日数据 - 最大时间跨度1
	* @param appInfo 公众账号信息
	* @param begin_date 获取数据的起始日期
	* @param end_date 获取数据的结束日期，end_date允许设置的最大值为昨日
	*/
	public void syncArticleSummary(AppInfo appInfo, String begin_date, String end_date){
		checkInputDate(begin_date, end_date, 1);
		
		String token = weixinService.getAccessToken(appInfo);
		
		List<ArticleSummary> list = WeixinStatisticUtils.getArticleSummary(token, begin_date, end_date);
		
		weixinStatisticDao.insertArticleSummary(appInfo, list);
	}
	
	/** 
	* 与微信公众后台同步图文群发总数据 - 最大时间跨度1
	* @param appInfo 公众账号信息
	* @param begin_date 获取数据的起始日期
	* @param end_date 获取数据的结束日期，end_date允许设置的最大值为昨日
	*/
	public void syncArticleTotal(AppInfo appInfo, String begin_date, String end_date){
		checkInputDate(begin_date, end_date, 1);
		System.out.println("1");
		String token = weixinService.getAccessToken(appInfo);
		
		List<ArticleTotal> list = WeixinStatisticUtils.getArticleTotal(token, begin_date, end_date);
		
		weixinStatisticDao.insertArticleTotal(appInfo, list);
	}
	
	/** 
	* 与微信公众后台同步图文统计数据 - 最大时间跨度3
	* @param appInfo 公众账号信息
	* @param begin_date 获取数据的起始日期
	* @param end_date 获取数据的结束日期，end_date允许设置的最大值为昨日
	*/
	public void syncUserRead(AppInfo appInfo, String begin_date, String end_date){
		checkInputDate(begin_date, end_date, 3);
		
		String token = weixinService.getAccessToken(appInfo);
		
		List<UserRead> list = WeixinStatisticUtils.getUserRead(token, begin_date, end_date);
		
		weixinStatisticDao.insertUserRead(appInfo, list);
	}
	
	/** 
	*  与微信公众后台同步图文统计分时数据 - 最大时间跨度1
	* @param appInfo 公众账号信息
	* @param begin_date 获取数据的起始日期
	* @param end_date 获取数据的结束日期，end_date允许设置的最大值为昨日
	*/
	public void syncUserReadHour(AppInfo appInfo, String begin_date, String end_date){
		checkInputDate(begin_date, end_date, 1);
		
		String token = weixinService.getAccessToken(appInfo);
		
		List<UserRead> list = WeixinStatisticUtils.getUserReadHour(token, begin_date, end_date);
		
		weixinStatisticDao.insertUserReadHour(appInfo, list);
	}
	
	/** 
	* 与微信公众后台同步图文分享转发数据 - 最大时间跨度7
	* @param appInfo 公众账号信息
	* @param begin_date 获取数据的起始日期
	* @param end_date 获取数据的结束日期，end_date允许设置的最大值为昨日
	*/
	public void syncUserShare(AppInfo appInfo, String begin_date, String end_date){
		checkInputDate(begin_date, end_date, 7);
		
		String token = weixinService.getAccessToken(appInfo);
		
		List<UserShare> list = WeixinStatisticUtils.getUserShare(token, begin_date, end_date);
		
		weixinStatisticDao.insertUserShare(appInfo, list);
	}
	
	/** 
	* 与微信公众后台同步图文分享转发分时数据 - 最大时间跨度7
	* @param appInfo 公众账号信息
	* @param begin_date 获取数据的起始日期
	* @param end_date 获取数据的结束日期，end_date允许设置的最大值为昨日
	*/
	public void syncUserShareHour(AppInfo appInfo, String begin_date, String end_date){
		checkInputDate(begin_date, end_date, 1);
		
		String token = weixinService.getAccessToken(appInfo);
		
		List<UserShare> list = WeixinStatisticUtils.getUserShareHour(token, begin_date, end_date);
		
		weixinStatisticDao.insertUserShareHour(appInfo, list);
	}
	/************************************************************************************/
	/*******************************    消息分析数据接口      *******************************/
	/************************************************************************************/
	/** 
	* 与微信公众后台同步消息发送概况数据 - 最大时间跨度7
	* @param appInfo 公众账号信息
	* @param begin_date 获取数据的起始日期
	* @param end_date 获取数据的结束日期，end_date允许设置的最大值为昨日
	*/
	public void syncUpstreamMsg(AppInfo appInfo, String begin_date, String end_date){
		checkInputDate(begin_date, end_date, 7);
		
		String token = weixinService.getAccessToken(appInfo);
		
		List<UpstreamMsg> list = WeixinStatisticUtils.getUpstreamMsg(token,begin_date,end_date);
		
		weixinStatisticDao.insertUpstreamMsg(appInfo, list);
	}
	/** 
	* 与微信公众后台同步消息分送分时数据 - 最大时间跨度1
	* @param appInfo 公众账号信息
	* @param begin_date 获取数据的起始日期
	* @param end_date 获取数据的结束日期，end_date允许设置的最大值为昨日
	*/
	public void syncUpstreamMsgHour(AppInfo appInfo, String begin_date, String end_date){
		checkInputDate(begin_date, end_date, 1);
		
		String token = weixinService.getAccessToken(appInfo);
		
		List<UpstreamMsg> list = WeixinStatisticUtils.getUpstreamMsgHour(token,begin_date,end_date);
		
		weixinStatisticDao.insertUpstreamMsgHour(appInfo, list);
	}
	/** 
	* 与微信公众后台同步消息发送周数据 - 最大时间跨度30
	* @param appInfo 公众账号信息
	* @param begin_date 获取数据的起始日期
	* @param end_date 获取数据的结束日期，end_date允许设置的最大值为昨日
	*/
	public void syncUpstreamMsgWeek(AppInfo appInfo, String begin_date, String end_date){
		checkInputDate(begin_date, end_date, 30);
		
		String token = weixinService.getAccessToken(appInfo);
		
		List<UpstreamMsg> list = WeixinStatisticUtils.getUpstreamMsgWeek(token,begin_date,end_date);
		
		weixinStatisticDao.insertUpstreamMsgWeek(appInfo, list);
	}
	/** 
	* 与微信公众后台同步消息发送月数据 - 最大时间跨度30
	* @param appInfo 公众账号信息
	* @param begin_date 获取数据的起始日期
	* @param end_date 获取数据的结束日期，end_date允许设置的最大值为昨日
	*/
	public void syncUpstreamMsgMonth(AppInfo appInfo, String begin_date, String end_date){
		checkInputDate(begin_date, end_date, 30);
		
		String token = weixinService.getAccessToken(appInfo);
		
		List<UpstreamMsg> list = WeixinStatisticUtils.getUpstreamMsgMonth(token,begin_date,end_date);
		
		weixinStatisticDao.insertUpstreamMsgMonth(appInfo, list);
	}
	/** 
	* 与微信公众后台同步消息发送分布数据 - 最大时间跨度15
	* @param appInfo 公众账号信息
	* @param begin_date 获取数据的起始日期
	* @param end_date 获取数据的结束日期，end_date允许设置的最大值为昨日
	*/
	public void syncUpstreamMsgDist(AppInfo appInfo, String begin_date, String end_date){
		checkInputDate(begin_date, end_date, 15);
		
		String token = weixinService.getAccessToken(appInfo);
		
		List<UpstreamMsg> list = WeixinStatisticUtils.getUpstreamMsgDist(token,begin_date,end_date);
		
		weixinStatisticDao.insertUpstreamMsgDist(appInfo, list);
	}
	/** 
	* 与微信公众后台同步消息发送分布周数据 - 最大时间跨度30
	* @param appInfo 公众账号信息
	* @param begin_date 获取数据的起始日期
	* @param end_date 获取数据的结束日期，end_date允许设置的最大值为昨日
	*/
	public void syncUpstreamMsgDistWeek(AppInfo appInfo, String begin_date, String end_date){
		checkInputDate(begin_date, end_date, 30);
		
		String token = weixinService.getAccessToken(appInfo);
		
		List<UpstreamMsg> list = WeixinStatisticUtils.getUpstreamMsgDistWeek(token,begin_date,end_date);
		
		weixinStatisticDao.insertUpstreamMsgDistWeek(appInfo, list);
	}
	/** 
	* 与微信公众后台同步消息发送分布月数据 - 最大时间跨度30
	* @param appInfo 公众账号信息
	* @param begin_date 获取数据的起始日期
	* @param end_date 获取数据的结束日期，end_date允许设置的最大值为昨日
	*/
	public void syncUpstreamMsgDistMonth(AppInfo appInfo, String begin_date, String end_date){
		checkInputDate(begin_date, end_date, 30);
		
		String token = weixinService.getAccessToken(appInfo);
		
		List<UpstreamMsg> list = WeixinStatisticUtils.getUpstreamMsgDistMonth(token,begin_date,end_date);
		
		weixinStatisticDao.insertUpstreamMsgDistMonth(appInfo, list);
	}
	
	/************************************************************************************/
	/*******************************    接口分析数据接口     *******************************/
	/************************************************************************************/
	/** 
	* 与微信公众后台同步接口分析数据 - 最大时间跨度 30
	* @param appInfo 公众账号信息
	* @param begin_date 获取数据的起始日期
	* @param end_date 获取数据的结束日期，end_date允许设置的最大值为昨日
	*/
	public void syncInterfaceSummary(AppInfo appInfo, String begin_date, String end_date){
		checkInputDate(begin_date, end_date, 30);
		
		String token = weixinService.getAccessToken(appInfo);
		
		List<InterfaceSummary> list = WeixinStatisticUtils.getInterfaceSummary(token,begin_date,end_date);
		
		weixinStatisticDao.insertInterfaceSummary(appInfo, list);
	}
	
	/** 
	* 与微信公众后台同步接口分析分时数据 - 最大时间跨度 1
	* @param appInfo 公众账号信息
	* @param begin_date 获取数据的起始日期
	* @param end_date 获取数据的结束日期，end_date允许设置的最大值为昨日
	*/
	public void syncInterfaceSummaryHour(AppInfo appInfo, String begin_date, String end_date){
		checkInputDate(begin_date, end_date, 1);
		
		String token = weixinService.getAccessToken(appInfo);
		
		List<InterfaceSummaryHour> list = WeixinStatisticUtils.getInterfaceSummaryHour(token,begin_date,end_date);
		
		weixinStatisticDao.insertInterfaceSummaryHour(appInfo, list);
	}
	
	
	public void syncShareTotal(AppInfo appInfo, String begin_date, String end_date){
		String token = weixinService.getAccessToken1(appInfo);
		//token="CCqaojgC4tLzt4C61XcAg5ItfPM8DkaentG4BXZhS9XhabwuIwgNP5eBAPUCifZ1nSkSNfspKGnZ8-aem_s5TRyfZtNHow8vPlQ9cjjY3WVtOfPkCZihx6UVyWRx7q58UGJgAEAYKN";
		List<ArticleTotal> list = WeixinStatisticUtils.getArticleTotal(token, begin_date, end_date);
		weixinStatisticDao.insertShareTotal(appInfo, list);
	}
	
	
}
