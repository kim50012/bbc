package com.waremec.framework.common;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.math.NumberUtils;

public class Page implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	public static final int FIRST_PAGE_NO = 1;
	public static final int DEFAULT_PAGE_SIZE = 10;
	private int pageSize;
	private int start;
	private Object data;
	private int totalCount;
	private String message;

	@SuppressWarnings("rawtypes")
	public Page() {
		this(0, 0, 10, new ArrayList());
	}

	@SuppressWarnings("rawtypes")
	public Page(int start, int totalSize, int pageSize, List data) {
		this.pageSize = 10;

		this.pageSize = pageSize;
		this.start = start;
		this.totalCount = totalSize;
		this.data = data;
	}

	@SuppressWarnings("rawtypes")
	public Page(String start, String pageSize) {
		this(NumberUtils.toInt(start), 0,
				(NumberUtils.toInt(pageSize) <= 0) ? 10 : NumberUtils
						.toInt(pageSize), new ArrayList());
	}

	public int getTotalCount() {
		return this.totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPageCount() {
		double dividend = getTotalCount();
		double divisor = getPageSize();
		return new Double(Math.ceil(dividend / divisor)).intValue();
	}

	public static int getTotalPageNo(int pageNo, int pageSize, int totalCount) {
		int totalPage = new Double(Math.ceil(totalCount / pageSize)).intValue();
		return Math.min(pageNo, totalPage);
	}

	public int getPageSize() {
		return this.pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public Object getData() {
		return this.data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public int getPageNo() {
		return (this.start / this.pageSize + 1);
	}

	public boolean hasNextPage() {
		return (getPageNo() < getTotalPageCount() - 1);
	}

	public boolean hasPreviousPage() {
		return (getPageNo() > 1);
	}

	protected static int getStartOfPage(int pageNo) {
		return getStartOfPage(pageNo, 10);
	}

	public static int getStartOfPage(int pageNo, int pageSize) {
		return ((pageNo - 1) * pageSize);
	}

	public static int getEndOfPage(int pageNo, int pageSize) {
		return (pageNo * pageSize);
	}

	public int getStart() {
		return this.start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public String getMessage() {
		return this.message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
