package com.with.community.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

public class Criteria {
	
	private int pageNum;
	private int amount;
	private int skip;
	
	public int getPageNum() {
		return pageNum;
	}
	
	public void setPageNum(int pageNum) {
		
		this.skip = (pageNum - 1) * this.amount;
		this.pageNum = pageNum;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.skip = (this.pageNum - 1) * amount;
		this.amount = amount;
	}
	public int getSkip() {
		return skip;
	}
	public void setSkip(int skip) {
		this.skip = skip;
	}
	
	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", skip=" + skip + "]";
	}
	
	
}
