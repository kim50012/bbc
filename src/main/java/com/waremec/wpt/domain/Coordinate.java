package com.waremec.wpt.domain;

import com.waremec.framework.utilities.StringUtil;

public class Coordinate {
	private String latitude;
	private String longitude;
	private String address1;
	private String address2;
	private String address3;
	private String address4;

	public String toString(){
		return StringUtil.convertNullToEmpty(longitude) + "," + StringUtil.convertNullToEmpty(latitude);
	}
	public String toAddress(){
		return StringUtil.convertNullToEmpty(address1) + StringUtil.convertNullToEmpty(address2) +
				StringUtil.convertNullToEmpty(address3) + StringUtil.convertNullToEmpty(address4);
	}
	
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getAddress3() {
		return address3;
	}
	public void setAddress3(String address3) {
		this.address3 = address3;
	}
	public String getAddress4() {
		return address4;
	}
	public void setAddress4(String address4) {
		this.address4 = address4;
	}
}
