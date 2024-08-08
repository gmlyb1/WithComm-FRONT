package com.with.community.service;

import com.with.community.vo.VisitCountVO;

public interface VisitCountService {

	public void insertVisitCount(VisitCountVO vvo);
	
	public void updateVisitCount(VisitCountVO vvo);
	
	public VisitCountVO selectVisitCount(VisitCountVO vvo);
	
}
