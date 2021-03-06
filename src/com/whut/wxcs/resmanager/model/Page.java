package com.whut.wxcs.resmanager.model;

import java.util.List;

public class Page<T> {

	private int pageNo;


	private List<T> list;
    
	//一页page的容量
	private int pageSize = 20;

    //查询的所有总数
	private long totalItemNumber;

	public Page(int pageNo) {
		super();
		this.pageNo = pageNo;
	}


	public int getPageNo() {
		if (pageNo < 0)
			pageNo = 1;
		if (pageNo > getTotalPageNumber()) {
			pageNo = getTotalPageNumber();
		}

		return pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	public List<T> getList() {
		return list;
	}

	public int getTotalPageNumber() {

		int totalPageNumber = (int) totalItemNumber / pageSize;

		if (totalItemNumber % pageSize != 0) {
			totalPageNumber++;
		}

		return totalPageNumber;
	}

	public void setTotalItemNumber(long totalItemNumber) {
		this.totalItemNumber = totalItemNumber;
	}

	public boolean isHasNext() {
		if (getPageNo() < getTotalPageNumber()) {
			return true;
		}

		return false;
	}

	public boolean isHasPrev() {
		if (getPageNo() > 1) {
			return true;
		}

		return false;
	}

	public int getPrevPage() {
		if (isHasPrev()) {
			return getPageNo() - 1;
		}
		return getPageNo();
	}

	public int getNextPage() {
		if (isHasNext()) {
			return getPageNo() + 1;
		}


		return getPageNo();
	}
}
