/*
 * 枚举用户种类
 */
package com.waremec.wpt.domain;

public class EnumerateDomain {
	private String index = "0";
	private String group = "";
	private String code = "";
	private String name = "";
	private String parentGroup = "";
	private String parentCode = "";
	private String shortName = "";
	private String description = "";
	private EnumerateDomain type = null;
	private EnumerateDomain status = null;

	public EnumerateDomain() {
		this.index = "0";
		this.code = "";
		this.name = "";
		this.group = "";
		this.shortName = "";
		this.description = "";
		this.type = null;
		this.status = null;
	}

	public EnumerateDomain(String code) {
		this.index = "0";
		this.code = code;
		this.name = "";
		this.group = "";
		this.shortName = "";
		this.description = "";
		this.type = null;
		this.status = null;
	}

	public EnumerateDomain(String code, String name) {
		this.index = "0";
		this.code = code;
		this.name = name;
		this.group = "";
		this.shortName = "";
		this.description = "";
		this.type = null;
		this.status = null;
	}

	public EnumerateDomain(String code, String name, String group) {
		this.index = "0";
		this.code = code;
		this.name = name;
		this.group = group;
		this.shortName = "";
		this.description = "";
		this.type = null;
		this.status = null;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public EnumerateDomain getType() {
		return type;
	}

	public void setType(EnumerateDomain type) {
		this.type = type;
	}

	public String getIndex() {
		return index;
	}

	public void setIndex(String index) {
		this.index = index;
	}

	public String getShortName() {
		return shortName;
	}

	public void setShortName(String shortName) {
		this.shortName = shortName;
	}

	public EnumerateDomain getStatus() {
		return status;
	}

	public void setStatus(EnumerateDomain status) {
		this.status = status;
	}

	public String getParentGroup() {
		return parentGroup;
	}

	public void setParentGroup(String parentGroup) {
		this.parentGroup = parentGroup;
	}

	public String getParentCode() {
		return parentCode;
	}

	public void setParentCode(String parentCode) {
		this.parentCode = parentCode;
	}
}
