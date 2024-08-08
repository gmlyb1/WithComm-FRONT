package com.with.community.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.with.community.dao.VisitCountDAO;
import com.with.community.vo.VisitCountVO;

@Service("VisitCountService")
public class VisitCountServiceImpl implements VisitCountService{

	@Inject
	private VisitCountDAO visitCountDAO;
	
	@Override
	public void insertVisitCount(VisitCountVO vvo) {
		visitCountDAO.insertVisitCount(vvo);
	}

	@Override
	public void updateVisitCount(VisitCountVO vvo) {
		visitCountDAO.updateVisitCount(vvo);
	}

	@Override
	public VisitCountVO selectVisitCount(VisitCountVO vvo) {
		return visitCountDAO.selectVisitCount(vvo);
	}


}
