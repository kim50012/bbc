package com.waremec.framework.common;

import java.util.ArrayList;
import java.util.List;

import com.waremec.framework.utilities.IntegerUtils;

public class PageData {

	public static final int FIRST_PAGE_NO = 1;
	public static final int DEFAULT_PAGE_SIZE = 10;
	private int pageSize;
	private int pageNo;
	private List data;
	private int totalCount;
	
	public PageData() {
		this(0, 10,  0,new ArrayList());
	}

	public PageData(int pageNo, int pageSize, int totalSize, List data) {
		this.pageNo = pageNo;
		this.pageSize = pageSize;
		this.totalCount = totalSize;
		this.data = data;
	}
	
	public PageData(String pageNo, String pageSize) {
		this(IntegerUtils.valueOf(pageNo,FIRST_PAGE_NO), 
				(IntegerUtils.valueOf(pageSize) <= 0) ? DEFAULT_PAGE_SIZE :IntegerUtils.valueOf(pageSize),  
						0, new ArrayList());
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

	public List getData() {
		return this.data;
	}

	public void setData(List data) {
		this.data = data;
	}
	 

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public boolean isHasNextPage() {
		return (getPageNo() < getTotalPageCount() );
	}

	public boolean isHasPreviousPage() {
		return (getPageNo() > 1);
	}
	
	public boolean isLastPage() {
		return getPageNo() == getTotalPageCount() ;
	}
	
	public boolean isFisrtPage() {
		return getPageNo() == FIRST_PAGE_NO;
	}
	
	
	public static void main(String[] args) {
		PageData page = new PageData();
		System.out.println(Integer.MAX_VALUE);
		System.out.println(page.getData() == null);
		System.out.println(page.getData().isEmpty());
	}
	
}
