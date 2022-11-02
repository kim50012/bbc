package com.waremec.weixin.utils;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.waremec.weixin.domain.pay.OrderBill;

public class PayBillUtils {
	
	@SuppressWarnings("unused")
	private static final transient Log logger = LogFactory.getLog(PayBillUtils.class);
	
	public static OrderBill convert2OrderBill(List<String> list){
		
		OrderBill orderBill = new OrderBill();
		
		try {
		
		for (int i = 0; i < list.size(); i++) {
			String item = list.get(i);
			boolean isItemHeader = (i == 0) ;
			boolean isItemData = (i > 0 && i < list.size() - 2 ) ;
			boolean isStatisticsHeader = (i == list.size() - 2) ;
			boolean isStatisticsData = (i == list.size() - 1);
			
			
			
			if(isItemHeader){
				orderBill.setHeader(item.split(","));
			}else if(isItemData){
				orderBill.getData().add(item.split(","));
			}else if(isStatisticsHeader){
				orderBill.setStatisticsHeader(item.split(","));
			}else if(isStatisticsData){
				orderBill.setStatisticsData(item.split(","));
			}
			
//			logger.info("lineNumber=" + i + " , isItemHeader=" + isItemHeader + " , isItemData=" + isItemData + " , isStatisticsHeader=" + isStatisticsHeader + " , isStatisticsData=" + isStatisticsData);
//			logger.info("<><><><>");
//			String[] array = item.split(",");
//			for (String subitem : array) {
//				logger.info(subitem + "==>" + subitem.startsWith("`"));
//			}
//			logger.info("================================");
		}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return orderBill;
	}

}
