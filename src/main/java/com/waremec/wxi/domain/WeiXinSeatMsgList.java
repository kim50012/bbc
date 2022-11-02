package com.waremec.wxi.domain;

import java.util.ArrayList;
import java.util.List;

import com.waremec.weixin.domain.WeixinReturn;

public class WeiXinSeatMsgList extends WeixinReturn {
	private List<WeiXinSeatMsg> kf_list = new ArrayList<WeiXinSeatMsg>();

	public List<WeiXinSeatMsg> getWeiXinSeatMsgList() {
		return kf_list;
	}

	public void setWeiXinSeatMsgList(List<WeiXinSeatMsg> kf_list) {
		this.kf_list = kf_list;
	}


	
}
