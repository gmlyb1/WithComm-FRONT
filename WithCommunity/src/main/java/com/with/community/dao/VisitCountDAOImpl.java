package com.with.community.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.with.community.vo.VisitCountVO;

public class VisitCountDAOImpl implements VisitCountDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.with.community.dao.VisitCountDAO";
	
	@Override
	public void insertVisitCount() {
		sqlSession.insert("namespace.insertVisitCount");
	}

	@Override
	public void updateVisitCount() {
		sqlSession.update("namespace.updateVisitCount");
	}

	@Override
	public VisitCountVO selectVisitCount(VisitCountVO vvo) {
		return sqlSession.selectOne("namespace.selectVisitCount",vvo);
	}

}
