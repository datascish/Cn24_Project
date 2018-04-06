package com.cn24.community.vo;

import io.github.seccoding.web.pager.annotaions.EndRow;
import io.github.seccoding.web.pager.annotaions.StartRow;

public class CommunitySearchVO {
	private int pageNo = -1;

	@StartRow
	private int startNumber;
	
	@EndRow
	private int endNumber;
	
	private int searchType;
	private String searchKeyword;
	
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getStartNumber() {
		return startNumber;
	}
	public void setStartNumber(int startNumber) {
		this.startNumber = startNumber;
	}
	public int getEndNumber() {
		return endNumber;
	}
	public void setEndNumber(int endNumber) {
		this.endNumber = endNumber;
	}
	public int getSearchType() {
		return searchType;
	}
	
	public void setSearchType(int searchType) {
		this.searchType = searchType;
	}
	
	public String getSearchKeyword() {
		return searchKeyword;
	}
	
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	
}
