package com.waremec.weixin.domain.user;

import java.util.List;

/** 
* @Package com.waremec.weixin.domain.user 
* @FileName Data
* @Description  获取用户列表 response- 列表数据，OPENID的列表
* @author taebem 
* @date 2015年5月22日 上午9:32:44 
*  
*/
public class Data {

	private List<String> openid;

	public List<String> getOpenid() {
		return openid;
	}

	public void setOpenid(List<String> openid) {
		this.openid = openid;
	}

	@Override
	public String toString() {
		return "Data [openid=" + openid + "]";
	}
	
	
	
}
