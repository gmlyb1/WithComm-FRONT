package com.with.community.service;

import com.with.community.vo.VisitCountVO;

public interface VisitCountService {

	public void insertVisitCount();
	
	public void updateVisitCount();
	
	public VisitCountVO selectVisitCount(VisitCountVO vvo);
	
}
