package com.with.community.dao;

import com.with.community.vo.VisitCountVO;

public interface VisitCountDAO {

	public void insertVisitCount();
	
	public void updateVisitCount();
	
	public VisitCountVO selectVisitCount(VisitCountVO vvo);
}
