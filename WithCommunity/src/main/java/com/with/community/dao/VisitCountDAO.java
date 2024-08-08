package com.with.community.dao;

import com.with.community.vo.VisitCountVO;

public interface VisitCountDAO {

	public void insertVisitCount(VisitCountVO vvo);
	
	public void updateVisitCount(VisitCountVO vvo);
	
	public VisitCountVO selectVisitCount(VisitCountVO vvo);
	
}
