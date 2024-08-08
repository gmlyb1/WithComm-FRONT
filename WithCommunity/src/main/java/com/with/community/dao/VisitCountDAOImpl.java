package com.with.community.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.with.community.vo.VisitCountVO;

public class VisitCountDAOImpl implements VisitCountDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.with.community.dao.VisitCountDAO";
	
	@Override
	public void insertVisitCount(VisitCountVO vvo) {
		sqlSession.insert("namespace.insertVisitCount",vvo);
	}

	@Override
	public void updateVisitCount(VisitCountVO vvo) {
		sqlSession.update("namespace.updateVisitCount",vvo);
	}

	@Override
	public VisitCountVO selectVisitCount(VisitCountVO vvo) {
		return sqlSession.selectOne("namespace.selectVisitCount",vvo);
	}


}
