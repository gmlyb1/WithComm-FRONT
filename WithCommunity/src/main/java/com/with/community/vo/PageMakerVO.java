package com.with.community.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageMakerVO {
	
	private int startPage;
	private int endPage;
	private boolean prev, next;
	private int total;
	private Criteria cri;
	
	//생성자
	public PageMakerVO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		this.endPage = (int)(Math.ceil(total * 1.0/ cri.getAmount()));
		this.startPage = this.endPage - 9;
		
		int realEnd = (int)(Math.ceil(total * 1.0/ cri.getAmount()));
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		
		this.next = this.endPage < realEnd;
		
	}
}
